#1 /bin/bash

# _______-------- FUNCTION FROM PASSWORD VALIDATOR --------_______

function minCharacters {
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

echo "$(minCharacters $1)"