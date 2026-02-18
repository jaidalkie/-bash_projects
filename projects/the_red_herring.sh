#!/bin/bash

echo "refreshing the directory"
rm -r scene
mkdir scene
cd scene

hash=("p" "Z" "2" "k" "V" "e" "m" "R" "7" "g" "x" "Y" "4" "n" "L" "W" "f" "T" "9" "i" "A" "o" "H" "q" "C" "0" "d" "u" "X" "5" "j" "s" "O" "v" "1" "y" "N" "E" "b" "K" "c" "M" "3" "a" "J" "l" "U" "t" "6" "B" "w" "Q" "8" "F" "z" "r" "D" "P" "g" "Y" "e" "k" "V" "2" "x" "n" "L" "m" "7" "f" "T" "o" "H" "q" "A" "0" "d" "W" "C" "i" "5" "s" "O" "v" "1" "u" "E" "y" "b" "X" "N" "c" "M" "3" "a" "J" "l" "U" "t" "6" "B" "w" "z" "Q" "8" "F" "r" "D" "P" "p" "K" "g" "x" "Y" "e" "m" "R" "7" "f" "T" "n" "L" "o" "H" "q" "A" "0" "d" "W" "C" "i" "5" "s" "O" "v" "1" "u" "E" "y" "b" "X" "N" "c" "M" "3" "a" "J" "l" "U" "t" "6" "B" "w" "z" "Q" "8" "F" "r" "D" "P" "g" "K" "x" "Y" "e" "m" "2" "R" "7" "f" "T" "n" "L" "o" "H" "q" "A" "0" "d" "W" "C" "i" "5" "s" "O" "v" "1" "u" "E" "y" "b" "X" "N" "c" "M" "3" "a" "J" "l" "U" "t" "6" "B" "w" "z" "Q" "8" "F" "r" "D" "P" "p" "K" "g" "x" "Y" "e" "m" "R" "7" "f" "T" "n" "L" "o" "H" "q" "A" "0" "d" "W" "C" "i" "5" "s" "O" "v" "1" "u" "E" "y" "b" "X" "N" "c" "M" "3" "a" "J" "l" "U" "t" "6" "B" "w" "z" "Q" "8" "F" "r" "D" "P") # random assortment, this is a low quality place holder.

slew() { # now a function we can use to bury our files.
    for ((x=1; x<=$1; x++)); do # from {x=1}, {x++} count, untill {x<=$1} x is less then the argument {$1}
        name="" # 
        for ((y=1; y<=$2; y++)); do # 
            name+=${hash[0]} # 

            hash+=(${hash[0]}) # 
            unset 'hash[0]' # 
            hash=( "${hash[@]}" ) # 
            done
        #echo "$name"
        mkdir "$name"
    done
}

# the following involves creating our flag, and red herring, and then burying them with our funciton.

slew 10 20 # argument 1 is the number of slew files, argument 2 is the length of their names.
mkdir "alSfSFdfSlaDflaggFDjsGsf" # ive added the real flag.
# entering the directory just to add somthing, then exiting.
cd "alSfSFdfSlaDflaggFDjsGsf"
echo "you have found the flag!" >> flag.txt # append the content to a text file, in our flag directory.
cd -

slew 10 20
mkdir "faSdFDlsFj flag s" # ive added the fake flag.

cd "faSdFDlsFj flag s"
echo "you have not found the flag!" >> flag1.txt # punishment
cd -

slew 10 20