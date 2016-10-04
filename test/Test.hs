module Main (main) where

import           Data.Generics.Uniplate.Operations
import qualified Rash.AST                          as AST
import qualified Rash.Bash2AST                     as Bash2AST
import qualified Rash.Options                      as Opts
import qualified Rash.Runner                       as Runner
import qualified Rash.Test.TestAST                 as TestAST
import           System.Exit
import qualified System.IO.Silently                as Silently
import           Test.Tasty
import           Test.Tasty.HUnit

main :: IO ()

main = do
  Opts.init ["file.rash"]
  pts <- parseTests
--  cts <- codeTests
  --rts <- runTests
  defaultMain $ testGroup "Tests" [TestAST.tests, pts]

run :: IO a -> IO (String, a)
run x = do
  Silently.capture $ x


-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
  let failure e = assertFailure ("parseError: " ++ show e)
      checkASTSuccess ast = [] @=? [ s | AST.Debug s <- universeBi ast ]
  in do
    return (testCaseSteps file $ \step -> do
      step "parse code"
      src <- readFile file
      let ast = Bash2AST.translate "test" src
      step "check AST"
      either failure checkASTSuccess ast)

-- testCode :: String -> String -> IO TestTree
-- testCode source expectedOutput =
--   return $ testCaseSteps source $ \step -> do
--     step "Run tests"
--     (captured, _) <- run $ Runner.runSource "test_src" source []
--     step "check output"
--     (expectedOutput ++ "\n") @=? captured

-- testRuns :: FilePath -> ExitCode -> String -> IO TestTree
-- testRuns filename expectedCode expectedOutput =
--   return $ testCaseSteps filename $ \step -> do
--     step "run code"
--     (captured, exitCode) <- run $ Runner.runFile filename
--     step "check output && exit"
--     expectedOutput @=? captured
--     expectedCode @=? exitCode




parseTests :: IO TestTree
parseTests =
    do t1 <- testParses "data/spaceman-diff"
       t2 <- testParses "data/le.sh"
       t3 <- testParses "data/pdf-check.sh"
--       t4 <- testParses "data/nvm.sh"
--       t5 <- testParses "data/dropbox_uploader.sh"
--       t6 <- testParses "data/roll.sh"
       t7 <- testParses "data/nginx.sh"
       return $ testGroup "Parse tests" $ [t1, t2, t3, t7]

-- codeTests :: IO TestTree
-- codeTests = do
--   t1 <- testCode "echo 4" "4"
-- -- t2 <- testCode "echo $((2 + 2))" "4"
-- -- t3 <- testCode "die 255"
--   return $ testGroup "code tests" [t1]

-- runTests :: IO TestTree
-- runTests =
--   do t1 <- testRuns "data/spaceman-diff" ExitSuccess expected1
--      t2 <- testRuns "data/nginx.sh" ExitSuccess expected2
--      return $ testGroup "Run tests" [t1, t2]
--   where
--     expected1 = "  This should normally be called via `git-diff(1)`.\n\n  USAGE:\n    spaceman-diff fileA shaA modeA fileB shaB modeB\n"
--     expected2 = "Unsupported OS detected, this script will now exit."
