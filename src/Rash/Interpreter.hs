module Rash.Interpreter where

import           Control.Monad.IO.Class    (liftIO)
import qualified Control.Monad.Trans.State as State
import qualified Data.Map.Strict           as Map
import           Data.Maybe                (fromMaybe)
import qualified GHC.IO.Handle             as Handle
import qualified System.IO                 as IO
import qualified System.Process            as Proc

import           Rash.AST
import           Rash.Builtins             as Builtins
import           Rash.Debug
import qualified Rash.Process              as Process
import qualified Rash.Runtime              as RT
import           Rash.RuntimeTypes
import qualified Rash.Util                 as Util



interpret :: Program -> [String] -> IO Value
interpret (Program expr) args = do
  let st = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  let ft = Builtins.builtins
  let hs = Handles IO.stdin IO.stdout IO.stderr
  let state = IState (Frame st hs) ft
  (val, final) <- State.runStateT (evalExpr expr) state
  debugIO "Final state" final
  return val


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
  RT.updateFuncTable $ Map.insert name (UserDefined fd)
  return VNull

evalExpr' (If cond then' else') = do
  condVal <- evalExpr cond
  if Util.isTruthy condVal then evalExpr then' else evalExpr else'

evalExpr' (Binop l Equals r) = do
  lval <- evalExpr l
  rval <- evalExpr r
  return $ VBool (lval == rval)

evalExpr' (Binop l And r) = do
  lval <- evalExpr l
  res <- if (Util.isTruthy lval) then
    do rval <- evalExpr r
       return $ Util.isTruthy rval
    else return False
  return $ VBool res

evalExpr' (Unop Not e) = do
  res <- evalExpr e
  return $ VBool $ not (Util.isTruthy res)

evalExpr' (Concat exprs) = do
  vs <- mapM evalExpr exprs
  return $ VString $ foldl (\a b -> a ++ (Util.asString b)) "" vs

evalExpr' (Variable name) = do
  st <- RT.getSymTable
  return $ fromMaybe VNull $ Map.lookup name st

evalExpr' ss@(Subscript (Variable name) e) = do
  index <- evalExpr e
  st <- RT.getSymTable
  let var = Map.lookup name st
  return $ case (var, index) of
    (Just (VArray a), VInt i) -> Util.findWithDefault a i VNull
    (Just (VHash h), VString s) -> Map.findWithDefault VNull s h
    _ -> todo "Can't do a subscript unless on array/int or hash/string" (ss, var, index)

evalExpr' (Assignment (LVar name) e) = do
  result <- evalExpr e
  RT.updateSymTable $ Map.insert name result
  return result


------------------------------------------------
-- Function calls and pipes
------------------------------------------------

evalExpr' f@(FunctionCall _ _) =
  evalExpr' (Pipe [f])

evalExpr' (Pipe exprs@(FunctionCall _ _:_)) = do
  stdin <- RT.getStdin
  evalPipe exprs stdin

evalExpr' (Pipe (expr : exprs)) =
  evalExpr $ Stdin expr (Pipe exprs)

evalExpr' (Pipe exprs) = do
  stdin <- RT.getStdin
  evalPipe exprs stdin

evalExpr' (Stdin input (Pipe exprs)) = do
  inputStr <- eval2Str input
  (r,w) <- liftIO $ Proc.createPipe
  liftIO $ IO.hPutStr w inputStr

  result <- evalPipe exprs r
  liftIO $ IO.hClose r
  return result

evalExpr' (Stdin input expr) = do
  evalExpr (Stdin input (Pipe [expr]))




evalExpr' Null = return VNull
evalExpr' (Integer i) = return $ VInt i
evalExpr' (Str s) = return $ VString s
evalExpr' (Array es) = do
  as <- mapM evalExpr es
  return $ VArray as



evalExpr' e = do
  todo "an unsupported expression was found" e

eval2Str :: Expr -> WithState String
eval2Str e = do
    expr <- evalExpr e
    let (VString str) = Util.toString expr
    return str

evalPipe :: [Expr] -> Handle.Handle -> WithState Value
evalPipe exprs stdin = do
  commands <- mapM evalArgs exprs
  Process.evalPipe commands stdin evalExpr
  where
    evalArgs (FunctionCall name args) = do
      args2 <- mapM evalExpr args
      return (name, args2)
    evalArgs e = todo "how do we invoke non-FunctionInvocations" e
