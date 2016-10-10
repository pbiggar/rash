module Rash.Debug where

import GHC.Stack
import Debug.Trace as Trace
import qualified Text.Groom          as G
--import qualified System.IO.Unsafe as Unsafe

import qualified Rash.Options as Opts

die :: Show a => String -> String -> a -> r
die ns msg obj = do
  errorWithStackTrace $ "[" ++ ns ++ "] " ++ msg ++ "):\n " ++ (G.groom obj)

{-# NOINLINE traceTmpl #-}
traceTmpl :: Show a => String -> String -> a -> a
traceTmpl ns msg obj = do
  if Opts.debugP ns Opts.flags then
    Trace.trace ("[" ++ ns ++ "]" ++ msg) obj
  else
    obj

{-# NOINLINE traceMTmpl #-}
traceMTmpl :: (Monad f, Show a, Applicative f) => String -> String -> a -> f ()
traceMTmpl ns msg obj =
  Trace.traceM $ "[" ++ ns ++ "] " ++ msg ++ " " ++ (show obj)

{-# NOINLINE groom #-}

groom :: (Show a) => String -> String -> a -> a
groom ns msg obj =
  if Opts.debugP ns Opts.flags then
    Trace.trace (msg ++ ":\n" ++ G.groom obj) obj
  else
    obj
