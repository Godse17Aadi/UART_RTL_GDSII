#read_db DBS/init.dat

set_db design_process_node 45

#Enables On-Chip Variation (OCV) analysis.
#In reality, different cells and paths on the same chip can experience slightly different delays due to process, voltage, and temperature variations. OCV accounts for these variations during timing analysis.
set_db timing_analysis_type ocv
#Enables Common Path Pessimism Removal (CPPR) for both setup and hold analysis.
set_db timing_analysis_cppr both

set_db place_global_place_io_pins false
#Don't perform IO pin placement during global placement.Global placement focuses on placing the standard cells.
set_db opt_useful_skew true
#Allows Innovus to use useful clock skew during optimization.
#Instead of forcing every clock to arrive at exactly the same time, Innovus can intentionally adjust clock arrival times to help timing.

set_db opt_fix_fanout_load true


place_opt_design


get_db base_cells TIE* 
## Specify which cells to use for tie-off insertion
set_db add_tieoffs_cells {TIELO TIEHI}

# Temporarily allow tie cells to be used
set_db [get_db base_cells TIE*] .dont_use false
# Insert tie-high and tie-low cells
add_tieoffs
# Prevent further automatic use of tie cells
##NOTE: Tie-high and tie-low cells are used to provide constant logic values safely in a physical chip.
set_db [get_db base_cells TIE*] .dont_use true

write_db DBS/place.dat

report_timing

set_db timing_analysis_check_type hold

report_timing -check_type hold



