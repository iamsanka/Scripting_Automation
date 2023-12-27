#!/bin/bash

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <number1> <number2>"
  exit 1
fi

# Assign the command line arguments to variables
num1="$1"
num2="$2"

# Perform arithmetic operations
addition=$((num1 + num2))
subtraction=$((num1 - num2))
multiplication=$((num1 * num2))

# Display the results
echo "Addition: $addition"
echo "Subtraction: $subtraction"
echo "Multiplication: $multiplication"


#execute permission
#chmod +x task1.sh


#execute
#./task1.sh 5 3
