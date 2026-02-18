for ((x=1;x<10;x++)) do
    if (( $(($x % 2)) > 0 )) then 
        echo "$x is even"
    else 
        echo "$x is odd" # bash bash
    fi
done # bash