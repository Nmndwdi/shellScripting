#!/bin/bash

if [[ $UID -ne 0 ]]
then
        echo "You are not a root user!"
        echo "If you want to execute the file you can use sudo command"
        exit 1
fi

if [[ $# -le 1 ]]
then
        echo "Please provide a Group and at least one user"
        exit 1
fi

groupName=$1
if ! getent group "$groupName" &>/dev/null
then
	echo "Group $groupName is not present, Invalid group, please provide a valid group"
	exit 1
fi

shift
arr=( $@ )

users=()
userNot=()
userError=()

for user in ${arr[*]}
do
	if id $user &>/dev/null
	then
		gpasswd -a $user $groupName &>/dev/null
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
	echo ""
        echo "These users are successfully added in the group $groupName :"
        echo ""
        echo "${users[*]}"
	echo ""
fi

if [[ ${#userNot[*]} -ne 0 ]]
then
	echo ""
        echo "These users can't be added in the group as these users are not present :"
        echo ""
        echo "${userNot[*]}"
	echo ""
fi

if [[ ${#userError[*]} -ne 0 ]]
then
	echo ""
        echo "These users can't be added in the group $groupName due to some error, Please try again ! to add these users in the group $groupName :"
        echo ""
        echo "${userError[*]}"
	echo ""
fi
