module Rash.Runner (runSource, runFile, evalAndPrint, checkSyntax) where

import           Control.Exception   (catch, fromException, SomeException)
import           Control.Monad       (liftM, when)
import qualified Data.Either         as Either
import qualified Data.Maybe          as Maybe
import qualified System.Exit         as Exit
import qualified Text.Groom          as G

import qualified Language.Bash.Parse as BashParse

import           Rash.AST
import qualified Rash.Bash2AST       as Bash2AST
import qualified Rash.Interpreter    as Interpreter
import qualified Rash.Options        as Opts
import           Rash.RuntimeTypes


evalAndPrint :: String -> String -> IO ()
evalAndPrint name source = do
  result <- case (Bash2AST.translate name source) of
    Left err -> return . show $ err
    Right prog -> Interpreter.interpret prog [] >>= return . show
  putStrLn result
  return ()

checkSyntax :: String -> String -> IO Exit.ExitCode
checkSyntax name file = do
  src <- readFile file

  Either.either
    (\err -> (do putStrLn $ "Error running source: " ++ show err
                 return $ Exit.ExitFailure (-2)))
    (\_ -> do return $ Exit.ExitSuccess)
    (Bash2AST.translate name src)

runProgram :: Program -> [String] -> IO Exit.ExitCode
runProgram program args = do
  when (Opts.debugAST Opts.flags) $ do
    putStrLn "AST:"
    putStrLn $ (G.groom program)

  catch
    (liftM convertToExitCode (Interpreter.interpret program args))
    -- catch an ExitCode from sys.exit
    (\e -> do
        let code = Maybe.fromMaybe
                     (Exit.ExitFailure (-1))
                     (fromException (e :: SomeException))
        case code of
          Exit.ExitFailure i -> do putStrLn $
                                     "An error occured: ("
                                     ++ show i
                                     ++ "): "
                                   print e
          Exit.ExitSuccess -> return ()

        return code)



runSource :: String -> String -> [String] -> IO Exit.ExitCode
runSource name source args = do
  when (Opts.debugPT Opts.flags) $ do
    putStrLn " tree:"
    putStrLn $ G.groom $ BashParse.parse name source

  Either.either
    (\err -> (do putStrLn $ "Error running source: " ++ show err
                 return $ Exit.ExitFailure (-1)))
    (\prog -> do runProgram prog args)
    (Bash2AST.translate name source)

runFile :: FilePath -> IO Exit.ExitCode
runFile file = do
  src <- readFile file
  runSource file src []

convertToExitCode :: Value -> Exit.ExitCode
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess
