// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Aug  9 05:39:29 2026
// Host        : guest-Z890 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /workspace/nscscc2026ByCQUPT/chiplab/hdmi_out_test.gen/sources_1/ip/BlockRAM_64x21/BlockRAM_64x21_stub.v
// Design      : BlockRAM_64x21
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *)
module BlockRAM_64x21(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="ena,wea[0:0],addra[5:0],dina[20:0],rstb,enb,addrb[5:0],doutb[20:0]" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input ena;
  input [0:0]wea;
  input [5:0]addra;
  input [20:0]dina;
  input clkb /* synthesis syn_isclock = 1 */;
  input rstb;
  input enb;
  input [5:0]addrb;
  output [20:0]doutb;
endmodule
