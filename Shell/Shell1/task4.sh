#!/bin/bash

# Prompt the user for the original file path
read -p "Enter the path of the original file: " original_file

# Check if the original file exists
if [ ! -e "$original_file" ]; then
  echo "Error: The specified original file does not exist."
  exit 1
fi

# Prompt the user for the destination path
read -p "Enter the destination path: " destination_path

# Copy the file to the specified destination
cp "$original_file" "$destination_path"

# Extract the file name from the original file path
original_filename=$(basename "$original_file")

# Display a success message
echo "Copied the '$original_filename' to '$destination_path'!"



#execute permission
#chmod +x task4.sh

