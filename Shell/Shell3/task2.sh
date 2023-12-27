#!/bin/bash

# Define the count_objects function
count_objects() {
  # Use the find command to list files and directories (excluding hidden files)
  object_count=$(find . -maxdepth 1 -type f -o -type d -not -name '.*' | wc -l)

  # Print the count to the user
  echo "Number of objects in the current directory: $object_count"
}

# Call the count_objects function
count_objects


#execute permission
#chmod +x task2.sh
