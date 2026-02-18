#!/bin/bash
Args=$@
for x in {0001..9999}; do
   echo "breaking $Args with $x"
   if 7z "x $Args" -p"$x" &>/dev/null ; then
       echo "$x"
       break;
   fi
done

progressbar() {
   clear
   width=$1
   hight=$2
   progress=$3
   end=$4
   gradiant="@&%QWNM0gB$#DR8mHXKAUbGOpV4d9h6PkqwSE2]ayjxY5Zoen[ult13If}C{iF|(7J)vTLs?z/*cr!+<>;=^,_:'-. "


   build=""
   for ((y=0; x<hight; x++)); do 
   
   done
   for ((x=0; x<width; x++)); do
        pixel="${gradiant:1:1}"
        if (( x%width > 0 )) then
            if (( y%hight > 0 )) then 
                pixel="+"
            else 
                pixel="-"
        elif (( y%hight > 0 )) then
            pixel="|"
        else 
            render=$(( (0-($x/$width)*50)+($progress/$end)*50 ))
            render=$(max 0 $render)
            render=$(min 50 $render)
            pixel="${gradiant:$render:$render}"
        fi

        build="$build$pixel$pixel"
   done
   echo "$build"
}

max() {
    if (( $1 > $2 )) then
        return $1
    else 
        return $2
    fi
}

min() {
    if (( $1 > $2 )) then
        return $1
    else 
        return $2
    fi
}