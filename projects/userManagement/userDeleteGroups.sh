#!/bin/bash

if [[ $UID -ne 0 ]]
then
        echo "You are not a root user!"
        echo "If you want to execute the file you can use sudo command"
        exit 1
fi

if [[ $# -le 1 ]]
then
        echo "Please provide a User and at least one Group"
        exit 1
fi

userName=$1
if ! id $userName &>/dev/null
then
        echo "User $userName is not present, Invalid user, please provide a valid user"
        exit 1
fi

shift
arr=( $@ )

groups=()
groupNot=()
groupError=()

for grp in ${arr[*]}
do
	if groups $userName | grep -q "\<$grp\>"
        then
                gpasswd -d $userName $grp &>/dev/null
                if [[ $? -ne 0 ]]
                then
                        groupError+=( $grp )
                else
                        groups+=( $grp )
                fi
        else
                groupNot+=( $grp )
        fi
done

if [[ ${#groups[*]} -ne 0 ]]
then
	echo ""
        echo "The user $userName is successfully removed from these groups :"
        echo ""
        echo "${groups[*]}"
	echo ""
fi

if [[ ${#groupNot[*]} -ne 0 ]]
then
	echo ""
        echo "The user $userName can't be removed from these groups as $userName is not the part of these groups :"
        echo ""
        echo "${groupNot[*]}"
	echo ""
fi

if [[ ${#groupError[*]} -ne 0 ]]
then
	echo ""
        echo "The user $userName can't be removed from these groups due to some error, Please try again to remove $userName from these groups ! :"
        echo ""
        echo "${groupError[*]}"
	echo ""
fi
