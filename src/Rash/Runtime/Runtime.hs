module Rash.Runtime.Runtime where

import qualified Control.Monad.Trans.State as State
import qualified GHC.IO.Handle             as Handle

import           Rash.Runtime.Types

getState :: WithState IState
getState = State.get

getStdin :: WithState Handle.Handle
getStdin = State.gets $ stdin_ . handles_ . frame_

getStdout :: WithState Handle.Handle
getStdout = State.gets $ stdout_ . handles_ . frame_

getStderr :: WithState Handle.Handle
getStderr = State.gets $ stderr_ . handles_ . frame_

getFrame :: WithState Frame
getFrame = State.gets frame_

getSymTable :: WithState SymTable
getSymTable = State.gets $ symtable . frame_

getFuncTable :: WithState FuncTable
getFuncTable = State.gets functable

updateFuncTable :: (FuncTable -> FuncTable) -> WithState ()
updateFuncTable newTable = do
  s <- State.get
  State.put $ s {functable = newTable (functable s)}

updateSymTable :: (SymTable -> SymTable) -> WithState ()
updateSymTable newTable = do
  s <- State.get
  let f = frame_ s
  let newFrame = f {symtable = newTable (symtable f)}
  State.put $ s {frame_ = newFrame}

v2int :: Value -> Int
v2int (VInt i) = i
v2int v = error $ "not an int: " ++ (show v)

