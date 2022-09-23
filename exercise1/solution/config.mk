export DESIGN_NICKNAME = dynamic_node
export DESIGN_NAME = dynamic_node_top_wrap
export PLATFORM    = nangate45

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/dynamic_node.pickle.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# The utilization and place density were too high. After buffering for timing,
# the utilization was over 100%. This causes detailed placement failures.
# Adjusting the utilization / place density lower (but not low enough) causes
# other problems, such as global routing failure (design is too congested)
# A value of 60% resolves the issues.
export CORE_UTILIZATION = 60
export PLACE_DENSITY = 0.60
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 5

