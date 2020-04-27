CC=gcc
CXX=g++
CFLAGS=-Wall -g -I../../../src/framework/include
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS=-lrtg -lpthread

all: bandwidth-rt

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)
	@cp $@ tau_1
	@mv $@ tau_2

clean:
	rm -f bandwidth-rt tau_1 tau_2
