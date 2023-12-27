#!/bin/bash

# Get the user's home directory
home_dir="$HOME"

# Prompt the user for a filename
read -p "Enter a filename: " filename

# Get the current date in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

# Concatenate the filename and date to create the new filename
new_filename="${filename}_${current_date}"

# Create the file in the user's home directory
touch "$home_dir/$new_filename"

echo "File '$new_filename' created in your home directory."


#execute permission
#chmod +x task2.sh

#execute
#./task2.sh
