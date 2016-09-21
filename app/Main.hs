module Main where

import qualified System.Exit as Exit

import qualified Rash.Runner as Runner
import qualified Rash.Repl as Repl
import qualified Rash.Options as Options

main :: IO ()
main = do
  args <- Options.init
  exitCode <- do
    case args of
      [] -> do Repl.runRepl
               return $ Exit.ExitSuccess
      [filename] -> Runner.runFile filename
      _ -> do putStrLn "too many args"
              return $ Exit.ExitFailure (-1)
  Exit.exitWith exitCode
