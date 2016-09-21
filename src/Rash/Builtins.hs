module Rash.Builtins where

import qualified Data.Map.Strict as Map
import qualified System.Exit
import           Control.Monad.IO.Class (liftIO)

import qualified Rash.Util as Util
import           Rash.Runtime
import           Rash.Debug



builtins :: Map.Map String Function
builtins = m2
  where
    m0 = Map.empty
    m1 = Map.insert "sys.exit" (Builtin sysExit) m0
    m2 = Map.insert "length" (Builtin length_) m1


sysExit :: BuiltinFunction
sysExit [] = sysExit $ [VInt 0]
sysExit [code] = do
  _ <- liftIO $ System.Exit.exitWith $ Util.int2exit $ v2int code
  return VNull
sysExit a = todo "todo types" a

length_ :: BuiltinFunction
length_ a@[] = todo "empty length" a
length_ [VString s] = do
  return $ VInt $ length s
length_ [VArray s] = do
  return $ VInt $ length s
length_ a = todo "length should support more types" a
