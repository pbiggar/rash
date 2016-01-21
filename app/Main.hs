module Main where

import System.Environment
import TranslateBash

main :: IO ()
main = do
  (scriptname:_) <- getArgs
  translateFileToStdout scriptname
