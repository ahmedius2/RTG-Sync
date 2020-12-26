all:
	@rm -f *.smt2
	@echo "[STATUS] Generating a taskset and its SMT solver script..."
	@python simulator.py
	@echo "[STATUS] Executing SMT solver"
	@echo
	@z3 *.smt2
	@echo
	@echo "[STATUS] Done!"

clean:
	@rm -rf *.smt2 *.pyc *.txt
