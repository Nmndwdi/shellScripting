#!/bin/bash

if [[ $UID -ne 0 ]]
then
        echo "You are not a root user!"
        echo "If you want to execute the file you can use sudo command"
        exit 1
fi

if [[ $# -le 1 ]]
then
        echo "Please provide atleast one User and one Group"
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
        if getent group $grp &>/dev/null
        then
		gpasswd -a $userName $grp &>/dev/null
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
        echo "The user $userName is successfully added in these groups :"
        echo ""
        echo "${groups[*]}"
fi

if [[ ${#groupNot[*]} -ne 0 ]]
then
        echo "The user $userName can't be added in these groups as they are not present :"
        echo ""
        echo "${groupNot[*]}"
fi

if [[ ${#groupError[*]} -ne 0 ]]
then
        echo "The user $userName can't be added in these groups due to some error, Please try again to add $userName in these groups ! :"
        echo ""
        echo "${groupError[*]}"
fi

