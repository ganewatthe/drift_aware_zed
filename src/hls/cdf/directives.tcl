############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_unroll "cdf/HIST_LOOP"
set_directive_unroll "cdf/RESET_LOOP"
set_directive_interface -mode ap_ctrl_none "cdf"
set_directive_interface -mode ap_none "cdf" cumsum_o
set_directive_interface -mode ap_none "cdf" cumsum_vld_o
set_directive_pipeline -II 1 "cdf"
set_directive_array_partition -type complete -dim 1 "cdf" histarraylocal
