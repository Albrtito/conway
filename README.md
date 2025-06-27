# Conway's Game of Life - SFML C++ MacOS

A Conway's Game of Life implementation using SFML 2.x and CMake on macOS.

## Prerequisites

1. [Git](https://git-scm.com/)
2. [VSCode](https://code.visualstudio.com/) or [Neovim](https://neovim.io/)
3. [Homebrew](https://brew.sh)
4. [CMake](https://cmake.org/) - `brew install cmake`
5. [Make](https://www.gnu.org/software/make/#download)

## Setup

First, clone this repo:

```bash
git clone git@github.com:Albrtito/conway.git
cd conway
```

Install SFML 2.x using Homebrew:

```bash
brew install sfml@2
```

## Building

### Using the build script (recommended):

```bash
./build.sh
```

### Manual CMake build:

```bash
mkdir build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
make
```

## Running

After building, the executable will be located at `build/bin/Conway`:

```bash
cd build/bin
./Conway
```

## Project Structure

```
conway/
├── src/                    # All source files (.cpp, .hpp)
│   ├── main.cpp
│   ├── add.cpp
│   └── add.h
├── build/                  # CMake build directory (generated)
│   ├── bin/               # Executable output
│   ├── Makefile           # Generated Makefile
│   └── compile_commands.json  # LSP support
├── .vscode/               # VSCode configuration
├── .clang-format          # Code formatting rules
├── CMakeLists.txt         # CMake configuration
├── build.sh               # Build script
├── clean.sh               # Clean script
└── README.md
```

## Development

- **Code formatting**: Uses `.clang-format` with Google style
- **LSP support**: `compile_commands.json` generated for Neovim/VSCode
- **Build system**: CMake generates Makefiles in `build/` directory
- **SFML version**: Uses SFML 2.x for better macOS compatibility

### Cleaning build artifacts:

```bash
./clean.sh
```

### VSCode Integration

The project includes VSCode configuration with proper include paths and LSP support. Press `Cmd+Shift+P` and run "CMake: Build" or use the build script.

### Neovim Integration

The `compile_commands.json` file provides LSP support for clangd and other language servers.

## Features

- ✅ SFML 2.x compatibility
- ✅ CMake build system
- ✅ LSP support (compile_commands.json)
- ✅ Code formatting (.clang-format)
- ✅ Cross-platform build scripts
- ✅ Proper project structure
