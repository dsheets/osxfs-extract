#!/bin/sh -e

sed "s/-p //g" | \
    xargs git show-branch --independent | \
    sed "s/^/-p /g" | \
    tr "\n" " "
