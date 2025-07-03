#!/bin/bash
# Script to clean buildroot and project artifacts

echo "Running full clean operation..."

# Navigate to buildroot directory and run distclean
if [ -d "buildroot" ]; then
    echo "Cleaning buildroot..."
    make -C buildroot distclean
else
    echo "Error: buildroot directory not found"
    exit 1
fi

echo "Clean operation completed successfully"