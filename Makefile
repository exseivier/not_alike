GCC=gcc
FLAGS=-g -Wall -lm --std=c99 -O2
INSTALL_PATH=/usr/bin

install: build/manager

build: build/manager

build/manager: src/manager.o lib/libio.o
	@mkdir -p build
	$(GCC) $(FLAGS) -o ./build/manager ./src/manager.o ./lib/libio.o

lib/libio.o: lib/libio.*
	$(GCC) $(FLAGS) -c ./lib/libio.c -o ./lib/libio.o -I ./lib/

src/manager.o: src/manager.c
	$(GCC) $(FLAGS) -c ./src/manager.c -o ./src/manager.o -I ./lib/

clean:
	@rm lib/*.o src/*.o

remove: 
	@rm lib/*.o src/*.o build/manager
