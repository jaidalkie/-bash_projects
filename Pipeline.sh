file=outputs.txt

awk '/cf.sh/ { print $1 }' "$file" | sort | uniq -c
