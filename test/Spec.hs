module Main (main) where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.ExpectedFailure (expectFail)
import           Data.Generics.Uniplate.Operations

import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.AST2IR as AST2IR
import qualified Rash.Test.TestAST as TestAST
-- import qualified Rash.Test.TestIR as TestIR
import qualified Rash.AST as AST
import qualified Rash.IR as IR

main :: IO ()

main = do pts <- fullParseTests
          defaultMain $ testGroup "Tests" [TestAST.tests, pts]


-- | a test that a bash script parses without Debug statements
testParses :: String -> IO TestTree
testParses file =
    let failure e = assertFailure ("parseError" ++ (show e))
        checkASTSuccess ast = [] @=? [ s | AST.Debug s <- universeBi ast ]
        checkIRConversion ir = [] @=? [ s | IR.Debug s <- universeBi ir ]
    in do
      ast <- Bash2AST.translateFile file
      return (testCaseSteps ("Full parse test: " ++ file) $ \step -> do
                step "check AST"
                either failure checkASTSuccess ast
                step "check IR"
                either failure (checkIRConversion . AST2IR.translate) ast)


fullParseTests :: IO TestTree
fullParseTests =
    do test2 <- testParses "data/le.sh"
       return $ testGroup "Parse tests" [expectFail test2]
