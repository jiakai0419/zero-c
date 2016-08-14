#!/bin/sh

stack clean && stack install
if [ ${?} -eq 0 ]
then
  echo "trial-snap-s compile"
fi
