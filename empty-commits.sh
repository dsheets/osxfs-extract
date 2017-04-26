#!/bin/sh

for sha in $(git rev-list --min-parents=1 --max-parents=1 --all)
do
   if [ $(git rev-parse ${sha}^{tree}) == $(git rev-parse ${sha}^1^{tree} ) ]
   then
       echo "${sha} will be pruned"
   fi
done
