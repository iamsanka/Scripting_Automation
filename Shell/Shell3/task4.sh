#!/bin/bash

# Function to count objects in an array of directories
count_objects() {
  local directories=("$@")
  
  for directory in "${directories[@]}"; do
    # Check if the specified directory exists
    if [ ! -d "$directory" ]; then
      echo "Error: The directory '$directory' does not exist."
    else
      # Use the find command to list files and directories (excluding hidden files)
      object_count=$(find "$directory" -maxdepth 1 -type f -o -type d -not -name '.*' | wc -l)

      # Print the count to the user
      echo "Number of objects in '$directory': $object_count"
    fi
  done
}

# Initialize an empty array to store directory paths
directories=()

# Prompt the user for directory paths until they enter "exit"
while true; do
  read -p "Enter a directory path (type 'exit' to quit): " path
  if [ "$path" = "exit" ]; then
    break
  fi
  directories+=("$path")
done

# Call the count_objects function with the array of directory paths
count_objects "${directories[@]}"


#execute permission
#chmod +x task4.sh
