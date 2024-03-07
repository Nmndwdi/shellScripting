#!/bin/bash

# for loop

for (( i= 0;i < 5;i++ ))
do
	echo "$i"
done
 
# while loop

j=0
while [[ $j -lt 10 ]]
do
	echo "$j"
#	j=$j+1 # this will do concatenation
	j=$((j+1))
#	or you can also do ((j++))
#	or you can also do let j++ // using let keyword
done

# until loop

a=10
until [[ $a -eq 1 ]]  # until condition is false or not satisfied
do
	echo "$a"
	a=`expr $a-1`    # this will do concatenation
	a=`expr $a - 1`  # this syntax can also be used note the spacing between
done                     # $a and '-' and 1 
