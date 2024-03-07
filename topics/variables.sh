#!/bin/bash
set -e
# this is single line comment

<< comment
is this a multiline comment??
yes is indeed a multiline comment
comment

pokemon="pikachu"

echo "your pokemon is $pokemon"

echo "today's date is $(date)"

#constant variable

readonly firstPokemon="pikachu"

echo "your first pokemon is $firstPokemon"

firstPokemon="charizard" # it is not allowed will give error

read -p "Enter your first pokemon: " readonly firstpok # firstpok will take no                                                # value and it will remain empty

echo "your first pokemon is $firstpok"
