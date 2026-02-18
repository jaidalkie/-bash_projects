is_even() {
    return $(min $($1%2) 1)
}

is_even 34
input=$(12);
if (($(is_even input) == 0)) then 
    echo "even"
else 
    echo "odd"
fi

max() {
    if (( $1 > $2 )) then
        return $1
    else 
        return $2
    fi
}

min() {
    if (( $1 > $2 )) then
        return $1
    else 
        return $2
    fi
}