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
if ! getent group $groupName &>/dev/null
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
	if getent group "$groupName" | cut -d: -f4 | tr ',' '\n' | grep -q "\<$user\>"
	then
		gpasswd -d $user $groupName &>/dev/null
                if [[ $? -ne 0 ]]
                then
                        userError+=( $user )
                else
                        users+=( $user )
                fi
        else
                userNot+=( $user )
        fi
done

if [[ ${#users[*]} -ne 0 ]]
then
	echo ""
        echo "These users are successfully removed from the group $groupName :"
        echo ""
        echo "${users[*]}"
	echo ""
fi

if [[ ${#userNot[*]} -ne 0 ]]
then
	echo ""
        echo "These users can't be removed from the group $groupName as they are not the part of the group $groupName :"
        echo ""
        echo "${userNot[*]}"
	echo ""
fi

if [[ ${#userError[*]} -ne 0 ]]
then
	echo ""
        echo "These users can't be removed from the group $groupName due to some error, Please try again to remove these users from the group $groupName ! :"
        echo ""
        echo "${userError[*]}"
	echo ""
fi
