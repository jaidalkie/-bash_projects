count=0
while read line; do 
    echo "$line"
    if cat "$line" | grep -q "error"; then
       ((count++))
       echo $(cat "$line")
    fi
done < <(find . -name "*.txt" 2>/dev/null)
echo $count