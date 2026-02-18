args=$@
echo "$args"
output=$($args)
if (($? != 0)) then 
    echo "$output">"errors.txt"
else 
    echo "$output">"outputs.txt"
fi
