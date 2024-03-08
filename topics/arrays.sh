#!/bin/bash

arr=( 1 20 15.5 "Hi" "Hello World" )

echo "value in 3rd index is ${arr[3]}"

echo "All values in the array are ${arr[*]}"

echo "the length of the array is ${#arr[*]}"

echo "values from index 2-4 ${arr[*]:2:3}"

echo "values from index 3 are ${arr[*]:3}"

#adding values

arr+=(40 "pika")

echo "new array is ${arr[*]}"

newarr=()

for (( i=0;i<5;i++ ))
do
	read val
	newarr+=($val)
done

echo "array taken from user is ${newarr[*]}"
