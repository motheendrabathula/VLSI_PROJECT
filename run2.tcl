# =====================================================================
# Cadence Genus Synthesis Script for PWM DAC Design
# Target Technology : 90 nm Digital CMOS
# Author            : Bathula Venkata Naga Motheendranadh Reddy
# Date              : 2025-11-02
# =====================================================================

# ------------------------------------------------------------
# Library Setup
# ------------------------------------------------------------
# Update this path and file name according to your 90nm PDK installation
set_db init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib/}

# Specify the timing library (example: slow.lib, typical.lib, fast.lib)
set_db library slow.lib

# ------------------------------------------------------------
# Read RTL Sources
# ------------------------------------------------------------
read_hdl {./dac_1.v}

# ------------------------------------------------------------
# Elaborate and Set Current Design
# ------------------------------------------------------------
elaborate dac_1
current_design dac_1

# ------------------------------------------------------------
# Apply Timing Constraints
# ------------------------------------------------------------
# If you have an SDC file, read it here; otherwise, set default clock constraints
if {[file exists "./constraint_input.sdc"]} {
    read_sdc ./constraint_input.sdc
} else {
    create_clock -name CLK -period 10 [get_ports clk]
    set_input_delay 1 -clock CLK [all_inputs]
    set_output_delay 1 -clock CLK [all_outputs]
}

# ------------------------------------------------------------
# Set Synthesis Effort Levels
# ------------------------------------------------------------
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

# ------------------------------------------------------------
# Run Full Synthesis Flow
# ------------------------------------------------------------
syn_generic
syn_map
syn_opt

# ------------------------------------------------------------
# Write Synthesized Netlist and Constraint Outputs
# ------------------------------------------------------------
write_hdl > pwm_dac_90nm_netlist.v
write_sdc > pwm_dac_90nm_output.sdc

# ------------------------------------------------------------
# Generate Reports
# ------------------------------------------------------------
report timing > pwm_dac_90nm_timing.rpt
report power  > pwm_dac_90nm_power.rpt
report area   > pwm_dac_90nm_area.rpt
report gates  > pwm_dac_90nm_gates.rpt

# ------------------------------------------------------------
# Optional GUI
# ------------------------------------------------------------
# gui_show  ;# Uncomment if you want to open GUI after synthesis

# =====================================================================
# End of Script
# =====================================================================
