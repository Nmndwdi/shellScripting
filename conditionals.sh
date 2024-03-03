#!/bin/bash

read -p "Enter you pokemon : " pokemon

if [[ $pokemon == "charizard" ]];
then
	echo "$pokemon is a fire type pokemon"
elif [[ $pokemon == "squirtle" ]];
then
	echo "$pokemon is a water type pokemon"
elif [[ $pokemon == "balbasaur" ]];
then
	echo "$pokemon is a grass type pokemon"
elif [[ $pokemon == "pikachu" ]];
then
	echo "$pokemon is a electric type pokemon"
else
	echo "type not found"
fi
