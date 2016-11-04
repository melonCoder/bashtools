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
