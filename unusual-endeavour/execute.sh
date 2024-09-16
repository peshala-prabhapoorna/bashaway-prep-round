#!/usr/bin/env bash

docker run -d -p 2525:25 -p 1636:143 rnwood/smtp4dev

sleep 10

python3 mail.py
