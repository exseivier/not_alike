GCC=gcc
FLAGS=-g -Wall -Wextra -lm --std=c99
INSTALL_PATH=/usr/bin
PWD=`pwd`

install: build/manager
	@ln -s $(PWD)/build/manager $(INSTALL_PATH)/manager
	@ln -s $(PWD)/scripts/format_db.sh $(INSTALL_PATH)/format_db
	@ln -s $(PWD)/scripts/not_alike.sh $(INSTALL_PATH)/not_alike

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
