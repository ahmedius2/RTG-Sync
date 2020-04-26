CC=gcc
CXX=g++
CFLAGS=-Wall -g -I../../../src/framework/include
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS=-lrtg -lpthread

all: bandwidth-rt bandwidth

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)
	@mv $@ tau_1

bandwidth: bandwidth.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
	@mv $@ tau_be_rd

clean:
	rm -f bandwidth-rt tau_* *.txt *.trace
