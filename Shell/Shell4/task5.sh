#!/bin/bash

# Enable debugging to show variable substitutions and command execution
set -x

# Function to create a new folder
mk_folder() {
  read -p "Enter a new folder path: " folder_path
  mkdir -p "$folder_path"
}

# Function to download an image and rename it
download_image() {
  # Define the URL of the image
  image_url="https://www.kernel.org/theme/images/logos/tux.png"

  # Specify the target folder and new filename
  target_folder="$folder_path"
  new_filename="linux-tux.png"

  # Download the image and rename it
  wget -O "$target_folder/$new_filename" "$image_url"
}

# Function to change folder and image permissions to owner only
change_perm() {
  # Change folder permissions to owner only
  chmod 700 "$folder_path"

  # Change image permissions to owner only
  chmod 600 "$folder_path/linux-tux.png"
}

# Call the functions
mk_folder
download_image
change_perm


#execute permission
#chmod +x task5.sh
