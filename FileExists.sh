args="$@"

Exists() {
    count=()
    while read line; do
        count+=$line
        if [[ -f "$line" ]]; then 
            len=$((${#count[@]}-1))
            count[$len]="$count[$len],regular"
        fi
        if cat "$line"; then 
            len=$((${#count[@]}-1))
            count[$len]="$count[$len],readable"
        fi
    done < <(find . -name "*$1*" 2>/dev/null)
    echo ${count[@]}
}

command=$(Exists $args)
echo $command
if (( ${#command[@]} == 0 )) then
    echo "none"
else 
    echo "some"
    while read line; do
        IFS=',' read -r -a parts <<< "$line"
        if (( ${#parts[@]} == 3 )) then
            echo "ok"
        else 
            echo "fail"
        fi
    done < <($command)
fi