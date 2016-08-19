module Rash.Interpret where

import System.Exit (ExitCode)

import Rash.Bash2AST (translateFile)
import Rash.AST
import qualified Data.Either as Either
import qualified System.Exit as Exit


interpretFile :: FilePath -> IO ExitCode
interpretFile file = do
  result <- translateFile file
  exitCode <-
    if Either.isRight result
      then
        let (Right program) = result
        in interpret program
      else do
        putStrLn "Failed to parse"
        return $ Exit.ExitFailure (-1)
  return $ exitCode

interpret :: Program -> IO ExitCode
interpret = exeProgram

exeProgram :: Program -> IO ExitCode
exeProgram (Program e) = exeExpr e

exeExpr :: Expr -> IO ExitCode
exeExpr e = do
  print e
  return $ Exit.ExitFailure (-1)
