module Rash.Test.TestAST (tests) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.ExpectedFailure (expectFail)

import           Rash.AST
import           Rash.Bash2AST (translate)

tests :: TestTree
tests = testGroup "AST tests" [unitTests, bugs]


-- | A test with an expected value
testExpected :: String -> Expr -> TestTree
testExpected source expected =
    testCase (filter ((/=) '\n') source) $
               case translate "test" source of
                 Left err -> assertFailure ("parseError" ++ show err)
                 Right (Program prog) -> expected @=? prog

-- | Shortcut for building FunctionCalls
fc :: String -> [Expr] -> Expr
fc name args = FunctionCall name args

unitTests :: TestTree
unitTests =
  testGroup "Unit tests" [
    testExpected "a | b" (Pipe
                          [fc "a" []
                         , fc "b" []])
  , testExpected "while yes; do echo y; done"
                 (For
                   AnonVar
                   (fc "yes" [])
                   (fc "echo" [Str "y"]))
  , testExpected "while read input; do echo $input; done"
                 (For
                   (LVar "input")
                   (fc "sys.read" [])
                   (fc "echo" [Variable "input"]))
  , testExpected "read input"
                    (Assignment
                    (LVar "input")
                    (fc "sys.read" []))
  , testExpected "type wget"
                 (fc
                  "sys.onPath"
                  [Str "wget"])
  , testExpected "exit 1"
                 (fc
                  "sys.exit"
                  [Integer 1])
  , testExpected "[ \"`uname`\" = Darwin ]"
                 (Binop
                  (fc "uname" [])
                  Equals
                  (Str "Darwin"))
  , testExpected "arg=$1"
                 (Assignment
                   (LVar "arg")
                   (Subscript
                     (Variable "sys.argv")
                     (Integer 1)))
  , testExpected "for i in $@; do nop; done"
                 (For
                   (LVar "i")
                   (Variable "sys.argv")
                   (fc "nop" []))
  , testExpected "$GH_GREP | \\\n sed 'asd' \n\n"
                 (Pipe
                   [IndirectFunctionCall (Variable "GH_GREP") []
                  , fc "sed" [Str "asd"]])
  , testExpected "function x() { arg=$1; exit $arg; }"
                 (FunctionDefinition
                   (FuncDef
                     "x"
                     [FunctionParameter "arg"]
                     (List [(fc "sys.exit" [Variable "arg"])])))
  , testExpected "[ -n $2 ]" (Pipe [Subscript (Variable "sys.argv") (Integer 2),
                                    fc "string.nonblank?" []])
  , testExpected "[[ $a =~ \"a.b\" ]]"
                 (Pipe [Variable "a", fc "re.matches" [Str "a.b"]])
  , testExpected "echo -n $a | grep b"
                 (Pipe [Variable "a", fc "grep" [Str "b"]])
  -- test redirecting and flattening pipes
  , testExpected "grep a b | grep c >/dev/null 2>&1 | grep d"
                 (Pipe [fc "grep" [Str "a", Str "b"], fc "grep" [Str "c"], fc "stderr.replaceStdout" [], fc "grep" [Str "d"]])
  , testExpected "[ $a == https* ]"
                 (fc "string.matches?"
                   [Variable "a"
                  , Str "https.*"])
    ]

bugs :: TestTree
bugs =
  testGroup "Known bugs"
  (map expectFail [])
