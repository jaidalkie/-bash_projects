
scale() {
    read -p "give a number" number

    if [[ $number > 100 ]] then
        echo "large"
    elif [[ $number > 10 ]] then
        echo "medium"
    else 
        echo "small"
    fi
}

scale