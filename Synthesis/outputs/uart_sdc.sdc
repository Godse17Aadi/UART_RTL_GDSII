# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Sat Aug 22 13:47:18 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design uart_top_design

create_clock -name "clock" -period 50.0 -waveform {0.0 25.0} [get_ports clk]
set_clock_transition 0.05 [get_clocks clock]
set_load -pin_load 0.05 [get_ports tx]
set_load -pin_load 0.05 [get_ports {read_data[7]}]
set_load -pin_load 0.05 [get_ports {read_data[6]}]
set_load -pin_load 0.05 [get_ports {read_data[5]}]
set_load -pin_load 0.05 [get_ports {read_data[4]}]
set_load -pin_load 0.05 [get_ports {read_data[3]}]
set_load -pin_load 0.05 [get_ports {read_data[2]}]
set_load -pin_load 0.05 [get_ports {read_data[1]}]
set_load -pin_load 0.05 [get_ports {read_data[0]}]
set_false_path -from [list \
  [get_ports rst]  \
  [get_ports rx] ]
group_path -weight 1.000000 -name REG2REG -from [list \
  [get_cells {uut_baud_rate/baud_count_reg[0]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[15]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[1]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[2]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[3]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[4]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[5]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[6]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[7]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[8]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[9]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[10]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[11]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[12]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[13]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[14]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[31]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[17]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[18]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[19]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[20]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[21]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[22]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[23]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[24]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[25]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[26]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[27]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[28]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[29]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[30]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[16]}]  \
  [get_cells uut_baud_rate/baud_tick_reg]  \
  [get_cells uut_baud_rate/delayed_en_reg]  \
  [get_cells uut_baud_rate/temp_en_reg]  \
  [get_cells {uut_rx/count_8_reg[2]}]  \
  [get_cells {uut_rx/data_save_reg[7]}]  \
  [get_cells {uut_rx/data_save_reg[6]}]  \
  [get_cells {uut_rx/data_save_reg[0]}]  \
  [get_cells {uut_rx/count_16_reg[3]}]  \
  [get_cells {uut_rx/count_8_reg[1]}]  \
  [get_cells uut_rx/count_8_indication_reg]  \
  [get_cells {uut_rx/data_save_reg[1]}]  \
  [get_cells {uut_rx/data_save_reg[2]}]  \
  [get_cells {uut_rx/data_save_reg[3]}]  \
  [get_cells {uut_rx/data_save_reg[4]}]  \
  [get_cells {uut_rx/data_save_reg[5]}]  \
  [get_cells {uut_rx/count_16_reg[2]}]  \
  [get_cells {uut_rx/count_8_reg[0]}]  \
  [get_cells uut_rx/count_16_indication_reg]  \
  [get_cells {uut_rx/count_16_reg[1]}]  \
  [get_cells {uut_rx/count_16_reg[0]}]  \
  [get_cells {uut_rx/current_state_reg[0]}]  \
  [get_cells {uut_rx/current_state_reg[1]}]  \
  [get_cells {uut_tx/count_8_reg[2]}]  \
  [get_cells {uut_tx/data_save_reg[6]}]  \
  [get_cells {uut_tx/data_save_reg[3]}]  \
  [get_cells {uut_tx/data_save_reg[0]}]  \
  [get_cells {uut_tx/data_save_reg[1]}]  \
  [get_cells {uut_tx/data_save_reg[7]}]  \
  [get_cells {uut_tx/data_save_reg[5]}]  \
  [get_cells {uut_tx/data_save_reg[2]}]  \
  [get_cells {uut_tx/data_save_reg[4]}]  \
  [get_cells {uut_tx/count_16_reg[3]}]  \
  [get_cells {uut_tx/count_8_reg[1]}]  \
  [get_cells {uut_tx/count_16_reg[1]}]  \
  [get_cells {uut_tx/count_16_reg[2]}]  \
  [get_cells uut_tx/count_8_indication_reg]  \
  [get_cells {uut_tx/count_8_reg[0]}]  \
  [get_cells {uut_tx/count_16_reg[0]}]  \
  [get_cells {uut_tx/current_state_reg[0]}]  \
  [get_cells {uut_tx/current_state_reg[1]}]  \
  [get_cells {uut_tx/next_state_reg[0]}]  \
  [get_cells {uut_tx/next_state_reg[1]}]  \
  [get_cells uut_tx/count_16_indication_reg]  \
  [get_cells uut_tx/tx_reg]  \
  [get_cells {read_data_reg[7]}]  \
  [get_cells {read_data_reg[6]}]  \
  [get_cells {read_data_reg[4]}]  \
  [get_cells {read_data_reg[0]}]  \
  [get_cells {baud_division_reg[24]}]  \
  [get_cells {baud_division_reg[8]}]  \
  [get_cells {baud_division_reg[7]}]  \
  [get_cells {baud_division_reg[23]}]  \
  [get_cells {baud_division_reg[6]}]  \
  [get_cells {baud_division_reg[5]}]  \
  [get_cells {baud_division_reg[31]}]  \
  [get_cells {baud_division_reg[22]}]  \
  [get_cells {baud_division_reg[4]}]  \
  [get_cells {baud_division_reg[3]}]  \
  [get_cells {baud_division_reg[21]}]  \
  [get_cells {baud_division_reg[2]}]  \
  [get_cells {baud_division_reg[1]}]  \
  [get_cells {read_data_reg[3]}]  \
  [get_cells {baud_division_reg[30]}]  \
  [get_cells {baud_division_reg[20]}]  \
  [get_cells {baud_division_reg[0]}]  \
  [get_cells {data_out_reg[7]}]  \
  [get_cells {baud_division_reg[19]}]  \
  [get_cells {data_out_reg[6]}]  \
  [get_cells {data_out_reg[0]}]  \
  [get_cells {baud_division_reg[29]}]  \
  [get_cells {baud_division_reg[18]}]  \
  [get_cells {data_out_reg[4]}]  \
  [get_cells {data_out_reg[3]}]  \
  [get_cells {baud_division_reg[17]}]  \
  [get_cells {data_out_reg[2]}]  \
  [get_cells {data_out_reg[1]}]  \
  [get_cells {read_data_reg[5]}]  \
  [get_cells {read_data_reg[2]}]  \
  [get_cells {baud_division_reg[28]}]  \
  [get_cells {baud_division_reg[16]}]  \
  [get_cells {data_out_reg[5]}]  \
  [get_cells enable_reg]  \
  [get_cells {baud_division_reg[15]}]  \
  [get_cells {baud_division_reg[27]}]  \
  [get_cells {baud_division_reg[14]}]  \
  [get_cells {baud_division_reg[13]}]  \
  [get_cells {read_data_reg[1]}]  \
  [get_cells {baud_division_reg[26]}]  \
  [get_cells {baud_division_reg[12]}]  \
  [get_cells {baud_division_reg[11]}]  \
  [get_cells {baud_division_reg[25]}]  \
  [get_cells {baud_division_reg[10]}]  \
  [get_cells {baud_division_reg[9]}]  \
  [get_cells {uut_rx/next_state_reg[0]}]  \
  [get_cells {uut_rx/next_state_reg[1]}]  \
  [get_cells {uut_rx/ext_data_out_reg[6]}]  \
  [get_cells {uut_rx/ext_data_out_reg[4]}]  \
  [get_cells {uut_rx/ext_data_out_reg[0]}]  \
  [get_cells {uut_rx/ext_data_out_reg[5]}]  \
  [get_cells {uut_rx/ext_data_out_reg[2]}]  \
  [get_cells {uut_rx/ext_data_out_reg[3]}]  \
  [get_cells {uut_rx/ext_data_out_reg[7]}]  \
  [get_cells {uut_rx/ext_data_out_reg[1]}] ] -to [list \
  [get_cells {uut_baud_rate/baud_count_reg[0]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[15]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[1]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[2]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[3]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[4]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[5]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[6]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[7]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[8]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[9]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[10]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[11]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[12]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[13]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[14]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[31]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[17]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[18]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[19]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[20]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[21]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[22]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[23]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[24]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[25]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[26]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[27]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[28]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[29]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[30]}]  \
  [get_cells {uut_baud_rate/baud_count_reg[16]}]  \
  [get_cells uut_baud_rate/baud_tick_reg]  \
  [get_cells uut_baud_rate/delayed_en_reg]  \
  [get_cells uut_baud_rate/temp_en_reg]  \
  [get_cells {uut_rx/count_8_reg[2]}]  \
  [get_cells {uut_rx/data_save_reg[7]}]  \
  [get_cells {uut_rx/data_save_reg[6]}]  \
  [get_cells {uut_rx/data_save_reg[0]}]  \
  [get_cells {uut_rx/count_16_reg[3]}]  \
  [get_cells {uut_rx/count_8_reg[1]}]  \
  [get_cells uut_rx/count_8_indication_reg]  \
  [get_cells {uut_rx/data_save_reg[1]}]  \
  [get_cells {uut_rx/data_save_reg[2]}]  \
  [get_cells {uut_rx/data_save_reg[3]}]  \
  [get_cells {uut_rx/data_save_reg[4]}]  \
  [get_cells {uut_rx/data_save_reg[5]}]  \
  [get_cells {uut_rx/count_16_reg[2]}]  \
  [get_cells {uut_rx/count_8_reg[0]}]  \
  [get_cells uut_rx/count_16_indication_reg]  \
  [get_cells {uut_rx/count_16_reg[1]}]  \
  [get_cells {uut_rx/count_16_reg[0]}]  \
  [get_cells {uut_rx/current_state_reg[0]}]  \
  [get_cells {uut_rx/current_state_reg[1]}]  \
  [get_cells {uut_tx/count_8_reg[2]}]  \
  [get_cells {uut_tx/data_save_reg[6]}]  \
  [get_cells {uut_tx/data_save_reg[3]}]  \
  [get_cells {uut_tx/data_save_reg[0]}]  \
  [get_cells {uut_tx/data_save_reg[1]}]  \
  [get_cells {uut_tx/data_save_reg[7]}]  \
  [get_cells {uut_tx/data_save_reg[5]}]  \
  [get_cells {uut_tx/data_save_reg[2]}]  \
  [get_cells {uut_tx/data_save_reg[4]}]  \
  [get_cells {uut_tx/count_16_reg[3]}]  \
  [get_cells {uut_tx/count_8_reg[1]}]  \
  [get_cells {uut_tx/count_16_reg[1]}]  \
  [get_cells {uut_tx/count_16_reg[2]}]  \
  [get_cells uut_tx/count_8_indication_reg]  \
  [get_cells {uut_tx/count_8_reg[0]}]  \
  [get_cells {uut_tx/count_16_reg[0]}]  \
  [get_cells {uut_tx/current_state_reg[0]}]  \
  [get_cells {uut_tx/current_state_reg[1]}]  \
  [get_cells {uut_tx/next_state_reg[0]}]  \
  [get_cells {uut_tx/next_state_reg[1]}]  \
  [get_cells uut_tx/count_16_indication_reg]  \
  [get_cells uut_tx/tx_reg]  \
  [get_cells {read_data_reg[7]}]  \
  [get_cells {read_data_reg[6]}]  \
  [get_cells {read_data_reg[4]}]  \
  [get_cells {read_data_reg[0]}]  \
  [get_cells {baud_division_reg[24]}]  \
  [get_cells {baud_division_reg[8]}]  \
  [get_cells {baud_division_reg[7]}]  \
  [get_cells {baud_division_reg[23]}]  \
  [get_cells {baud_division_reg[6]}]  \
  [get_cells {baud_division_reg[5]}]  \
  [get_cells {baud_division_reg[31]}]  \
  [get_cells {baud_division_reg[22]}]  \
  [get_cells {baud_division_reg[4]}]  \
  [get_cells {baud_division_reg[3]}]  \
  [get_cells {baud_division_reg[21]}]  \
  [get_cells {baud_division_reg[2]}]  \
  [get_cells {baud_division_reg[1]}]  \
  [get_cells {read_data_reg[3]}]  \
  [get_cells {baud_division_reg[30]}]  \
  [get_cells {baud_division_reg[20]}]  \
  [get_cells {baud_division_reg[0]}]  \
  [get_cells {data_out_reg[7]}]  \
  [get_cells {baud_division_reg[19]}]  \
  [get_cells {data_out_reg[6]}]  \
  [get_cells {data_out_reg[0]}]  \
  [get_cells {baud_division_reg[29]}]  \
  [get_cells {baud_division_reg[18]}]  \
  [get_cells {data_out_reg[4]}]  \
  [get_cells {data_out_reg[3]}]  \
  [get_cells {baud_division_reg[17]}]  \
  [get_cells {data_out_reg[2]}]  \
  [get_cells {data_out_reg[1]}]  \
  [get_cells {read_data_reg[5]}]  \
  [get_cells {read_data_reg[2]}]  \
  [get_cells {baud_division_reg[28]}]  \
  [get_cells {baud_division_reg[16]}]  \
  [get_cells {data_out_reg[5]}]  \
  [get_cells enable_reg]  \
  [get_cells {baud_division_reg[15]}]  \
  [get_cells {baud_division_reg[27]}]  \
  [get_cells {baud_division_reg[14]}]  \
  [get_cells {baud_division_reg[13]}]  \
  [get_cells {read_data_reg[1]}]  \
  [get_cells {baud_division_reg[26]}]  \
  [get_cells {baud_division_reg[12]}]  \
  [get_cells {baud_division_reg[11]}]  \
  [get_cells {baud_division_reg[25]}]  \
  [get_cells {baud_division_reg[10]}]  \
  [get_cells {baud_division_reg[9]}]  \
  [get_cells {uut_rx/next_state_reg[0]}]  \
  [get_cells {uut_rx/next_state_reg[1]}]  \
  [get_cells {uut_rx/ext_data_out_reg[6]}]  \
  [get_cells {uut_rx/ext_data_out_reg[4]}]  \
  [get_cells {uut_rx/ext_data_out_reg[0]}]  \
  [get_cells {uut_rx/ext_data_out_reg[5]}]  \
  [get_cells {uut_rx/ext_data_out_reg[2]}]  \
  [get_cells {uut_rx/ext_data_out_reg[3]}]  \
  [get_cells {uut_rx/ext_data_out_reg[7]}]  \
  [get_cells {uut_rx/ext_data_out_reg[1]}] ]
