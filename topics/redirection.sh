#!/bin/bash

# '>' command overwrite the file
ls > /home/ubuntu/devops/all_files_present_in_shellScripting_folder.txt

# '>>' this is used to append the contents to the file , it will not overwrite it

ls -l >> /home/ubuntu/devops/all_files_present_in_shellScripting_folder.txt

read -p "Enter the site : " site

# ping -c 1 $site  #it will print the output of the ping command to the terminal

ping -c 1 $site &> /dev/null  # nothing will be printed on the terminal
                              # and nowhere the output is redirected to any file

if [[ $? -eq 0 ]]
then
	echo "Successfully connected to $site"
else
	echo "Unable to connect to $site"
fi
