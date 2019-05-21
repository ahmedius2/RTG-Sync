CC=gcc
CXX=g++
PGMS=bandwidth-rt

CFLAGS=-O2 -Wall -g -I../../framework/include
CXXFLAGS=$(CFLAGS)
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS := -lrtg -lpthread

all: $(PGMS)

bandwidth-rt: bandwidth-rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)

clean:
	rm -f $(PGMS)
