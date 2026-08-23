set_db init_lib_search_path ./lib/timing
set_db init_hdl_search_path ./rtl

read_libs {fast_vdd1v0_basicCells_hvt.lib  slow_vdd1v0_basicCells_hvt.lib fast_vdd1v0_basicCells.lib      slow_vdd1v0_basicCells.lib fast_vdd1v0_basicCells_lvt.lib  slow_vdd1v0_basicCells_lvt.lib fast_vdd1v2_basicCells_hvt.lib  slow_vdd1v2_basicCells_hvt.lib fast_vdd1v2_basicCells.lib      slow_vdd1v2_basicCells.lib fast_vdd1v2_basicCells_lvt.lib  slow_vdd1v2_basicCells_lvt.lib }

#set_db hdl_track_filename_row_col true

read_hdl "uart_baud_rate.v uart_tx.v uart_rx.v uart_top_design.v"

elaborate uart_top_design
read_sdc ./constraints.sdc

#set_db lp_insert_clock_gating true
#or
#set_db / .lp_insert_clock_gating true 
#set_db tns_opto true


## Power root attributes
#set_db / .lp_clock_gating_prefix <string>
set_db / .lp_power_analysis_effort high 
#set_db / .lp_power_unit mW 
#set_db / .lp_toggle_rate_unit /ns 
#set_db degin_power_effort high
## The attribute has been set to default value "medium"
## you can try setting it to high to explore MVT QoR for low power optimization
#csh
set_db / .leakage_power_effort medium 


set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium



syn_generic
syn_map
syn_opt

#reports
report_timing > ./reports/report_timing.rpt
report_power  > ./reports/report_power.rpt
report_area   > ./reports/report_area.rpt
report_qor    > ./reports/report_qor.rpt



#Outputs
write_hdl > ./outputs/uart_netlist.v
write_sdc > ./outputs/uart_sdc.sdc

#sdf -> standard delay file
# Generate an SDF (Standard Delay Format) file containing timing delays
# for gate-level simulation. Timing values use nanoseconds.
# -nonegchecks : Excludes negative timing check values
# -recrem split: Writes recovery and removal checks separately
# -edges check_edge: Includes appropriate edge information for timing checks
# -setuphold split: Writes setup and hold checks separately
# Output is redirected to outputs/delays.sd
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > outputs/delays.sdf

#line added
write_do_lec -golden_design rtl -revised_design outputs/uart_netlist.v > rtl_to_final.tcl







