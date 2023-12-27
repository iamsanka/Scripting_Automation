#!/bin/bash

# Function to ping a URL with 1 packet
ping_url() {
  local url="$1"
  ping -c 1 "$url" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    return 0  # Successful ping
  else
    return 1  # Unsuccessful ping
  fi
}

# Prompt the user for a URL
read -p "Enter a URL to ping: " user_url

# Call the ping_url function with the user's URL
ping_url "$user_url"

# Check the exit code from the function
if [ $? -eq 0 ]; then
  echo "Ping to $user_url was successful (Exit code: 0)."
else
  echo "Ping to $user_url was unsuccessful (Exit code: 1)."
fi


#execute permission
#chmod +x task1.sh
