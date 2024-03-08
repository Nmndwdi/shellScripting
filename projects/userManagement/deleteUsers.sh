#!/bin/bash

if [[ $UID -ne 0 ]]
then
        echo "You are not a root user!"
        echo "If you want to execute the file you can use sudo command"
        exit 1
fi

if [[ $# -eq 0 ]]
then
        echo "Please provide atleast one user!"
        exit 1
fi

arr=( $@ )
len=${#arr[*]}

users=()

userNot=()
userError=()

for user in ${arr[*]}
do
	if id $user &>/dev/null
        then
		userdel -r $user &>/dev/null
		if [[ $? -eq 0 ]]
		then
			users+=( $user )
		else
			userError+=( $user )
		fi
	else
		userNot+=( $user )
	fi
done

if [[ ${#users[*]} -ne 0 ]]
then
	echo "These users are successfully deleted :"
	echo ""
	echo "${users[*]}"
fi

if [[ ${#userNot[*]} -ne 0 ]]
then
	echo "These users can't be deleted as they are not present :"
	echo ""
	echo "${userNot[*]}"
fi

if [[ ${#userError[*]} -ne 0 ]]
then
	echo "These users can't be deleted due to some error, Please try again ! :"
	echo ""
	echo "${userError[*]}"
fi

