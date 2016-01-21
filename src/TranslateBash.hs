{-# LANGUAGE QuasiQuotes, FlexibleContexts, DeriveDataTypeable #-}

module TranslateBash
    ( translateFileToStdout
    , translateFile
    , translate
    , Expr(..)
    , Program(..)
    , LValue(..)
    , FunctionParameter(..)
    , convertList
    ) where

import qualified Language.Bash.Parse as BashParse
import qualified Language.Bash.Syntax as S
import qualified Language.Bash.Word as W
import qualified Language.Bash.Cond as C
import qualified Language.Bash.Pretty as BashPretty
import qualified Data.Typeable as Typeable
import qualified Text.Groom as G
import           Text.Parsec.Error            (ParseError)
import           Data.Generics.Uniplate.Data
import Data.Data
import Data.Typeable
--import qualified Text.Regex.PCRE.Heavy as RE
--import qualified Data.List.Utils as U
import qualified Data.Maybe as Maybe


-- | Debugging
debugStr :: (Show a, BashPretty.Pretty a) => a -> String -> String
debugStr x reason = "TODO (" ++ reason ++ ") - " ++ (BashPretty.prettyText x) ++ " - " ++ (show x)

debug :: (Show a, BashPretty.Pretty a) => a -> String -> Expr
debug x reason = Debug (debugStr x reason)

debugWithType :: (Show a, Typeable.Typeable a, BashPretty.Pretty a) => a -> String -> Expr
debugWithType x reason = debug x (reason ++ " " ++ (show (Typeable.typeOf x)))

-- | The AST definition
data Program = Program Expr deriving (Show, Eq, Read, Data, Typeable)
data Expr =
  -- | Control flow
    For LValue Expr Expr -- TODO: better to pipe into a for loop?
  | If Expr Expr Expr
  | Pipe [Expr]
  | List [Expr] -- the last one is the true value

  -- | Operators
  | And Expr Expr
  | Or Expr Expr
  | Equals Expr Expr
  | LessThan Expr Expr
  | GreaterThan Expr Expr
  | Not Expr
  | Concat [Expr]
  -- | Literals
  | Str String
  | Integer Int
  -- | Temporary
  | Debug String
  | Nop
  -- | Functions
  | FunctionInvocation String [Expr]
  | FunctionDefinition String [FunctionParameter] Expr

  | Shellout [Expr]
  -- | Storage
  | Variable String
  | Assignment LValue Expr
  | Subscript Expr Expr

    deriving (Show, Eq, Read, Data, Typeable)

-- TODO: separate or combined definitions of Variables or LHS and RHS, and
-- arrays and hashtables?
data LValue =   LVar String
              | AnonVar
              deriving (Show, Eq, Read, Data, Typeable)

data FunctionParameter = FunctionParameter String
                         deriving (Show, Eq, Read, Data, Typeable)



-- | Lists
convertList :: S.List -> Expr
-- TODO: ignoring pipeline args
convertList (S.List stmts) =
    listOrExpr [ convertAndOr x | (S.Statement x _) <- stmts ]

listOrExpr :: [Expr] -> Expr
listOrExpr [] = Nop
listOrExpr (e:[]) = e
listOrExpr es = List es

-- | Pipelines
convertAndOr :: S.AndOr -> Expr
convertAndOr (S.Last p) = convertPipeline p
convertAndOr (S.And p ao) = And (convertPipeline p) (convertAndOr ao)
convertAndOr (S.Or p ao) = Or (convertPipeline p) (convertAndOr ao)

listOrPipe :: [Expr] -> Expr
listOrPipe (e:[]) = e
listOrPipe es = Pipe es

convertPipeline :: S.Pipeline -> Expr
-- ignored timing and inverted. I think this is right.
convertPipeline (S.Pipeline _ _ _ cs) =
    listOrPipe [ convertShellCommand sc rs | (S.Command sc rs) <- cs ]

-- | Commands
convertShellCommand :: S.ShellCommand -> [S.Redir] -> Expr
convertShellCommand (S.If cond l1 Nothing) [] = If
                                                (convertList cond)
                                                (convertList l1)
                                                (listOrExpr [Nop]) -- TODO: is Maybe nicer here?

convertShellCommand (S.If cond l1 (Just l2)) [] = If
                                                  (convertList cond)
                                                  (convertList l1)
                                                  (convertList l2)

-- TODO: this is the only place that handles heredocs. Everywhere should.
convertShellCommand (S.SimpleCommand as ws) rs = convertSimpleCommand as (combineHeredoc ws rs)

convertShellCommand (S.AssignBuiltin w es) []
    | w == (W.fromString "local") = listOrExpr (map convertAssignOrWord es)
    | otherwise = debugWithType w "ccscab"

convertShellCommand (S.Cond e) [] = convertCondExpr e
convertShellCommand (S.FunctionDef name cmds) [] =
    FunctionDefinition name [] (convertList cmds)

convertShellCommand (S.For v wl cmds) [] =
    For (LVar v) (convertWordList wl) (convertList cmds)

convertShellCommand (S.While expr cmds) [] =
    For AnonVar (convertList expr) (convertList cmds)

convertShellCommand x rs = debugWithType x ("cc" ++ (show rs))


-- | SimpleCommands (assignments)
convertSimpleCommand :: [S.Assign] -> [W.Word] -> Expr
convertSimpleCommand as [] = listOrExpr (map convertAssign as)
convertSimpleCommand as ws = listOrExpr ((map convertAssign as) ++ [(convertWords ws)])

-- TODO: parameter doesn't take subscript
-- TODO: assignment doesn't handle +=
convertAssign :: S.Assign -> Expr
convertAssign (S.Assign (W.Parameter name _) S.Equals (S.RValue r)) =
  Assignment (LVar name) (convertWord r)

convertAssignOrWord :: Either S.Assign W.Word -> Expr
convertAssignOrWord (Left a) = convertAssign a
convertAssignOrWord (Right w) = convertWord w



-- | WordLists and Words and Spans
convertWordList :: S.WordList -> Expr
convertWordList S.Args = (Str "$@") -- TODO
convertWordList (S.WordList wl) = listOrExpr (map convertWord wl)


convertWords :: [W.Word] -> Expr
convertWords ([W.Char '['] : ws)
    | (convertString . last $ ws) == "]" = convertTest . init $ ws
    | otherwise = debugWithType ws "cw"
convertWords (w:ws) = convertFunctionCall (convertWord w) (map convertWord ws)
convertWords ws@[] = debugWithType ws "cwEmpty"

convertWord :: W.Word -> Expr
convertWord ss = cConcat [convertSpan s | s <- ss]

convertSpan :: W.Span -> Expr
convertSpan (W.Char c) = Str [c]
convertSpan (W.Double w) = cConcat [convertWord w]
convertSpan (W.Single w) = cConcat [convertWord w]
convertSpan (W.CommandSubst c) = Shellout [(Str c)] -- TODO: we should parse this
convertSpan (W.ParamSubst (W.Brace {W.indirect = False,
                                    W.parameter = (W.Parameter p Nothing)}))
    = Variable p
convertSpan (W.ParamSubst (W.Bare {W.parameter = (W.Parameter p Nothing)}))
    = Variable p
convertSpan (W.ParamSubst (W.Delete {W.indirect = False,
                                     W.parameter = (W.Parameter p Nothing),
                                     W.longest = longest,
                                     W.deleteDirection = direction,
                                     W.pattern = pattern}))
    = FunctionInvocation ("string." ++ name) args
      where
        name = if direction == W.Front then "replace_front" else "replace_back"
        args = [(Variable p), (convertWord pattern)] ++ longestArgs
        longestArgs = if longest then [] else [Str "--nongreedy"]
                      -- TODO: indirect?

convertSpan (W.Backquote w) = parsestring (W.unquote w)


convertSpan w = debugWithType w "cs"

-- like convertWord but we expect a string
convertString :: W.Word -> String
convertString w = case (convertWord w) of
                    (Str s) -> s
                    _ -> "TODO - couldnt get a string out of " ++ (show w)

-- TODO: support first class functions?
convertFunctionCall :: Expr -> [Expr] -> Expr
convertFunctionCall (Str "set") [(Str "-e")] = Nop
convertFunctionCall (Str "set") [(Str "+e")] = Nop
convertFunctionCall (Str name) args = FunctionInvocation name args
convertFunctionCall name args = Shellout (name : args)



-- | Heredocs
combineHeredoc :: [W.Word] -> [S.Redir] -> [W.Word]
combineHeredoc ws rs = ws ++ ns
    where ns = Maybe.catMaybes $ map hd2word rs

hd2word :: S.Redir -> Maybe W.Word
hd2word (S.Heredoc {S.hereDocument=hd}) = Just hd
hd2word _ = Nothing

-- | CondExprs
convertCondExpr :: C.CondExpr W.Word -> Expr
convertCondExpr (C.Not e) = Not (convertCondExpr e)
convertCondExpr (C.And a b) = And (convertCondExpr a) (convertCondExpr b)
convertCondExpr (C.Or a b) = Or (convertCondExpr a) (convertCondExpr b)
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

-- | Function names for BinaryOps
bop2FunctionName :: C.BinaryOp -> String
bop2FunctionName C.SameFile = "file.same?"
bop2FunctionName C.NewerThan = "file.newer_than?"
bop2FunctionName C.OlderThan = "file.older_than?"
bop2FunctionName C.StrMatch = "re.matches"
bop2FunctionName _ = "FAIL"

-- | Function names for UnaryOps
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

-- | Tests (handles test, '[' and '[[')
convertTest :: [W.Word] -> Expr
-- note that bash parses tests after it has expanded the arguments, and so you
-- can't really statically parse this. For example, what does `[ "$x" a ]` do?
-- Still, we can get this right when they are statically specified, and get the
-- gist right in some cases otherwise.
convertTest ws = case condExpr of
    Left  err -> Debug $ "doesn't parse" ++ (show err) ++ (show hacked)
    Right e -> (convertShellCommand (S.Cond (convertStrCondExpr2WordCondExpr e)) [])
    where condExpr = C.parseTestExpr hacked
          hacked = hackTestExpr strs
          strs = (map W.unquote ws)

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


-- | Turn lists of Strings or string components into a Str
foldStrs :: [Expr] -> [Expr]
foldStrs ((Str a) : (Str b) : ss) = foldStrs ((Str (a ++ b)) : ss)
foldStrs (s : ss) = (s : foldStrs ss)
foldStrs ss = ss

cConcat :: [Expr] -> Expr
cConcat es = cConcat0 (foldStrs es)

cConcat0 :: [Expr] -> Expr
cConcat0 [] = Str ""
cConcat0 (e:[]) = e
cConcat0 es = Concat es

-- TODO:

-- | possibly buggy parsing
-- parse DoubleQuoted strings
-- heredocs dont remove leading tabs for <<-
-- when parsing AssignBuiltin, lists of words wont be handled as lists of words

-- | handle builtins
-- echo (-e)
-- basename
-- printf
-- exit (convert to a number)
-- $#, $1, etc
-- nullglob and dotglob
-- getopts
-- set -e - how to allow failure to be handled well? Exceptions? We currently
--   just rip them out for now
-- type
-- backticks and $()s


-- | replace shell utilities that are tricky to use
-- awk
-- sed
-- cut
-- expr
-- grep?
-- readlink?
-- tr
-- xargs?
-- seq
-- curl/wget into builtin

-- | obvious improvements
-- convert lists of echos into a single heredoc
-- convert globals into params being passed around
-- convert assignments of "0" and "1" into real bools
-- find BASH_REMATCH and convert it into proper usage
-- find duplicated code
-- variable variables into hashtables
-- turn bash RE into PCRE
-- turn nested if/else into switches
-- exit code into integer
-- if IFS is set, all bets are off

parsestring :: String -> Expr
parsestring source = case translate "src" source of
                     { Left err -> error ("nested parse of " ++ source ++ " failed")
                     ; Right (Program expr) -> expr
                     }

translate :: String -> String -> Either ParseError Program
translate name source =
    case BashParse.parse name source of
      { Left err -> Left err
      ; Right ans -> Right (Program (convertList ans))
      }

translateFile :: String -> IO (Either ParseError Program)
translateFile file = do
  src <- readFile file
  return (translate file src)

translateFileToStdout :: String -> IO ()
translateFileToStdout file = do
  e <- translateFile file
  case e of
    { Left err -> putStrLn (show err)
    ; Right prog -> putStrLn (G.groom prog)
    }
