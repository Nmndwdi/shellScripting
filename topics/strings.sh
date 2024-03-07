#!/bin/bash

str="Hey Buddy , How are you?"

length=${#str}

upperstr=${str^^}

lowerstr=${str,,}

#to replace a substring

newstr=${str/Buddy/Ash}

#substring of a string

substr=${str:4:5}

echo "length is $length , uppercase is $upperstr , lowercase is $lowerstr , after replacing string is $newstr and substring is $substr"
