{-# LANGUAGE QuasiQuotes, FlexibleContexts, DeriveDataTypeable #-}

-- | Convert the AST into an executable IR

module Rash.AST2IR
    (
     translate
    ) where

import qualified Rash.AST as A
import qualified Rash.IR as I

translate :: A.Program -> I.Program
translate _ = I.Program [] []
