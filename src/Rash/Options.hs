module Rash.Options where

import qualified System.IO.Unsafe as Unsafe
import           System.Environment (getArgs)
import qualified Data.IORef as IORef

init :: IO [String]
init = do
  args <- getArgs
  if (length args > 0 && head args == "--debug") then
    do (IORef.writeIORef flags_data True)
       return (tail args)
  else
    return args


flags_data :: IORef.IORef Bool
flags_data = Unsafe.unsafePerformIO $ IORef.newIORef False

flags_debug :: Bool
flags_debug = Unsafe.unsafePerformIO $ IORef.readIORef flags_data
