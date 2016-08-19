module Main where

import System.Environment(getArgs)
import qualified System.Exit as Exit
import qualified Data.Either as Either

import Rash.Bash2AST
import Rash.Interpret

main :: IO ()
main = do
  (scriptname:_) <- getArgs
  exitCode <- interpretFile scriptname
  Exit.exitWith exitCode
