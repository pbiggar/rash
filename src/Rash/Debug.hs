module Rash.Debug where

import qualified System.IO.Unsafe as Unsafe
import           Control.Monad (when)
import           Control.Monad.IO.Class (liftIO)

import qualified Rash.Options as Options


todo :: Show a => String -> a -> r
todo msg obj = do
  error $ "\nTODO: " ++ msg ++ ": " ++ (show obj)

debug :: Show a => a -> ()
debug x = do
  Unsafe.unsafePerformIO $ debugIO x

debugIO :: Show a => a -> IO ()
debugIO x = do
  liftIO $ when Options.flags_debug $ putStrLn $ "DEBUG: " ++ (show x)
