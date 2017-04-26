#!/bin/sh -e

# git rev-list --max-parents=0 HEAD
ROOTS=bd9e6fd97edc89d3f482d050681d2589507fc469\|f4aaf84e1570ad7b7b3110c4c7d305a8980d9b22\|289c976d3758405c0e437f1f81a5a8a0a7f82db0\|8299a3a9cb108d212040a3041e098ef64e883967\|d2e73b369dcd2590badef9bcf1ec06a786ab632b\|22abfb0696f2bb6099032fd0684a66c03f255acd\|7d0c3cbb45a04a8219856e5cfb7312ee03382496\|c6fccad84a2661b048672258ef5f2620c13fd413\|8615b5ea4e9d1d7f93b4464b2e0e920df1a849d8\|bb14d85caa87f1c46aafed61779ef40d626366a6

sed "s/-p //g" | \
    xargs git show-branch --independent | \
    egrep -v $ROOTS | \
    sed "s/^/-p /g" | \
    tr "\n" " "
