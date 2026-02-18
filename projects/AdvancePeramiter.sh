file="report.final.txt"
IFS='.' read -ra set <<< "$file"

extention=${file%${set[${#set[@]}-1]}}
echo "${file#$extention}"
echo "$extention"
echo "$file"
# rather then cut and awk, peramiter expantion is usefull for processing insignificant proportions of data.
# they offer use cases applicable to programming situations rather then command line situations.