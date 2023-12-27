#!/bin/bash

# Prompt the user for the username
read -p "Enter the username you want to create: " username

# Check if the user already exists using id -u
if id -u "$username" &>/dev/null; then
  echo "Error: User '$username' already exists."
  exit 1
fi

# Create the new user with home directory under /home and default shell as bash
sudo useradd -m -d "/home/$username" -s /bin/bash "$username"

# Check if the user creation was successful
if [ $? -eq 0 ]; then
  echo "User '$username' has been created with home directory '/home/$username' and default shell 'bash'."
else
  echo "Error: Failed to create user '$username'."
fi


#execute permission
#sudo ./task4.sh

