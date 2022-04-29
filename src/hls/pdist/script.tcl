############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset pdist
set_top pdist
add_files pdist/pdist.h
add_files pdist/pdist.cpp
add_files -tb pdist/pdist_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution -reset "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 8 -name default
config_rtl  -encoding onehot -reset all  -reset_level low  -vivado_impl_strategy default -vivado_phys_opt place -vivado_synth_design_args {-directive sdx_optimization_effort_high} -vivado_synth_strategy default
source "./pdist/directives.tcl"
# csim_design -clean
csynth_design
# cosim_design -setup
export_design -flow syn -rtl verilog -format sysgen
exit
