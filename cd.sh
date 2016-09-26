#!/bin/bash

if builtin cd $1; then
    clear
    ls --color=auto
    return 0
fi
return 1
