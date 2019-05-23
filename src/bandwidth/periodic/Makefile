CC=gcc
CXX=g++
PGMS=tau_1 tau_2

CFLAGS=-O2 -Wall -g -I../../framework/include
CXXFLAGS=$(CFLAGS)
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS := -lrtg -lpthread

all: $(PGMS)

tau_1: bandwidth-rt.c
	@$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)

tau_2: tau_1
	@cp tau_1 tau_2
	@echo "Compilation Complete!"

clean:
	@rm -f $(PGMS)
	@echo "Executable has been removed!"
