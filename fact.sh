#!/usr/bin/env bash
function fact {
    if [[ $1 == 0 ]]; then
        return 1
    fi
    fact $(($1 - 1))
    return $(( $1 * $? ))
}

__factorial=1
function calc {
    if [[ $1 == 0 ]]; then
        __factorial=1
        return
    fi
    calc $(($1 - 1))
    __factorial=$(($1 * __factorial))
}
function factorial {
    calc $1
    echo $__factorial
}

while [[ 1 == 1 ]]; do
    read
    factorial $REPLY
done

