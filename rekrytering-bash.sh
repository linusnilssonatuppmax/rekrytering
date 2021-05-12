#!/bin/bash

#
# T - directory to store the data in
#

if test "$1"  = "" ; then
    T=test.$RANDOM
else
    T="$1"
fi

#
# function: create_a_lot_of_files
#
# Arguments: none
# Return: none
# Actions: Create some files with important data in them.
#

function create_a_lot_of_files () {
    for i in {1..16} ; do 
	R1=$RANDOM_$i
	(
	    for j in {1..4} ; do 
		R2=$RANDOM
		mkdir "$T/$R1/$R2"
		SUM=$(echo "$RANDOM*9999^39999%$RANDOM+$RANDOM"|bc)
		echo "$SUM" >"$T/$R1/$R2/$RANDOM $RANDOM_$j.txt"
		echo -n .
	    done
	) &
	wait
    done
    echo
}

if test ! -d "$T" ; then
    mkdir "$T"
    echo -n create_a_lot_of_files: 
    time create_a_lot_of_files
fi

exit

#
# 1) När funktion ovan (create_a_lot_of_files) körs skrivs det ut en massa fel.
#   
#    Varför blir de fel?
#
#    Lös felet genom att ändra i koden.
#
#
# 2) Funktionen försöker köra parallellt men misslyckas.
#
#    Varför blir det fel?
#
#    Lös felet genom att ändra i koden så att den yttre loopen körs parallellt.
#
#
#    Tag bort exit ovan och fortsätt.
#

#
# function: collect_all_data
#
# Arguments: none
# Return: none
# Actions: Print all data
#

function collect_all_data () {
    pushd "$1"
    for p in * ; do 
	if test -d "$p" ; then
	    cat "$p"
	else
	    collect_all_data "$p"
	fi
    popd
    done
}

#
# function: sum_of_all_data
#
# Arguments: none
# Return: none
# Actions: Print sum of all data
#

function sum_of_all_data () {
    collect_all_data "$T" | awk '{sum=sum+$1} ; END {print sum}'
}

time echo "sum_of_all_data: $(sum_of_all_data)"

exit

#
# 3. Funktionen ovan (sum_of_all_data) anropar funktionen (collect_of_all_data)
#    och försöker tillsammans summmera allt data i ett filträd men misslyckas.
#
#    Popd och pushd klagar.
#
#    Varför blir det fel? 
#
#    Lös felet genom att ändra i koden.
#
#
# 4. Cat klagar.
#
#    Varför blir det fel?
#
#    Lös felet genom att ändra i koden.
#
#
#    Tag bort exit och fortsätt.
#

#
# function: sum_of_all_data_with_xargs
#
# Arguments: none
# Return: none
# Actions: Print the sum of all data
#

function sum_of_all_data_with_xargs () {
    find "$T" -type f | xargs -P 1 cat | awk '{sum=sum+$1} ; END {print sum}'
}

time echo "sum_of_all_data_with_xargs: $(sum_of_all_data_with_xargs)"

#
# 5. Funktionen ovan (sum_of_all_data_with_xargs) försöker summera allt data
#    men misslyckas.
#
#    Varför blir det fel? Lös felet genom att ändra i koden.
#

