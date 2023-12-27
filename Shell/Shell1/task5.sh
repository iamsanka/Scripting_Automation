#!/bin/bash

# Check if at least 3 arguments are provided
if [ $# -lt 3 ]; then
  echo "Usage: $0 <file1> <file2> <file3>"
  exit 1
fi

# Get the user's home directory
home_dir="$HOME"

# Loop through the provided arguments and delete the files from the home directory
deleted_files=()
for file in "$@"; do
  if [ -e "$home_dir/$file" ]; then
    rm "$home_dir/$file"
    deleted_files+=("$file")
  fi
done

# Display the list of deleted files
if [ ${#deleted_files[@]} -gt 0 ]; then
  echo "Deleted the following files: ${deleted_files[@]}"
else
  echo "No files were deleted."
fi


#execute permission
#chmod +x delete_files.sh

#execute
./task5.sh file1.txt file2.txt file3.txt
