#!/bin/bash

x=10
y=3

mul=$x*$y  # does the concatenation output will be : 10*2

let mul=$x*$y # does the arithmetic operation

let add=$x+$y

sub=$(($x-$y)) # can perform arithmetic operation without using let keyword by
	       # using double paranthesis for specifying that it is an operation

div=$(($x/$y))

echo "mul is $mul , add is $add , sub is $sub , div is $div"

let mod=$x%$y

echo "mod is $mod"

let power=$x**$y

echo "power is $power"
