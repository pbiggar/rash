module Rash.Runtime.Interpreter where

import           Control.Monad.IO.Class    (liftIO)
import qualified Control.Monad.Trans.State as State
import qualified Data.Map.Strict           as Map
import           Data.Maybe                (fromMaybe)
import qualified GHC.IO.Handle             as Handle
import qualified System.IO                 as IO
import qualified System.Process            as Proc

import qualified Rash.Debug                as Debug
import           Rash.IR.AST
import           Rash.Runtime.Builtins     as Builtins
import qualified Rash.Runtime.Process      as Process
import qualified Rash.Runtime.Runtime      as RT
import           Rash.Runtime.Types
import qualified Rash.Util                 as Util

debug :: Show a => String -> a -> a
debug a b = Debug.traceTmpl "exe" a b

debugM :: (Show a, Monad f, Applicative f) => String -> a -> f ()
debugM a b = Debug.traceMTmpl "exe" a b

die :: Show a => String -> a -> t
die a b = Debug.die "exe" a b

interpret :: Program -> [String] -> IO Value
interpret (Program exprs) args = do
  let st = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  let ft = Builtins.builtins
  let hs = Handles IO.stdin IO.stdout IO.stderr
  let state = IState (Frame st hs) ft
  (val, final) <- State.runStateT (evalExprs exprs) state
  debugM "final state" final
  return val

evalExprs :: [Expr] -> WithState Value
evalExprs es = do
  debugM ("executing a list with " ++ (show (length es)) ++ " exprs") ()
  evaled <- mapM evalExpr es
  return (last evaled)

evalExpr :: Expr -> WithState Value
evalExpr e = do
  _ <- debugM "executing" e
  v <- evalExpr' e
  _ <- debugM "returning" v
  _ <- debugM "  <- " e
  return v

evalExpr' :: Expr -> WithState Value
evalExpr' Nop = return VNull

evalExpr' (FunctionDefinition fd@(FuncDef name _ _)) = do
  RT.updateFuncTable $ Map.insert name (UserDefined fd)
  return VNull

evalExpr' (If cond then' else') = do
  condVal <- evalExpr cond
  if Util.isTruthy condVal then evalExprs then' else evalExprs else'

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
    _ -> die "Can't do a subscript unless on array/int or hash/string" (ss, var, index)

evalExpr' (Assignment (LVar name) e) = do
  result <- evalExpr e
  RT.updateSymTable $ Map.insert name result
  return result


------------------------------------------------
-- Function calls and pipes
------------------------------------------------

evalExpr' (Pipe (Stdin input) fns) = do
  inputStr <- eval2Str input
  (r,w) <- liftIO $ Proc.createPipe
  liftIO $ IO.hPutStr w inputStr

  result <- evalPipe fns r
  liftIO $ IO.hClose r
  return result

evalExpr' (Pipe NoStdin fns) = do
  stdin <- RT.getStdin
  evalPipe fns stdin



evalExpr' Null = return VNull
evalExpr' (Integer i) = return $ VInt i
evalExpr' (Str s) = return $ VString s
evalExpr' (Array es) = do
  as <- mapM evalExpr es
  return $ VArray as



evalExpr' e = do
  die "an unsupported expression was found" e

eval2Str :: Expr -> WithState String
eval2Str e = do
    expr <- evalExpr e
    let (VString str) = Util.toString expr
    return str

evalPipe :: [FunctionCall] -> Handle.Handle -> WithState Value
evalPipe fns stdin = do
  commands <- mapM evalArgs fns
  Process.evalPipe commands stdin evalExpr
  where
    evalArgs (Fn name args) = do
      args2 <- mapM evalExpr args
      return (name, args2)
    evalArgs e = die "how do we invoke non-FunctionInvocations" e
