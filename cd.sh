#!/bin/bash

if "a$1" == "a"
then
    cd ~
fi

if builtin cd $1; then
    clear
    ls --color=auto
    return 0
fi
return 1
