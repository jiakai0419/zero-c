#!/bin/sh

trial-snap-s -p 8000 1>log/console.log 2>&1 &
if [ ${?} -eq 0 ]
then
  echo "trial-snap-s start"
fi
