#!/bin/bash

_cancel_info="Ok, do what you want"

function when_stopped () {
    tput cnorm
    echo
    echo "$_cancel_info"
    exit 0
}

function wait_with_countdown () {
    local msg="$1"
    local cnt_value="$2"
    local last_shift=1
    trap when_stopped SIGINT
    echo -n "$(tput smul)${msg}$(tput rmul)  "
    tput civis
    for i in $(seq $cnt_value -1 1); do
        sleep 1 &
        echo -n "$(tput cub $last_shift)$(tput el)${i}"
        last_shift=${#i}
        wait
    done
    echo
}

wait_with_countdown "$1" "$2"
