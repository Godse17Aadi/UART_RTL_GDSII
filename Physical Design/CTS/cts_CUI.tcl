#read_db DBS/place.dat


set_db route_design_detail_use_multi_cut_via_effort high

create_route_rule -width {Metal1 0.12 Metal2 0.14 Metal3 0.14 Metal4 0.14 Metal5 0.14 Metal6 0.14 Metal7 0.14 Metal8 0.14  } \
                -spacing {Metal1 0.12 Metal2 0.14 Metal3 0.14 Metal4 0.14 Metal5 0.14 Metal6 0.14 Metal7 0.14 Metal8 0.14  } -name 2w2s

create_route_type -name clkroute -route_rule 2w2s -bottom_preferred_layer Metal5 -top_preferred_layer Metal6 -shield_net VSS

set_db cts_route_type_top clkroute
set_db cts_route_type_trunk clkroute
set_db cts_route_type_leaf clkroute
#Clock source
#     │
#     ▼
#TOP
#     │
#     ▼
#TRUNK
#   ┌─┴─┐
#   ▼   ▼
# LEAF LEAF
#   │     │
#  FF    FF



set_db route_design_with_litho_driven true
#Check the lithography-driven routing setting


set_db opt_useful_skew_ccopt medium
#Allows CCOpt to use medium effort for useful skew optimization
set_db cts_buffer_cells "CLKBUFX20LVT CLKBUFX20 CLKBUFX16 CLKBUFX12 CLKBUFX8"
set_db cts_inverter_cells "CLKINVX20LVT CLKINVX20 CLKINVX16 CLKINVX12 CLKINVX8"
#low-Vt cells switch faster (lower intrinsic delay, often better slew) at the cost of leakage power.LVT cells are commonly reserved for clock trees specifically because of this speed advantage — it's a legitimate and common choice as long as your power budget allows it.
set_db cts_use_inverters true

set_db cts_clock_gating_cells TLATNTSCA*

create_clock_tree_spec -out_file ccopt_cui.spec

source  ccopt_cui.spec

ccopt_design
#report_messages -errors
#check_cts_config

write_db DBS/cts.dat


extract_rc
write_parasitics -spef_file uart.spef -rc_corner rccorners
#route_design if
time_design -post_cts
opt_design -post_cts #fixes violations, basically optimises design
opt_design -post_cts -hold

report_clock_trees -out_file ./rclk_full.rpt
report_skew_groups -out_file ./rskg_full.rpt

report_timing -late
report_timing -early

#set_db opt_fix_hold_allow_setup_tns_degradation false
#set_db opt_fix_hold_ignore_path_groups default
opt_design -post_cts -hold -report_dir RPT -report_prefix postcts_hold

write_db DBS/postcts_hold.dat

################################################################################
#                    CLOCK TREE SYNTHESIS (CTS) FLOW
################################################################################
#
#   START: PLACEMENT DATABASE
#     |
#     v
#   Read Placement DB
#     |
#     |-- read_db DBS/place.dat
#     |
#     v
#   RC Extraction
#     |
#     |-- extract_rc
#     |-- (Optional pre-route parasitic extraction)
#     |
#     v
#   Define Clock Routing Rules
#     |
#     |-- Set wire width and spacing
#     |-- Define routing layers
#     |-- Define clock shielding
#     |
#     v
#   Configure CTS
#     |
#     |-- Set useful skew effort
#     |-- Define clock buffer cells
#     |-- Define clock inverter cells
#     |-- Define clock gating cells
#     |
#     v
#   Create Clock Tree Specification
#     |
#     |-- create_clock_tree_spec
#     |-- source ccopt_cui.spec
#     |
#     v
#   RUN CTS
#     |
#     |-- ccopt_design
#     |
#     v
#   Save CTS Database
#     |
#     |-- write_db DBS/cts.dat
#     |
#     v
#   Post-CTS Timing Analysis
#     |
#     |-- time_design -post_cts
#     |-- Check setup timing
#     |-- Check hold timing
#     |
#     v
#   Post-CTS Optimization
#     |
#     |-- opt_design -post_cts          -> Setup optimization
#     |-- opt_design -post_cts -hold    -> Hold optimization
#     |
#     v
#   Clock Tree Analysis
#     |
#     |-- report_clock_trees
#     |-- report_skew_groups
#     |
#     v
#   Final Post-CTS Timing Check
#     |
#     |-- report_timing -late           -> Setup check
#     |-- report_timing -early          -> Hold check
#     |
#     v
#   Save Final Post-CTS Database
#     |
#     |-- write_db DBS/postcts_hold.dat
#     |
#     v
#   NEXT STAGE: ROUTING
#
################################################################################
