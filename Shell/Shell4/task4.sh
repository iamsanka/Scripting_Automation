#!/bin/bash

# Function to display network information and log it
network_information() {
  local ip_address=$(ip a | grep 'inet ' | awk '{print $2}' | head -n1)
  local hostname=$(hostname)

  echo "ip address: $ip_address"
  echo "hostname: $hostname"

  # Log the information to syslog with a custom tag
  logger -t network-information "IP Address: $ip_address, Hostname: $hostname"
}

# Call the network_information function
network_information


#execute permission
#chmod +x task4.sh
