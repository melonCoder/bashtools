#/bin/bash

function vnote(){
    if [ "a$1" == "a" ]
    then
        noteName=`date "+%y-%m-%d"`
        noteName="${noteName}.md"
    else
        noteName=$1
    fi
    vim ~/note/$noteName
}

function cd(){
    if [ "a$1" == "a" ]
    then
        cd ~
    else
        if builtin cd $1
        then 
            clear
            ls --color=auto
            return 0
        fi
    fi
}
