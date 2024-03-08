#!/bin/bash

#condition1 && condition2 || condition3

read -p "Enter you age : " age

[[ $age -ge 18 ]] && echo "Adult" || echo "Minor"

