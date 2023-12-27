#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]; then
  echo "Usage: $0 <new_port> <new_default_page> <example.conf>"
  exit 1
fi

# Store the command-line arguments in variables
new_port="$1"
new_default_page="$2"
example_conf="$3"

# Check if the specified configuration file exists
if [ ! -f "$example_conf" ]; then
  echo "Error: The specified file '$example_conf' does not exist."
  exit 1
fi

# Use sed to modify the configuration file
sed -i "s/\(listen \)[0-9]\+\(;\)/\1$new_port\2/g" "$example_conf"
sed -i "s/\(default_page \).*$/\1$new_default_page;/g" "$example_conf"

echo "Changes applied to $example_conf:"
grep -E "listen|default_page" "$example_conf"



#execute permission
#./task4.sh <new_port> <new_default_page> <example.conf>