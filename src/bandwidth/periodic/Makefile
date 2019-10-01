CC=gcc
CXX=g++
PGMS=tau_1 tau_rt

CFLAGS=-O2 -Wall -g -I../../framework/include -D RTG_SYNCH_DEBUG
CXXFLAGS=$(CFLAGS)
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS := -lrtg -lpthread

all: $(PGMS)

tau_1: bandwidth-rt.c
	@$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)

tau_rt: tau_1
	@cp tau_1 tau_rt_1
	@cp tau_1 tau_rt_2
	@cp tau_1 tau_rt_3
	@mv tau_1 tau_rt_4
	@echo "Compilation Complete!"

clean:
	@rm -f tau_*
	@echo "Executable has been removed!"
