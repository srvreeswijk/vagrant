#!/bin/bash
# set -x


for i in 1 2 3 4
do 
  sed -i "s/3.[1-9]/3.$i/g" Dockerfile
  docker build -t="sebas/test$i" .
  docker run "sebas/test$i"
done
