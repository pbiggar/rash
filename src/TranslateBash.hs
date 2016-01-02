{-# LANGUAGE QuasiQuotes, FlexibleContexts #-}

module TranslateBash
    ( translate
    ) where

import qualified Language.Bash.Parse as BashParse
import qualified Language.Bash.Syntax as S
import qualified Language.Bash.Word as W
import qualified Language.Bash.Pretty as BashPretty
import qualified Data.Typeable as Typeable
import qualified Text.Groom as G
import qualified Text.Regex.PCRE.Heavy as RE
import qualified Data.List.Utils as U

prettify :: String -> String
prettify s = simplifyWords . simplifyDouble . toCharFinal . toChar $ s
             where toChar = RE.gsub [RE.re|Char '([^']+)',|] (\(x:_) -> x :: String)
                   toCharFinal = RE.gsub [RE.re|Char '([^']+)'|] (\(x:_) -> x :: String)
                   simplifyDouble = RE.gsub [RE.re|Double \[(.*?)\]|] (\(x:_) -> "\"" ++ (x :: String) ++ "\"")
                   simplifyWords = (U.replace "List" "L")
                                   . (U.replace "Statement" "S")
                                   . (U.replace "Pipeline" "P")
                                   . (U.replace "Sequential" "Seq")
                                   . (U.replace "Command" "C")
                                   . (U.replace "SimpleCommand" "SC")
                                   . (U.replace "{timed = False, timedPosix = False, inverted = False, " "{")

debug :: (Show a, BashPretty.Pretty a) => a -> String -> Expr
debug x reason = Debug ("TODO: " ++ reason) (BashPretty.prettyText x) (prettify (show x))

debugWithType :: (Show a, Typeable.Typeable a, BashPretty.Pretty a) => a -> Expr
debugWithType x = debug x (show (Typeable.typeOf x))

data Program = Program Expr deriving (Show)
data Expr = Command
            | If Expr Expr Expr
            | And Expr Expr
            | Or Expr Expr
            | FunctionInvocation String [Expr]
            | Not Expr
            | Debug String String String
            | List [Expr] -- the last one is the true value
              deriving (Show)

convertList :: S.List -> Expr
-- TODO: ignoring pipeline args
convertList (S.List stmts) = List (map (\(S.Statement x _) -> (convertAndOr x)) stmts)

convertAndOr :: S.AndOr -> Expr
convertAndOr (S.Last p) = convertPipeline p
convertAndOr (S.And p ao) = And (convertPipeline p) (convertAndOr ao)
convertAndOr (S.Or p ao) = Or (convertPipeline p) (convertAndOr ao)

convertPipeline :: S.Pipeline -> Expr
convertPipeline (S.Pipeline _ _ _ cs) =
    (List (map convertCommand scs))
    -- TODO: redirs ignored
    where scs = map (\(S.Command sc _) -> sc) cs


convertCommand :: S.ShellCommand -> Expr
convertCommand (S.If cond l1 Nothing) = If
                                        (convertList cond)
                                        (convertList l1)
                                        (List []) -- TODO: is Maybe nicer here?

convertCommand (S.If cond l1 (Just l2)) = If
                                          (convertList cond)
                                          (convertList l1)
                                          (convertList l2)

-- test
convertCommand (S.SimpleCommand [] ws) = convertWords ws

convertCommand x = debugWithType x

convertWords :: [W.Word] -> Expr
convertWords ws = debugWithType ws

-- clean up and optimize and cononicalize things that have been converted poorly
tidyProgram :: Program -> Program
tidyProgram (Program e) = Program (tidyExpr e)

tidyExpr :: Expr -> Expr
tidyExpr (List (e:[])) = e -- one element lists
tidyExpr e = e


translate :: String -> IO ()
translate file = do
  src <- readFile file
  case BashParse.parse "source" src of
    { Left err -> putStrLn (show err)
    ; Right ans -> do
        putStrLn (G.groom (tidyProgram (Program (convertList ans))))
  }
