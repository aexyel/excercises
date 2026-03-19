#!/bin/ksh

# _list file [pattern]
_list(){
if [ "$2" = "" ]; then
    gpg -d < $1 2> /dev/null | tr "\t" " " | tr -s " " | cut -f 1,3-20 -d ' ' | column -t -s "="
else
    gpg -d < $1 2> /dev/null | tr "\t" " " | tr -s " " | cut -f 1,3-20 -d ' ' | fgrep -i $2 | column -t -s "="
fi
}

# _show file key
_show(){
gpg -d < $1 2> /dev/null | tr "\t" " " | tr -s " " | fgrep -w $2 | cut -f 2 -d ' ' 
}


## gpg -c -a >file - вводишь пароль и хранимые данные
## gpg -d < file | fgrep -i xxxx | cut -f 2 - вводишь пароль, ищешь нужную строчку

## data format:
## key _space_ password
_file=gpass.db

if [ "$1" = "" ];
    then echo "No key" ; echo "Try: gpass.sh -l" && exit 1
fi

case "$1" in
-l) _list $_file $2 ;;
*)  _show $_file $1 ;;
esac
