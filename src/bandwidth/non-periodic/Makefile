CC = gcc
CFLAGS := -I../../framework/include
LIBS := -lrtg -lpthread

TGT := tau_1 tau_2
SRC := bandwidth.c pagetype.c

all: $(TGT)

tau_1: $(SRC)
	@$(CC) $(CFLAGS) $^ -o $@ $(LIBS)

tau_2: tau_1
	@cp tau_1 tau_2
	@echo "Compilation Complete!"

clean:
	@rm -f ${TGT}
	@echo "Executable has been removed!"
