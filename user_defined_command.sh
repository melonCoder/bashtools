#/bin/bash

function vnote(){
    #if note directory is not available, create it
    if [ ! -d ~/note ]
    then 
        mkdir ~/note
    fi

    # default edit a markdown file according the current time
    # or edit a specified file
    if [ "a$1" == "a" ]
    then
        noteName=`date "+%y-%m-%d"`
        noteName="${noteName}.md"
    else
        noteName=$1
    fi
    vim ~/note/$noteName
}

# cd into a directory, clear the screen and list current directory
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
