{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
module Rash.IR.Rough2AST
    ( lower ) where

-- import qualified Data.Data
-- import           Data.Generics.Uniplate.Data (rewrite)
-- import qualified Data.Typeable               as Typeable
-- import qualified System.IO.Unsafe            as UnsafeIO
-- import qualified Data.Maybe as Maybe

import           Rash.IR.Rough as R
import           Rash.IR.AST as A


lower :: String -> R.Program -> A.Program
lower _ source = fprog source
  where
    fprog (R.Program e) = A.Program $ f e

    fop :: R.BOp -> A.BOp
    fop R.And = A.And
    fop R.Or = A.Or
    fop R.Equals = A.Equals
    fop R.LessThan = A.LessThan
    fop R.GreaterThan = A.GreaterThan
    fop R.GreaterThanOrEquals = A.GreaterThanOrEquals
    fop R.LessThanOrEquals = A.LessThanOrEquals


    fuop R.Not = A.Not

    f :: R.Expr -> A.Expr
    f R.Null = A.Null
    f R.Nop = A.Nop
    f (R.For lv e1 e2) = A.For (flv lv) (f e1) (f e2)
    f (R.If c l r) = A.If (f c) (f l) (f r)
    f (R.Pipe es) = A.Pipe (fes es)
    f (R.List es) = A.List (fes es)
    f (R.Binop l op r) = A.Binop (f l) (fop op) (f r)
    f (R.Unop op e) = A.Unop (fuop op) (f e)
    f (R.Concat es) = A.Concat (fes es)
    f (R.Str str) = A.Str str
    f (R.Integer i) = A.Integer i
    f (R.Array es) = A.Array (fes es)
    f (R.Hash es) = A.Hash (fet es)
    f (R.Debug str) = A.Debug str
    f (R.FunctionCall str es) = A.FunctionCall str (fes es)
    f (R.IndirectFunctionCall e es) = A.IndirectFunctionCall (f e) (fes es)
    f (R.Exec str) = A.Exec str
    f (R.FunctionDefinition fd) = A.FunctionDefinition (ffd fd)
    f (R.Stdin e1 e2) = A.Stdin (f e1) (f e2)
    f (R.Variable str) = A.Variable str
    f (R.Assignment lv e) = A.Assignment (flv lv) (f e)
    f (R.Subscript e1 e2) = A.Subscript (f e1) (f e2)
    flv R.AnonVar = A.AnonVar
    flv (R.LVar str) = A.LVar str
    flv (R.LSubscript e1 e2) = A.LSubscript (f e1) (f e2)
    ffp (R.FunctionParameter str) = A.FunctionParameter str
    fes (es :: [R.Expr]) = map f es
    fet (ets :: [(R.Expr,R.Expr)]) = map (\(a,b) -> (f a, f b)) ets
    ffd (R.FuncDef str fps e) = A.FuncDef str (map ffp fps) (f e)
