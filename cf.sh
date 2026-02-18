one="the 9000"
two="this 5000"
three="that 100"

evaluate() {
    out=""
    if (( $1 >= 10000 )); then
        out="admin"
    elif (( $1 >= 5000 )); then
        out="privileged"
    elif (( $1 >= 1000 )); then
        out="standard"
    elif (( $1 >= 100 )); then
        out="restricted"
    else 
        out="nologin"
    fi
    echo "$out"
}

while read user rank; do
    echo "$rank"
    echo "$user:$(evaluate "$rank")"
done

files=($one $two $three)
for ((x=0; x<${#files[@]}/2; x++)) do
    echo ${files[$x*2]}: $(evaluate ${files[($x*2)+1]})
done
IFS=' ' read -r -a array <<< "$one"
echo ${array[0]}: $(evaluate ${array[1]})
#echo ${$one%" "}$(evaluate ${$one#" "})

while read user rank; do
    echo "$user: $(evaluate "$rank")"
done