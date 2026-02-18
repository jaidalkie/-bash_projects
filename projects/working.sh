#!/bin/bash

echo "refreshing the directory"
rm -r scene2
mkdir scene2
cd scene2

read -p "give me your username: " name
echo "hello $name, nice to meet you"
