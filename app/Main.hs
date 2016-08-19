module Main where

import System.Environment(getArgs)
import qualified System.Exit as Exit
import qualified Data.Either as Either

import Rash.Bash2AST
import Rash.Interpret

main :: IO ()
main = do
  (scriptname:_) <- getArgs
  result         <- translateFile scriptname
  exitCode       <- if Either.isRight result
    then let (Right program) = result in interpret program
    else putStrLn "Failed to parse" >> return (Exit.ExitFailure (-1))
  Exit.exitWith exitCode
