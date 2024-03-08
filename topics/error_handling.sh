#!/bin/bash
set -e
# set -x

function create_directory()
{
	mkdir demo
}

if ! create_directory
then
	echo "Directory already exists , error... , code is exiting"
	exit 1
fi

echo "<------------ Directory created successfully ------------->"

<<comment

function do_something() {
    # Code here
    echo "doing something..............."
    if [ some_condition ]; then
        return 1  # Indicate failure
    fi
}

# Main script
do_something
if [ $? -ne 0 ]; then
    echo "Error: Something went wrong in do_something"
    exit 1
fi

comment

mkdir demo1

if [ $? -ne 0 ]; then
    echo "Error: Command failed"
    exit 1
fi

mkdir demo

if [ $? -ne 0 ]; then
	echo "err....."
	exit 1
fi
