module Rash.Debug where

import GHC.Stack
import Debug.Trace as Trace
import qualified Text.Groom          as G

import qualified Rash.Options as Opts

die :: Show a => String -> String -> a -> r
die ns msg obj = do
  errorWithStackTrace $ "[" ++ ns ++ "] " ++ msg ++ "):\n " ++ (G.groom obj)

traceTmpl :: Show a => String -> String -> a -> a
traceTmpl ns msg obj =
  if Opts.debugP ns Opts.flags then
    Trace.traceStack (msg ++ show obj) obj
  else
    obj

traceMTmpl :: (Show a, Applicative f) => String -> String -> a -> f a
traceMTmpl ns msg obj = pure $ traceTmpl ns msg obj

groom :: (Show a) => String -> String -> a -> a
groom ns msg obj =
  if Opts.debugP ns Opts.flags then
    Trace.trace (msg ++ ":\n" ++ G.groom obj) obj
  else
    obj
