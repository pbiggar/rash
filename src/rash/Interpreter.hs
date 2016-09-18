{-# LANGUAGE ScopedTypeVariables #-}
module Rash.Interpreter where

import qualified Data.Map.Strict as Map
import qualified Control.Monad.Trans.State as State
import           Control.Monad.IO.Class (liftIO)
import qualified System.Process as Proc
import qualified GHC.IO.Handle as Handle
import qualified Text.Groom as G
import qualified System.IO as IO


import Rash.AST
import Rash.Builtins as Builtins
import Rash.Runtime
import qualified Rash.Process as Process

todo :: Show a => String -> a -> b
--todo reason a = VTodo reason (show a)
todo reason a = error (reason ++ ": " ++ (show a))


findWithDefault :: [a] -> Int -> a -> a
findWithDefault list index def =
  if index >= length list
    then def
    else list !! index

debug :: Show a => a -> IO ()
debug _ = return ()
--debug x = putStrLn $ "Debug: " ++ show x


runExpr :: RunExprFn
runExpr expr st hs ft = do
  (val, _) <- State.runStateT (evalExpr expr)
                                  (IState
                                  (Frame st hs)
                                  ft)
  return val

interpret :: Program -> [String] -> IO Value
interpret (Program expr) args = do
  let initialSymTable = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  let initialFuncTable = Builtins.builtins
  let handles = Handles IO.stdin IO.stdout IO.stderr
  val <- runExpr expr initialSymTable handles initialFuncTable
  -- debug $ "Final state: " ++ show final
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
  let _ = debug $ "executing a list with " ++ (show (length es)) ++ " exprs"
  evalExpr' e

evalExpr e = do
  let _ = debug $ "executing: " ++ (G.groom e)
  v <- evalExpr' e
  let _ = debug $ "returning: " ++ (show v)
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

evalExpr' f@(FunctionInvocation _ _) = evalExpr' (Pipe [f])

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
  liftIO $ debug "an unsupported expression was found"
  liftIO $ debug e
  _ <- error "ending early"
  return $ todo "an unsupported expression was found" e

evalPipe :: [Expr] -> Handle.Handle -> WithState Value
evalPipe exprs stdin = do
  goods :: [(String, [Value])] <- mapM evalArgs exprs
  let commands = map (\(v, vs) -> (v, map (\(VString v2) -> v2) vs)) goods
  Process.evalPipe commands stdin runExpr
  where
    evalArgs (FunctionInvocation name args) = do
      as <- mapM eval2Str args
      return (name, as)
    evalArgs e = todo "how do we invoke non-FunctionInvocations" e
