module Rash.Test.TestAST (tests) where

import           Test.Tasty
import           Test.Tasty.ExpectedFailure (expectFail)
import           Test.Tasty.HUnit

import           Rash.IR.AST
import           Rash.Runner            (translate)

tests :: TestTree
tests = testGroup "AST tests" [unitTests, bugs]


-- | A test with an expected value
testExpected :: String -> Expr -> TestTree
testExpected source expected =
    testCase (filter ((/=) '\n') source) $
               case translate "test" source of
                 Left err -> assertFailure ("parseError" ++ show err)
                 Right (Program prog) -> [expected] @=? prog

unitTests :: TestTree
unitTests =
  testGroup "Unit tests" [
    testExpected "a | b" (Pipe NoStdin
                          [Fn "a" []
                         , Fn "b" []])

  , testExpected "while yes; do echo y; done"
                 (For
                   AnonVar
                   (Pipe NoStdin [Fn "yes" []])
                   [(Pipe NoStdin [Fn "echo" [Str "y"]])])

  , testExpected "while read input; do echo $input; done"
                 (For
                   (LVar "input")
                   (Pipe NoStdin [Fn "sys.read" []])
                   [(Pipe NoStdin [Fn "echo" [Variable "input"]])])

  , testExpected "read input" (Assignment
                               (LVar "input")
                               (Pipe NoStdin [Fn "sys.read" []]))

  , testExpected "type wget"
                 (Pipe NoStdin [Fn
                                "sys.onPath"
                                [Str "wget"]])

  , testExpected "exit 1"
                 (Pipe NoStdin [Fn
                                "sys.exit"
                                [Integer 1]])

  , testExpected "[ \"`uname`\" = Darwin ]"
                 (Binop
                  (Pipe NoStdin [Fn "uname" []])
                  Equals
                  (Str "Darwin"))

  , testExpected "arg=$1"
                 (Assignment
                   (LVar "arg")
                   (Subscript
                     (Variable "sys.argv")
                     (Integer 0)))

  , testExpected "for i in $@; do nop; done"
                 (For
                   (LVar "i")
                   (Variable "sys.argv")
                   [(Pipe NoStdin [Fn "nop" []])])

  , testExpected "$GH_GREP | \\\n sed 'asd' \n\n"

                 (Pipe NoStdin
                   [ IndirectFn (Variable "GH_GREP") []
                   , Fn "sed" [Str "asd"]])

  , testExpected "function x() { arg=$1; exit $arg; }"
                 (FunctionDefinition
                   (FuncDef
                     "x"
                     [FunctionParameter "arg"]
                     [Pipe NoStdin [Fn "sys.exit" [Variable "arg"]]]))

  , testExpected "[ -n $2 ]" (Pipe (Stdin (Subscript (Variable "sys.argv") (Integer 1)))
                                    [Fn "string.nonblank?" []])

  , testExpected "[[ $a =~ \"a.b\" ]]" $
                 Pipe (Stdin (Variable "a")) [Fn "re.matches" [Str "a.b"]]

  , testExpected "echo -n $a | grep b" $
                 Pipe (Stdin (Variable "a")) [Fn "grep" [Str "b"]]

  -- test redirecting and flattening pipes
  , testExpected "grep a b | grep c >/dev/null 2>&1 | grep d" $
                 Pipe NoStdin
                  [Fn "grep" [Str "a", Str "b"],
                   Fn "grep" [Str "c"],
                   Fn "stderr.replaceStdout" [],
                   Fn "grep" [Str "d"]]
  , testExpected "[ $a == https* ]" $ Pipe NoStdin [(Fn "string.matches?"
                                                     [ Variable "a"
                                                     , Str "https.*"])]
    ]

bugs :: TestTree
bugs =
  testGroup "Known bugs"
  (map expectFail [])
