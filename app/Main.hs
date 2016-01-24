module Main where

import System.Environment(getArgs)

import Rash.Bash2AST

main :: IO ()
main = do
  (scriptname:_) <- getArgs
  translateFileToStdout scriptname
