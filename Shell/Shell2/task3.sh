#!/bin/bash

# Loop through the command-line arguments
for path in "$@"; do
  # Check if the path exists
  if [ -e "$path" ]; then
    # Check if it's a regular file
    if [ -f "$path" ]; then
      echo "$path is a file"
    # Check if it's a directory
    elif [ -d "$path" ]; then
      echo "$path is a directory"
    # If it's not a regular file or directory, it's something else
    else
      echo "$path is something else"
    fi
  else
    echo "$path does not exist"
  fi
done


#execute permission
#chmod +x check_object_type.sh

#execute
#./task3.sh D:\JAMK\Sem3\Basics of Scripting and Automation\Excercises /nonexistent/path
