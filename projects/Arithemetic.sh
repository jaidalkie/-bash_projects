#/bin/bash

echo "refreshing the directory"
rm -r "scene2"
mkdir "scene2"
cd "scene2"

read -p "give me a number: " n1
read -p "give me another number: " n2
result=$(($n1*$n2))
echo "they multiply into $result"
