module Rash.Interpret where

import System.Exit (ExitCode)

import Rash.Bash2AST (translateFile)
import Rash.AST
import qualified Data.Either as Either
import qualified Data.Map.Strict as Map
import qualified System.Exit as Exit
import qualified Control.Monad.Trans.State as State
import Control.Monad.IO.Class (liftIO)

data Value = Test

type IState = Map.Map String Value
type WithState = State.StateT IState IO Value

interpretFile :: FilePath -> IO ExitCode
interpretFile file = do
  result <- translateFile file
  exitCode <-
    if Either.isRight result
      then
        let (Right program) = result
        in interpret program
      else do
        putStrLn "Failed to parse"
        return $ Exit.ExitFailure (-1)
  return $ exitCode

convertToExitCode :: Value -> ExitCode
convertToExitCode _ = Exit.ExitSuccess

interpret :: Program -> IO ExitCode
interpret program = do
  (val, final) <- State.runStateT (exeProgram program) Map.empty
  return $ convertToExitCode val

exeProgram :: Program -> WithState
exeProgram (Program e) = exeExpr e

exeExpr :: Expr -> WithState
exeExpr (List es) = do
  result <- mapM exeExpr es
  return $ last result



exeExpr e = do
  liftIO $ print "Something"
  return $ Test
