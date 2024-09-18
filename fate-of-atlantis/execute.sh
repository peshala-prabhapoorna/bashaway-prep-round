#!/usr/bin/env bash

if [ $# -eq 0 ]
then
    >&2 echo "no id provided"
    exit
fi

grep "$1" src/logs.txt
