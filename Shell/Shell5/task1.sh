#!/bin/bash

# Main loop to continuously ask for values
while true; do
  read -p "Enter a value (type 'end' to finish): " value

  # Check if the user wants to end the script
  if [ "$value" = "end" ]; then
    break
  fi

  # Append the value to the 'animal.txt' file
  echo "$value" >> animal.txt
done

# Print every value from the 'animal.txt' file
echo "Values in animal.txt:"
cat animal.txt


