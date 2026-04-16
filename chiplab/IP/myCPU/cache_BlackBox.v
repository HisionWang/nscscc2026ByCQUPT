module cache_BlackBox (
  // AXI3 AR通道 (读地址)
  output [3:0]  axi_master_ar_data_arid,
  output [31:0] axi_master_ar_data_araddr,
  output [3:0]  axi_master_ar_data_arlen,
  output [2:0]  axi_master_ar_data_arsize,
  output [1:0]  axi_master_ar_data_arburst,
  output [1:0]  axi_master_ar_data_arlock,
  output [3:0]  axi_master_ar_data_arcache,
  output [2:0]  axi_master_ar_data_arprot,
  output        axi_master_ar_data_arvalid,
  input         axi_master_ar_arready,
  
  // AXI3 AW通道 (写地址)
  output [3:0]  axi_master_aw_data_awid,
  output [31:0] axi_master_aw_data_awaddr,
  output [3:0]  axi_master_aw_data_awlen,
  output [2:0]  axi_master_aw_data_awsize,
  output [1:0]  axi_master_aw_data_awburst,
  output [1:0]  axi_master_aw_data_awlock,
  output [3:0]  axi_master_aw_data_awcache,
  output [2:0]  axi_master_aw_data_awprot,
  output        axi_master_aw_data_awvalid,
  input         axi_master_aw_awready,
  
  // AXI3 W通道 (写数据)
  output [3:0]  axi_master_w_data_wid,
  output [31:0] axi_master_w_data_wdata,
  output [3:0]  axi_master_w_data_wstrb,
  output        axi_master_w_data_wlast,
  output        axi_master_w_data_wvalid,
  input         axi_master_w_wready,
  
  // AXI3 R通道 (读响应)
  input  [3:0]  axi_master_r_data_rid,
  input  [31:0] axi_master_r_data_rdata,
  input  [1:0]  axi_master_r_data_rresp,
  input         axi_master_r_data_rlast,
  input         axi_master_r_data_rvalid,
  output        axi_master_r_rready,
  
  // AXI3 B通道 (写响应)
  input  [3:0]  axi_master_b_data_bid,
  input  [1:0]  axi_master_b_data_bresp,
  input         axi_master_b_data_bvalid,
  output        axi_master_b_bready,
  
  // CPU接口
  input  [31:0] cpu_if_req_addr,
  input         cpu_if_req_valid,
  output [31:0] cpu_if_resp_data,
  output        cpu_if_resp_valid
);

  // 将所有输出端口驱动为0
  assign axi_master_ar_data_arid    = 4'b0;
  assign axi_master_ar_data_araddr  = 32'b0;
  assign axi_master_ar_data_arlen   = 4'b0;
  assign axi_master_ar_data_arsize  = 3'b0;
  assign axi_master_ar_data_arburst = 2'b0;
  assign axi_master_ar_data_arlock  = 2'b0;
  assign axi_master_ar_data_arcache = 4'b0;
  assign axi_master_ar_data_arprot  = 3'b0;
  assign axi_master_ar_data_arvalid = 1'b0;
  
  assign axi_master_aw_data_awid    = 4'b0;
  assign axi_master_aw_data_awaddr  = 32'b0;
  assign axi_master_aw_data_awlen   = 4'b0;
  assign axi_master_aw_data_awsize  = 3'b0;
  assign axi_master_aw_data_awburst = 2'b0;
  assign axi_master_aw_data_awlock  = 2'b0;
  assign axi_master_aw_data_awcache = 4'b0;
  assign axi_master_aw_data_awprot  = 3'b0;
  assign axi_master_aw_data_awvalid = 1'b0;
  
  assign axi_master_w_data_wid      = 4'b0;
  assign axi_master_w_data_wdata    = 32'b0;
  assign axi_master_w_data_wstrb    = 4'b0;
  assign axi_master_w_data_wlast    = 1'b0;
  assign axi_master_w_data_wvalid   = 1'b0;
  
  assign axi_master_r_rready        = 1'b0;
  assign axi_master_b_bready        = 1'b0;
  
  assign cpu_if_resp_data           = 32'b0;
  assign cpu_if_resp_valid          = 1'b0;

  // 输入端口不需要驱动，由外部连接
  // axi_master_ar_arready, axi_master_aw_awready, axi_master_w_wready
  // axi_master_r_data_*, axi_master_b_data_*
  // cpu_if_req_addr, cpu_if_req_valid

endmodule