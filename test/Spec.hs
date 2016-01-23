module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           TranslateBash
import           Test.Tasty.ExpectedFailure (expectFail)
import           Data.Generics.Uniplate.Operations


main :: IO ()

main = do pts <- fullParseTests
          defaultMain $ testGroup "Tests" [bugs, unitTests, pts]

fi :: String -> [Expr] -> Expr
fi name args = FunctionInvocation (Str name) args

unitTests :: TestTree
unitTests =
  testGroup "Unit tests"
    [(testExpected "a | b" (Pipe
                            [(fi "a" [])
                            , (fi "b" [])]))
    ,(testExpected "while yes; do echo y; done"
                       (For
                        AnonVar
                        (fi "yes" [])
                        (fi "echo" [Str "y"])))
    ,(testExpected "while read input; do echo $input; done"
                       (For
                        (LVar "input")
                        (fi "sys.read" [])
                        (fi "echo" [Variable "input"])))
    ,(testExpected "read input"
                       (Assignment
                        (LVar "input")
                        (fi "sys.read" [])))
    ,(testExpected "type wget" (fi
                                "os.onPath"
                                [(Str "wget")]))
    ,(testExpected "exit 1" (fi
                             "sys.exit"
                             [(Integer 1)]))
    ,(testExpected "[ \"`uname`\" = Darwin ]"
                       (Equals (fi "uname" []) (Str "Darwin")))
    ,(testExpected "arg=$1" (Assignment
                             (LVar "arg")
                             (Subscript
                              (Variable "sys.argv")
                              (Integer 1))))
    ,(testExpected "for i in $@; do nop; done" (For
                                                (LVar "i")
                                                (Variable "sys.argv")
                                                (fi "nop" [])))

    ]

bugs :: TestTree
bugs =
  testGroup "Known bugs"
   (map expectFail
    [(testExpected "[ $a == https* ]" (fi "string.matches?"
                                              [(Variable "a"),
                                              (Str "https*")]))
    ,(testExpected "function x() { arg=$1; }" (FunctionDefinition
                                               "x"
                                               [FunctionParameter "arg"]
                                               Nop))
    ,(testExpected "$GH_GREP | \\\n sed 'asd' \n\n" (Pipe [(FunctionInvocation (Variable "a") [(Str "b"), (Str "c")]),
                                      (FunctionInvocation (Variable "d") [])]))
    ,(testExpected "arguments()" Nop)
    ])

-- TODO: add tests from how wrong we got things

-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    do parsed <- translateFile file
       return (testCase ("parsing " ++ file) $
                 case parsed of
                   { Left err -> assertFailure ("parseError" ++ (show err))
                   ; Right prog -> [] @=? [ y | Debug y <- universeBi prog ]
                   })

-- | A test with an expected value
testExpected :: String -> Expr -> TestTree
testExpected source expected =
    testCase ("`" ++ source ++ "`") $
               case (translate "test" source) of
                 { Left err -> assertFailure ("parseError" ++ (show err))
                 ; Right (Program prog) -> expected @=? prog
                 }

fullParseTests :: IO TestTree
fullParseTests =
    do test <- testParses "data/github-markdown-toc/gh-md-toc"
       test2 <- testParses "data/le.sh"
       return $ testGroup "Parse tests" [test, test2]
