module Rash.Builtins where

import           Control.Monad.IO.Class (liftIO)
import qualified Data.Map.Strict        as Map
import qualified System.Exit
import qualified System.IO as IO
import qualified System.Directory as Dir

import           Rash.Debug
import           Rash.RuntimeTypes
import qualified Rash.Runtime           as RT

import qualified Rash.Util              as Util



builtins :: Map.Map String Function
builtins = m3
  where
    m0 = Map.empty
    m1 = Map.insert "sys.exit" (Builtin sysExit) m0
    m2 = Map.insert "length" (Builtin length_) m1
    m3 = Map.insert "file.exists?" (Builtin fileExists) m2



sysExit :: BuiltinFunction
sysExit stdin [] = sysExit stdin [VInt 0]
sysExit _ [code] = do
  _ <- liftIO $ System.Exit.exitWith $ Util.int2exit $ RT.v2int code
  return VNull
sysExit _ a = todo "todo types" a

length_ :: BuiltinFunction
length_ _ a@[] = todo "empty length" a
length_ _ [VString s] = do
  return $ VInt $ length s
length_ _ [VArray s] = do
  return $ VInt $ length s
length_ _ a = todo "length should support more types" a


fileExists :: BuiltinFunction
fileExists stdin _ = liftIO $ do
  name <- IO.hGetLine stdin
  res <- Dir.doesFileExist name
  return $ VBool res
