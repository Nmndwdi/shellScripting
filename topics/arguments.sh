#!/bin/bash

echo "Your pokemon team is : $1 , $2 , $3 , $4 , $5 , $6"

<< comment
the team is taken from the arguments passed from the terminal while executing the file
comment

sudo useradd -m $1

echo "number of arguments passed is : $#"
echo "all the arguments are : $@"

for arg in $@
do
	echo "argument is $arg"
done

echo "used first argument $1"

# combine rest of the arguments

shift
echo "all the left arguments are combined $@"
