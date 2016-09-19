{-# LANGUAGE TemplateHaskell #-}
module Main where

import qualified System.Exit as Exit

import qualified Rash.Runner as Runner
import qualified Rash.Repl as Repl

-- need this for HFlags to find the options
import Rash.Options ()

import HFlags

main :: IO ()
main = do
  args <- $initHFlags "rash - the Rebourne Again Shell"
  exitCode <- do
    case args of
      [] -> do Repl.runRepl
               return $ Exit.ExitSuccess
      [filename] -> Runner.runFile filename
      _ -> do putStrLn "too many args"
              return $ Exit.ExitFailure (-1)
  Exit.exitWith exitCode
