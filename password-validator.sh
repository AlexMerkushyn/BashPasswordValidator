#1 /bin/bash
# Script from Alex Merkushyn

# _______-------- FUNCTION FOR PASSWORD VALIDATION iN STRiNG --------_______

function minCharactersForStr {
    RED='\033[0;31m' # red color 
    GREEN='\033[0;32m' # green color

    # ---- Check for a minimum of 10 characters ----
    if [[ ${#1} -le 10 ]];then 
        echo -e "$RED !!! Password length should be 10 charactore !!!"
        return 1
    fi
    # ---- Check using regex contain both alphabet and number, small and capital case letters ----
    temp=`echo $1 | grep "[A-Z]" | grep "[a-z]" | grep "[0-9]"`
    
    # ---- Checker if last command failed, password not valid ----
    if [[ $? -ne 0 ]];then
        echo -e "$RED !!! Password Must contain upparcase ,lowecase and number !!!"
        return 1
    else # --- if not failed, password valid ----
        echo -e "$GREEN --- Your password is valid ---"
        return 0
    fi
}

# _______-------- FUNCTION FOR PASSWORD VALIDATION iN FILE --------_______

function minCharactersFromFile {
    RED='\033[0;31m' # red color 
    GREEN='\033[0;32m' # green color
    file=$(cat $1) # read from file to variable

    # check if there are multiple words in the file
    count=0
    for word in $(cat $1); do count=$(( count+1 )); done
    if [[ $count -gt 1 ]]; then
        echo -e "$RED you have $count password word in file. We will be checked it in the next version"
        exit 1
    fi

    # ---- Check for a minimum of 10 characters ----
    if [[ ${#file} -le 10 ]];then 
        echo -e "$RED !!! Password length should be 10 charactore !!!"
        return 1
    fi
    # ---- Check using regex contain both alphabet and number, small and capital case letters ----
    temp=`echo $file | grep "[A-Z]" | grep "[a-z]" | grep "[0-9]"`

    # ---- Check if last command failed, password not valid ----
    if [[ $? -ne 0 ]];then
        echo -e "$RED !!! Password Must contain upparcase ,lowecase and number !!!"
        return 1
    else # ---- if not failed, password valid ----
        echo -e "$GREEN --- Your password is valid ---"
        return 0
    fi
}

# _______-------- SCRIPT STARTED HERE --------_______

# ---- Check if some parameters send ----
if [[ $# -eq 0 ]]; then
    echo "No parameters were passed"
    exit 1
fi

flag=0 # variable flag, check reading from file or string

while [ -n "$1" ] # if argument string not empty
do
case "$1" in # check parametr
    -f) echo "$(minCharactersFromFile $2)" # if parametr -f call functio minCharactersFromFile with second argument 
    flag=$(( flag+1 )) # up flag 
    shift ;; # shift to the left, read next variable
esac
#read from string if no -f (flag = 0)
if [[ $flag -eq 0 ]];then 
    echo "$(minCharactersForStr $1)"
fi
shift
done