group_path -weight 1.000000 -name INPUTS -through [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports {address[1]}]  \
  [get_ports {address[0]}]  \
  [get_ports {write_data[31]}]  \
  [get_ports {write_data[30]}]  \
  [get_ports {write_data[29]}]  \
  [get_ports {write_data[28]}]  \
  [get_ports {write_data[27]}]  \
  [get_ports {write_data[26]}]  \
  [get_ports {write_data[25]}]  \
  [get_ports {write_data[24]}]  \
  [get_ports {write_data[23]}]  \
  [get_ports {write_data[22]}]  \
  [get_ports {write_data[21]}]  \
  [get_ports {write_data[20]}]  \
  [get_ports {write_data[19]}]  \
  [get_ports {write_data[18]}]  \
  [get_ports {write_data[17]}]  \
  [get_ports {write_data[16]}]  \
  [get_ports {write_data[15]}]  \
  [get_ports {write_data[14]}]  \
  [get_ports {write_data[13]}]  \
  [get_ports {write_data[12]}]  \
  [get_ports {write_data[11]}]  \
  [get_ports {write_data[10]}]  \
  [get_ports {write_data[9]}]  \
  [get_ports {write_data[8]}]  \
  [get_ports {write_data[7]}]  \
  [get_ports {write_data[6]}]  \
  [get_ports {write_data[5]}]  \
  [get_ports {write_data[4]}]  \
  [get_ports {write_data[3]}]  \
  [get_ports {write_data[2]}]  \
  [get_ports {write_data[1]}]  \
  [get_ports {write_data[0]}]  \
  [get_ports we]  \
  [get_ports rx]  \
  [get_ports re] ]
