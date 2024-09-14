#!/usr/bin/env bash

git init
git config user.email yippie@hotmail.com
git config user.name Yapper

FILE="./.git/hooks/post-commit"
LINE_1="#!/usr/bin/env bash"
LINE_2="mkdir -p ./out"
LINE_3="git log > ./out/commits.txt"

printf "$LINE_1\n$LINE_2\n$LINE_3" > $FILE

chmod +x ./.git/hooks/post-commit
