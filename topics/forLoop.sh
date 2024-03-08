#!/bin/bash

for i in 1 2 3 4 5
do
	echo "Number is $i"
done

for word in pikachu charizard squirle balbasaur greninja sceptile gangar
do
	echo "pokemon is $word"
done

for i in {1..20}
do
	echo "Number is $i"
done

file="/home/ubuntu/shellScripting/topics/forLoop.sh"

for item in $(cat $file)
do
	echo "$item"
done

for item in $(ls)
do
	echo "$item"
done

arr=( 1 2 3 4 5 )

for num in ${arr[*]}
do
	echo "$num"
done
