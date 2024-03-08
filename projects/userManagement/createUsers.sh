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

userAlready=()

userGroup=()

userError=()

userGroupError=()

generatePassword() {
    local length="${1:-12}"  # Default length is 12 characters

    # Generate a random password and filter out ambiguous characters
    password=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9' | head -c"$length")
    echo "$password"
}

function userAdd
{
	local userName=$1
	local password=$(generatePassword)
	local type=$2
	useradd -m $userName &>/dev/null
	if [[ $? -ne 0 ]]
	then
		userError+=( $userName )
		return 1
	else
		echo "$userName:$password" | chpasswd
		if [[ $? -ne 0 ]]
		then
			userError+=( $userName )
			userdel -r $userName &>/dev/null
		else
			passwd -e $userName &>/dev/null
			if [[ $type -eq 0 ]]
			then
				users+=( $userName )
                        	users+=( $password )
			elif [[ $type -eq 1 ]]
			then
				userGroup+=( $userName )
				userGroup+=( $password )
			elif [[ $type -eq 2 ]]
			then
				local groupName=$3
				gpasswd -a $userName $groupName &>/dev/null
                                if [[ $? -ne 0 ]]
                                then
					userGroupError+=( $userName )
					userGroupError+=( $password )
				else
					users+=( $userName )
					users+=( $password )
				fi
			fi
		fi
	fi
}

for (( i=0;i<len;i+=2 ))
do
	userName=${arr[i]}
	if [[ $userName == "null" ]]
	then
		continue
	fi
	if id $userName &>/dev/null
        then
	       	userAlready+=( $userName )
                continue
	fi	
	if [[ i+1 -lt len ]]
	then
		groupName=${arr[i+1]}
		if [[ $groupName == "null" ]]
		then
			userAdd $userName 0
		elif getent group "$groupName" &>/dev/null;
		then
			userAdd $userName 2 $groupName
		else
                        userAdd $userName 1
		fi
	else
		userAdd $userName 0
	fi
done

if [[ ${#users[*]} -ne 0 ]]
then
	echo ""
	echo "These users are created successfully! and added in the provided groups :"
	#echo "Users with their passwords are: "
	echo ""
	len=${#users[*]}
	for (( i=0;i<len;i+=2 ))
	do
		echo "User : ${users[i]}"
		echo "Password : ${users[i+1]}"
		echo ""
	done
	echo ""
fi

if [[ ${#userGroup[*]} -ne 0 ]]
then
	echo ""
	echo "These users are created but can't be added to the provided groups as provided groups does not exists :"
	#echo "Users with their passwords are: "
        echo ""
        len=${#userGroup[*]}
        for (( i=0;i<len;i+=2 ))
        do
                echo "User : ${userGroup[i]}"
                echo "Password : ${userGroup[i+1]}"
                echo ""
        done
	echo ""
fi

if [[ ${#userAlready[*]} -ne 0 ]]
then
	echo ""
	echo "These users are not created as they are already present :"
	echo "${userAlready[*]}"
	echo ""
	echo ""
fi

if [[ ${#userGroupError[*]} -ne 0 ]]
then
	echo ""
	echo "These users are created but can't be added to the groups as there is some error in adding them in the group, Please try again to add them in the groups :"
	#echo "Users with their passwords are: "
        echo ""
        len=${#userGroupError[*]}
        for (( i=0;i<len;i+=2 ))
        do
                echo "User : ${userGroupError[i]}"
                echo "Password : ${userGroupError[i+1]}"
                echo ""
        done
	echo ""
fi

if [[ ${#userError[*]} -ne 0 ]]
then
	echo ""
	echo "These users can't be created due to some error, try again to create them ! :"
	echo "${userError[*]}"
	echo ""
	echo ""
fi
