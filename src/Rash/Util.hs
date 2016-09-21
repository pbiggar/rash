module Rash.Util where

import qualified System.Exit as Exit

exit2int :: Exit.ExitCode -> Int
exit2int Exit.ExitSuccess = 0
exit2int (Exit.ExitFailure i) = i

int2exit :: Int -> Exit.ExitCode
int2exit 0 = Exit.ExitSuccess
int2exit i = Exit.ExitFailure i
