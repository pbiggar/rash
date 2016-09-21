module Rash.Runner (runSource, runFile, evalAndPrint) where

import qualified Data.Either as Either
import qualified Data.Maybe as Maybe
import qualified System.Exit as Exit
import qualified Text.Groom as G
import           Control.Monad (when, liftM)
import           Control.Exception (catch, fromException)


import Rash.AST
import Rash.Runtime
import qualified Rash.Interpreter as Interpreter
import qualified Rash.Bash2AST as Bash2AST
import qualified Rash.Options as Options


evalAndPrint :: String -> String -> IO ()
evalAndPrint name source = do
  result <- case (Bash2AST.translate name source) of
    Left err -> return . show $ err
    Right prog -> Interpreter.interpret prog [] >>= return . show
  putStrLn result
  return ()

runProgram :: Program -> [String] -> IO Exit.ExitCode
runProgram program args = do
  when (Options.flags_debug) $ putStrLn $ (G.groom program)
  catch
    (liftM convertToExitCode (Interpreter.interpret program args))
    -- sys.exit maybe throw an ExitCode in an exception
    (\e -> return $
             Maybe.fromMaybe (Exit.ExitFailure (-1)) (fromException e))



runSource :: String -> String -> [String] -> IO Exit.ExitCode
runSource name source args = do
  Either.either
    (\err -> (do
                print err
                return $ Exit.ExitFailure (-1)))
    (\prog -> (runProgram prog args))
    (Bash2AST.translate name source)

runFile :: FilePath -> IO Exit.ExitCode
runFile file = do
  src <- readFile file
  runSource file src []

convertToExitCode :: Value -> Exit.ExitCode
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess
