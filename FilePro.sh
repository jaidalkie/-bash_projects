bash() {
    path=$(find . -name $1)
    score=0
    for ((x=0;x<$(cat $path | wc -l);x++)) do
        content=$(cat $path | head -n $x | tail -n 1)
        if echo "$content" | grep -q "bash"; then
            score=$(($score+1))
        fi
    done
    echo $score
}
bash FilePro.sh
