{-# LANGUAGE QuasiQuotes, FlexibleContexts, DeriveDataTypeable #-}

-- | A 3 address-code based IR. All expressions are trivial
module Rash.IR
    ( Program(..)
    , FunctionDefinition(..)
    , FunctionParameter(..)
    , Statement(..)
    , Variable(..)
    , Val(..)
    , LValue(..)
    , RValue(..)
    , Literal(..)

    ) where

import Data.Typeable()
import Data.Data


data Program = Program [FunctionDefinition] [Statement]
                 deriving (Show, Eq, Read, Data, Typeable)


data FunctionDefinition = FunctionDefinition String [FunctionParameter] [Statement]
                          deriving (Show, Eq, Read, Data, Typeable)

data FunctionParameter = FunctionParameter String
                         deriving (Show, Eq, Read, Data, Typeable)

data Statement = Assignment LValue RValue
                 deriving (Show, Eq, Read, Data, Typeable)

data Variable = Var String
              | Temporary Integer
                deriving (Show, Eq, Read, Data, Typeable)

data Val = VVar Variable
         | VLit Literal
           deriving (Show, Eq, Read, Data, Typeable)

data LValue = LVar Variable
              deriving (Show, Eq, Read, Data, Typeable)

data RValue = FunctionInvocation Val [Val]
            | RVal Val
            | Subscript Variable Val
            | And Val Val
            | Or Val Val
            | Equals Val Val
            | LessThan Val Val
              deriving (Show, Eq, Read, Data, Typeable)


data Literal = Integer Int
             | Str String
               deriving (Show, Eq, Read, Data, Typeable)
