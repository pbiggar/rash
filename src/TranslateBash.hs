module TranslateBash
    ( translate
    ) where

import Language.Bash.Parse

translate :: String -> IO ()
translate file = do
  src <- readFile file
  case parse "source" src of
    { Left err -> print err
    ; Right ans -> print ans
  }
