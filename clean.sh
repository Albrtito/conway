#!/bin/bash

# Conway Game of Life - Clean Script
# This script removes all build artifacts

echo "🧹 Cleaning build artifacts..."

# Remove build directory
if [ -d "build" ]; then
    echo "🗑️  Removing build directory..."
    rm -rf build
fi

# Remove any stray bin directory in root
if [ -d "bin" ]; then
    echo "🗑️  Removing bin directory..."
    rm -rf bin
fi

# Remove old Makefile if it exists in root
if [ -f "Makefile" ]; then
    echo "🗑️  Removing old Makefile..."
    rm Makefile
fi

echo "✅ Clean complete!"
