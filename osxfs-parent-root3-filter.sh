#!/bin/sh -e

# git rev-list --max-parents=0 HEAD
ROOTS=915fa852f90835a190ed2bf33a0703000f215a57

sed "s/-p //g" | \
    xargs git show-branch --independent | \
    egrep -v $ROOTS | \
    sed "s/^/-p /g" | \
    tr "\n" " "
