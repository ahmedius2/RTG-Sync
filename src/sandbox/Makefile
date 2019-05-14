CC := gcc

LIB_EXE := build/rtg_lib.so
LIB_SRC := $(wildcard lib/*.c)
LIB_INC := include

TGTS := $(LIB_EXE)

all: setup $(TGTS)

setup:
	@mkdir -p build
	@rm -f build/*

$(LIB_EXE): $(LIB_SRC)
	$(CC) -I$(LIB_INC) -shared -fPIC $< -o $@
	
%: %.c
	$(CC) $^ -o $@

clean:
	rm -f $(TGTS)

.PHONY: all setup clean
