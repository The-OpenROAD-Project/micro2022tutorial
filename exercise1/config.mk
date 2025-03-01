export DESIGN_NICKNAME = dynamic_node
export DESIGN_NAME = dynamic_node_top_wrap
export PLATFORM    = nangate45

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/dynamic_node.pickle.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# One or more of the below lines are causing a problem!
export CORE_UTILIZATION = 99
export PLACE_DENSITY = 0.99
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 5

