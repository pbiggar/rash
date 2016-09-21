module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Data.Generics.Uniplate.Operations
import qualified System.IO.Silently as Silently
import           System.Exit

import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.Test.TestAST as TestAST
import qualified Rash.Runner as Runner
import qualified Rash.AST as AST
import           Rash.Options()

main :: IO ()

main = do
  pts <- fullParseTests
  cts <- codeTests
  rts <- fullRunTests
  defaultMain $ testGroup "Tests" [TestAST.tests, pts, cts, rts]

-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    let failure e = assertFailure ("parseError: " ++ show e)
        checkASTSuccess ast = [] @=? [ s | AST.Debug s <- universeBi ast ]
    in do
      return (testCaseSteps ("Full parse test: " ++ file) $ \step -> do
              step "read code"
              src <- readFile file
              step "parse code"
              let ast = Bash2AST.translate "test" src
              step "check AST"
              either failure checkASTSuccess ast)

testRuns :: FilePath -> ExitCode -> String -> IO TestTree
testRuns filename expectedCode expectedOutput =
  return $ testCaseSteps ("Interpreter test: " ++ filename) $ \step -> do
    step "run code"
    (captured, exitCode) <- Silently.capture $ Runner.runFile filename
    step "check output"
    expectedOutput @=? captured
    step "check exit"
    expectedCode @=? exitCode

testCode :: String -> String -> IO TestTree
testCode source expectedOutput = let
    checkOutputExpected output = expectedOutput @=? output
    in do
        return $ testCaseSteps ("Interpreter test: " ++ source) $ \step -> do
            (captured, _) <- Silently.capture $ Runner.runSource "test_src" source []
            step "check output"
            checkOutputExpected captured


codeTests :: IO TestTree
codeTests = do
--  t1 <- testCode "echo 4" "4"
-- t2 <- testCode "echo $((2 + 2))" "4"
--  t2 <- testCode "die 255"
  return $ testGroup "code tests" []

fullRunTests :: IO TestTree
fullRunTests =
  do t1 <- testRuns "data/spaceman-diff" ExitSuccess expected
     return $ testGroup "Run tests" [t1]
  where expected = "  This should normally be called via `git-diff(1)`.\n\n  USAGE:\n    spaceman-diff fileA shaA modA fileB shaB modeB\n"

fullParseTests :: IO TestTree
fullParseTests =
    do t1 <- testParses "data/spaceman-diff"
       t2 <- testParses "data/le.sh"
       return $ testGroup "Parse tests" [t1, t2]
