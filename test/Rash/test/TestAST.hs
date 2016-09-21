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
    testCase ("`" ++ (filter ((/=) '\n') source) ++ "`") $
               case translate "test" source of
                 { Left err -> assertFailure ("parseError" ++ show err)
                 ; Right (Program prog) -> expected @=? prog
                 }

-- | Shortcut for building FunctionInvocations
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

    ]

bugs :: TestTree
bugs =
  testGroup "Known bugs"
   (map expectFail [
    testExpected "[ $a == https* ]"
                 (fc "string.matches?"
                   [Variable "a"
                  , Str "https*"])
  , testExpected "function x() { arg=$1; }"
                 (FunctionDefinition
                   (FuncDef
                     "x"
                     [FunctionParameter "arg"]
                     Nop))
  , testExpected "arguments()" Nop
  ])
