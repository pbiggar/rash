module Rash.Options where

import qualified System.IO.Unsafe as Unsafe
import qualified Data.IORef as IORef
import           Options.Applicative
import System.Environment as Env


data Opts = Opts
  { debug       :: Bool
  , checkSyntax :: Bool
  , files       :: [String] }

flagsDesc :: Parser Opts
flagsDesc = Opts
     <$> switch
         ( long "debug"
        <> help "Print internal compiler debug output" )
     <*> switch
         ( long "check-syntax"
        <> help "Check syntax and then exit" )
     <*> some (argument str (metavar "FILE"))

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
