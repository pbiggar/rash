module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import qualified Language.Bash.Parse as BashParse
import           Text.Parsec.Error            (ParseError)
import           TranslateBash
import           Data.List (isInfixOf)
import           Test.Tasty.ExpectedFailure (expectFail)



main :: IO ()

main = do pts <- fullParseTests
          defaultMain $ testGroup "Tests" [bugs, unitTests, pts]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
            [(testExpected "a | b" (Pipe
                                    [(FunctionInvocation "a" [])
                                    , (FunctionInvocation "b" [])]))]

bugs :: TestTree
bugs = testGroup "Known bugs"
       (map expectFail
        [(testExpected "arg=$1" (Assignment
                                 (LVar "arg")
                                 (Subscript
                                  (Variable "sys.argv")
                                  (Integer 1))))
       , (testExpected "for i in $@; do nop; done" (For
                                 (LVar "i")
                                 (Variable "sys.argv")
                                 (FunctionInvocation "nop" [])))
       , (testExpected "function x() { arg=$1; }" (FunctionDefinition
                                                   "x"
                                                   [FunctionParameter "arg"]
                                                   Nop))
       , (testExpected "type wget" (FunctionInvocation
                                    "os.onPath"
                                    [(Str "wget")]))
       , (testExpected "exit 1" (FunctionInvocation
                                 "sys.exit"
                                 [(Integer 1)]))
       , (testExpected "if [ \"`uname`\" = Darwin ]; then ''; fi"
                           (If (Equals (FunctionInvocation "uname" [])
                                           (Str "Darwin"))
                            (Str "") Nop))

        ])

-- TODO: add tests from how wrong we got things

-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    do parsed <- translateFile file
       return (testCase ("parsing " ++ file) $
                 case parsed of
                   { Left err -> assertFailure ("parseError" ++ (show err))
                   ; Right prog -> isInfixOf "Debug" (show (prog)) @=? False
                   })

-- | A test with an expected value
testExpected source expected =
    testCase ("`" ++ source ++ "`") $
               case (translate "test" source) of
                 { Left err -> assertFailure ("parseError" ++ (show err))
                 ; Right prog -> Program expected @=? prog
                 }

fullParseTests :: IO TestTree
fullParseTests =
    do test <- testParses "data/github-markdown-toc/gh-md-toc"
       return $ testGroup "Parse tests" [test]
