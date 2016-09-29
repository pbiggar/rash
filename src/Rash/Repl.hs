module Rash.Repl (runRepl) where

import           Control.Monad (unless)
import qualified System.IO     as IO

import qualified Rash.Runner   as Runner



flushStr :: String -> IO ()
flushStr str = putStr str >> IO.hFlush IO.stdout

readPrompt :: String -> IO String
readPrompt prompt = flushStr prompt >> getLine

until_ :: Monad m => (a -> Bool) -> m a -> (a -> m ()) -> m ()
until_ pred_ prompt action = do
   result <- prompt
   unless (pred_ result) $
      action result >> until_ pred_ prompt action

runRepl :: IO ()
runRepl = until_ (== "quit")
                 (readPrompt "rash> ")
                 (Runner.evalAndPrint "repl")
