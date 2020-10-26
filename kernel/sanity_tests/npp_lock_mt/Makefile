CC=gcc
CXX=g++
LIBS=-lrtg -lpthread
LDFLAGS=-Wl,--no-as-needed -lrt
CFLAGS=-Wall -g -I../../../src/framework/include

all: bandwidth-rt

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)
	@cp $@ tau_1
	@mv $@ tau_2

clean:
	rm -f bandwidth-rt tau_1 tau_2
