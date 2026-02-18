#!/bin/bash

for x in {0001..9999}; do
    #echo "onto $x"
    #7z "x" "bash.009.flag.7z" -p"$x" -y >/dev/null 2>&1 && echo "pwd is $x" && break
    #echo "$(7z "x" "bash.009.flag.7z" -p"$x")"
    #stout=$(7z "x" "bash.009.flag.7z" -p"$x")
    #stout=$(awk 'Cannot' bash.009.flag.7z)
    #if echo "$stout" | grep "Cannot"; then
    if 7z "x" "bash.009.flag.7z" -p"$x"; then
        echo "the pwd is $x"
        cat bash.009.flag.7z
        break;
    else 
        echo "not this $x"
    fi
done


