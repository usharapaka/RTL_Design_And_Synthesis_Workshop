set ::env(DESIGN_NAME) battery_safety_controller
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) clk
set ::env(CLOCK_PERIOD) "20"
set ::env(CLOCK_NET) clk

set ::env(FP_SIZING) relative
set ::env(FP_CORE_UTIL) 30
set ::env(PL_TARGET_DENSITY) 0.40

set ::env(SYNTH_STRATEGY) "AREA 0"
