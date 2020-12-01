analyze -f vhdl -lib work ../src/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib work ../src/fpround_fpround.vhd
analyze -f vhdl -lib work ../src/unpackfp_unpackfp.vhd
analyze -f vhdl -lib work ../src/packfp_packfp.vhd
analyze -f vhdl -lib work ../src/fpmul_single_cycle.vhd
analyze -f vhdl -lib work ../src/fpmul_stage1_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_stage2_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_stage3_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_stage4_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_pipeline_inregs.vhd
elaborate fpmul_pipeline_inreg -arch pipeline -lib WORK > ./elaborate_PPARCH.txt

