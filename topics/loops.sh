#!/bin/bash

for (( i= 0;i < 5;i++ ))
do
	echo "$i"
done

j=0
while [[ $j -lt 10 ]]
do
	echo "$j"
#	j=$j+1 # this will do concatenation
	j=$((j+1))
#	or you can also do ((j++))
done
