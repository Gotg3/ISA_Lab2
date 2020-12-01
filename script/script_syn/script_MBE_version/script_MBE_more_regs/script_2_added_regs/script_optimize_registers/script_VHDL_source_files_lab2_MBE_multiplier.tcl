analyze -f vhdl -lib work ../src/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib work ../src/fpround_fpround.vhd
analyze -f vhdl -lib work ../src/unpackfp_unpackfp.vhd
analyze -f vhdl -lib work ../src/packfp_packfp.vhd
analyze -f vhdl -lib work ../src/dadda_package.vhd
analyze -f vhdl -lib work ../src/BEU.vhd
analyze -f vhdl -lib work ../src/fa.vhd
analyze -f vhdl -lib work ../src/ha.vhd
analyze -f vhdl -lib work ../src/dadda.vhd
analyze -f vhdl -lib work ../src/MBE_MULTIPLIER.vhd
analyze -f vhdl -lib work ../src/fpmul_stage1_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_stage2_struct_2_added_regs_MBE.vhd
analyze -f vhdl -lib work ../src/fpmul_stage3_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_stage4_struct.vhd
analyze -f vhdl -lib work ../src/fpmul_pipeline_inregs.vhd
elaborate FPmul -arch pipeline -lib WORK > ./elaborate_MBE_multiplier_2_regs_optimize_registers.txt

