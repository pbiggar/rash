module Rash.RuntimeTypes where

import qualified Data.Map.Strict           as Map
import qualified System.Exit               as Exit
import qualified Control.Monad.Trans.State as State
import qualified GHC.IO.Handle             as Handle

import Rash.AST

data Value = VInt Int
           | VString String
           | VBool Bool
           | VExitCode Exit.ExitCode
           | VNull
           | VTodo String String
           | VHash (Map.Map String Value)
           | VArray [Value]
           | VPacket RetVal
             deriving (Show, Eq)


data RetVal = VResult Exit.ExitCode deriving (Show, Eq)
vsuccess :: RetVal
vsuccess = VResult Exit.ExitSuccess

vfail :: Int -> RetVal
vfail i = VResult (Exit.ExitFailure i)


-- TODO: take a stdin, output a stdout and stderr, return exit code or exception
type BuiltinFunction = ([Value] -> WithState RetVal)

data Function = UserDefined FuncDef
              | Builtin BuiltinFunction

type SymTable = Map.Map String Value
type FuncTable = Map.Map String Function
data Frame = Frame {symtable::SymTable, handles_::Handles} deriving (Show)
data IState = IState {frame_::Frame, functable::FuncTable} deriving (Show)
type WithState a = State.StateT IState IO a

data Handles = Handles { stdin_::Handle.Handle
                       , stdout_::Handle.Handle
                       , stderr_::Handle.Handle } deriving (Show)


instance (Show Function) where
       show (UserDefined (FuncDef n _ _)) = n
       show (Builtin _) = "Some builtin function"


type EvalExprFn  = Expr -> WithState Value
