cmake_minimum_required(VERSION 3.16)
project(Conway LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set build type to Debug by default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Set SFML path for Homebrew installation
set(SFML_ROOT "/opt/homebrew/opt/sfml@2")

# Add SFML library directory to search path
link_directories(${SFML_ROOT}/lib)

# Collect all source files
file(GLOB_RECURSE SOURCES 
    "src/*.cpp"
)

# Create executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Include SFML headers and system headers
target_include_directories(${PROJECT_NAME} PRIVATE 
    ${SFML_ROOT}/include
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

# Set output directory
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# Enable debug symbols in Debug mode
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(${PROJECT_NAME} PRIVATE -g -O0)
endif()

# Enable optimizations in Release mode
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(${PROJECT_NAME} PRIVATE -O3)
endif()
