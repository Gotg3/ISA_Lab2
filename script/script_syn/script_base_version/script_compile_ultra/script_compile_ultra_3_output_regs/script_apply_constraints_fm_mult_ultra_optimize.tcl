create_clock -name MY_CLK -period 1.57 clk
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
ungroup -all -flatten
compile_ultra
report_timing > ./report_timing_fm_mult_3_added_regs_ultra_optimize.txt
report_area > ./report_area_fm_mult_3_added_regs_ultra_optimize.txt
report_resources > ./report_resources_fm_mult_3_added_regs_ultra_optimize.txt



