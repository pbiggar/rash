{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleContexts   #-}

module Rash.AST
    ( Expr(..)
    , Program(..)
    , LValue(..)
    , FunctionParameter(..)
    , BOp(..)
    , UOp(..)
    , FuncDef(..)
    ) where

import           Data.Data
import           Data.Generics.Uniplate.Data ()
import           Data.Typeable               ()


-- | The AST definition
data Program = Program Expr
               deriving (Show, Eq, Read, Data, Typeable)

data BOp = And | Or | Equals
         | LessThan | GreaterThan | GreaterThanOrEquals | LessThanOrEquals
           deriving (Show, Eq, Read, Data, Typeable)
data UOp = Not
           deriving (Show, Eq, Read, Data, Typeable)

data FuncDef = FuncDef String [FunctionParameter] Expr
               deriving (Show, Eq, Read, Data, Typeable)

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
  | Array [Expr]
  | Hash [(Expr, Expr)]
  | Null

  -- | Temporary
  | Debug String
  | Nop

  -- | Functions
  | FunctionCall String [Expr]
  | IndirectFunctionCall Expr [Expr]
  | Exec String

  | FunctionDefinition FuncDef
  | Stdin Expr Expr

  -- | Storage
  | Variable String
  | Assignment LValue Expr
  | Subscript Expr Expr

    deriving (Show, Eq, Read, Data, Typeable)

-- TODO: separate or combined definitions of Variables or LHS and RHS, and
-- arrays and hashtables?
data LValue =   LVar String
              | LSubscript Expr Expr
              | AnonVar
              deriving (Show, Eq, Read, Data, Typeable)

data FunctionParameter = FunctionParameter String
                         deriving (Show, Eq, Read, Data, Typeable)
