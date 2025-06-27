#!/bin/bash

# Conway Game of Life - Build Script
# This script uses CMake to generate Makefiles and build the project

set -e  # Exit on any error

echo "🔨 Building Conway Game of Life..."

# Create build directory if it doesn't exist
if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir build
fi

# Navigate to build directory
cd build

# Run CMake to generate Makefiles
echo "Configuring with CMake..."
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

# Build the project
echo "Building project..."
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu)

echo "Build complete!"
echo "Executable location: build/bin/Conway"
echo "To run: cd build/bin && ./Conway"
