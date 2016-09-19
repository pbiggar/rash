{-# LANGUAGE TemplateHaskell #-}
module Rash.Options where

import HFlags

HFlags.defineFlag "debug" False "print rash's internal debugging info"
