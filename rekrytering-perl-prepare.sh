#!/bin/bash


mkdir projektkatalog
cd projektkatalog || exit 5

for i in {1..1000} ; do
    P="proj-$RANDOM"
    if ! test -d $P ; then
	mkdir $P
	dd if=/dev/urandom of=$P/dataset_$i.txt bs=1 count=$RANDOM
	chgrp -R "$(echo $RANDOM%2000+5000 | bc )" "$P" 
    fi
done
