#!/bin/bash

# Check if a file path is provided as a command-line argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <superhero.json>"
  exit 1
fi

# Check if the specified JSON file exists
json_file="$1"
if [ ! -f "$json_file" ]; then
  echo "Error: The specified file '$json_file' does not exist."
  exit 1
fi

# Function to display superhero information
display_superhero_info() {
  local superhero_name="$1"
  local attribute_type="$2"

  # Use jq to extract and display the desired attribute
  attribute_value=$(jq -r ".[] | select(.name == \"$superhero_name\") | .$attribute_type" "$json_file")
  echo "$attribute_type for $superhero_name: $attribute_value"
}

# Main loop
while true; do
  # Prompt the user for superhero selection or exit
  read -p "Enter a superhero name or 'exit' to quit: " superhero_name

  # Check if the user wants to exit
  if [ "$superhero_name" = "exit" ]; then
    echo "Exiting the script."
    exit 0
  fi

  # Prompt the user for attribute selection
  read -p "Select 'powers' or 'secret_identity': " attribute_type

  # Validate attribute type
  if [ "$attribute_type" != "powers" ] && [ "$attribute_type" != "secret_identity" ]; then
    echo "Invalid attribute type. Please select 'powers' or 'secret_identity'."
    continue
  fi

  # Display the selected superhero's information
  display_superhero_info "$superhero_name" "$attribute_type"
done


#execute permission
#chmod +x superhero_info.sh

#execute
#./task5.sh superhero.json
