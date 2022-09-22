# :warning: **This tutorial is still in development** :warning:

# OpenROAD: Open-Source ASIC Design for Computer Architects

This repository contains all material needed to participate in the tutorial hosted at MICRO 2022.
Please see the [tutorial website](https://the-openroad-project.github.io/micro2022tutorial) for more information.

## Tutorial Info
**Date**: Saturday, October 1, 2022

**Time**: 1 PM - 5 PM CST (afternoon session)

**Location**: [The Westin Chicago River North Hotel](https://www.marriott.com/en-us/hotels/chino-the-westin-chicago-river-north/),
Chicago, IL, USA. Room TBD.

## Preparation
See [Tutorial Preparation](https://the-openroad-project.github.io/micro2022tutorial/content/0-prep.html).

## Installation
For demonstration, this tutorial will install in `user`'s home folder. The tools may be installed anywhere you prefer.

Download the tutorial repository:
```
$ git clone --recursive https://github.com/The-OpenROAD-Project/micro2022tutorial.git
```
Install all required tools (will take several minutes):
```
# This script uses all available cores to build OpenROAD, Yosys, and the LSOracle Yosys plugin
# To use N threads, use --threads N
# For more options, use --help
$ ./micro2022tutorial/OpenROAD-flow-scripts/build_openroad.sh
```
You will find the tools installed locally in `micro2022tutorial/OpenROAD-flow-scripts/tools/install`.
```
$ tree -L 3 micro2022tutorial/OpenROAD-flow-scripts/tools/install
micro2022tutorial/OpenROAD-flow-scripts/tools/install
├── LSOracle
│   ├── bin
│   │   └── lsoracle
│   └── share
│       └── lsoracle
├── OpenROAD
│   ├── bin
│   │   ├── openroad
│   │   └── sta
│   ├── include
│   │   └── sta
│   └── lib
│       └── libOpenSTA.a
└── yosys
    ├── bin
    │   ├── yosys
    │   ├── yosys-abc
    │   ├── yosys-config
    │   ├── yosys-filterlib
    │   └── yosys-smtbmc
    └── share
        └── yosys
```

Set up your environment:
```
$ source micro2022tutorial/OpenROAD-flow-scripts/setup_env.sh
OPENROAD: /home/user/micro2022tutorial/OpenROAD-flow-scripts/tools/OpenROAD
```

Test that `yosys`, `openroad`, and `klayout` are in your `PATH`:
```
$ command -v yosys
/home/user/micro2022tutorial/OpenROAD-flow-scripts/tools/install/yosys/bin/yosys

$ command -v openroad
/home/user/micro2022tutorial/OpenROAD-flow-scripts/tools/install/openroad/bin/openroad

# Your KLayout installation path may vary
$ command -v klayout
/usr/local/bin/klayout
```

Test that a sample design works:
```
$ cd micro2022tutorial/OpenROAD-flow-scripts/flow
$ make
[INFO][FLOW] Using platform directory ./platforms/nangate45
./util/markDontUse.py -p "TAPCELL_X1 FILLCELL_X1 AOI211_X1 OAI211_X1" -i platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib -o objects/nangate45/gcd/base/lib/NangateOpenCellLibrary_typical.lib
Opening file for replace: platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
Marked 4 cells as dont_use

# ...

[INFO] Writing out GDS/OAS 'results/nangate45/gcd/base/6_1_merged.gds'
Elapsed time: 0:00.93[h:]min:sec. CPU time: user 0.79 sys 0.07 (93%). Peak memory: 229832KB.
cp results/nangate45/gcd/base/6_1_merged.gds results/nangate45/gcd/base/6_final.gds
```

If you see that the GDS file is written out, congratulations! You have successfully installed the flow.

# Demos and Exercises

## Demo 1: Running the flow

Follow along as the presenter explains each step / sub-step of the flow (click to expand each section).

### Synthesis
1. Perform file preprocessing (mainly for yosys)
   ```
   ./util/markDontUse.py 
   Marked 4 cells as dont_use
   Commented 0 lines containing "original_pin"
   Replaced malformed functions 0
   Writing replaced file: objects/nangate45/gcd/base/lib/NangateOpenCellLibrary_typical.lib
   ```
2. Parse input files
   ```
   1. Executing Verilog-2005 frontend: ./designs/src/gcd/gcd.v
   2. Executing Liberty frontend.
   3. Executing Verilog-2005 frontend: ./platforms/nangate45/cells_clkgate.v
   ```
3. Elaborate the design
   ```
   4.1 Executing HIERARCHY pass (managing design hierarchy).
   4.2 Executing AST frontend in derive mose using pre-parses AST for module `\gcd'.
   # ...
   4.3. Executing PROC pass (convert processes to netlists)
   # ...
   ```
4. Optimize the netlist
   ```
   4.4. Executing FLATTEN pass (flatten design).
   4.5. Executing OPT_EXPR pass (perform const folding).
   4.6. Executing OPT_CLEAN pass (remove unused cells and wires).
   4.7. Executing CHECK pass (checking for obvious problems).
   4.8. Executing OPT pass (perform simple optimizations).
   # ...
   ```
5. Map the generic netlist cells to technology specific cells
   ```
   4.22. Executing TECHMAP pass (map to technology primitives).
   # ...
   6. Executing TECHMAP pass (map to technology primitives).
   # ...
   9. Executing ABC pass (technology mapping using ABC).
   ```
6. Generate Verilog netlist
   ```
   17. Executing Verilog backend.
   ```
   
### Floorplanning

### Global Placement
### Detailed Placement
### Clock Tree Synthesis
### Global Routing
### Detailed Routing
### Parasitic Extraction
### Timing Signoff
### GDS Export


## Exercise 1: Debugging a design #1
Find the problem with the provided design.

`exercise1/ibex.mk` provides a faulty design config. Find the error by running `make DESIGN_CONFIG=exercise1/ibex.mk`

Once the error is spotted, open `exercise1/ibex.mk` in a text editor and fix the problematic line.
You can test your solution by cleaning and rerunning the design:
```
make DESIGN_CONFIG=exercise1/ibex.mk clean_all
make DESIGN_CONFIG=exercise1/ibex.mk
```

Compare your solution to the reference solution at `exercise1/solution/ibex.mk`

## Exercise 2: Debugging a design #2
Find the problem with the provided design.

`exercise2/ibex.mk` provides a faulty design config. Find the error by running `make DESIGN_CONFIG=exercise2/ibex.mk`

Once the error is spotted, open `exercise2/ibex.mk` in a text editor and fix the problematic line.
You can test your solution by cleaning and rerunning the design:
```
make DESIGN_CONFIG=exercise2/ibex.mk clean_all
make DESIGN_CONFIG=exercise2/ibex.mk
```

Compare your solution to the reference solution at `exercise2/solution/ibex.mk`

## Demo 2: Analyzing your design using OpenROAD
Follow along as the presenter demonstrates how to observe design metrics.

## Exercise 3: Creating a pareto curve
Adjust the constraints on a design to observe the impact on power, performance, and area (PPA).

## Exercise 4: Scaling a design across technologies
Observe the differences when a design is implemented in different technologies.

## Demo 3: Building Complex Designs
TODO
## Exercise 5: Setting Up a New Design with OpenROAD-flow-Scripts
TODO
## Exercise 6: Using OpenLane for the free Skywater 130nm Open MPW Shuttle
TODO
