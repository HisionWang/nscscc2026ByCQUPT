// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sun Aug  9 05:39:29 2026
// Host        : guest-Z890 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /workspace/nscscc2026ByCQUPT/chiplab/hdmi_out_test.gen/sources_1/ip/BlockRAM_64x20/BlockRAM_64x20_sim_netlist.v
// Design      : BlockRAM_64x20
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BlockRAM_64x20,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module BlockRAM_64x20
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [19:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [19:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [19:0]dina;
  wire [19:0]doutb;
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
  wire [19:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [19:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.3755 mW" *) 
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
  (* C_INIT_FILE = "BlockRAM_64x20.mem" *) 
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
  (* C_READ_WIDTH_A = "20" *) 
  (* C_READ_WIDTH_B = "20" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "NONE" *) 
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
  (* C_WRITE_WIDTH_A = "20" *) 
  (* C_WRITE_WIDTH_B = "20" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BlockRAM_64x20_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[19:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[19:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21520)
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
