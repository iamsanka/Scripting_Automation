#!/bin/bash

# Check if a file path is provided as a command-line argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <csv_file>"
  exit 1
fi

# Check if the provided file exists
csv_file="$1"
if [ ! -f "$csv_file" ]; then
  echo "Error: The specified file '$csv_file' does not exist."
  exit 1
fi

# Read the CSV file and print car information
awk -F ',' 'BEGIN { line=1; }
             {
               if (NR % 4 == 1) {
                 printf("--- Line %d ---\n", line);
                 line++;
               }
               if (NR % 4 == 1) { printf("Manufacturer: %s\n", $1); }
               if (NR % 4 == 2) { printf("Model: %s\n", $1); }
               if (NR % 4 == 3) { printf("Color: %s\n", $1); }
               if (NR % 4 == 0) { printf("Year: %s\n", $1); }
             }
           ' "$csv_file"



#Execute permission
#chmod +x task2.sh

#Execute 
#./task2.sh cars.csv

