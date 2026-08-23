#set sdc_version 2.1
reset_design

#VARIABLES
set PERIOD 10.0
#A 100 MHz system clock was selected as a practical and commonly used digital system clock. The UART operates at 9600 baud using a baud-rate generator with 16× oversampling. Therefore, the required oversampling #tick frequency is 9600 × 16 = 153.6 kHz. A 100 MHz clock can be divided by approximately 651 to generate this timing accurately. The 10 ns clock period was therefore used as the synthesis timing constraint, and #the design was verified to meet the required timing constraints
#otherwise the period can go well below 0.7ns 
set INPUT_DELAY  0.5
set OUTPUT_DELAY  0.5
set CLOCK_LATENCY 0.25
set SOURCE_LATENCY 0.25
set UNCERTAINTY 0.1
set MAX_TRANSITION 0.2		
set MIN_CLOCK_LATENCY 0.05
set MIN_SOURCE_LATENCY 0.05
set MIN_IO_DELAY 0.1



## CLOCK BASICS
#Creating Clock
create_clock -name "clock" -period $PERIOD [get_ports clk]

#CLock Latency
set_clock_latency $CLOCK_LATENCY [get_clocks clock]
set_clock_latency -min $MIN_CLOCK_LATENCY [get_clocks clock]

#Source Latency
set_clock_latency -source $SOURCE_LATENCY [get_clocks clock]
set_clock_latency -source -min $MIN_SOURCE_LATENCY [get_clocks clock]

#External clock source
#       │
#       │ 0.25 ns
#       ▼
#  wb_clk_i ──────────── Your design


#Uncertainity 
set_clock_uncertainty -setup $UNCERTAINTY [get_clocks clock]
set_clock_uncertainty -hold $UNCERTAINTY [get_clocks clock]

set_clock_transition 0.05 [get_clocks clock]

#------------------------------------------------

## GROUPING


group_path  -name REG2REG \
            -from [all_registers] \
            -to   [all_registers] \
            -weight 1

group_path  -name INPUTS\
            -through [all_inputs]\
            -weight 1

group_path  -name OUTPUTS\
            -to [all_outputs]\
            -weight 1

group_path  -name COMBO\
            -from [all_inputs]\
            -to [all_outputs]\
            -weight 1
#Do not perform normal timing analysis on paths starting from these reset ports.

set_false_path -from [get_ports rst]
set_false_path -from [get_ports rx]

# rx is an asynchronous serial input -- excluded from synchronous timing

#---------------------------

## IN/OUT
set INPUTPORTS  [remove_from_collection [all_inputs] [list [get_ports clk] [get_ports rst]]]
set OUTPUTPORTS [all_outputs]

#External input data can arrive up to 0.5 ns after the clock reference edge  
set_input_delay -clock "clock" -max $INPUT_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "clock" -min $MIN_IO_DELAY $INPUTPORTS 
set_output_delay -clock "clock" -min $MIN_IO_DELAY $OUTPUTPORTS

set_driving_cell -lib_cell BUFX2 $INPUTPORTS
set_load 0.05 $OUTPUTPORTS

## DRC
set_max_transition $MAX_TRANSITION [current_design]

set_max_fanout 30 [current_design]

set_max_capacitance 80 [current_design]



