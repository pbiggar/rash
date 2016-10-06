{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
module Rash.IR.Rough2AST
    ( lower ) where

import qualified Data.Typeable               as Typeable
import qualified Rash.IR.Rough as R
import qualified Rash.IR.AST as A


debug :: (Show a, Typeable.Typeable a)  => String -> a -> b
debug msg x =
  error $ "[R2A] " ++ msg ++ " -> [" ++ (show $ Typeable.typeOf x) ++ "]" ++ (show x)



lower :: String -> R.Program -> A.Program
lower _ source = fprog source
  where
    fprog (R.Program e) = A.Program $ fl e

    -- | Exprs
    f :: R.Expr -> A.Expr
    f R.Null = A.Null
    f R.Nop = A.Nop
    f (R.For lv e body) = A.For (flv lv) (f e) (fl body)
    f (R.If c l r) = A.If (f c) (fl l) (fl r)
    f (R.Binop l op r) = A.Binop (f l) (fop op) (f r)
    f (R.Unop op e) = A.Unop (fuop op) (f e)
    f (R.Concat es) = A.Concat (fes es)
    f (R.Str str) = A.Str str
    f (R.Integer i) = A.Integer i
    f (R.Array es) = A.Array (fes es)
    f (R.Hash es) = A.Hash (fet es)
    f (R.Debug str) = A.Debug str
    f (R.FunctionDefinition fd) = A.FunctionDefinition (ffd fd)
    f (R.Variable str) = A.Variable str
    f (R.Assignment lv e) = A.Assignment (flv lv) (f e)
    f (R.Subscript e1 e2) = A.Subscript (f e1) (f e2)

    -- | Functions

    -- We want to make sure all Functions are in Pipes, and all Pipe Expressions
    -- are Functions. Stdin should be at the front of a pipe and nowhere else.



    -- these are solo fn. We need to avoid calling lowerExpr on R.Pipes in case we hit one
    f fn@(R.FunctionCall _ _) =
      A.Pipe A.NoStdin [mustBeAFn fn]
    f fn@(R.IndirectFunctionCall _ _) =
      A.Pipe A.NoStdin [mustBeAFn fn]
    f fn@(R.Exec _) =
      A.Pipe A.NoStdin [mustBeAFn fn]
    f fn@(R.List _) =
      A.Pipe A.NoStdin [mustBeAFn fn]

    -- These wrap other Fns. We need to make sure we convert these to pipes, and
    -- that only functions are within it. We also need to avoid calling
    -- lowerExpr on these, or else R.FunctionCalls will be converted to A.Pipes,
    -- which is wrong.
    f (R.Stdin e (R.Pipe fns)) = A.Pipe (A.Stdin (f e)) (map mustBeAFn fns)
    f (R.Stdin e fn) = A.Pipe (A.Stdin (f e)) [mustBeAFn fn]

    -- if there's only one thing, it must be a fn
    f (R.Pipe [fn]) = A.Pipe A.NoStdin [mustBeAFn fn]

    -- with more than one thing, the first might be a fn or an expr
    f (R.Pipe (fn:fns)) =
       case first of
         (A.Pipe A.NoStdin [asFn]) -> A.Pipe A.NoStdin (asFn : others)
         expr -> A.Pipe (A.Stdin expr) others

       where first = f fn -- this converts our various Fns into Pipes, and leaves expr as is
             others = (map mustBeAFn fns)

    f p@(R.Pipe []) = debug "empty pipeline" p


    mustBeAFn :: R.Expr -> A.FunctionCall
    mustBeAFn (R.FunctionCall name args) =
      A.Fn name (fes args)
    mustBeAFn (R.IndirectFunctionCall name args) =
      A.IndirectFn (f name) (fes args)
    mustBeAFn (R.Exec str) =
      A.Exec str
    mustBeAFn (R.List es) =
      A.Lambda $ fes es

    mustBeAFn expr = debug "expected function" expr

    fl :: R.Expr -> [A.Expr]
    fl (R.List es) = fes es
    fl e = [f e]

    fes (es :: [R.Expr]) = map f es
    fet (ets :: [(R.Expr,R.Expr)]) = map (\(a,b) -> (f a, f b)) ets

    -- | Operators
    fop :: R.BOp -> A.BOp
    fop R.And = A.And
    fop R.Or = A.Or
    fop R.Equals = A.Equals
    fop R.LessThan = A.LessThan
    fop R.GreaterThan = A.GreaterThan
    fop R.GreaterThanOrEquals = A.GreaterThanOrEquals
    fop R.LessThanOrEquals = A.LessThanOrEquals
    fuop R.Not = A.Not

    -- | LVals
    flv R.AnonVar = A.AnonVar
    flv (R.LVar str) = A.LVar str
    flv (R.LSubscript e1 e2) = A.LSubscript (f e1) (f e2)

    ffp (R.FunctionParameter str) = A.FunctionParameter str
    ffd (R.FuncDef str fps body) = A.FuncDef str (map ffp fps) (fl body)
