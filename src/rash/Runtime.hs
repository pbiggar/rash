module Rash.Runtime where

import qualified Data.Map.Strict as Map
import qualified System.Exit as Exit
import qualified Control.Monad.Trans.State as State
import qualified GHC.IO.Handle as Handle

import           Rash.AST


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

-- TODO: take a stdin, output a stdout and stderr, return exit code or exception
type BuiltinFunction = ([Value] -> WithState Value)

data Function = UserDefined FuncDef
              | Builtin BuiltinFunction

type SymTable = Map.Map String Value
type FuncTable = Map.Map String Function
data Frame = Frame {symtable::SymTable, handles_::Handles} deriving (Show)
data IState = IState {frame_::Frame, functable::FuncTable}
type WithState a = State.StateT IState IO a

data Handles = Handles {stdin_::Handle.Handle
                      , stdout_::Handle.Handle
                      , stderr_::Handle.Handle}
                      deriving (Show)



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

v2int :: Value -> Int

v2int (VInt i) = i
v2int v = error $ "not an int: " ++ (show v)

type RunExprFn  = Expr -> SymTable -> Handles -> FuncTable -> IO Value
