{-# LANGUAGE QuasiQuotes, FlexibleContexts, DeriveDataTypeable #-}

-- | Convert the AST into an executable IR

module Rash.AST2IR
    (
     translate
    ) where

import qualified Rash.AST as A
import qualified Rash.IR as I

translate :: A.Program -> I.Program
translate (A.Program expr) =
    I.Program
         []
         [I.Assignment
          (I.LVar (I.Var "var"))
          (I.And (I.VLi (I.Integer 5)) (I.VLit) (I.Integer 6))]
    --where (fns, stmts, e) = convertExpr expr

-- convertExpr :: A.Expr -> ([A.FunctionDefinition], [A.Statement], Expr)
-- convertExpr
