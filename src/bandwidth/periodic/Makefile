CC=gcc
CXX=g++
PGMS=bandwidth-rt

CFLAGS=-O2 -Wall -g
CXXFLAGS=$(CFLAGS)
LDFLAGS=-Wl,--no-as-needed -lrt

all: $(PGMS)

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ -lpthread

clean:
	rm -f $(PGMS)
