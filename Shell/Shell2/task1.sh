#!/bin/bash

# Prompt the user for the file to remove
read -p "Enter the file to remove: " file_to_remove

# Check if the specified file exists
if [ ! -e "$file_to_remove" ]; then
  echo "Error: The specified file does not exist."
  exit 1
fi

# Check if the specified file is a regular file
if [ ! -f "$file_to_remove" ]; then
  echo "Error: The specified file is not a regular file."
  exit 1
fi

# Check if the specified file is empty
if [ ! -s "$file_to_remove" ]; then
  rm "$file_to_remove"
  echo "Removed the empty file: $file_to_remove"
else
  echo "Error: The specified file is not empty and cannot be removed."
fi


#execute permission
#chmod +x task1.sh


