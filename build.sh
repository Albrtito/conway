#!/bin/bash

# Create build directory if it doesn't exist
mkdir -p build

# Navigate to build directory
cd build

# Configure the project (only needed first time or when CMakeLists.txt changes)
cmake ..

# Build the project
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu)

# Run the executable if build succeeded
if [ $? -eq 0 ]; then
    echo "Build successful! Running the application..."
    ./bin/Conway
else
    echo "Build failed!"
    exit 1
fi
