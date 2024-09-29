#!/bin/bash

# Define the directory to be backed up
source_dir="/opt/tomcat/webapps"

# Define the backup directory
backup_dir="/home/jenkins-agent/"

# Create a timestamp to include in the backup file name
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create a unique backup file name with .tar.gz extension
backup_file="$backup_dir/backup_$timestamp.tar.gz"

# Check if the backup directory exists, if not, create it
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

# Create the backup using tar with compression (gzip)
echo "Creating backup of entire directory..."
sudo tar -zcvf "$backup_file" "$source_dir"

# Check if backup creation was successful
if [ $? -eq 0 ]; then
  echo "Backup created successfully: $backup_file"
else
  echo "Failed to create backup."
  exit 1
fi
