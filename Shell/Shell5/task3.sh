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

# Function to add a new entry to the cars.csv file
add_car_entry() {
  local manufacturer="$1"
  local model="$2"
  local color="$3"
  local year="$4"

  # Append the values to the CSV file
  echo "$manufacturer,$model,$color,$year" >> "$csv_file"
}

# Function to read and print car information from the CSV file
read_car_info() {
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
}

# Main menu
while true; do
  echo "1. Read Car Information"
  echo "2. Add New Car Entry"
  echo "3. Exit"
  read -p "Select an option (1/2/3): " option

  case "$option" in
    1)
      read_car_info
      ;;
    2)
      read -p "Enter Manufacturer: " manufacturer
      read -p "Enter Model: " model
      read -p "Enter Color: " color
      read -p "Enter Year: " year
      add_car_entry "$manufacturer" "$model" "$color" "$year"
      echo "New entry added to $csv_file."
      ;;
    3)
      echo "Exiting the script."
      exit 0
      ;;
    *)
      echo "Invalid option. Please select 1, 2, or 3."
      ;;
  esac
done


#execute permission
#chmod +x manage_cars.sh
