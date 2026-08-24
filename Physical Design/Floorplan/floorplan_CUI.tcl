create_floorplan -site CoreSite -core_density_size 1 0.65 8.0 8 8.0 8

add_rings -nets {VDD VSS} \
-type core_rings \
-follow core \
-layer {top Metal11 bottom Metal11 left Metal10 right Metal10} \
-width {top 1.8 bottom 1.8 left 1.8 right 1.8} \
-spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} \
-offset {top 0.5 bottom 0.5 left 0.5 right 0.5}


add_stripes -nets {VDD VSS} \
-layer Metal10 \
-direction vertical \
-width 1.8 \
-spacing 0.5 \
-set_to_set_distance 18

connect_global_net VDD -type pg_pin -pin VDD -inst *
# Connects the VDD power pin of all instances to the global VDD net.
connect_global_net VSS -type pg_pin -pin VSS -inst *
# Connects the VSS ground pin of all instances to the global VSS net.
connect_global_net VDD -type tie_hi 
# Connects all tie-high (logic 1) cells to the global VDD net.
connect_global_net VSS -type tie_lo 
# Connects all tie-low (logic 0) cells to the global VSS net.
connect_global_net VDD -type tie_hi -pin VDD -inst *
# Connects the VDD power pins of all tie-high cells to the global VDD net.
connect_global_net VSS -type tie_lo -pin VSS -inst *
# Connects the VSS power pins of all tie-low cells to the global VSS net.

set_db route_special_via_connect_to_shape { stripe }
#This tells Innovus what shape route_special is allowed/preferred to connect to using vias.When creating special-route via connections, connect to power stripes.Allows special routing to connect vias to power #stripes.

route_special -connect {pad_pin core_pin} -layer_change_range { Metal1(1) Metal11(11) } -block_pin_target {nearest_target} -pad_pin_port_connect {all_port one_geom} -pad_pin_target {nearest_target} -core_pin_target {first_after_row_end} -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }

check_drc

write_db DBS/floorplan.dat