group_path -weight 1.000000 -name OUTPUTS -to [list \
  [get_ports tx]  \
  [get_ports {read_data[7]}]  \
  [get_ports {read_data[6]}]  \
  [get_ports {read_data[5]}]  \
  [get_ports {read_data[4]}]  \
  [get_ports {read_data[3]}]  \
  [get_ports {read_data[2]}]  \
  [get_ports {read_data[1]}]  \
  [get_ports {read_data[0]}] ]
group_path -weight 1.000000 -name COMBO -from [list \
  [get_ports clk]  \
  [get_ports rst]  \
  [get_ports {address[1]}]  \
  [get_ports {address[0]}]  \
  [get_ports {write_data[31]}]  \
  [get_ports {write_data[30]}]  \
  [get_ports {write_data[29]}]  \
  [get_ports {write_data[28]}]  \
  [get_ports {write_data[27]}]  \
  [get_ports {write_data[26]}]  \
  [get_ports {write_data[25]}]  \
  [get_ports {write_data[24]}]  \
  [get_ports {write_data[23]}]  \
  [get_ports {write_data[22]}]  \
  [get_ports {write_data[21]}]  \
  [get_ports {write_data[20]}]  \
  [get_ports {write_data[19]}]  \
  [get_ports {write_data[18]}]  \
  [get_ports {write_data[17]}]  \
  [get_ports {write_data[16]}]  \
  [get_ports {write_data[15]}]  \
  [get_ports {write_data[14]}]  \
  [get_ports {write_data[13]}]  \
  [get_ports {write_data[12]}]  \
  [get_ports {write_data[11]}]  \
  [get_ports {write_data[10]}]  \
  [get_ports {write_data[9]}]  \
  [get_ports {write_data[8]}]  \
  [get_ports {write_data[7]}]  \
  [get_ports {write_data[6]}]  \
  [get_ports {write_data[5]}]  \
  [get_ports {write_data[4]}]  \
  [get_ports {write_data[3]}]  \
  [get_ports {write_data[2]}]  \
  [get_ports {write_data[1]}]  \
  [get_ports {write_data[0]}]  \
  [get_ports we]  \
  [get_ports rx]  \
  [get_ports re] ] -to [list \
  [get_ports tx]  \
  [get_ports {read_data[7]}]  \
  [get_ports {read_data[6]}]  \
  [get_ports {read_data[5]}]  \
  [get_ports {read_data[4]}]  \
  [get_ports {read_data[3]}]  \
  [get_ports {read_data[2]}]  \
  [get_ports {read_data[1]}]  \
  [get_ports {read_data[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {address[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {address[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[31]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[30]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[29]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[28]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[27]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[26]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[25]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[24]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[23]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[22]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[21]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[20]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[19]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[18]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[17]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[16]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[15]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[14]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[13]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[12]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[11]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[10]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[9]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[8]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {write_data[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports we]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports rx]
set_input_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports re]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports tx]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[7]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[6]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[5]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[4]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[3]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[2]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[1]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 0.5 [get_ports {read_data[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {address[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {address[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[31]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[30]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[29]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[28]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[27]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[26]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[25]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[24]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[23]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[22]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[21]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[20]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[19]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[18]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[17]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[16]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[15]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[14]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[13]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[12]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[11]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[10]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[9]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[8]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {write_data[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports we]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports rx]
set_input_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports re]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports tx]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[7]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[6]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[5]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[4]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[3]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[2]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[1]}]
set_output_delay -clock [get_clocks clock] -add_delay -min 0.1 [get_ports {read_data[0]}]
set_max_fanout 30.000 [current_design]
set_max_transition 0.2 [current_design]
set_max_capacitance 80.0 [current_design]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {address[1]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {address[0]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[31]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[30]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[29]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[28]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[27]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[26]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[25]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[24]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[23]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[22]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[21]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[20]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[19]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[18]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[17]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[16]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[15]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[14]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[13]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[12]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[11]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[10]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[9]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[8]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[7]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[6]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[5]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[4]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[3]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[2]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[1]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports {write_data[0]}]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports we]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports rx]
set_driving_cell -lib_cell BUFX2 -library fast_vdd1v0 -pin "Y" [get_ports re]
set_wire_load_mode "enclosed"
set_clock_latency -min 0.05 [get_clocks clock]
set_clock_latency -max 0.25 [get_clocks clock]
set_clock_latency -source -max 0.25 [get_clocks clock]
set_clock_latency -source -min 0.05 [get_clocks clock]
set_clock_uncertainty -setup 0.1 [get_clocks clock]
set_clock_uncertainty -hold 0.1 [get_clocks clock]
