module Rash.Debug where

import           Control.Monad    (when)
import qualified System.IO.Unsafe as Unsafe
import qualified Text.Groom          as G

import qualified Rash.Options     as Opts

todo :: Show a => String -> a -> r
todo msg obj = do
  error $ "TODO (" ++ msg ++ "):\n " ++ (G.groom obj)


{-# NOINLINE debug #-}
debug :: Show a => String -> a -> ()
debug msg obj = do
  Unsafe.unsafePerformIO $ debugIO msg obj

debugIO :: Show a => String -> a -> IO ()
debugIO msg obj = do
  when (Opts.debugAll Opts.flags) $ putStrLn $ "DEBUG (" ++ msg ++ "): " ++ show obj
