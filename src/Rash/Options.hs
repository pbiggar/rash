module Rash.Options where

import qualified Data.IORef          as IORef
import           Options.Applicative
import qualified System.Environment  as Env
import qualified System.IO.Unsafe    as Unsafe

import           Data.List           (isInfixOf)


data Opts = Opts
  { debug       :: String
  , runTests    :: Bool
  , files       :: [String]
  , checkSyntax :: Bool
  } deriving (Show)

debugP :: String -> Opts -> Bool
debugP prefix opts = isInfixOf prefix (debug opts)

flagsDesc :: Parser Opts
flagsDesc = Opts
     <$> strOption
         ( long "debug"
        <> value "none"
        <> help "Print internal compiler debug output" )
     <*> switch
         ( long "run-tests"
        <> help "Run tests" )
     <*> some (argument str (metavar "FILE"))
     <*> switch
         ( long "check-syntax"
        <> help "Check syntax and then exit" )


optionsDesc :: ParserInfo Opts
optionsDesc = info (helper <*> flagsDesc)
                ( fullDesc
               <> progDesc "Run FILENAME"
               <> header "rash - the Rebourne Again Shell"
               )

parsedFlags :: IO Opts
parsedFlags = do
  args <- IORef.readIORef flagsData
  Env.withArgs args $
    execParser optionsDesc

{-# NOINLINE flags #-}
flags :: Opts
flags = Unsafe.unsafePerformIO $ do
  parsedFlags

{-# NOINLINE flagsData #-}
flagsData :: IORef.IORef [String]
flagsData = Unsafe.unsafePerformIO $ do
  args <- Env.getArgs
  IORef.newIORef args

init :: [String] -> IO ()
init args = do
  IORef.writeIORef flagsData args
  return ()
