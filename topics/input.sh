#!/bin/bash

echo "Enter your pokemon"

read pokemon

echo "Your pokemon is $pokemon"

read -p "Enter your pokemon : " pokemon

echo "Your second pokemon is $pokemon"

read -p "Enter your name : " name

sudo useradd -m $name

echo "user $name added successfully"
