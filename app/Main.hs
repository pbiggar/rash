module Main where

import System.Environment
import TranslateBash

main :: IO ()
main = do
  (script:_) <- getArgs
  translate script
