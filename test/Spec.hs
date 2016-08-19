module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.ExpectedFailure (expectFail)
import           Data.Generics.Uniplate.Operations
import           System.IO.Silently
import           System.Exit

import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.Test.TestAST as TestAST
import qualified Rash.Interpret as Interpret
-- import qualified Rash.Test.TestIR as TestIR
import qualified Rash.AST as AST

main :: IO ()

main = do pts <- fullParseTests
          defaultMain $ testGroup "Tests" [TestAST.tests, pts]

-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    let failure e = assertFailure ("parseError" ++ (show e))
        checkASTSuccess ast = [] @=? [ s | AST.Debug s <- universeBi ast ]
    in do
      ast <- Bash2AST.translateFile file
      return (testCaseSteps ("Full parse test: " ++ file) $ \step -> do
                step "check AST"
                either failure checkASTSuccess ast)

testRuns :: FilePath -> ExitCode -> String -> IO TestTree
testRuns filename expectedCode expectedOutput = let
    checkOutputExpected expected output = output @=? expected
    checkCodeExpected   expected   code =   code @=? expected
    in do
        (captured, exitCode) <- capture $ Interpret.interpretFile filename
        return $ testCaseSteps ("Interpreter test: " ++ filename) $ \step -> do
            step "check output"
            checkOutputExpected expectedOutput captured
            checkCodeExpected expectedCode     exitCode


fullParseTests :: IO TestTree
fullParseTests =
    do spacemanDiff <- testParses "data/spaceman-diff"
       test2 <- testParses "data/le.sh"
       test3 <- testRuns "data/spaceman-diff" ExitSuccess expected
       return $ testGroup "Parse tests" [spacemanDiff, expectFail test2, test3]
       where expected = "  This should normally be called via `git-diff(1)`.\n\n  USAGE:\n    spaceman-diff fileA shaA modA fileB shaB modeB\n"
