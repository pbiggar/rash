module Rash.Interpret where

import System.Exit (ExitCode)

import Rash.Bash2AST (translateFile)
import Rash.AST

interpret :: Program -> IO ExitCode
interpret = undefined

interpretFile :: FilePath -> IO ExitCode
interpretFile = undefined
