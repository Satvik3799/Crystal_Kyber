#!/bin/bash

# Define the source and destination paths
SOURCE_PATH="/media/satvik/Study/M_tech/IITB/MTP/satvik/Crystal_Kyber/Crystal_Kyber_SDK/key_gen/"
CONTAINER_ID="15b1a3bbbc5f"
DESTINATION_PATH="/home/ajit/ajit-toolchain/validation_ladder/cortos2_tests/Crystal_Kyber_SDK/Test/"

# Check if Docker is running
if ! systemctl is-active --quiet docker; then
  echo "Docker is not running. Please start Docker and try again."
  exit 1
fi

# Check if the source path exists
if [ ! -d "$SOURCE_PATH" ]; then
  echo "Source path $SOURCE_PATH does not exist."
  exit 1
fi

# Create the destination directory inside the container
docker exec "$CONTAINER_ID" mkdir -p "$DESTINATION_PATH"

# Copy the files to the container
docker cp "$SOURCE_PATH/." "$CONTAINER_ID:$DESTINATION_PATH"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "Files successfully copied to the Docker container."
else
  echo "Error occurred while copying files to the Docker container."
fi

