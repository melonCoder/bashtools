#/bin/bash

################################################################################
##################### vnote: a simple script function ##########################
##################### make note anywhere you want     ##########################
################################################################################
function vnote(){
    #if note directory is not available, create it
    if [ ! -d ~/note ]
    then 
        mkdir ~/note
    fi

    # default edit a markdown file according the current time
    # or edit a specified file
    local noteName
    if [ "a$1" == "a" ]
    then
        noteName=`date "+%y-%m-%d"`
        noteName="${noteName}.md"
    else
        noteName=$1
    fi
    vim ~/note/$noteName
}
################################################################################

################################################################################
##################### gt: a simple script function #############################
##################### bring you where you wanna go to ##########################
################################################################################
# TODO: AUTO IMPLEMENTATION
# CON: too slow
function gt(){
    #set -x
    if [ "a$1" == "a" ]; then
        usage_gt
    fi

    local simple_target=`echo $1 | awk -F '/' '{print $NF}'`
    local i=0
    local target_list
    while read target
    do
        target_list[i]=$target
        let i++
    done <<< "$(find -type d -iname ${simple_target} | grep -i $1)"

    local target_cnt=${#target_list[@]}
    if [ "${target_cnt}" -eq 1 ]; then
        builtin cd $target_list
    else 
        echo "There are more than one candidate"
        for i in $( seq 0 $target_cnt )
        do
            echo "    ${target_list[i]}"
        done
    fi
}

function usage_gt(){
    echo "Usage:"
    echo "    gt TARGET_DIR"
}
################################################################################
