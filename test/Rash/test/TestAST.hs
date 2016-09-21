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
    testCase ("`" ++ source ++ "`") $
               case translate "test" source of
                 { Left err -> assertFailure ("parseError" ++ show err)
                 ; Right (Program prog) -> expected @=? prog
                 }

-- | Shortcut for building FunctionInvocations
fi :: String -> [Expr] -> Expr
fi name args = FunctionInvocation name args

unitTests :: TestTree
unitTests =
  testGroup "Unit tests" [
    testExpected "a | b" (Pipe
                          [fi "a" []
                         , fi "b" []])
  , testExpected "while yes; do echo y; done"
                 (For
                   AnonVar
                   (fi "yes" [])
                   (fi "echo" [Str "y"]))
  , testExpected "while read input; do echo $input; done"
                 (For
                   (LVar "input")
                   (fi "sys.read" [])
                   (fi "echo" [Variable "input"]))
  , testExpected "read input"
                    (Assignment
                    (LVar "input")
                    (fi "sys.read" []))
  , testExpected "type wget"
                 (fi
                  "sys.onPath"
                  [Str "wget"])
  , testExpected "exit 1"
                 (fi
                  "sys.exit"
                  [Integer 1])
  , testExpected "[ \"`uname`\" = Darwin ]"
                 (Binop
                  (fi "uname" [])
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
                   (fi "nop" []))
    ]

bugs :: TestTree
bugs =
  testGroup "Known bugs"
   (map expectFail [
    testExpected "[ $a == https* ]"
                 (fi "string.matches?"
                   [Variable "a"
                  , Str "https*"])
  , testExpected "function x() { arg=$1; }"
                 (FunctionDefinition
                   (FuncDef
                     "x"
                     [FunctionParameter "arg"]
                     Nop))
  , testExpected "$GH_GREP | \\\n sed 'asd' \n\n"
                  (Pipe
                    [FunctionInvocation
                      "a"
                      [Str "b", Str "c"]
                   , FunctionInvocation
                      "d"
                      []])
  , testExpected "arguments()" Nop
  ])
