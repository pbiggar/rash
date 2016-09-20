{-# LANGUAGE TemplateHaskell #-}
module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Data.Generics.Uniplate.Operations
import qualified System.IO.Silently as Silently
import           System.Exit

import HFlags

import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.Test.TestAST as TestAST
import qualified Rash.Runner as Runner
import qualified Rash.AST as AST
import           Rash.Options()

main :: IO ()

main = do
  _ <- $initHFlags "test"
  pts <- fullParseTests
  cts <- codeTests
  defaultMain $ testGroup "Tests" [TestAST.tests, pts, cts]

-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    let failure e = assertFailure ("parseError" ++ (show e))
        checkASTSuccess ast = [] @=? [ s | AST.Debug s <- universeBi ast ]
    in do
      src <- readFile file
      let ast = Bash2AST.translate "test" src
      return (testCaseSteps ("Full parse test: " ++ file) $ \step -> do
                step "check AST"
                either failure checkASTSuccess ast)

testRuns :: FilePath -> ExitCode -> String -> IO TestTree
testRuns filename expectedCode expectedOutput = let
    checkOutputExpected output = expectedOutput @=? output
    checkCodeExpected   code =   expectedCode @=? code
    in do
        return $ testCaseSteps ("Interpreter test: " ++ filename) $ \step -> do
            (captured, exitCode) <- Silently.capture $ Runner.runFile filename
            step "check output"
            checkOutputExpected captured
            checkCodeExpected exitCode

testCode :: String -> String -> IO TestTree
testCode source expectedOutput = let
    checkOutputExpected output = expectedOutput @=? output
    in do
        return $ testCaseSteps ("Interpreter test: " ++ source) $ \step -> do
            (captured, _) <- Silently.capture $ Runner.runSource "__src__" source []
            step "check output"
            checkOutputExpected captured


codeTests :: IO TestTree
codeTests = do
  t1 <- testCode "2 + 2" "4"
--  t2 <- testCode "die 255"
  return $ testGroup "code tests" [t1]

fullParseTests :: IO TestTree
fullParseTests =
    do test1 <- testParses "data/spaceman-diff"
       test2 <- testParses "data/le.sh"
       test3 <- testRuns "data/spaceman-diff" ExitSuccess expected
       return $ testGroup "Parse tests" [test1, test2, test3]
       where expected = "  This should normally be called via `git-diff(1)`.\n\n  USAGE:\n    spaceman-diff fileA shaA modA fileB shaB modeB\n"
