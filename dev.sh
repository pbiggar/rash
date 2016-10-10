#!/bin/bash

declare -a args
args=$@
args+=(--run-tests)


stack build --file-watch \
            --fast \
            --ghc-options="-j +RTS -A128m -n2m -RTS -dynamic" \
            --exec "rash-exe $args"
