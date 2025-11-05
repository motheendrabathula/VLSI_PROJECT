# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Sun Nov 02 11:16:00 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design dac_1

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_load -pin_load 0.1 [get_ports pwm_out]
set_clock_gating_check -setup 0.0 
set_drive 1.0 [get_ports clk]
set_drive 1.0 [get_ports {digital_value[7]}]
set_drive 1.0 [get_ports {digital_value[6]}]
set_drive 1.0 [get_ports {digital_value[5]}]
set_drive 1.0 [get_ports {digital_value[4]}]
set_drive 1.0 [get_ports {digital_value[3]}]
set_drive 1.0 [get_ports {digital_value[2]}]
set_drive 1.0 [get_ports {digital_value[1]}]
set_drive 1.0 [get_ports {digital_value[0]}]
set_wire_load_mode "enclosed"
