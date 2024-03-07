#!/bin/bash

# '>' command overwrite the file
ls > /home/ubuntu/devops/all_files_present_in_shellScripting_folder.txt

# '>>' this is used to append the contents to the file , it will not overwrite it

ls -l >> /home/ubuntu/devops/all_files_present_in_shellScripting_folder.txt
