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

`exercise1/config.mk` provides a faulty design config for the design `dynamic_node` (mesh router node). Find the error by running:
```
$ make DESIGN_CONFIG=exercise1/config.mk
```

Once the error is spotted, open `exercise1/config.mk` in a text editor and fix the problematic line(s).
You can test your solution by cleaning and rerunning the design:
```
# Save time by only cleaning the floorplan step to avoid rerunning synthesis
make DESIGN_CONFIG=exercise1/config.mk clean_floorplan
make DESIGN_CONFIG=exercise1/config.mk
```

Compare your solution to the reference solution at `exercise1/solution/config.mk`.

## Exercise 2: Debugging a design #2
Find the problem with the provided design.

`exercise2/config.mk` provides a faulty design config. Find the error by running:
```
make DESIGN_CONFIG=exercise2/config.mk
```

Once the error is spotted, open `exercise2/config.mk` in a text editor and fix the problematic line.
You can test your solution by cleaning and rerunning the design:
```
# Save time by only cleaning the floorplan step to avoid rerunning synthesis
make DESIGN_CONFIG=exercise2/ibex.mk clean_all
make DESIGN_CONFIG=exercise2/ibex.mk
```

Compare your solution to the reference solution at `exercise2/solution/config.mk`



## Demo 2: Analyzing your design using OpenROAD
Follow along as the presenter demonstrates how to observe design metrics.

This demo will look at the metrics reported for `nangate45/gcd`. If you haven't already, run the
design by running `make`.

Once complete, observe the final report by navigating to `logs/nangate45/alu/base/6_report.json`
for a simple JSON-based report or `logs/nangate45/alu/base/6_report.log` for a textual report.

### Modeling Power
To observe the modeled power, look at `finish__power__total` or `finish report_power`. Note that
OpenROAD models power using default activity factors on inputs and propagates these activity factors
through the design. This method provides a solid first-order approximation of power and is useful
for design space exploration. You can increase the accuracy of the model by applying accurate
activity factors on the inputs (see OpenSTA documentation). Static activity-based power modeling
(SAIF) and vector-based (VPD) power modeling are even more accurate methods, however they are not
currently supported in OpenROAD.

