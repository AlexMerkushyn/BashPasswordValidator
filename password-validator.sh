#! /bin/bash
function minCharacters {
    if [ ${#1} -le 10 ]
    then
        echo "1" 
    else
        echo "0" 
    fi
}
