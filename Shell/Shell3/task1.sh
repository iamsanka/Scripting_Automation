#!/bin/bash

# Initialize an empty array to store the values
values=()

# Main loop
while true; do
  # Prompt the user for input
  read -p "Enter a value (type 'exit' to quit): " input

  # Check if the user wants to exit
  if [ "$input" = "exit" ]; then
    break
  fi

  # Add the input to the array
  values+=("$input")
done

# Print the values along with their indices
for i in "${!values[@]}"; do
  echo "Index $i: ${values[$i]}"
done

#execute permission
#chmod +x task1.sh

