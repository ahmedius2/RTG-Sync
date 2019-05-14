CC := gcc

LIB_EXE := build/librtg.so
LIB_SRC := $(wildcard lib/*.c)
LIB_INC := -Iinclude

DMN_EXE := build/rtg_daemon
DMN_SRC := $(wildcard manager/daemon/*.c)
DMN_INC := -Iinclude -Imanager/include

CLT_EXE := build/rtg_client
CLT_SRC :=  $(wildcard manager/client/*.c)
CLT_INC := -Iinclude -Imanager/include

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
