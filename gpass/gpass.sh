#!/bin/ksh

# _list file [pattern]
_list(){
if [ "$2" = "" ]; then
    gpg -d < $1 2> /dev/null | cut -f 1 -d ' '
else
    gpg -d < $1 2> /dev/null | cut -f 1 -d ' ' | fgrep -i $2
fi
}

# _show file key
_show(){
gpg -d < $1 2> /dev/null | fgrep -w $2 | cut -f 2 -d ' ' 
}


## gpg -c -a >file - вводишь пароль и хранимые данные
## gpg -d < file | fgrep -i xxxx | cut -f 2 - вводишь пароль, ищешь нужную строчку

## data format:
## key _space_ password
_file=gpass.db

if [ "$1" = "" ];
    then echo "No key" && exit 1
fi

case "$1" in
-l) _list $_file $2 ;;
*)  _show $_file $1 ;;
esac
