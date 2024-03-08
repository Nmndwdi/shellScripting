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

groupNot=()

groupError=()

for grp in ${arr[*]}
do
        if getent group $grp &>/dev/null
        then
                groupdel $grp &>/dev/null
		if [[ $? -eq 0 ]]
		then
			groups+=( $grp )
		else
			groupError+=( $grp )
		fi
        else
                groupNot+=( $grp )
        fi
done

if [[ ${#groups[*]} -ne 0 ]]
then
	echo ""
        echo "These groups are successfully deleted :"
        echo ""
        echo "${groups[*]}"
	echo ""
fi

if [[ ${#groupNot[*]} -ne 0 ]]
then
	echo ""
        echo "These groups can't be deleted as they are not present :"
        echo ""
        echo "${groupNot[*]}"
	echo ""
fi

if [[ ${#groupError[*]} -ne 0 ]]
then
	echo ""
        echo "These groups can't be deleted due to some error, Please try again ! :"
        echo ""
        echo "${groupError[*]}"
	echo ""
fi
