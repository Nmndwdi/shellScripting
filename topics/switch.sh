#!/bin/bash

echo "Provide an option"
echo "a to print date"
echo "b for checking all the items in the current directory"
echo "c for getting your working directory"

read -p "Enter option : " choice

case $choice in
	"a")
		echo "Today's date is :"
		date
		;;    # is used to end the case
	b) ls;;       # ')' is mandatory / to specify it is a case
	c) pwd;;
	*) echo "Please provide a valid option"  # in place of default
esac
