module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.ExpectedFailure (expectFail)
import           Data.Generics.Uniplate.Operations

import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.Test.TestAST as TestAST
--import qualified Rash.Test.TestIR as TestIR
import qualified Rash.AST as AST

main :: IO ()

main = do pts <- fullParseTests
          defaultMain $ testGroup "Tests" [TestAST.tests, pts]


-- TODO: add tests from how wrong we got things
-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    do parsed <- Bash2AST.translateFile file
       return (testCase ("parsing " ++ file) $
                 case parsed of
                   Left err -> assertFailure ("parseError" ++ (show err))
                   Right prog -> [] @=? [ y | AST.Debug y <- universeBi prog ]
              )

fullParseTests :: IO TestTree
fullParseTests =
    do test <- testParses "data/github-markdown-toc/gh-md-toc"
       test2 <- testParses "data/le.sh"
       return $ testGroup "Parse tests" [test, expectFail test2]
