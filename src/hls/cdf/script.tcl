############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset cdf
set_top cdf
add_files cdf/cdf.cpp
add_files cdf/cdf.h
add_files -tb cdf/cdf_float.cpp
add_files -tb cdf/cdf_float.h
add_files -tb cdf/cdf_tb.cpp
open_solution -reset "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 8 -name default
config_rtl  -encoding onehot -reset all  -reset_level low  -vivado_impl_strategy default -vivado_phys_opt place -vivado_synth_design_args {-directive sdx_optimization_effort_high} -vivado_synth_strategy default
source "cdf/directives.tcl"
# csim_design -clean
csynth_design
# cosim_design -setup
export_design -flow syn -rtl verilog -format sysgen
exit
