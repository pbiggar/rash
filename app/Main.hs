module Main where

import System.Environment as Env
import qualified System.Exit as Exit

import qualified Rash.Runner as Runner
import qualified Rash.Repl as Repl

main :: IO ()
main = do
  args <- Env.getArgs
  let (scriptname : clArgs) = args
  exitCode <-
    if 0 == length args
    then do Repl.runRepl
            return $ Exit.ExitSuccess
    else Runner.runFile scriptname clArgs
  Exit.exitWith exitCode
