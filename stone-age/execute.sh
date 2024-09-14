#!/usr/bin/env bash

sudo apt-get install fpc
fpc ./src/markings.pas -o"./src/markings"
./src/markings
