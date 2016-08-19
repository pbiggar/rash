module Rash.Interpret where

import System.Exit (ExitCode)

import Rash.Bash2AST (translateFile)
import Rash.AST
import qualified Data.Either as Either
import qualified Data.Map.Strict as Map
import qualified System.Exit as Exit
import qualified Control.Monad.Trans.State as State
import Control.Monad.IO.Class (liftIO)

data Value = VInt Int
           | VString String
           | Test
           | Null
             deriving (Show, Eq)

type Symtable = Map.Map String Value
type FunctionTable = Map.Map String Expr
type IState = (Symtable, FunctionTable)
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
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess

interpret :: Program -> IO ExitCode
interpret program = do
  (val, final) <- State.runStateT (exeProgram program) (Map.empty, Map.empty)
  putStr "Final state: "
  print final
  return $ convertToExitCode val

exeProgram :: Program -> WithState
exeProgram (Program e) = exeExpr e

exeExpr :: Expr -> WithState
exeExpr (List es) = do
  result <- mapM exeExpr es
  return $ last result

exeExpr Nop = return Null

exeExpr fd@(FunctionDefinition name _ _) = do
  s <- State.get
  State.put (fst s, (Map.insert name fd (snd s)))
  return Null

exeExpr e = do
  liftIO $ print e
  return $ Test
