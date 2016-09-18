module Rash.Builtins where

import qualified Data.Map.Strict as Map
import qualified System.Exit
import           Control.Monad.IO.Class (liftIO)

import qualified Rash.Util as Util
import           Rash.Runtime



builtins :: Map.Map String Function
builtins = Map.insert "sys.exit" (Builtin sysExit) Map.empty

sysExit :: BuiltinFunction
sysExit [] = sysExit $ [VInt 0]
sysExit [code] = do
  _ <- liftIO $ System.Exit.exitWith $ Util.int2exit $ v2int code
  return VNull
sysExit a = error $ "todo types" ++ (show a)
