#!/bin/bash

# Check if /etc/hosts exists
if [ -e "/etc/hosts" ]; then
  echo "/etc/hosts is available."

  # Check if you have write permission
  if [ -w "/etc/hosts" ]; then
    echo "You have permission to edit the file."
  else
    echo "You don't have permission to edit the file."
  fi
else
  echo "/etc/hosts does not exist."
fi


#execute permission
#chmod +x task2.sh
