CC=gcc
CXX=g++
LIBS=-lrtg -lpthread
LDFLAGS=-Wl,--no-as-needed -lrt
CFLAGS=-Wall -g -I../framework/include

all: simple_rt

simple_rt: simple_rt.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@ $(LIBS)

clean:
	rm -f simple_rt
