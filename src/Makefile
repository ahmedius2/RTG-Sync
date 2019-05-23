.PHONY: framework bandwidth clean

all: framework bandwidth
	@echo "[STATUS] Build Complete!"

framework:
	@echo "[STATUS] Making framework..."
	$(MAKE) -C framework

bandwidth:
	@echo "[STATUS] Making bandwidth..."
	$(MAKE) -C bandwidth/non-periodic
	$(MAKE) -C bandwidth/periodic

clean:
	@echo "[STATUS] Cleaning up..."
	$(MAKE) -C framework clean
	$(MAKE) -C bandwidth/periodic clean
	$(MAKE) -C bandwidth/non-periodic clean
	@echo "[STATUS] Cleaning Complete!"
