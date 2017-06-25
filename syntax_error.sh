#!/bin/bash

if test $# -eq 1
then
    if test "$1" = "-h"
    then
        echo "usage: $(basename $0) -h|file"
    fi

echo 'end of script'
