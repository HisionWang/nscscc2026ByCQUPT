// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Aug  9 05:35:35 2026
// Host        : guest-Z890 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /workspace/nscscc2026ByCQUPT/chiplab/loongson.gen/sources_1/ip/BlockRAM_256x58/BlockRAM_256x58_sim_netlist.v
// Design      : BlockRAM_256x58
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockRAM_256x58,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module BlockRAM_256x58
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    rstb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [57:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [57:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [57:0]dina;
  wire [57:0]doutb;
  wire ena;
  wire enb;
  wire rstb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [57:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [57:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     7.145225 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "BlockRAM_256x58.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "58" *) 
  (* C_READ_WIDTH_B = "58" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "58" *) 
  (* C_WRITE_WIDTH_B = "58" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BlockRAM_256x58_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[57:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(rstb),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[57:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31744)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
