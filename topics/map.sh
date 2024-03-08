#!/bin/bash

declare -A map

map+=( ["name"]="pikachu" [age]=2 [trainer]="ash" [powerful]=true )

echo "Trainer is ${map[trainer]} and pokemon is ${map[name]}"

echo "${map[name]} is powerful : ${map[powerful]}"
