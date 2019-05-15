#*****************************************************************************
# File:		Makefile
# Description:	Contains rules for building RT-Gang shared library, daemon and
# 		client executables. Executables are placed in the 'build'
# 		directory. Symbolic link is created under '/usr/lib' for the
# 		RT-Gang shared library hence user must have write permission
# 		for that path (e.g., root access)
# Author:	wali@ku.edu
#*****************************************************************************

CC := gcc

# Options for RT-Gang shared library
LIB_EXE := build/librtg.so
LIB_SRC := $(wildcard lib/*.c)
LIB_INC := -Iinclude

# Options for daemon executable
DMN_EXE := build/rtg_daemon
DMN_SRC := $(wildcard manager/daemon/*.c)
DMN_INC := -Iinclude -Imanager/include

# Options for client executable
CLT_EXE := build/rtg_client
CLT_SRC :=  $(wildcard manager/client/*.c)
CLT_INC := -Iinclude -Imanager/include

# Default target is to build everything
all: setup $(LIB_EXE) $(DMN_EXE) $(CLT_EXE)

clean:
	@rm -rf build

setup:
	@mkdir -p build
	@rm -f build/*

$(LIB_EXE): $(LIB_SRC)
	$(CC) $(LIB_INC) -shared -fPIC $< -o $@
	@rm -f /usr/lib/$(notdir $(LIB_EXE))
	@ln -s $(shell pwd)/$(LIB_EXE) /usr/lib/$(notdir $(LIB_EXE))
	
$(DMN_EXE): $(DMN_SRC) $(LIB_EXE)
	$(CC) $(DMN_INC) $(DMN_SRC) -o $@ -lrtg -lpthread

$(CLT_EXE): $(CLT_SRC) $(LIB_EXE)
	$(CC) $(CLT_INC) $(CLT_SRC) -o $@ -lrtg -lpthread

.PHONY: setup clean
