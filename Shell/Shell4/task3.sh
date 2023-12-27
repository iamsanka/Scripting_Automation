#!/bin/bash

# Prompt the user for the program to install
read -p "Enter the name of the program to install: " program_name

# Use sudo to run apt update and install the specified program
sudo apt update

# Check if the installation is successful
if sudo apt install -y "$program_name"; then
  echo "Installation of $program_name is successful."
  exit 0
else
  echo "Error: Failed to install $program_name."
  exit 111
fi


#execute permission
#chmod +x task3.sh


