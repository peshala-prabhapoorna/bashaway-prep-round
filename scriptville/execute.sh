#!/usr/bin/env bash

mkdir -p out
for filename in src/*; do
    if test "$filename" = "src/*"; then
        echo "folder is empty or doesn't exist"
        break
    fi
    convert "$filename" -resize 400% "out/"${filename:4}
done
