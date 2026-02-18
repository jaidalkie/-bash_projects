lookup=()
for x in {1..50}; do
    lookup[x]="";
    if (( x%3 == 0 )); then
        lookup[x]+="fizz"
    fi  

    if (( x%5 == 0 )); then
        lookup[x]+="buzz"
    fi
done
echo "${lookup[@]}"
for x in {1..50}; do
    count=1
    if (( x%3 == 0 )); then
        count=$(($count*3))
    fi  

    if (( x%5 == 0 )); then
        count=$(($count*5))
    fi
    echo ${lookup[$count]}
done