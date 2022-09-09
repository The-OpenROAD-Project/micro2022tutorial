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

# Exercises

## Exercise 1: Running an RTL design through OpenROAD-flow-Scripts
TODO
## Exercise 2: Running an RTL design through OpenROAD-flow-Scripts
TODO
## Exercise 2: Analyzing your design using OpenROAD
TODO
## Exercise 3: Building Complex Designs
TODO
## Exercise 4: Setting Up a New Design with OpenROAD-flow-Scripts
TODO
## Exercise 5: Using OpenLane for the free Skywater 130nm Open MPW Shuttle
TODO
