module Rash.Options where

import qualified System.IO.Unsafe as Unsafe
import           Options.Applicative

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

flagsData :: IO Opts
flagsData = execParser optionsDesc

flags :: Opts
flags = Unsafe.unsafePerformIO flagsData

init :: IO Opts
init = undefined
