fruit=( "orange" "banana" "grape" )
for x in {1..${#fruit[@]}}; do
    echo ${fruit[x]}
done
echo ${fruit[@]}
echo ${fruit[${#fruit[@]}]}