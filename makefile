GPP = g++
GCC = gcc
OUTPUT = "bin/hash.so"
COMPILER_FLAGS = -std=gnu++17 -m32 -c -DLINUX -w -I./include/ -I./include/SDK/amx/
LIBRARIES = ./lib/libcryptopp.a -lrt -Wl,-Bstatic -Wl,-Bdynamic
CRYPTOPP_SRC_DIR = ./src/cryptopp

all: cryptolib hash clean

hash:
        $(GCC) $(COMPILER_FLAGS) ./include/SDK/amx/*.c
        $(GPP) $(COMPILER_FLAGS) ./include/SDK/*.cpp
        $(GPP) $(COMPILER_FLAGS) ./src/*.cpp
        mkdir -p bin
        $(GPP) -std=gnu++17 -m32 -fshort-wchar -shared -o $(OUTPUT) *.o $(LIBRARIES)

cryptolib:
        $(MAKE) -C $(CRYPTOPP_SRC_DIR) static
        mkdir -p lib
        cp $(CRYPTOPP_SRC_DIR)/libcryptopp.a ./lib

clean:
        rm -f *.o
