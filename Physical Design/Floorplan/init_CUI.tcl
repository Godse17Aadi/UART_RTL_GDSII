#Initializing the design

set_db init_read_netlist_files ./uart_netlist.v
set_db init_lef_files {./lib/lef/gsclib045_hvt_macro.lef ./lib/lef/gsclib045_macro.lef ./lib/lef/gsclib045_tech.lef ./lib/lef/gsclib045_lvt_macro.lef}
set_db init_power_nets VDD
set_db init_ground_nets VSS
set_db init_mmmc_files mmmc_new.tcl


read_mmmc mmmc_new.tcl
read_physical -lef {./lib/lef/gsclib045_tech.lef ./lib/lef/gsclib045_hvt_macro.lef ./lib/lef/gsclib045_macro.lef ./lib/lef/gsclib045_lvt_macro.lef}
read_netlist ./uart_netlist.v -top uart_top_design
init_design


