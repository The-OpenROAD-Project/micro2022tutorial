export DESIGN_NAME = alu
export PLATFORM    = nangate45

export VERILOG_FILES = ../../exercise3/$(DESIGN_NAME).v
export SDC_FILE      = ../../exercise3/constraint.sdc
export ABC_AREA      = 1

export CORE_UTILIZATION = 45
export PLACE_DENSITY = 0.50
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 1.0
