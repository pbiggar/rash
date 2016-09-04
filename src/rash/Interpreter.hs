module Rash.Interpreter where

import qualified Data.Map.Strict as Map
import qualified Control.Monad.Trans.State as State
import           Control.Monad.IO.Class (liftIO)

import Rash.AST

data Value = VInt Int
           | VString String
           | VBool Bool
           | VExitCode Int
           | VNull
           | VTest
           | VHash (Map.Map String Value)
           | VArray [Value]
             deriving (Show, Eq)

type SymTable = Map.Map String Value
type FuncTable = Map.Map String Expr
data IState = IState {symtable::SymTable, functable::FuncTable} deriving (Show)
type WithState = State.StateT IState IO Value

getSymTable :: State.StateT IState IO SymTable
getSymTable = State.gets symtable

getFuncTable :: State.StateT IState IO FuncTable
getFuncTable = State.gets functable

updateFuncTable :: (FuncTable -> FuncTable) -> State.StateT IState IO ()
updateFuncTable newTable = do
  s <- State.get
  State.put $ s {functable = newTable (functable s)}

updateSymTable :: (SymTable -> SymTable) -> State.StateT IState IO ()
updateSymTable newTable = do
  s <- State.get
  State.put $ s {symtable = newTable (symtable s)}


findWithDefault :: [a] -> Int -> a -> a
findWithDefault list index def =
  if index >= length list
    then def
    else list !! index

interpret :: Program -> [String] -> IO Value
interpret program args = do
  let initial = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  (val, final) <- State.runStateT (evalProgram program) (IState initial Map.empty)
  putStrLn $ "Final state: " ++ show final
  return val

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



evalProgram :: Program -> WithState
evalProgram (Program e) = evalExpr e

evalExpr :: Expr -> WithState
evalExpr (List es) = do
  result <- mapM evalExpr es
  return $ last result

evalExpr Nop = return VNull

evalExpr fd@(FunctionDefinition name _ _) = do
  updateFuncTable $ Map.insert name fd
  return VNull

evalExpr (If cond then' else') = do
  condVal <- evalExpr cond
  if isTruthy condVal then evalExpr then' else evalExpr else'

evalExpr (Equals l r) = do
  lval <- evalExpr l
  rval <- evalExpr r
  return $ VBool (lval == rval)

evalExpr (Subscript (Variable name) e) = do
  index <- evalExpr e
  st <- getSymTable
  let var = Map.lookup name st
  return $ case (var, index) of
    (Just (VArray a), VInt i) -> findWithDefault a i VNull
    (Just (VHash h), VString s) -> Map.findWithDefault VNull s h
    _ -> VTest

evalExpr (Assignment (LVar name) e) = do
  result <- evalExpr e
  updateSymTable $ Map.insert name result
  return result



evalExpr (Integer i) = return $ VInt i
evalExpr (Str i) = return $ VString i




evalExpr e = do
  liftIO $ print e
  return VTest