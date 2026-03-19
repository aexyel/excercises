#!/bin/ksh

_file=gpass.db

## data format:
## key _space_ password [_space_ = des crip ti on]
## _space_ = space and/or tab

gpg -c -a << EOF > $_file
key	password	= description
pass1	bc8wQS7ZIL	= 111 111 111
key1	rBLD00XWdZ	= 222 222 222
site1	ecsDwnEEXB	= 333 333 333
pass2 ULB76VprwQ = 111 111 111
key2 3H6ETFFsL6 = 222 222 222
site2 FNCwInhVjl = 333 333 333
pass3   ariTGSVLnc        = 111 111 111
key3      BfSy4qQP4c   = 222 222 222
site3        BC5AG2AxyY            = 333 333 333
EOF
