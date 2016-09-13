{-# LANGUAGE ScopedTypeVariables #-}
module Rash.Interpreter where

import qualified Data.Map.Strict as Map
import qualified Control.Monad.Trans.State as State
import           Control.Monad.IO.Class (liftIO)
import           Control.Monad (foldM)
import qualified System.Exit as Exit
import qualified System.Process as Proc
import qualified GHC.IO.Handle as Handle
import qualified System.IO as IO

import Rash.AST

todo :: Show a => String -> a -> b
--todo reason a = VTodo reason (show a)
todo reason a = error (reason ++ ": " ++ (show a))

data Value = VInt Int
           | VString String
           | VBool Bool
           | VExitCode Int
           | VNull
           | VTodo String String
           | VHash (Map.Map String Value)
           | VArray [Value]
           | VPacket Exit.ExitCode -- TODO stdout and stderr as streams
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

debug ::Show a => a -> IO ()
debug x = putStrLn $ "Debug: " ++ show x

interpret :: Program -> [String] -> IO Value
interpret program args = do
  let initial = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  (val, final) <- State.runStateT (evalProgram program) (IState initial Map.empty)
  debug $ "Final state: " ++ show final
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

eval2Str :: Expr -> WithState
eval2Str e = do
    expr <- evalExpr e
    return $ toString expr


toString :: Value -> Value
toString s@(VString _) = s
toString v = todo "Not a string" v

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

evalExpr ss@(Subscript (Variable name) e) = do
  index <- evalExpr e
  st <- getSymTable
  let var = Map.lookup name st
  return $ case (var, index) of
    (Just (VArray a), VInt i) -> findWithDefault a i VNull
    (Just (VHash h), VString s) -> Map.findWithDefault VNull s h
    _ -> todo "Can't do a subscript unless on array/int or hash/string" (ss, var, index)

evalExpr (Assignment (LVar name) e) = do
  result <- evalExpr e
  updateSymTable $ Map.insert name result
  return result

evalExpr (FunctionInvocation name args) = do
  _ <- liftIO $ print args
  fn <- evalExpr name
  evaledArgs <- mapM evalExpr args
  code <- liftIO $ runFunction fn evaledArgs
  return $ code


evalExpr (Pipe goods) = do
  goods2 :: [(Value, [Value])] <- mapM evalArgs goods
  let commands = map (\((VString v), vs) -> (v, map (\(VString v2) -> v2) vs)) goods2

  result <- liftIO $ do

    (lastStdout, procs) <- foldM buildProc (Proc.NoStream, []) commands
    _ <- mapM Proc.waitForProcess procs

    let (Proc.UseHandle final) = lastStdout
    stdout <- Handle.hGetContents final

    print $ "stdout: " ++ stdout

    return stdout

  return $ VString result
  where
    buildProc :: (Proc.StdStream, [Proc.ProcessHandle]) -> (String, [String]) -> IO (Proc.StdStream, [Proc.ProcessHandle])
    buildProc (stdin, prevProcs) (cmd, args) = do
      let p = (Proc.proc cmd args) {
                 Proc.std_in = stdin
               , Proc.std_out = Proc.CreatePipe
               , Proc.close_fds = True }
      (_, Just out, _, procH) <- Proc.createProcess_ cmd p
      return (Proc.UseHandle out, prevProcs ++ [procH])

    evalArgs (FunctionInvocation name args) = do
      n <- eval2Str name
      as <- mapM eval2Str args
      return (n, as)
    evalArgs e = todo "how do we invoke non-FunctionInvocations" e


evalExpr (Integer i) = return $ VInt i
evalExpr (Str i) = return $ VString i


evalExpr e = do
  liftIO $ debug "an unsupported expression was found"
  liftIO $ debug e
  _ <- error "ending early"
  return $ todo "an unsupported expression was found" e


runFunction :: Value -> [Value] -> IO Value
runFunction fn args = do
  code <- case fn of
            VString str -> do
                  debug $ "Calling function: " ++ str ++ show args
                  Proc.rawSystem str (map show args)
            _ -> return $ Exit.ExitFailure (-1)
  return $ VPacket code
