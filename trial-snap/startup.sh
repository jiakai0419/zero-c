#!/bin/sh

~/.cabal/bin/trial-snap -p 8000 1>log/console.log 2>&1 &
if [ ${?} -eq 0 ]
then
  echo "trial-snap start"
fi
