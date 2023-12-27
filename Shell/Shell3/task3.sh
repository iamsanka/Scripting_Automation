#!/bin/bash

# Function to count objects in a given directory
count_objects() {
  local directory="$1"

  # Use the find command to list files and directories (excluding hidden files)
  object_count=$(find "$directory" -maxdepth 1 -type f -o -type d -not -name '.*' | wc -l)

  # Print the count to the user
  echo "Number of objects in '$directory': $object_count"
}

# Prompt the user for a directory path
read -p "Enter the directory path: " user_directory

# Check if the specified directory exists
if [ ! -d "$user_directory" ]; then
  echo "Error: The specified directory does not exist."
  exit 1
fi

# Call the count_objects function with the user's directory
count_objects "$user_directory"


#EXECUTE PERMISSION
#chmod +x task3.sh
