module Main where

import           Data.List    (intercalate)
import qualified System.Exit  as Exit
import Control.Monad (when)

import qualified Rash.Options as Opts
import qualified Rash.Repl    as Repl
import qualified Rash.Runner  as Runner
import qualified Test as Test

main :: IO ()
main = do
  exitCode <- do
    when (Opts.runTests Opts.flags) $ do
      Test.main
    case Opts.files Opts.flags of
      [] -> do Repl.runRepl
               return $ Exit.ExitSuccess
      [filename] -> if Opts.checkSyntax Opts.flags
                       then Runner.checkSyntax filename filename
                       else Runner.runFile filename
      files -> do putStrLn $ "too many args: " ++ (intercalate " " files)
                  return $ Exit.ExitFailure (-1)
  Exit.exitWith exitCode
