#!/bin/sh -e

# git rev-list --max-parents=0 HEAD
ROOTS=616ad41cf7cde9589ff71b59ad26c663d6601e78\|8f426af1ab37fb8f3e2a3a63f5b5e9d35c137cc3

sed "s/-p //g" | \
    xargs git show-branch --independent | \
    egrep -v $ROOTS | \
    sed "s/^/-p /g" | \
    tr "\n" " "
