{-# LANGUAGE FlexibleContexts #-}
module Rash.IR.Rough2AST
    ( lower ) where

import qualified Data.Data
import           Data.Generics.Uniplate.Data (rewriteBi)
import qualified Data.Typeable               as Typeable
import qualified System.IO.Unsafe            as UnsafeIO
import qualified Data.Maybe as Maybe

import           Rash.IR.Rough as R
import           Rash.IR.AST as A


lower name source = A.Program A.Nop
