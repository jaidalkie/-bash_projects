#/bin/bash
greet () {
    echo "hello $1, its nice to meet you"
}
for ((x=1;x<10;x++)) do
    greet "person $x"
done