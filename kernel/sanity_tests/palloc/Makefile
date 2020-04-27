CC=gcc
PGMS=bandwidth

# This is the page-coloring mask for partitioning LLC on Jetson TX-2 board.
# Please modify it appropriately if the target platform is different.
PALLOC_MASK=0x1c000

CFLAGS=-Wall -g -I../../../src/framework/include
LDFLAGS=-Wl,--no-as-needed -lrt
LIBS=-lrtg

all: $(PGMS)

bandwidth: bandwidth.o pagetype.o
	$(CC) $(LDFLAGS) $^ -o $@ $(LIBS)
	@rm -f *.o

bandwidth.o: bandwidth.c
	$(CC) $(CFLAGS) -c $<

pagetype.o: pagetype.c
	$(CC) $(CFLAGS) -DPALLOC_MASK=$(PALLOC_MASK) -c $<

clean:
	rm -f *.o *~ $(PGMS)
