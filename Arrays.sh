fruit=( o g s )
echo "this is running"
for ((x=0;x<${#fruit[@]};x++)) do
    echo ${fruit[x]}
done
fruit+=(this)
fruit[1]=this
unset "fruit[0]"
echo ${fruit[@]}
echo ${fruit[${#fruit[@]}-1]}

