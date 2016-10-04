module Rash.Runner ( runSource, runFile, evalAndPrint, checkSyntax, translate ) where

import           Control.Exception   (catch, fromException, SomeException)
import           Control.Monad       (liftM, when)
import qualified Data.Either         as Either
import qualified Data.Maybe          as Maybe
import qualified System.Exit         as Exit
import qualified Text.Groom          as G
import qualified Text.Parsec.Error

import qualified Language.Bash.Parse as BashParse

import qualified Rash.IR.AST as AST
import qualified Rash.IR.Bash2Rough       as Bash2Rough
import qualified Rash.IR.Rough2AST       as Rough2AST
import qualified Rash.Runtime.Interpreter    as Interpreter
import qualified Rash.Options        as Opts
import           Rash.Runtime.Types


evalAndPrint :: String -> String -> IO ()
evalAndPrint name source = do
  result <- case translate name source of
    Left err -> return . show $ err
    Right prog -> Interpreter.interpret prog [] >>= return . show
  putStrLn result
  return ()

checkSyntax :: String -> String -> IO Exit.ExitCode
checkSyntax name file = do
  src <- readFile file
  let ast = translate name src
  case ast of
    Left err -> (do putStrLn $ "Error running source: " ++ show err
                    return $ Exit.ExitFailure (-2))
    Right _ -> return Exit.ExitSuccess


runProgram :: AST.Program -> [String] -> IO Exit.ExitCode
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

translate :: String -> String -> Either Text.Parsec.Error.ParseError AST.Program
translate name source = do
  rough <- Bash2Rough.translate name source
  return $ Rough2AST.lower name rough


runSource :: String -> String -> [String] -> IO Exit.ExitCode
runSource name source args = do
  when (Opts.debugPT Opts.flags) $ do
    putStrLn " tree:"
    putStrLn $ G.groom $ BashParse.parse name source

  Either.either
    (\err -> (do putStrLn $ "Error running source: " ++ show err
                 return $ Exit.ExitFailure (-1)))
    (\prog -> do runProgram prog args)
    (translate name source)

runFile :: FilePath -> IO Exit.ExitCode
runFile file = do
  src <- readFile file
  runSource file src []

convertToExitCode :: Value -> Exit.ExitCode
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess
