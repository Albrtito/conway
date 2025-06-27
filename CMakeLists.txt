cmake_minimum_required(VERSION 3.16)
project(Conway LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set build type to Debug by default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Set SFML path for Homebrew installation (SFML 2)
set(SFML_ROOT "/opt/homebrew/opt/sfml@2")

# Add SFML library directory to search path
link_directories(${SFML_ROOT}/lib)

# Collect all source files from src directory
file(GLOB_RECURSE SOURCES 
    "src/*.cpp"
    "src/*.hpp"
)

# Create executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Include SFML headers and src directory
target_include_directories(${PROJECT_NAME} PRIVATE 
    ${SFML_ROOT}/include
    ${CMAKE_SOURCE_DIR}/src
    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1
)

# Set compiler flags for macOS
target_compile_options(${PROJECT_NAME} PRIVATE -stdlib=libc++)

# Link SFML libraries (order matters!)
target_link_libraries(${PROJECT_NAME} 
    sfml-graphics 
    sfml-window 
    sfml-system 
    sfml-audio 
    sfml-network
)

# Set output directory to build/bin
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# Create bin directory
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Enable debug symbols in Debug mode
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${PROJECT_NAME} PRIVATE -g -O0 -Wall -Wextra)
endif()

# Enable optimizations in Release mode
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(${PROJECT_NAME} PRIVATE -O3 -DNDEBUG)
endif()

# Generate compile_commands.json for LSP support
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
