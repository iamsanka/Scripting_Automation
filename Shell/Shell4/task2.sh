#!/bin/bash

# Function to generate a random number and log a message
log_random_number() {
  local number="$1"
  local message="Random number $number: $RANDOM"
  echo "$message"
  logger -p user.info "$message"
}

# Generate and log three random numbers
log_random_number 1
log_random_number 2
log_random_number 3


#execute permission
#chmod +x task2.sh
