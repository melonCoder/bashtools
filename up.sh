#!/bin/bash

TMPIFS=$IFS
IFS='/'
dir=($(builtin pwd))
IFS=$TMPIFS
total=${#dir[*]}

#check if current dir is available
if [ "a$dir[1]" == "a" ]; then
    return 1
fi

#build path
backSlash="/"
dest=""
for x in "${dir[@]}"
do
    #escape the first white space
    if [ "a$x" == "a" ]; then
        continue
    fi
    dest="$dest$backSlash$x"
    if [ "$x" == "$1" ]; then
        builtin cd $dest
        return 0
    fi
done
return 1
