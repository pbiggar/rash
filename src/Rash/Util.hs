module Rash.Util where

import qualified System.Exit as Exit

import Rash.RuntimeTypes
import Rash.Debug


findWithDefault :: [a] -> Int -> a -> a
findWithDefault list index def =
  if index >= length list
    then def
    else list !! index

isTruthy :: Value -> Bool
isTruthy (VString _) = True
isTruthy (VInt 0) = False
isTruthy (VInt _) = True
isTruthy (VBool b) = b
isTruthy (VExitCode Exit.ExitSuccess) = True
isTruthy (VExitCode _) = False
isTruthy VNull = False
isTruthy (VTodo _ _) = False
isTruthy (VArray _) = True
isTruthy (VHash _) = True
isTruthy vp@(VPacket _) = todo "should vpacket be truthy?" vp


toString :: Value -> Value
toString s@(VString _) = s
toString v = todo "Not a string" v

v2rv :: Value -> RetVal
v2rv (VExitCode ec) = VResult ec
v2rv _ = error "Bad exit code"

b2rv :: Bool -> RetVal
b2rv b = if b then vsuccess else (vfail (-1))

exit2int :: Exit.ExitCode -> Int
exit2int Exit.ExitSuccess = 0
exit2int (Exit.ExitFailure i) = i

int2exit :: Int -> Exit.ExitCode
int2exit 0 = Exit.ExitSuccess
int2exit i = Exit.ExitFailure i
