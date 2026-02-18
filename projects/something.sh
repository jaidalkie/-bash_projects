#!/bin/bash

echo "refreshing the directory"
rm -r scene1
mkdir scene1
cd scene1

winThreshold=3
xDimention=10
yDimention=10
xMargin=2
yMargin=2
gamePlayx=()
gamePlayy=()

# bash {script.sh}
# chmod +x script.sh && ./script.sh # basically turn it into an executable, and running it with "./"
board() { # 1 and 2 are x and y coords for dimentions. 3 and 4 are steps for margins. 5, is the board itself.
    build=();
    for ((y=1; y<=$2; y++)) {
        build+=("")
        for ((x=1; x<=$1; x++)) {
            if [[x%$3 != 0]] then
                if [[y%$4 != 0]] then 
                    build[#build[@]]=("+")
                else 
                    build[#build[@]]=("-")
                fi
            elif [[y%2 != 0]] then
                build[#build[@]]=("|")
            elif [[$5[($y*$2)+$x] != " "]] then
                build[#build[@]]=($5[($y*$2)+$x])
            fi
        }
    }

    buildString="";
    for (x=1; x<=#build[@]; x++) {
        buildString+="$build[$x]\n"
    }
    echo $board
}

evaluate() { # 1 and 2 are coords for the current point, 3 and 4 are steps for margins. 5 and 6 are the dimentions. 7 is the board. 8 is the team.#### 9 is the win threashold
    #line="false"
    xvector=(1,1,0,1)
    yvector=(0,1,1,-1)
    for ((x=1; x<#xvector[@]; x++)); do
        count=0
        xpos = $1
        ypos = $2
        while true; do
            xpos = $xpos+($count*($xvector[$x]*$3))
            ypos = $ypos+($count*($yvector[$y]*$4))
            if ((xpos > $5) || (xpos < 0)) then
                break
            elif ((ypos > $6) || (ypos < 0)) then
                break
            elif (($7[($ypos*$6)+$xpos] != $8)) then
                break
            fi
            count+=1
        done
        
        count2=0
        xpos = $1
        ypos = $2
        while true; do
            xpos = $xpos+($count2*((0-$xvector[$x])*$3))
            ypos = $ypos+($count2*((0-$yvector[$y])*$4))
            if ((xpos > $5) || (xpos < 0)) then
                break
            elif ((ypos > $6) || (ypos < 0)) then
                break
            elif (($7[($ypos*$6)+$xpos] != $8)) then
                break
            fi
            count2+=1
        done

        #if ((count+count2 >= $9)) then
        #    line = "true"
        #    break;
        #fi
    done    
    local result=$(($count+$count2))
}

play() { # 1 and 2 are the steps for the margins, and 3 and 4 are the dimentions, 5 and 6 is the gene coords, 7 is the win threshold.
    board=()
    gamePlayx=()
    gamePlayy=()
    game="true"
    for ((x=1; x<=($3*$4); x++)) {
        board+=""
    }
    while $game = "true" do
        board $3 $4 $1 $2 $board
        while true; do
            read -p "enter the x pos" xInput
            read -p "enter the y pos" yInput
            result=$(evaluete $xInput $yInput $1 $2 $3 $4 $board "X")
            if [[ $result > 0 ]] then
                if [[ $result > $5 ]] then
                    game="X"
                fi
                break
            else
                echo "invalid move" # means that they likly make an input on a occupyed square
            fi
        done

        while true; do 
            min=1
            max=#$6[@]
            sample=$((RANDOM % ($max - $min + 1) + $min))
            xInput=$5[$sample]
            yInput=$6[$sample]
            result=$(evaluete $xInput $yInput $1 $2 $3 $4 $board "O")
            if [[ $result > 0 ]] then
                gamePlayx+=$xInput
                gamePlayy+=$yInput
                if [[ $result > $7 ]] then
                    game="O"
                fi
                break
            else
                echo "invalid move" # means that they likly make an input on a occupyed square
            fi
        done

        complete="false"
        for (x=1; x<=$3/$1; x++) do
            if [[ $complete!="false" ]] then
                break
            fi
            for (y=1; y<=$4/$2; y++) do
                if [[ $board[x*$1+((y*$2)*$3)] == "" ]] then
                    complete="true"
                    break
                fi
            done
        done

        if [[ $complete=="false" ]] then
            game="draw"
        fi
    done
}

winThreshold=4
xDimention=10
yDimention=10
xMargin=2
yMargin=2
gamePlayx=()
gamePlayy=()

for ((x=1; x<=10; x++)) do
    min=1
    max=$xDimention/$xMargin
    sample=$((RANDOM % ($max - $min + 1) + $min))
    gameGenex+=$sample

    min=1
    max=$yDimention/$yMargin
    sample=$((RANDOM % ($max - $min + 1) + $min))
    gameGeney+=$sample
done

for ((x=1; x<=10; x++)) do


    result=$(play $xMargin $yMargin $xDimention $yDimention $gameGenex $gameGeney $winThreshold)
    if [[ $result == "X" ]]; then
        for ((y=1; y<=#gameGenex[@]; y++)) do
            min=1
            max=2
            sample=$((RANDOM % ($max - $min + 1) + $min))
            if [[ $sample == 1 ]] then
                gameGenex+=$gamePlayx[$y]
                gameGeney+=$gamePlayy[$y]
                for ((z=1; z<=#gamePlayx[@]; z++)) do 
                    if [[ gameGenex[y] == gamePlayx[z]]]
                done
            if
        done
    elif [[ $result == "O" ]]; then
        for ((y=1; y<=#gamePlayx[@]; y++)) do
            min=1
            max=2
            sample=$((RANDOM % ($max - $min + 1) + $min))
            if [[ $sample == 1 ]] then
                gameGenex+=$gamePlayx[$y]
                gameGeney+=$gamePlayy[$y]
            if
        done
    elif [[ $result == "draw" ]]; then

    fi


done
play $xMargin $yMargin $xDimention $yDimention $gameGenex $gameGeney $winThreshold


