## Notes
The simulator has been tested with Python-2.7. It may / may not work with
Python-3.

## Required Packages
The following packages are required to run the simulator:
  - z3 v4.8.9 - 64 bit (Download from: https://github.com/Z3Prover/z3/releases)
  - matplotlib (sudo apt install python-matplotlib)
  - colorama (pip2 install colorama)

Colorama is used to stylize the output messages from the simulator. It is not
*required* (raw messages will be printed) but is recommended.

## How to Run?
Use the following command to see the options for configuring / running the simulator:
```bash
./simulator -h
```

There is a **demo mode** of the simulator which illustrates the steps of the simulation using default parameters. To try that, run the simulator as follows:
```bash
./simulator -d
```
