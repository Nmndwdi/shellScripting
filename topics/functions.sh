#!/bin/bash

function check_pokemon_type()
{
	#read -p "Enter you pokemon : " pokemon
	# pokemon=$1  # this will not give error but using local to declare                           # variable withing a function is a good practice

	local pokemon=$1
	local pok=$2
	echo "$pok"

	if [[ $pokemon == "charizard" ]]
	then
		echo "$pokemon is a fire type pokemon"
	elif [[ $pokemon == "squirtle" ]];
	then
		echo "$pokemon is a water type pokemon"
	elif [[ $pokemon == "balbasaur" ]];
	then
		echo "$pokemon is a grass type pokemon"
	elif [[ $pokemon == "pikachu" ]]
	then
		echo "$pokemon is a electric type pokemon"
	else
		echo "type not found"
	fi
}

read -p "Enter you pokemon : " pokemon

check_pokemon_type "$pokemon" "gangar"

# function declaration types

# type1) by using function keyword

function greet
{
	echo "You are welcome!"
}

greet
greet

# type 2) by using paranthesis

hello()
{
	echo "Hello!"
}

hello
hello
