
fruitbowl () {
    bowl=("apple" "orange" "there")
    echo ${bowl[0]}
    bowl+=("coolness")
    echo ${bowl[${#bowl[@]}]}
    unset 'bowl[0]'
    bowl[1]="1"
    echo ${bowl[@]}
}

fruitbowl