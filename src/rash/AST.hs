{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE DeriveDataTypeable #-}

module Rash.AST
    ( Expr(..)
    , Program(..)
    , LValue(..)
    , FunctionParameter(..)
    , BOp(..)
    , UOp(..)
    ) where

import           Data.Typeable()
import           Data.Data
import           Data.Generics.Uniplate.Data()


-- | The AST definition
data Program = Program Expr
               deriving (Show, Eq, Read, Data, Typeable)

data BOp = And | Or | Equals | LessThan | GreaterThan deriving (Show, Eq, Read, Data, Typeable)
data UOp = Not deriving (Show, Eq, Read, Data, Typeable)

data Expr =

  -- | Control flow
    For LValue Expr Expr -- TODO: better to pipe into a for loop?
  | If Expr Expr Expr
  | Pipe [Expr]
  | List [Expr] -- the last one is the true value

  -- | Operators
  | Binop Expr BOp Expr
  | Unop UOp Expr
  | Concat [Expr]

  -- | Literals
  | Str String
  | Integer Int
  | Null
  -- | Temporary
  | Debug String
  | Nop
  -- | Functions
  | FunctionInvocation Expr [Expr]
  | FunctionDefinition String [FunctionParameter] Expr

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
