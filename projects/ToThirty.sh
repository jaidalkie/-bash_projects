for x in {1..30}; do
    if (( x%3 == 0 )) then
        echo $x
    fi
done