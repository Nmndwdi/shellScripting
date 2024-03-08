#!/bin/bash

if [[ $UID -ne 0 ]]
then
	echo "You are not a root user!"
	echo "If you want to execute the file you can use sudo command"
	exit 1
fi

if [[ $# -eq 0 ]]
then
	echo "Please provide atleast one Group"
	exit 1
fi

arr=( $@ )

len=${#arr[*]}

groups=()

groupAlready=()

groupError=()

for grp in ${arr[*]}
do
	if getent group $grp &>/dev/null
	then
		groupAlready+=( $grp )
	else
		groupadd $grp
		if [[ $? -ne 0 ]]
		then
			groupError+=( $grp )
		else
			groups+=( $grp )
		fi
	fi
done

if [[ ${#groups[*]} -ne 0 ]]
then
	echo ""
	echo "These Groups are successfully created"
	echo "${groups[*]}"
	echo ""
fi

if [[ ${#groupAlready[*]} -ne 0 ]]
then
	echo ""
	echo "These Groups are not created as they are already present"
	echo "${groupAlready[*]}"
	echo ""
fi

if [[ ${#groupError[*]} -ne 0 ]]
then
	echo ""
	echo "These Groups cant't be created due to some error please try again !"
	echo "${groupError[*]}"
	echo ""
fi
