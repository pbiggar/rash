module Rash.Runner ( runSource, runFile, evalAndPrint, checkSyntax, translate ) where

import           Control.Exception        (SomeException, catch, fromException)
import           Control.Monad            (liftM)
import qualified Data.Maybe               as Maybe
import qualified System.Exit              as Exit
import           Text.Parsec.Error        (ParseError)


import qualified Rash.IR.AST              as AST
import qualified Rash.IR.Bash2Rough       as Bash2Rough
import qualified Rash.IR.Rough2AST        as Rough2AST
import qualified Rash.Runtime.Interpreter as Interpreter
import           Rash.Runtime.Types
import qualified Rash.Debug as Debug


evalAndPrint :: String -> String -> IO ()
evalAndPrint name source = do
  let ast = translate name source
  result <- case ast of
    Left err -> return . show $ err
    Right prog -> Interpreter.interpret prog [] >>= return . show
  putStrLn result
  return ()

runProgram :: AST.Program -> [String] -> IO Exit.ExitCode
runProgram program args = do
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

translate :: String -> String -> Either ParseError AST.Program
translate name source = do
  rough <- Bash2Rough.translate name source
  let roughD = Debug.groom "rough" "Rough" rough

  let ast = Rough2AST.lower name roughD
  let astD = Debug.groom "ast" "AST" ast

  return astD

checkSyntax :: String -> String -> IO Exit.ExitCode
checkSyntax name file = do
  maybeAST <- translate name <$> readFile file
  case maybeAST of
    Left err -> (do putStrLn $ "Error while parsing: " ++ show err
                    return $ Exit.ExitFailure (-2))
    Right _ -> return Exit.ExitSuccess

runSource :: String -> String -> [String] -> IO Exit.ExitCode
runSource name source args = do
  let ast = translate name source
  case ast of
    Left err -> (do putStrLn $ "Error while parsing: " ++ show err
                    return $ Exit.ExitFailure (-1))

    Right prog -> runProgram prog args

runFile :: FilePath -> IO Exit.ExitCode
runFile file = do
  src <- readFile file
  runSource file src []

convertToExitCode :: Value -> Exit.ExitCode
convertToExitCode (VInt i) = if i == 0 then Exit.ExitSuccess else Exit.ExitFailure i
convertToExitCode _ = Exit.ExitSuccess
