{-# LANGUAGE ScopedTypeVariables #-}
module Rash.Interpreter where

import           Control.Monad.IO.Class    (liftIO)
import qualified Control.Monad.Trans.State as State
import qualified Data.Map.Strict           as Map
import           Data.Maybe                (fromMaybe)
import qualified GHC.IO.Handle             as Handle
import qualified System.Process            as Proc
import qualified System.IO                 as IO

import           Rash.AST
import           Rash.Builtins             as Builtins
import           Rash.Debug
import qualified Rash.Process              as Process
import           Rash.Runtime


findWithDefault :: [a] -> Int -> a -> a
findWithDefault list index def =
  if index >= length list
    then def
    else list !! index


interpret :: Program -> [String] -> IO Value
interpret (Program expr) args = do
  let st = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  let ft = Builtins.builtins
  let hs = Handles IO.stdin IO.stdout IO.stderr
  let state = IState (Frame st hs) ft
  (val, final) <- State.runStateT (evalExpr expr) state
  debugIO "Final state" final
  return val

isTruthy :: Value -> Bool
isTruthy (VString _) = True
isTruthy (VInt 0) = False
isTruthy (VInt _) = True
isTruthy (VBool b) = b
isTruthy (VExitCode 0) = True
isTruthy (VExitCode _) = False
isTruthy VNull = False
isTruthy (VTodo _ _) = False
isTruthy (VArray _) = True
isTruthy (VHash _) = True
isTruthy vp@(VPacket _) = todo "should vpacket be truthy?" vp

eval2Str :: Expr -> WithState Value
eval2Str e = do
    expr <- evalExpr e
    return $ toString expr


toString :: Value -> Value
toString s@(VString _) = s
toString v = todo "Not a string" v

evalExpr :: Expr -> WithState Value
evalExpr e@(List es) = do
  liftIO $ debugIO ("executing a list with " ++ (show (length es)) ++ " exprs") ()
  evalExpr' e

evalExpr e = do
  liftIO $ debugIO "executing: " e
  v <- evalExpr' e
  liftIO $ debugIO "returning: " v
  liftIO $ debugIO "  <- " e
  return v

evalExpr' :: Expr -> WithState Value
evalExpr' (List es) = do
  result <- mapM evalExpr es
  return $ last result

evalExpr' Nop = return VNull

evalExpr' (FunctionDefinition fd@(FuncDef name _ _)) = do
  updateFuncTable $ Map.insert name (UserDefined fd)
  return VNull

evalExpr' (If cond then' else') = do
  condVal <- evalExpr cond
  if isTruthy condVal then evalExpr then' else evalExpr else'

evalExpr' (Binop l Equals r) = do
  lval <- evalExpr l
  rval <- evalExpr r
  return $ VBool (lval == rval)

evalExpr' (Binop l And r) = do
  lval <- evalExpr l
  res <- if (isTruthy lval) then
    do rval <- evalExpr r
       return $ isTruthy rval
    else return False
  return $ VBool res

evalExpr' (Unop Not e) = do
  res <- evalExpr e
  return $ VBool $ not (isTruthy res)

evalExpr' (Variable name) = do
  st <- getSymTable
  return $ fromMaybe VNull $ Map.lookup name st

evalExpr' ss@(Subscript (Variable name) e) = do
  index <- evalExpr e
  st <- getSymTable
  let var = Map.lookup name st
  return $ case (var, index) of
    (Just (VArray a), VInt i) -> findWithDefault a i VNull
    (Just (VHash h), VString s) -> Map.findWithDefault VNull s h
    _ -> todo "Can't do a subscript unless on array/int or hash/string" (ss, var, index)

evalExpr' (Assignment (LVar name) e) = do
  result <- evalExpr e
  updateSymTable $ Map.insert name result
  return result

evalExpr' f@(FunctionCall _ _) = evalExpr' (Pipe [f])

evalExpr' (Pipe exprs) = do
  stdin <- getStdin
  evalPipe exprs stdin

evalExpr' (Stdin input expr) = do
  (VString inputStr) <- eval2Str input
  (r,w) <- liftIO $ Proc.createPipe
  liftIO $ IO.hPutStr w inputStr

  result <- evalPipe [expr] r
  liftIO $ IO.hClose r
  return result



evalExpr' Null = return VNull
evalExpr' (Integer i) = return $ VInt i
evalExpr' (Str i) = return $ VString i


evalExpr' e = do
  todo "an unsupported expression was found" e


evalPipe :: [Expr] -> Handle.Handle -> WithState Value
evalPipe exprs stdin = do
  commands <- mapM evalArgs exprs
  Process.evalPipe commands stdin evalExpr
  where
    evalArgs (FunctionCall name args) = do
      args2 <- mapM evalExpr args
      return (name, args2)
    evalArgs e = todo "how do we invoke non-FunctionInvocations" e
