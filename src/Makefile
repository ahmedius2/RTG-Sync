TGT := shell

all: ${TGT}

${TGT}: ${TGT}.c
	@gcc $^ -o $@
	@echo "Shell has been built!"

clean:
	@rm -f ${TGT}
	@echo "Shell executable has been removed!"
