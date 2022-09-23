export DESIGN_NAME = alu
export PLATFORM    = nangate45

export VERILOG_FILES = ../../exercise2/$(DESIGN_NAME).v
export SDC_FILE      = ../../exercise2/constraint.sdc
export ABC_AREA      = 1

# Core utilization cannot be higher than placement density
export CORE_UTILIZATION = 55
export PLACE_DENSITY = 0.60
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 1.0
