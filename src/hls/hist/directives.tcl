############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type complete -dim 1 "hist" histarraylocal
set_directive_unroll "hist/HIST_LOOP"
set_directive_interface -mode ap_ctrl_none "hist"
set_directive_interface -mode ap_none "hist" histarray_vld_o
set_directive_interface -mode ap_none "hist" histarray_o
