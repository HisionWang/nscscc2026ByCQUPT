// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Aug  9 05:35:36 2026
// Host        : guest-Z890 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /workspace/nscscc2026ByCQUPT/chiplab/loongson.gen/sources_1/ip/BlockRAM_1024x2/BlockRAM_1024x2_sim_netlist.v
// Design      : BlockRAM_1024x2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockRAM_1024x2,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module BlockRAM_1024x2
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [1:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [1:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [1:0]dina;
  wire [1:0]doutb;
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
  wire [1:0]NLW_U0_douta_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.256778 mW" *) 
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
  (* C_INIT_FILE = "BlockRAM_1024x2.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "2" *) 
  (* C_READ_WIDTH_B = "2" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "2" *) 
  (* C_WRITE_WIDTH_B = "2" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BlockRAM_1024x2_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[1:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[1:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20944)
`pragma protect data_block
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
LTZUpoqY54gGDYNHR1U7mQCBsIuBkUfbdw==
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
