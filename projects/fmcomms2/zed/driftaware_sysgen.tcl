# start_gui
open_project fmcomms2_zed.xpr

update_compile_order -fileset sources_1
set_property  ip_repo_paths  {../../../library ../../../src/sysgen/netlist/ip} [current_project]
update_ip_catalog

open_bd_design {./fmcomms2_zed.srcs/sources_1/bd/system/system.bd}
 
startgroup
create_bd_cell -type ip -vlnv User_Company:SysGen:driftdetect:1.0 driftdetect_0
endgroup
set_property location {5.5 2057 733} [get_bd_cells driftdetect_0]

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0
endgroup 
set_property -dict [list CONFIG.DIN_FROM {31} CONFIG.DIN_WIDTH {64} CONFIG.DIN_TO {0} CONFIG.DOUT_WIDTH {32}] [get_bd_cells xlslice_0]


delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_0]
delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_0]
delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_data_1]
delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_1]
delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_2]
delete_bd_objs [get_bd_nets util_ad9361_adc_fifo_dout_valid_3]
delete_bd_objs [get_bd_nets axi_ad9361_dac_dma_fifo_rd_underflow]
delete_bd_objs [get_bd_nets axi_ad9361_dac_dma_fifo_rd_dout]
delete_bd_objs [get_bd_nets util_ad9361_dac_upack_dac_valid]

connect_bd_net [get_bd_pins util_ad9361_adc_fifo/dout_data_0] [get_bd_pins driftdetect_0/idata_i]
connect_bd_net [get_bd_pins util_ad9361_adc_fifo/dout_valid_0] [get_bd_pins driftdetect_0/ivalid_i]
connect_bd_net [get_bd_pins util_ad9361_adc_fifo/dout_data_1] [get_bd_pins driftdetect_0/qdata_i]
connect_bd_net [get_bd_pins util_ad9361_adc_fifo/dout_valid_1] [get_bd_pins driftdetect_0/qvalid_i]
connect_bd_net [get_bd_pins driftdetect_0/data_0_o] [get_bd_pins util_ad9361_adc_pack/adc_data_0]
connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_data_1] [get_bd_pins driftdetect_0/data_1_o]

connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_0] [get_bd_pins driftdetect_0/data_valid_o]
connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_1] [get_bd_pins driftdetect_0/data_valid_o]
connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_2] [get_bd_pins driftdetect_0/data_valid_o]
connect_bd_net [get_bd_pins util_ad9361_adc_pack/adc_valid_3] [get_bd_pins driftdetect_0/data_valid_o]

connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_en] [get_bd_pins driftdetect_0/fifo_rd_o]
connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_valid] [get_bd_pins driftdetect_0/fifo_data_valid_i]
connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_underflow] [get_bd_pins driftdetect_0/fifo_rd_underflow_i]

connect_bd_net [get_bd_pins axi_ad9361_dac_dma/fifo_rd_dout] [get_bd_pins xlslice_0/Din]
connect_bd_net [get_bd_pins xlslice_0/Dout] [get_bd_pins driftdetect_0/fifo_data_i]

connect_bd_net [get_bd_pins driftdetect_0/rstn] [get_bd_pins util_ad9361_divclk_reset/peripheral_aresetn]
connect_bd_net [get_bd_pins driftdetect_0/clk] [get_bd_pins util_ad9361_divclk/clk_out]
 
regenerate_bd_layout

save_bd_design


validate_bd_design

# generate output products
set_property synth_checkpoint_mode Hierarchical [get_files  ./fmcomms2_zed.srcs/sources_1/bd/system/system.bd]
generate_target all [get_files  ./fmcomms2_zed.srcs/sources_1/bd/system/system.bd]


# synthesize the system
reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 6

close_project

exit