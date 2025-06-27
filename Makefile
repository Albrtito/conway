# Replace this with the path you get from `brew info sfml`
SFML_PATH = /opt/homebrew/Cellar/sfml/3.0.1

# Replace "src" with the name of the folder where all your cpp code is
cppFileNames := $(shell find ./src -type f -name "*.cpp")

all: compile

compile:	
	mkdir -p bin
	clang++ $(cppFileNames) -I$(SFML_PATH)/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1 -o bin/app -L$(SFML_PATH)/lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lsfml-network -std=c++17 -stdlib=libc++

