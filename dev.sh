#!/bin/bash

stack build --file-watch \
            --fast \
            --ghc-options="-j +RTS -A128m -n2m -RTS -dynamic" \
            --exec "rash-exe --run-tests $1"
