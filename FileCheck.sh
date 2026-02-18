check () {
    content=$(find . -name $1 )
    echo $content
    if [[ ${#content} > 0 ]] then
        echo "the file $1 exists"
    else 
        echo "the file $1 does not exist"
    fi
}

check "Arithemetic.sh"

#-e: Checks if a file exists
#-d: Checks if a directory exists
#-f: Checks if a file is a regular file
#-s: Checks if a file is not empty

