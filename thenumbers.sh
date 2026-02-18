

thebigger() {
    read -p "give " one
    read -p "give " two

    if (( $one > $two )); then 
        echo "$one"
    else
        echo "$two"
    fi
}

the=$(thebigger)

echo "$the"
