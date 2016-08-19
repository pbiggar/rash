module Main where

import System.Environment(getArgs)
import qualified System.Exit as Exit

import Rash.Interpret

main :: IO ()
main = do
  (scriptname:args) <- getArgs
  exitCode <- interpretFile scriptname args
  Exit.exitWith exitCode
