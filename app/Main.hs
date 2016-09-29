module Main where

import           Data.List    (intercalate)
import qualified System.Exit  as Exit

import qualified Rash.Options as Opts
import qualified Rash.Repl    as Repl
import qualified Rash.Runner  as Runner

main :: IO ()
main = do
  exitCode <- do
    print Opts.flags
    case Opts.files Opts.flags of
      [] -> do Repl.runRepl
               return $ Exit.ExitSuccess
      [filename] -> if Opts.checkSyntax Opts.flags
                       then Runner.checkSyntax filename filename
                       else Runner.runFile filename
      files -> do putStrLn $ "too many args: " ++ (intercalate " " files)
                  return $ Exit.ExitFailure (-1)
  Exit.exitWith exitCode
