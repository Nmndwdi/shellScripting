#!/bin/bash

# to read the contents of the file using while loop

while read item
do
	echo "$item"
done < whileLoop.sh

# to read the contents from a csv file , csv -> comma separated values

while IFS="," read item1 item2
do
	echo $item1
	echo $item2
	echo
done < /home/ubuntu/devops/demo.csv

# avoiding first row of the csv file
# first getting the output then removing first line through awk and then reading

cat /home/ubuntu/devops/demo.csv | awk 'NR!=1 {print}' | while IFS="," read item1 item2
do
	echo $item1
	echo $item2
	echo
done
