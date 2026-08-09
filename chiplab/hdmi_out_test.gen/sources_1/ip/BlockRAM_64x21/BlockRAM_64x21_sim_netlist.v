// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Aug  9 05:39:29 2026
// Host        : guest-Z890 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /workspace/nscscc2026ByCQUPT/chiplab/hdmi_out_test.gen/sources_1/ip/BlockRAM_64x21/BlockRAM_64x21_sim_netlist.v
// Design      : BlockRAM_64x21
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockRAM_64x21,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module BlockRAM_64x21
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [20:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [20:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [20:0]dina;
  wire [20:0]doutb;
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
  wire [20:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [20:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.4171 mW" *) 
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
  (* C_INIT_FILE = "BlockRAM_64x21.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "21" *) 
  (* C_READ_WIDTH_B = "21" *) 
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
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "21" *) 
  (* C_WRITE_WIDTH_B = "21" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BlockRAM_64x21_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[20:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[20:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21472)
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
