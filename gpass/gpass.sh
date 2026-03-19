#!/bin/ksh

## gpg -c -a >file - вводишь пароль и хранимые данные
## gpg -d < file | fgrep -i xxxx | cut -f 2 - вводишь пароль, ищешь нужную строчку

## data format:
## key _space_ password
_file=gpass.db

if [ "$1" = "" ];
    then echo "No key" && exit 1
fi

case "$1" in
-l) gpg -d < $_file 2> /dev/null | cut -f 1 -d ' ' ;;
*) gpg -d < $_file 2> /dev/null | fgrep -i $1 | cut -f 2 -d ' ' ;;
esac
