CC=gcc
CXX=g++
CFLAGS=-Wall -g
CXXFLAGS=$(CFLAGS)
LDFLAGS=-Wl,--no-as-needed -lrt

all: bandwidth-rt

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ -lpthread
	@cp $@ tau_1
	@mv $@ tau_2

clean:
	rm -f bandwidth-rt tau_1 tau_2
