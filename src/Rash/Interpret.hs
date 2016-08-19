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
           | VBool Bool
           | VExitCode Int
           | VNull
           | VTest
           | VHash (Map.Map String Value)
           | VArray [Value]
             deriving (Show, Eq)

type Symtable = Map.Map String Value
type FunctionTable = Map.Map String Expr
type IState = (Symtable, FunctionTable)
type WithState = State.StateT IState IO Value

interpretFile :: FilePath -> [String] -> IO ExitCode
interpretFile file args = do
  result <- translateFile file
  exitCode <-
    if Either.isRight result
      then
        let (Right program) = result
        in interpret program args
      else do
        putStrLn "Failed to parse"
        return $ Exit.ExitFailure (-1)
  return $ exitCode

convertToExitCode :: Value -> ExitCode
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess

isTruthy :: Value -> Bool
isTruthy (VString _) = True
isTruthy (VInt 0) = False
isTruthy (VInt _) = True
isTruthy (VBool b) = b
isTruthy (VExitCode 0) = True
isTruthy (VExitCode _) = False
isTruthy VNull = False
isTruthy VTest = False
isTruthy (VArray _) = True
isTruthy (VHash _) = True


interpret :: Program -> [String] -> IO ExitCode
interpret program args = do
  let initial = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  (val, final) <- State.runStateT (exeProgram program) (initial, Map.empty)
  putStr "Final state: "
  print final
  return $ convertToExitCode val

exeProgram :: Program -> WithState
exeProgram (Program e) = exeExpr e

exeExpr :: Expr -> WithState
exeExpr (List es) = do
  result <- mapM exeExpr es
  return $ last result

exeExpr Nop = return VNull

exeExpr fd@(FunctionDefinition name _ _) = do
  s <- State.get
  State.put (fst s, (Map.insert name fd (snd s)))
  return VNull

exeExpr (If cond then' else') = do
  condVal <- exeExpr cond
  if (isTruthy condVal) then exeExpr then' else exeExpr else'

exeExpr (Equals l r) = do
  lval <- exeExpr l
  rval <- exeExpr r
  return $ VBool (lval == rval)


exeExpr e = do
  liftIO $ print e
  return $ VTest
