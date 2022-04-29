############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset hist
set_top hist
add_files hist/hist.h
add_files hist/hist.cpp
add_files -tb hist/hist_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution -reset "solution1"
set_part {xc7z020clg484-1}
create_clock -period 8 -name default
config_rtl  -encoding onehot -reset all  -reset_level low  -vivado_impl_strategy default -vivado_phys_opt place -vivado_synth_design_args {-directive sdx_optimization_effort_high} -vivado_synth_strategy default
source "./hist/directives.tcl"
# csim_design -clean
csynth_design
# cosim_design -setup
export_design -flow syn -rtl verilog -format sysgen
exit
