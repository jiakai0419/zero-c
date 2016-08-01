#!/bin/sh

cabal clean && cabal install
if [ ${?} -eq 0 ]
then
  echo "trial-snap compile"
fi
