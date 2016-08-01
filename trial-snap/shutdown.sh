#!/bin/sh

lsof -i:8000 | grep LISTEN | awk '{print "kill -9 " $2}' | sh
if [ ${?} -eq 0 ]
then
  echo "trial-snap shutdown"
fi
