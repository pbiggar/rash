{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleContexts   #-}

{-| Description : Rash's AST -}
module Rash.IR.AST where

import           Data.Data
import           Data.Generics.Uniplate.Data ()
import           Data.Typeable               ()


-- | The AST definition
data Program = Program [Expr]
               deriving (Show, Eq, Read, Data, Typeable)

data BOp = And | Or | Equals
         | LessThan | GreaterThan | GreaterThanOrEquals | LessThanOrEquals
           deriving (Show, Eq, Read, Data, Typeable)

data UOp = Not
           deriving (Show, Eq, Read, Data, Typeable)

data FuncDef = FuncDef String [FunctionParameter] [Expr]
               deriving (Show, Eq, Read, Data, Typeable)

data Expr =

  -- | Control flow
    For LValue Expr [Expr]
  | If Expr [Expr] [Expr]
  | Pipe Stdin [FunctionCall]

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
  | FunctionDefinition FuncDef

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

data FunctionCall  = Fn String [Expr]
                   | IndirectFn Expr [Expr]
                   | Exec String
                   | Lambda [Expr]
  deriving (Show, Eq, Read, Data, Typeable)

data Stdin = Stdin Expr
           | NoStdin
  deriving (Show, Eq, Read, Data, Typeable)



data FunctionParameter = FunctionParameter String
                         deriving (Show, Eq, Read, Data, Typeable)
