CC=gcc
CXX=g++
LIBS=-lrtg -lpthread
LDFLAGS=-Wl,--no-as-needed -lrt
CFLAGS=-Wall -g -I../../../src/framework/include

all: simple_rt

simple_rt: simple_rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)
	@cp $@ tau_1
	@mv $@ tau_2

clean:
	rm -f simple_rt tau_1 tau_2
