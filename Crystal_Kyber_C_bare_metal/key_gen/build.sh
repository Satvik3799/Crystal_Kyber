#!/usr/bin/env bash

# Remove the existing cortos_build directory if it exists
if [ -d "cortos_build" ]; then
  rm -rf cortos_build
  echo "Removed existing cortos_build directory."
fi

# Build the project
cortos2 build "$@"

