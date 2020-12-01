create_clock -name MY_CLK -period 4.30 clk
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
ungroup -all -flatten
set_implementation DW02_mult/csa [find cell *mult*]
compile
report_timing > ./report_timing_fm_CSA.txt
report_area > ./report_area_fm_CSA.txt
report_resources > ./report_resources_fm_CSA.txt



