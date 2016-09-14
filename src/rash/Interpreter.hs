{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}
module Rash.Interpreter where

import qualified Data.Map.Strict as Map
import qualified Control.Monad.Trans.State as State
import           Control.Monad.IO.Class (liftIO)
--import           Control.Monad (foldM)
import qualified System.Exit as Exit
import qualified System.Process as Proc
import qualified GHC.IO.Handle as Handle
import qualified Text.Groom as G
--import qualified Unsafe.Coerce
import qualified System.IO as IO
import qualified Control.Concurrent as CC

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
type FuncTable = Map.Map String FuncDef
data Frame = Frame {symtable::SymTable, handles_::Handles} deriving (Show)
data IState = IState {frame_::Frame, functable::FuncTable} deriving (Show)
type WithState a = State.StateT IState IO a

data Handles = Handles {stdin_::Handle.Handle
                      , stdout_::Handle.Handle
                      , stderr_::Handle.Handle}
                      deriving (Show)

data Process = FuncProc CC.ThreadId | ProcProc Proc.ProcessHandle

waitForProcess :: Process -> IO ()
waitForProcess (FuncProc threadid) = error "asdas"
waitForProcess (ProcProc handle) = do
  _ <- Proc.waitForProcess handle
  return ()


getStdin :: WithState Handle.Handle
getStdin = State.gets $ stdin_ . handles_ . frame_

getStdout :: WithState Handle.Handle
getStdout = State.gets $ stdout_ . handles_ . frame_

getStderr :: WithState Handle.Handle
getStderr = State.gets $ stderr_ . handles_ . frame_

getSymTable :: WithState SymTable
getSymTable = State.gets $ symtable . frame_

getFuncTable :: WithState FuncTable
getFuncTable = State.gets functable

updateFuncTable :: (FuncTable -> FuncTable) -> WithState ()
updateFuncTable newTable = do
  s <- State.get
  State.put $ s {functable = newTable (functable s)}

updateSymTable :: (SymTable -> SymTable) -> State.StateT IState IO ()
updateSymTable newTable = do
  s <- State.get
  let f = frame_ s
  let newFrame = f {symtable = newTable (symtable f)}
  State.put $ s {frame_ = newFrame}


findWithDefault :: [a] -> Int -> a -> a
findWithDefault list index def =
  if index >= length list
    then def
    else list !! index

debug ::Show a => a -> IO ()
debug x = putStrLn $ "Debug: " ++ show x

interpret :: Program -> [String] -> IO Value
interpret program args = do
  let initialSymTable = Map.insert "sys.argv" (VArray (map VString args)) Map.empty
  let initialFuncTable = Map.empty
  let handles = Handles IO.stdin IO.stdout IO.stderr
  (val, final) <- State.runStateT (evalProgram program)
                                  (IState
                                   (Frame initialSymTable handles)
                                   initialFuncTable)
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

eval2Str :: Expr -> WithState Value
eval2Str e = do
    expr <- evalExpr e
    return $ toString expr


toString :: Value -> Value
toString s@(VString _) = s
toString v = todo "Not a string" v

evalProgram :: Program -> WithState Value
evalProgram (Program e) = evalExpr e

evalExpr :: Expr -> WithState Value
evalExpr e@(List es) = do
  liftIO $ print $ "executing a list with " ++ (show (length es)) ++ " exprs"
  evalExpr' e

evalExpr e = do
  liftIO $ print $ "executing: " ++ (G.groom e)
  v <- evalExpr' e
  liftIO $ print $ "returning: " ++ (show v)
  return v

evalExpr' :: Expr -> WithState Value
evalExpr' (List es) = do
  result <- mapM evalExpr es
  return $ last result

evalExpr' Nop = return VNull

evalExpr' (FunctionDefinition fd@(FuncDef name _ _)) = do
  updateFuncTable $ Map.insert name fd
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

evalExpr' (Pipe goodsExpr) = do
  -- TODO: when you call a pipe, what do you do with the "output"? Obviously,
  -- you stream it to the parent. And occasionally the parent will be stdout. So
  -- clearly, we need to pass - implicitly - the handle from the calling
  -- function.
  -- However, that breaks our metaphor of "returning" a packet with the streams in it...
  -- TODO: we need to handle stderr too.
  -- TODO support exit codes
  goods :: [(String, [Value])] <- mapM evalArgs goodsExpr
  let commands = map (\(v, vs) -> (v, map (\(VString v2) -> v2) vs)) goods

  stdin <- getStdin
  stdout <- getStdout
  stderr <- getStderr

  do
    --handles = [(stdin, w1), (r1, w2), (r2, stdout)]
    pipes :: [(Handle.Handle, Handle.Handle)] <- liftIO $ mapM (const Proc.createPipe) goods
    let pipes1 :: [(Handle.Handle, Handle.Handle)] = tail pipes
    let pipes2 :: [Handle.Handle] = foldl (\c (a,b) -> c ++ [a, b]) [] pipes1
    let pipes3 :: [Handle.Handle] = [stdin] ++ pipes2 ++ [stdout]
    let joiner = (\case
                   (a:b:cs) -> [Handles a b stderr] ++ (joiner cs)
                   [] -> [])

    let pipes4 :: [Handles] = joiner pipes3

    let entirity = zip pipes4 commands

    procs <- mapM buildSegment entirity

    _ <- liftIO $ mapM waitForProcess procs
    return VNull


  where
    buildSegment :: (Handles, (String, [String])) -> WithState (Process)
    buildSegment (handles, (cmd, args)) = do
      ft <- getFuncTable
      let func = Map.lookup cmd ft
      procHandle <- case func of
        Just f -> createFuncThread f args handles
        Nothing -> liftIO $ createBackgroundProc cmd args handles
      return procHandle

    evalArgs (FunctionInvocation name args) = do
      as <- mapM eval2Str args
      return (name, as)
    evalArgs e = todo "how do we invoke non-FunctionInvocations" e

evalExpr' Null = return VNull
evalExpr' (Integer i) = return $ VInt i
evalExpr' (Str i) = return $ VString i


evalExpr' e = do
  liftIO $ debug "an unsupported expression was found"
  liftIO $ debug e
  _ <- error "ending early"
  return $ todo "an unsupported expression was found" e



createBackgroundProc :: String -> [String] -> Handles -> IO Process
createBackgroundProc cmd args (Handles stdin stdout stderr) = do
  let p = (Proc.proc cmd args) {
      Proc.std_in = Proc.UseHandle stdin
    , Proc.std_out = Proc.UseHandle stdout
    , Proc.std_err = Proc.UseHandle stderr
    , Proc.close_fds = True }
  (_, _, _, proc) <- liftIO $ Proc.createProcess_ cmd p
  return $ ProcProc proc

createFuncThread :: FuncDef -> [String] -> Handles -> WithState Process
createFuncThread (FuncDef _ params body) args (Handles stdin stdout stderr) = do
  ft <- getFuncTable

  -- new stack frame, with args TODO: copy the "globals"
  let newSymTable = foldr (\((FunctionParameter param), arg)
                           table
                            -> Map.insert param (VString arg) table)
                         Map.empty
                         (zip params args)

  let frame = Frame newSymTable (Handles stdin stdout stderr)
  -- (returnVal, state) -- state is dontcare
  threadid <- do liftIO $ CC.forkIO $ do

                  (_, _) <- State.runStateT (evalProgram (Program body)) (IState frame ft)
                  return ()

  return $ FuncProc threadid
