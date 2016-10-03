{-# LANGUAGE FlexibleContexts #-}
module Rash.Bash2AST
    ( translate
    , convertList
    ) where

import qualified Data.Data
import           Data.Generics.Uniplate.Data (rewriteBi)
import qualified Data.Typeable               as Typeable
import qualified Language.Bash.Cond          as C
import qualified Language.Bash.Parse         as BashParse
import qualified Language.Bash.Parse.Word
import qualified Language.Bash.Pretty        as BashPretty
import qualified Language.Bash.Syntax        as S
import qualified Language.Bash.Word          as W
import qualified System.IO.Unsafe            as UnsafeIO
import           Text.Parsec                 (parse)
import           Text.Parsec.Error           (ParseError)

import           Rash.AST

-- | Debugging
debugStr :: (Show a, BashPretty.Pretty a) => String -> a -> String
debugStr msg x = "TODO (" ++ msg ++ ") - " ++ BashPretty.prettyText x ++ " - " ++ show x

debug :: (Show a, BashPretty.Pretty a) => String -> a -> b
debug msg x = UnsafeIO.unsafePerformIO $ do
  error $ msg ++ " -> " ++ (show x)

debugD :: (Show a, BashPretty.Pretty a) => String -> a -> Expr
debugD msg x = Debug (debugStr msg  x)

debugT :: (Show a, Typeable.Typeable a, BashPretty.Pretty a) => String -> a -> b
debugT msg x = debug (msg ++ " " ++ (show $ Typeable.typeOf x)) x

debugDT :: (Show a, Typeable.Typeable a, BashPretty.Pretty a) => String -> a -> Expr
debugDT msg x = debugD (msg ++ " " ++ (show $ Typeable.typeOf x)) x

fc :: String -> [Expr] -> Expr
fc = FunctionCall

-- | Lists
convertList :: S.List -> Expr
-- TODO: ignoring pipeline args
convertList (S.List stmts) =
    listOrExpr [ convertAndOr x | (S.Statement x _) <- stmts ]

listOrExpr :: [Expr] -> Expr
listOrExpr [] = Nop
listOrExpr [e] = e
listOrExpr es = List es

-- | Pipelines
convertAndOr :: S.AndOr -> Expr
convertAndOr (S.Last p) = convertPipeline p
convertAndOr (S.And p ao) = Binop (convertPipeline p) And (convertAndOr ao)
convertAndOr (S.Or p ao) = Binop (convertPipeline p) And (convertAndOr ao)

listOrPipe :: [Expr] -> Expr
listOrPipe [e] = e
listOrPipe es = Pipe es

addToPipe :: Expr -> Expr -> Expr
addToPipe (Pipe ps) new = Pipe (ps ++ [new])
addToPipe expr1 expr2 = Pipe [expr1, expr2]

convertPipeline :: S.Pipeline -> Expr
-- ignored timing and inverted. I think this is right.
convertPipeline (S.Pipeline _ _ _ cs) =
    listOrPipe $ map convertCommand cs

convertCommand :: S.Command -> Expr
convertCommand (S.Command sc rs) =
  foldl convertRedir (convertShellCommand sc) rs

convertRedir :: Expr -> S.Redir -> Expr
convertRedir expr (S.Heredoc S.Here _ False doc) = (Stdin (convertWord doc) expr)
convertRedir expr (S.Redir {S.redirDesc=Nothing
                          , S.redirOp=S.Append
                          , S.redirTarget=file}) =
   addToPipe expr (fc "stdout.appendTo" [convertWord file])
convertRedir expr (S.Redir {S.redirDesc=Just(S.IONumber 2)
                          , S.redirOp=S.OutAnd
                          , S.redirTarget=[W.Char '1']}) =
   addToPipe expr (fc "stderr.intoStdout" [])
convertRedir expr (S.Redir {S.redirDesc=Nothing
                          , S.redirOp=S.OutAnd
                          , S.redirTarget=[W.Char '2']}) =
   addToPipe expr (fc "stderr.replaceStdout" [])
convertRedir expr (S.Redir {S.redirDesc=Nothing
                          , S.redirOp=S.Out
                          , S.redirTarget=file}) =
   addToPipe expr (fc "stdout.writeTo" [convertWord file])
convertRedir expr (S.Redir {S.redirDesc=Just(S.IONumber 2)
                          , S.redirOp=S.Out
                          , S.redirTarget=file}) =
   addToPipe expr (fc "stderr.writeTo" [convertWord file])

convertRedir _ r = debugDT "cr" r

-- | Commands
convertShellCommand :: S.ShellCommand -> Expr
convertShellCommand (S.If cond l1 Nothing) =
    If
    (convertList cond)
    (convertList l1)
    (listOrExpr [Nop]) -- TODO: is Maybe nicer here?

convertShellCommand (S.If cond l1 (Just l2)) =
    If
    (convertList cond)
    (convertList l1)
    (convertList l2)

convertShellCommand (S.SimpleCommand as ws) =
  convertSimpleCommand as ws

convertShellCommand (S.AssignBuiltin w es)
    | w == W.fromString "local" = listOrExpr (map convertAssignOrWord es)
    | otherwise = debugDT "ccscab" w

convertShellCommand (S.Cond e) = convertCondExpr e
convertShellCommand (S.FunctionDef name cmds) =
    postProcessFunctionDefs (FunctionDefinition (FuncDef name [] (convertList cmds)))

convertShellCommand (S.For v wl cmds) =
    For (LVar v) (convertWordList wl) (convertList cmds)

convertShellCommand (S.While expr cmds) =
    For AnonVar (convertList expr) (convertList cmds)

convertShellCommand (S.Group list) =
    convertList list

convertShellCommand x = debugDT "cc" x


-- | SimpleCommands (assignments)
convertSimpleCommand :: [S.Assign] -> [W.Word] -> Expr
convertSimpleCommand as [] = listOrExpr (map convertAssign as)
convertSimpleCommand as ws = listOrExpr (map convertAssign as ++ [convertWords ws])

-- TODO: parameter doesn't take subscript
-- TODO: assignment doesn't handle +=
convertAssign :: S.Assign -> Expr
convertAssign (S.Assign (W.Parameter name _) S.Equals (S.RValue r)) =
  Assignment (LVar name) (convertWord r)

convertAssign a = debugT "convertAssign" a

convertAssignOrWord :: Either S.Assign W.Word -> Expr
convertAssignOrWord = either convertAssign convertWord


-- | WordLists and Words and Spans
convertWordList :: S.WordList -> Expr
convertWordList S.Args = Debug "$@" -- TODO
convertWordList (S.WordList wl) = listOrExpr (map convertWord wl)


convertWords :: [W.Word] -> Expr
convertWords ([W.Char '['] : ws)
    | (convertString . last $ ws) == "]" = convertTest . init $ ws
    | otherwise = debugDT "cw" ws
convertWords (w:ws) = convertFunctionCall (convertWord w) (map convertWord ws)
convertWords ws@[] = debugT "cwEmpty" ws

convertWord :: W.Word -> Expr
convertWord ss = cConcat [convertSpan s | s <- ss]

convertSpan :: W.Span -> Expr
convertSpan (W.Char c) = Str [c]
convertSpan (W.Double w) = cConcat [convertWord w]
convertSpan (W.Single w) = cConcat [convertWord w]
convertSpan (W.Escape c) = Str [c]
convertSpan (W.CommandSubst c) = parseString c
convertSpan (W.ProcessSubst W.ProcessIn w) =
  addToPipe (Exec w) (fc "sys.procSubst" [])
convertSpan (W.ParamSubst W.Brace {W.indirect = False,
                                    W.parameter = (W.Parameter p Nothing)})
    = Variable p
convertSpan (W.ParamSubst W.Length {W.parameter = (W.Parameter p Nothing)})
    = fc "string.length" [Variable p]
convertSpan (W.ParamSubst W.Bare {W.parameter = (W.Parameter p Nothing)})
    = Variable p
convertSpan (W.ParamSubst W.Delete {W.indirect = False
                                  , W.parameter = (W.Parameter p Nothing)
                                  , W.longest = longest
                                  , W.deleteDirection = direction
                                  , W.pattern = pattern })
    = fc ("string." ++ name) args
      where
        name = if direction == W.Front then "replaceFront" else "replaceBack"
        args = [Variable p, convertWord pattern] ++ longestArgs
        longestArgs = if longest then [] else [Str "--nongreedy"]
                      -- TODO: indirect?

convertSpan (W.Backquote w) = parseWord w


convertSpan w = debugDT "cs" w

-- like convertWord but we expect a string
convertString :: W.Word -> String
convertString w = case convertWord w of
                    Str s -> s
                    _ -> debug "not a string" w

-- | Functions
convertFunctionCall :: Expr -> [Expr] -> Expr
convertFunctionCall (Str name) args = fc name args
convertFunctionCall fn args = (IndirectFunctionCall fn args)

-- | CondExprs
convertCondExpr :: C.CondExpr W.Word -> Expr
convertCondExpr (C.Not e) = Unop Not (convertCondExpr e)
convertCondExpr (C.And a b) = Binop (convertCondExpr a) And (convertCondExpr b)
convertCondExpr (C.Or a b) = Binop (convertCondExpr a) Or (convertCondExpr b)
convertCondExpr (C.Unary uop w) =
    Pipe [convertWord w, fc (uop2FunctionName uop) []]
convertCondExpr (C.Binary l C.StrEQ r) = Binop (convertWord l) Equals (convertWord r)
convertCondExpr (C.Binary l C.ArithEQ r) = Binop (convertWord l) Equals (convertWord r)
convertCondExpr (C.Binary l C.StrNE r) = Unop Not (Binop (convertWord l) Equals (convertWord r))
convertCondExpr (C.Binary l C.ArithNE r) = Unop Not (Binop (convertWord l) Equals (convertWord r))
convertCondExpr (C.Binary l C.StrLT r) = Binop (convertWord l) LessThan (convertWord r)
convertCondExpr (C.Binary l C.ArithLT r) = Binop (convertWord l) LessThan (convertWord r)
convertCondExpr (C.Binary l C.StrGT r) = Binop (convertWord l) GreaterThan (convertWord r)
convertCondExpr (C.Binary l C.ArithLE r) = Unop Not (Binop (convertWord l) GreaterThan (convertWord r))
convertCondExpr (C.Binary l C.ArithGE r) = Unop Not (Binop (convertWord l) LessThan (convertWord r))
convertCondExpr (C.Binary l bop r) = fc (bop2FunctionName bop) [convertWord l, convertWord r]


-- | Function names for BinaryOps
bop2FunctionName :: C.BinaryOp -> String
bop2FunctionName C.SameFile = "file.same?"
bop2FunctionName C.NewerThan = "file.newer_than?"
bop2FunctionName C.OlderThan = "file.older_than?"
bop2FunctionName C.StrMatch = "re.matches"
bop2FunctionName x = debugT "binop" x

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
uop2FunctionName a = debug "uop2FunctionName" a
-- TODO: these ones are a bit odd
-- uop2FunctionName C.Optname =
-- uop2FunctionName C.Varname =

-- | Tests (handles test, '[' and '[[')
convertTest :: [W.Word] -> Expr

-- convertTest receives a list of words. Semantically, Bash would evaluate many
-- of those words (expanding arguments and parameters, etc), because passing it
-- to `test`. So semantically, we can't parse this correctly.
-- For example, what does `[ "$x" a ]` do?

-- parseTestExpr is really designed for run-time use, and doesn't produce parsed
-- words. For example [ "x" = "`uname`" ] won't result in a CommandSubst with
-- "uname" in it, because Bash doesn't actually do that, semantically. But
-- that's what we want!

-- Another apporach is to wrap the string in [[. Unfortunately, [[ doesn't actually work the same as [, for example -a doesn't work the same.

-- I think the correct approach is to parse it, then reparse the words again.
convertTest ws = case condExpr of
    Left  err -> Debug $ "doesn't parse" ++ show err ++ show hacked
    Right e -> convertCondExpr . fmap parseString2Word $ e
    where condExpr = C.parseTestExpr strs
          strs = map W.unquote hacked
          hacked = hackTestExpr ws


-- | break the bash rules to fix up mistakes
hackTestExpr :: [W.Word] -> [W.Word]
-- [ -a asd ] works, but [ ! -a asd] doesnt because -a is the "and" operator. -e
-- does the same though.
hackTestExpr ws@(n:a:rest)
  | n == W.fromString "!" && a == W.fromString "-a" = n : W.fromString "-e" : rest
  | otherwise = ws
hackTestExpr ws = ws


-- | Turn lists of Strings or string components into a Str
foldStrs :: [Expr] -> [Expr]
foldStrs (Str a : Str b : ss) = foldStrs (Str (a ++ b) : ss)
foldStrs (s : ss) = s : foldStrs ss
foldStrs ss = ss

cConcat :: [Expr] -> Expr
cConcat es = cConcat0 (foldStrs es)

cConcat0 :: [Expr] -> Expr
cConcat0 [] = Str ""
cConcat0 [e] = e
cConcat0 es = Concat es


--- Transformations
transformFixed :: (Data.Data.Data a, Eq a) => (Expr -> Expr) -> a -> a
transformFixed f = rewriteBi g
  where
    g x = let y = f x in if x == y then Nothing else Just y


-- | Perform transformations across the AST (everywhere)
postProcess :: Program -> Program
postProcess = transformFixed f
    where
      -- | Convert `while read input` into `for $input sys.read()`
      f (For AnonVar (Assignment v rv) block) =
          For v rv block

      -- | Convert `read input` into `input = sys.read()`
      f (FunctionCall "read" [Str var]) =
          Assignment (LVar var)
                        (fc "sys.read" [])

      -- | Convert `type wget` into `sys.onPath wget`
      f (FunctionCall "type" args) =
          fc "sys.onPath" args

      -- | Convert exit and it's arguments
      f (FunctionCall "exit" args) =
          fc "sys.exit"
          (map convertExitArg args)

      -- | String match and it's arguments
      f binop@(Binop a Equals (Str b)) =
        case reverse b of
          ('*':rest) -> fc "string.matches?" [a, (Str $ (reverse rest) ++ ".*")]
          _ -> binop


      -- TODO: convert this into some sort of exception
      f (FunctionCall "set" [Str "-e"]) = Nop
      f (FunctionCall "set" [Str "+e"]) = Nop

      f (FunctionCall "stderr.writeTo" [Str "/dev/null"]) = fc "stderr.ignore" []
      f (FunctionCall "stdout.writeTo" [Str "/dev/null"]) = fc "stdout.ignore" []

      -- TODO write a simple awk parser
      f (FunctionCall "awk" [Str "{print $0}"]) = fc "string.column" [Integer 0]
      f (FunctionCall "awk" [Str "{print $1}"]) = fc "string.column" [Integer 1]
      f (FunctionCall "awk" [Str "{print $2}"]) = fc "string.column" [Integer 2]
      f (FunctionCall "awk" [Str "{print $3}"]) = fc "string.column" [Integer 3]
      f (FunctionCall "awk" [Str "{print $4}"]) = fc "string.column" [Integer 4]
      f (FunctionCall "awk" [Str "{print $5}"]) = fc "string.column" [Integer 5]
      f (FunctionCall "awk" [Str "{print $6}"]) = fc "string.column" [Integer 6]
      f (FunctionCall "awk" [Str "{print $7}"]) = fc "string.column" [Integer 7]
      f (FunctionCall "awk" [Str "{print $8}"]) = fc "string.column" [Integer 8]
      f (FunctionCall "awk" [Str "{print $9}"]) = fc "string.column" [Integer 9]

      f (FunctionCall "awk" [Str "{print $0}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 0]]
      f (FunctionCall "awk" [Str "{print $1}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 1]]
      f (FunctionCall "awk" [Str "{print $2}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 2]]
      f (FunctionCall "awk" [Str "{print $3}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 3]]
      f (FunctionCall "awk" [Str "{print $4}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 4]]
      f (FunctionCall "awk" [Str "{print $5}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 5]]
      f (FunctionCall "awk" [Str "{print $6}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 6]]
      f (FunctionCall "awk" [Str "{print $7}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 7]]
      f (FunctionCall "awk" [Str "{print $8}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 8]]
      f (FunctionCall "awk" [Str "{print $9}", file]) = Pipe [fc "file.read" [file], fc "string.column" [Integer 9]]

      -- regexes use Pipes
      f (FunctionCall "re.matches" [val, arg]) = Pipe [val, fc "re.matches" [arg]]

      -- TODO: handle escaping with -e and -E properly
      f (Pipe (FunctionCall "echo" [Str "-e", str] : rest)) = Pipe (str : rest)
      f (Pipe (FunctionCall "echo" [Str "-E", str] : rest)) = Pipe (str : rest)
      f (Pipe (FunctionCall "echo" [Str "-n", str] : rest)) = Pipe (str : rest)
      -- we drop the implicit \n - I think that's safe
      f (Pipe ((FunctionCall "echo" [arg]) : rest)) = Pipe $ (arg : rest)

      -- fold within pipes
      f (Pipe es) = Pipe $ foldPipe es
      f x = x

      foldPipe exprs = foldr merge [] exprs

      merge (FunctionCall "stdout.ignore" [])
            ((FunctionCall "stderr.intoStdout" []) : cs)
            = (fc "stderr.replaceStdout" [] : cs)

      -- pipes within pipes
      merge (Pipe as)
            bs
            = as ++ bs

      merge a bs = (a:bs)

      convertExitArg (Str v) = Integer $ read v
      convertExitArg v = v


postProcessFunctionDefs :: Expr -> Expr
postProcessFunctionDefs = transformFixed $ f
    where
      f (FunctionDefinition (FuncDef name [] (List (Assignment (LVar lv) (Variable "1"): rest )))) =
         FunctionDefinition (FuncDef name [FunctionParameter lv] $ List rest)
      f x = x

postProcessGlobals :: Program -> Program
postProcessGlobals (Program (List exprs)) = Program $ List (map postProcessGlobalExpr exprs)
postProcessGlobals (Program expr) = Program $ postProcessGlobalExpr expr

postProcessGlobalExpr :: Expr -> Expr
postProcessGlobalExpr fd@(FunctionDefinition _) = fd
postProcessGlobalExpr e = transformFixed g $ transformFixed f e
    where
      -- | Comparing $# with something should convert to an int
      f (Binop v@(Variable "#") Equals (Str s)) =
        Binop v Equals (Integer $ read s)

      -- | Convert $1, $2, etc to sys.argv[0] etc
      f (Variable "0") = Variable "sys.command"
      f (Variable "1") = Subscript (Variable "sys.argv") (Integer 0)
      f (Variable "2") = Subscript (Variable "sys.argv") (Integer 1)
      f (Variable "3") = Subscript (Variable "sys.argv") (Integer 2)
      f (Variable "4") = Subscript (Variable "sys.argv") (Integer 3)
      f (Variable "5") = Subscript (Variable "sys.argv") (Integer 4)
      f (Variable "6") = Subscript (Variable "sys.argv") (Integer 5)
      f (Variable "7") = Subscript (Variable "sys.argv") (Integer 6)
      f (Variable "8") = Subscript (Variable "sys.argv") (Integer 7)
      f (Variable "9") = Subscript (Variable "sys.argv") (Integer 8)

      f (Binop s@(Subscript (Variable "sys.argv") _) op (Str "")) =
        (Binop s op Null)

      f x = x

      -- | Convert $# to sys.argv.length
      -- | Convert $@ to sys.argv
      g (Variable "#") = Pipe [Variable "sys.argv", fc "length" []]
      g (Variable "@") = Variable "sys.argv"
      g x = x


-- || TODO:
-- | possibly buggy parsing
-- parse DoubleQuoted strings
-- heredocs dont remove leading tabs for <<-
-- when parsing AssignBuiltin, lists of words wont be handled as lists of words
-- return is here as a function name, not a control flow thing
-- shell redirection

-- | handle builtins
-- $# -> sys.argv | length
-- process substitution (pipe into sys.procSub)
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

-- | Handle bash idioms
-- when it expects env args (eg, undefined vars being compared to -z, all caps),
-- use sys.argv instead of the var itself
-- __n=$(cat) - reading from stdin

-- | obvious improvements
-- keep comments
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

parseWord :: W.Word -> Expr
parseWord word = parseString (W.unquote word)

parseString :: String -> Expr
parseString source =
    case translate "src" source of
      Left err -> error ("nested parse of " ++ source ++ " failed: " ++ show err)
      Right (Program expr) -> expr

parseString2Word :: String -> W.Word
parseString2Word s =
    case Text.Parsec.parse Language.Bash.Parse.Word.word s s of
      Left err -> error ("nested parse of " ++ s ++ " failed: " ++ show err)
      Right word -> word

translate :: String -> String -> Either ParseError Program
translate name source =
    case BashParse.parse name source of
      Left err -> Left err
      Right ans -> Right $ postProcess $ postProcessGlobals $ Program $ convertList ans
