#!/bin/bash

# Function to perform addition
add() {
  result=$(echo "$1 + $2" | bc)
  echo "Result: $result"
}

# Function to perform subtraction
subtract() {
  result=$(echo "$1 - $2" | bc)
  echo "Result: $result"
}

# Function to perform multiplication
multiply() {
  result=$(echo "$1 * $2" | bc)
  echo "Result: $result"
}

# Function to perform division
divide() {
  if [ "$2" -eq 0 ]; then
    echo "Error: Division by zero is not allowed."
  else
    result=$(echo "scale=2; $1 / $2" | bc)
    echo "Result: $result"
  fi
}

# Main loop
while true; do
  # Prompt the user for the operation
  read -p "Enter operation (-, +, *, /) or 'exit' to quit: " operation

  # Check if the user wants to exit
  if [ "$operation" = "exit" ]; then
    echo "Exiting the calculator."
    break
  fi

  # Prompt the user for two values
  read -p "Enter the first value: " value1
  read -p "Enter the second value: " value2

  # Perform the selected operation
  case "$operation" in
    "+")
      add "$value1" "$value2"
      ;;
    "-")
      subtract "$value1" "$value2"
      ;;
    "*")
      multiply "$value1" "$value2"
      ;;
    "/")
      divide "$value1" "$value2"
      ;;
    *)
      echo "Invalid operation. Please enter +, -, *, /, or 'exit' to quit."
      ;;
  esac
done


#execute permission
#chmod +x task5.sh