OpenROAD power report:
```
==========================================================================
finish report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             4.49e-04   6.01e-05   3.13e-06   5.12e-04  38.6%
Combinational          4.08e-04   3.96e-04   9.84e-06   8.14e-04  61.4%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  8.57e-04   4.56e-04   1.30e-05   1.33e-03 100.0%
                          64.7%      34.4%       1.0%
```
Total power is the most important metric, however you can read more about the other components
[here](https://blogs.cuit.columbia.edu/zp2130/modeling_power_terminology). The power report is
broken down by group, where `Sequential` represents flip-flops, `Combinational` represents logic
gates, `Macro` represents macros such as SRAM, and `Pad` represents I/O cells (if any).

### Calculating Max Frequency
To determine maximum frequency, look at `finish__timing__setup__ws` or `finish report_worst_slack`
value. "Slack" is the difference between the constraint (0.46ns) and the actual signal propagation time.
Positive slack means the constraint is met ("there is extra slack"). Negative slack means the
constraint is violated.

```
==========================================================================
finish report_worst_slack
--------------------------------------------------------------------------
worst slack -0.08
```

Using the slack, the frequency is calculated as:
$$\mathrm{Frequency_max} = \frac{1}{\mathrm{constraint} - \mathrm{slack}}$$
Be mindful of the sign and units of the slack. Greater slack should mean greater frequency.
Be sure that you also calculate frequency using *setup* slack not *hold* slack.

In this case, the max frequency is:
$$\mathrm{Frequency_max} = \frac{1}{\mathrm{constraint} - \mathrm{slack}} = \frac{1}{0.46\mathrm{ns} - (-0.08\mathrm{ns})} \approx 1.85 \mathrm{GHz} $$

### Measuring Area
To measure the design area, you must be aware of the different types of reported area.
1. Synthesized area
2. Place-and-route area
3. Core area / die area

#### Synthesized Area
Synthesized area is obtained after synthesis and is a good first-order model for design space exploration.
You can find the design area in `logs/nangate45/gcd/base/synth_stat.txt`. Units are $\mathrm{\mu m}^2$.

```
Chip area for module '\gcd': 519.764000
```

#### Place-and-route area
Place-and-route area is the area obtained after cell placement and routing. If reporting this number, it
is implied that the design does not have any violations which make the chip unmanufacturable (e.g.
routing or hold time violations). You can find the area from `finish__design__instance__area` or
`finish report_design_area`.

```
==========================================================================
finish report_design_area
--------------------------------------------------------------------------
Design area 581 u^2 24% utilization.
```

#### Core area / die area
Core / Die areas are the most accurate numbers, as they specify the exact area of silicon that will be
used for fabrication. However, these numbers are not often reported for computer architecture works.
Core area is the area of silicon which cells can occupy. It can effectively be calculated as:
$$\mathrm{Area_{core}} = \frac{\mathrm{Area_design}}{\mathrm{utilization}}$$

Die area includes all silicon area needed to fabricate the chip, including any I/O and untilized space.

In the case of `nangate45/gcd`, the easiest location to find this information is from the design config,
which specifies the die area as a set of $(x_1, y_1, x_2, y_2)$ coordinates:

[`flow/designs/nangate45/gcd/config.mk`](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/96a7fc08e8404bec49f9a874589a5d95638707ee/flow/designs/nangate45/gcd/config.mk):
```
export DIE_AREA    = 0 0 70.11 70
export CORE_AREA   = 10.07 11.2 60.04 60.2
```
yielding a die area of:
$$\mathrm{Area_{die}} = (70.11 \mathrm{\mu m} - 0 \mathrm{\mu m})\times(70 \mathrm{\mu m} - 0 \mathrm{\mu m}) = 4907.7 \mathrm{\mu m}^2$$

and core area of:
$$\mathrm{Area_{core}} = (60.04 \mathrm{\mu m} - 10.07 \mathrm{\mu m})\times(60.2 \mathrm{\mu m} - 11.2 \mathrm{\mu m}) = 2448.53 \mathrm{\mu m}^2$$

which can also be obtained from the previous formula:
$$\mathrm{Area_{core}} = \frac{\mathrm{Area_design}}{\mathrm{utilization}} = \frac{581 \mathrm{\mu m}^2}{0.24} \approx 2420.83 \mathrm{\mu m}^2$$

## Exercise 3: Creating a Pareto curve
Adjust the constraints on a design to observe the impact on power, performance, and area (PPA).

`exercise3/` provides a simple integer arithmetic logic unit (ALU). The default bitwidth is 12
and the default clock constraint is 5ns (200 MHz). These parameters allow for RTL-to-GDS in
under 1 minute. Run the design with:
```
make DESIGN_CONFIG=exercise3/config.mk
```

Once complete, observe the final report at `logs/nangate45/alu/base/6_report.json` or
`logs/nangate45/alu/base/6_report.log`.

Record the power, frequency, and area. Then, open the constraint file with your favorite editor
and adjust the clock period to 4ns.

Clean the design and rerun using the new constraint:
```
make DESIGN_CONFIG=../exercise3/config.mk clean_all
make DESIGN_CONFIG=../exercise3/config.mk
```

Record the power, frequency, and area, then repeat for 3ns and 2ns.

Once complete, you can plot this data using your favorite software (Google Sheets, Microsoft
Excel, matplotlib, etc.). Use frequency as the independent variable. Confirm that your data
matches the reference data at `exercise3/solution/data.csv`

## Exercise 4: Scaling a design across technologies
Observe the differences when a design is implemented in different technologies.

OpenROAD-flow-scripts provides 3 open-source PDKs to implement designs in: SkyWater 130nm,
Nangate 45nm, and ASAP 7nm. RTL is easily portable across technologies if it does not contain
technology-specific cells (such as I/O, SRAM, clock-gate cells, etc.).

The `exercise4/` directory contains the same ALU design from exercise 3. However, this time you
will change the config to alter the target technology. Uncomment one of lines in the config to
set the target technology, then run the design using
```
make DESIGN_CONFIG=../exercise4/config.mk
```
Record the power, frequency, and area for each technology (sky130, nangate45, and asap7).
You can again graph the data using your favorite graphing software, and also compare your data
to the reference data at `exercise4/solution/data.csv`

## Demo 3: Building Complex Designs
Follow along as the presenter explains how to incorporate macros into your design.

For designs to scale to larger sizes, additional layers of abstraction are required. **Macros**
are special cells which are not logic gates and aren't automatically generated from synthesis.
Macros are often much larger than standard cells and therefore require special handling. Macros
are often used for several reasons:

1. Using SRAM or register files for large memories
2. Encapsulating a module which is instantiated multiple times
3. I/O pad cells for off-chip power and communication
4. Fiducial cells required by the manufacturer for fabrication
5. Intellectual property (IP) provided by a third-party vendor
6. And more

### How can I generate macros?
* [OpenRAM](https://github.com/VLSIDA/OpenRAM) is an open-source SRAM generator
  * Requires bitcells and sense amplifiers; creates implementations suitable for fabrication
* [bsg_fakeram](https://github.com/bespoke-silicon-group/bsg_fakeram) is a blackbox SRAM generator
  * Creates a blackbox implementation which is useful for modeling; cannot be used for fabrication
* Generate a block using OpenROAD 
  * Use OpenROAD to create a hardened macro, then instantiate the block in a parent module

`nangate45/tinyRocket` is a CPU core which incorporates SRAM macros generated by bsg_fakeram.
While OpenROAD-flow-scipts already includes platform files necessary for standard cells, designers
must specify macro files in the design config.

[`flow/designs/nangate45/tinyRocket/config.mk`](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/96a7fc08e8404bec49f9a874589a5d95638707ee/flow/designs/nangate45/tinyRocket/config.mk):
```
export ADDITIONAL_LEFS = $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/*.lef))
export ADDITIONAL_LIBS = $(sort $(wildcard ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/*.lib))
```
The config file uses the variable `ADDITIONAL_LEFS` and `ADDITIONAL_LIBS` to reference the abstract
physical views (`.lef`) and timing models (`.lib`) for the macros. The wildcard commands above are
shorthand for:
```
export ADDITIONAL_LEFS = ./designs/nangate45/tinyRocket/fakeram45_1024x32.lef ./designs/nangate45/tinyRocket/fakeram45_64x32.lef
export ADDITIONAL_LIBS = ./designs/nangate45/tinyRocket/fakeram45_1024x32.lib ./designs/nangate45/tinyRocket/fakeram45_64x32.lib
```
Notice however that these RAMs are generated by bsg_fakeram and do not have physical implementation
files (`.gds`). Normally, this would create an error during the GDS merge step, however the [platform
configuration for nangate45](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/96a7fc08e8404bec49f9a874589a5d95638707ee/flow/platforms/nangate45/config.mk#L101)
ignores this by setting `GDS_ALLOW_EMPTY` on these instances:
```
# Allow empty GDS cell
export GDS_ALLOW_EMPTY = fakeram.*
```
If the macro does have a physical implementation (`.gds`), it can be added to the design config with:
```
export ADDITIONAL_GDS = /path/to/macro1.gds /path/to/macro2.gds ...
```

Now, build tinyRocket with:
```
# Build takes several minutes
make DESIGN_CONFIG=./designs/nangate45/tinyRocket/config.mk
```

Once done, you can see that new steps in the flow were used:
1. `2_3_tdms_place.log`: timing-driven mixed-size place
2. `2_4_mplace.log`: macro place

`tdms_place` performs a rough initial placement of both macros and standard cells. This is used as a
seed for the macro placer. `2_4_mplace.log` performs macro placement. The placer tries to ensure that
macros block as little design area as possible while still allowing connectivity to the macro.

Common problems when introducing macros:
* "Channels" between macros need to be wide enough to not overcongest the router
* Slight changes to the design area can cause large changes in the macro placements
* Macros can block regions of the core area and make standard cell placement difficult
* Malformed macros can cause difficult-to-diagnose design problems

## Exercise 5: Setting Up a New Design with OpenROAD-flow-Scripts
TODO
## Exercise 6: Using OpenLane for the free Skywater 130nm Open MPW Shuttle
TODO
