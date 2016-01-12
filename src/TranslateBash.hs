{-# LANGUAGE QuasiQuotes, FlexibleContexts #-}

module TranslateBash
    ( translate
    ) where

import qualified Language.Bash.Parse as BashParse
import qualified Language.Bash.Syntax as S
import qualified Language.Bash.Word as W
import qualified Language.Bash.Cond as C
import qualified Language.Bash.Pretty as BashPretty
import qualified Data.Typeable as Typeable
import qualified Text.Groom as G
--import qualified Text.Regex.PCRE.Heavy as RE
--import qualified Data.List.Utils as U

debugStr :: (Show a, BashPretty.Pretty a) => a -> String -> String
debugStr x reason = "TODO (" ++ reason ++ ") - " ++ (BashPretty.prettyText x) ++ " - " ++ (show x)

debug :: (Show a, BashPretty.Pretty a) => a -> String -> Expr
debug x reason = Debug (debugStr x reason)

debugWithType :: (Show a, Typeable.Typeable a, BashPretty.Pretty a) => a -> String -> Expr
debugWithType x reason = debug x (reason ++ " " ++ (show (Typeable.typeOf x)))

data Program = Program Expr deriving (Show)
data Expr = Command
            | If Expr Expr Expr
            | And Expr Expr
            | Or Expr Expr
            | Concat [Expr]
            | Equals Expr Expr
            | LessThan Expr Expr
            | GreaterThan Expr Expr
            | FunctionInvocation String [Expr]
            | FunctionDef String Expr
            | Not Expr
            | Shellout String -- TODO: we need to parse this string in some cases
            | Str String
            | Variable String
            | Assignment LValue Expr
            | Debug String
            | List [Expr] -- the last one is the true value
              deriving (Show)

-- TODO: separate or combined definitions of Variables or LHS and RHS, and
-- arrays and hashtables?
data LValue = LVar String
              deriving (Show)

convertList :: S.List -> Expr
-- TODO: ignoring pipeline args
convertList (S.List stmts) =
    listOrExpr [ convertAndOr x | (S.Statement x _) <- stmts ]

listOrExpr :: [Expr] -> Expr
listOrExpr (e : []) = e
listOrExpr es = List es


convertAndOr :: S.AndOr -> Expr
convertAndOr (S.Last p) = convertPipeline p
convertAndOr (S.And p ao) = And (convertPipeline p) (convertAndOr ao)
convertAndOr (S.Or p ao) = Or (convertPipeline p) (convertAndOr ao)

convertPipeline :: S.Pipeline -> Expr
-- TODO: redirs ignored
convertPipeline (S.Pipeline _ _ _ cs) =
    listOrExpr [ convertCommand sc | (S.Command sc _) <- cs ]




convertCommand :: S.ShellCommand -> Expr
convertCommand (S.If cond l1 Nothing) = If
                                        (convertList cond)
                                        (convertList l1)
                                        (listOrExpr []) -- TODO: is Maybe nicer here?

convertCommand (S.If cond l1 (Just l2)) = If
                                          (convertList cond)
                                          (convertList l1)
                                          (convertList l2)

convertCommand (S.SimpleCommand [] ws) = convertWords ws
-- TODO: parameter doesn't take subscript
-- TODO: assignment doesn't handle +=
-- TODO: what are the rest of the words doing here?
-- TODO: doesn't handle multiple assignment
convertCommand (S.SimpleCommand [(S.Assign (W.Parameter name _) S.Equals (S.RValue r))] _) =
    Assignment (LVar name) (convertWord r)
convertCommand (S.Cond e) = convertCondExpr e
convertCommand (S.FunctionDef name cmds) = FunctionDef name (convertList cmds)
convertCommand x = debugWithType x "cc"

convertCondExpr :: C.CondExpr W.Word -> Expr
convertCondExpr (C.Not e) = Not (convertCondExpr e)
convertCondExpr (C.Unary uop w) =
    FunctionInvocation (uop2FunctionName uop) [convertWord w]
convertCondExpr (C.Binary l C.StrEQ r) = Equals (convertWord l) (convertWord r)
convertCondExpr (C.Binary l C.ArithEQ r) = Equals (convertWord l) (convertWord r)
convertCondExpr (C.Binary l C.StrNE r) = Not (Equals (convertWord l) (convertWord r))
convertCondExpr (C.Binary l C.ArithNE r) = Not (Equals (convertWord l) (convertWord r))
convertCondExpr (C.Binary l C.StrLT r) = LessThan (convertWord l) (convertWord r)
convertCondExpr (C.Binary l C.ArithLT r) = LessThan (convertWord l) (convertWord r)
convertCondExpr (C.Binary l C.StrGT r) = GreaterThan (convertWord l) (convertWord r)
convertCondExpr (C.Binary l C.ArithLE r) = Not (GreaterThan (convertWord l) (convertWord r))
convertCondExpr (C.Binary l C.ArithGE r) = Not (LessThan (convertWord l) (convertWord r))
convertCondExpr (C.Binary l bop r) = FunctionInvocation (bop2FunctionName bop) [convertWord l, convertWord r]


convertCondExpr e = debugWithType e "ceEmpty"

bop2FunctionName :: C.BinaryOp -> String
bop2FunctionName C.SameFile = "file.same?"
bop2FunctionName C.NewerThan = "file.newer_than?"
bop2FunctionName C.OlderThan = "file.older_than?"
bop2FunctionName C.StrMatch = "re.matches"
bop2FunctionName _ = "FAIL"

uop2FunctionName :: C.UnaryOp -> String
uop2FunctionName C.BlockFile = "file.isBlockFile"
uop2FunctionName C.CharacterFile = "file.isCharacterFile"
uop2FunctionName C.Directory = "file.is_directory?"
uop2FunctionName C.FileExists = "file.exists?"
uop2FunctionName C.RegularFile = "file.is_regular_file?"
uop2FunctionName C.SetGID = "file.isSetGID"
uop2FunctionName C.Sticky = "file.isSticky"
uop2FunctionName C.NamedPipe = "file.isNamedPipe"
uop2FunctionName C.Readable = "file.isReadable"
uop2FunctionName C.FileSize = "file.isFileSize"
uop2FunctionName C.Terminal = "file.isTerminal"
uop2FunctionName C.SetUID = "file.isSetUID"
uop2FunctionName C.Writable = "file.isWritable"
uop2FunctionName C.Executable = "file.isExecutable"
uop2FunctionName C.GroupOwned = "file.isGroupOwned"
uop2FunctionName C.SymbolicLink = "file.isSymbolicLink"
uop2FunctionName C.Modified = "file.isModified"
uop2FunctionName C.UserOwned = "file.isUserOwned"
uop2FunctionName C.Socket = "file.isSocket"
uop2FunctionName C.ZeroString = "string.blank?"
uop2FunctionName C.NonzeroString = "string.nonblank?"
uop2FunctionName a = debugStr (show a) "uop2FunctionName"
-- TODO: these ones are a bit odd
-- uop2FunctionName C.Optname =
-- uop2FunctionName C.Varname =


convertWords :: [W.Word] -> Expr
convertWords ws@[] = debugWithType ws "cwEmpty"
convertWords a@([(W.Char '[' )]:ws)
    | (last ws) == [W.Char ']'] = convertTest . init $ ws
    | otherwise = debugWithType a "cw"
convertWords (w:ws) = FunctionInvocation (convertString w) (map convertWord ws)

convertTest :: [W.Word] -> Expr
convertTest ws = case condExpr of
    Left  err -> Debug $ "doesn't parse" ++ (show err) ++ (show hacked)
    Right e -> (convertCommand (S.Cond (convertStrCondExpr2WordCondExpr e)))
    where condExpr = C.parseTestExpr hacked
          hacked = hackTestExpr strs
          strs = (map W.unquote ws)

convertWord :: W.Word -> Expr
convertWord ss = cConcat [convertSpan s | s <- ss]

convertSpan :: W.Span -> Expr
convertSpan (W.Char c) = Str [c]
convertSpan (W.Double w) = cConcat [convertWord w]
convertSpan (W.Single w) = cConcat [convertWord w]
convertSpan (W.CommandSubst c) = Shellout c
convertSpan (W.ParamSubst (W.Brace {W.indirect = False,
                                    W.parameter = (W.Parameter p Nothing)}))
    = Variable p
convertSpan (W.ParamSubst (W.Bare {W.parameter = (W.Parameter p Nothing)}))
    = Variable p
convertSpan w = debugWithType w "cs"

-- like convertWord but we expect a string
convertString :: W.Word -> String
convertString w = case (convertWord w) of
                    (Str s) -> s
                    _ -> "TODO - couldnt get a string out of " ++ (show w)


-- break the bash rules to fix up mistakes
hackTestExpr :: [String] -> [String]
-- [ -a asd ] works, but [ ! -a asd] doesnt because -a is the "and" operator. -e does the same though.
hackTestExpr ("!" : "-a" : ws) = ("!" : "-e" : ws)
hackTestExpr ws = ws


-- parseTestExpr gives a CondExpr string, not a CondExpr Word
convertStrCondExpr2WordCondExpr :: C.CondExpr String -> C.CondExpr W.Word
convertStrCondExpr2WordCondExpr = csce2wce
csce2wce :: C.CondExpr String -> C.CondExpr W.Word
csce2wce (C.Unary uop a) = C.Unary uop (W.fromString a)
csce2wce (C.Binary a bop b) = C.Binary (W.fromString a) bop (W.fromString b)
csce2wce (C.Not a) = C.Not (csce2wce a)
csce2wce (C.And a b) = C.And (csce2wce a) (csce2wce b)
csce2wce (C.Or a b) = C.Or (csce2wce a) (csce2wce b)


-- clean up and optimize and cononicalize things that have been converted poorly
tidyProgram :: Program -> Program
tidyProgram (Program e) = Program (tidyExpr e)

tidyExpr :: Expr -> Expr
tidyExpr (List (e:[])) = e -- one element lists
tidyExpr e = e


foldStrs :: [Expr] -> [Expr]
foldStrs ((Str a) : (Str b) : ss) = foldStrs ((Str (a ++ b)) : ss)
foldStrs ss = ss

cConcat :: [Expr] -> Expr
cConcat es = cConcat0 (foldStrs es)

cConcat0 :: [Expr] -> Expr
cConcat0 (e:[]) = e
cConcat0 es = Concat es

-- TODO:

-- buggy parsing
-- - parse DoubleQuoted strings
-- - heredocs are borken (speaceman-diff)
-- - concat [] should be Str ""

-- handle builtins
-- - echo (-e)
-- - basename
-- - printf
-- - exit (convert to a number)
-- - $#, $1, etc
-- - nullglob and dotglob
-- - getopts
-- - set -e (and others)

-- replace shell utilities that are tricku to use
-- - awk
-- - sed
-- - cut
-- - expr
-- - grep?
-- - readlink?

-- obvious improvements
-- - convert lists of echos into a single heredoc
-- - convert globals into params being passed around
-- - convert assignments of "0" and "1" into real bools
-- - find BASH_REMATCH and convert it into proper usage
-- - find duplicated code
-- - variable variables into hashtables
-- - turn bash RE into PCRE
-- - turn nested if/else into switches

translate :: String -> IO ()
translate file = do
  src <- readFile file
  case BashParse.parse "source" src of
    { Left err -> putStrLn (show err)
    ; Right ans -> do
        putStrLn (G.groom (tidyProgram (Program (convertList ans))))
  }
