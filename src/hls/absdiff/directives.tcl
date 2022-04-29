############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_partition -type complete -dim 1 "absdiff" cumsumref_local
set_directive_interface -mode ap_ctrl_none "absdiff"
set_directive_interface -mode ap_none "absdiff" absdiff_vld_o
set_directive_interface -mode ap_none "absdiff" absdiff_o
set_directive_pipeline "absdiff"
