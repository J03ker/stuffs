#!/bin/bash
# This script adds a new user using bash 
# - J0k3r


read -e -p "Enter the username for the new user: " username

#Check if the username already exists
if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        exit 1
fi

#create the user and home directory
sudo useradd -m "$username"

#set the password
passwd "$username"

#add user to the sudo group
usermod -a -G sudo "$username"

#set shell to bash

chsh -s /bin/bash "$username"
# Check if the user was created successfully
if [ $? -eq 0 ]; then
  echo "User '$username' has been created successfully."
else
  echo "Failed to create user '$username'."
fi
