module MiniICache(
  input         clock,
  input         reset,
  output [3:0]  io_axi_master_ar_out_arid, // @[src/main/scala/icache.scala 9:14]
  output [31:0] io_axi_master_ar_out_araddr, // @[src/main/scala/icache.scala 9:14]
  output [7:0]  io_axi_master_ar_out_arlen, // @[src/main/scala/icache.scala 9:14]
  output [2:0]  io_axi_master_ar_out_arsize, // @[src/main/scala/icache.scala 9:14]
  output [1:0]  io_axi_master_ar_out_arburst, // @[src/main/scala/icache.scala 9:14]
  output [1:0]  io_axi_master_ar_out_arlock, // @[src/main/scala/icache.scala 9:14]
  output [3:0]  io_axi_master_ar_out_arcache, // @[src/main/scala/icache.scala 9:14]
  output [2:0]  io_axi_master_ar_out_arprot, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_ar_out_arvalid, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_ar_arready, // @[src/main/scala/icache.scala 9:14]
  output [3:0]  io_axi_master_aw_out_awid, // @[src/main/scala/icache.scala 9:14]
  output [31:0] io_axi_master_aw_out_awaddr, // @[src/main/scala/icache.scala 9:14]
  output [7:0]  io_axi_master_aw_out_awlen, // @[src/main/scala/icache.scala 9:14]
  output [2:0]  io_axi_master_aw_out_awsize, // @[src/main/scala/icache.scala 9:14]
  output [1:0]  io_axi_master_aw_out_awburst, // @[src/main/scala/icache.scala 9:14]
  output [1:0]  io_axi_master_aw_out_awlock, // @[src/main/scala/icache.scala 9:14]
  output [3:0]  io_axi_master_aw_out_awcache, // @[src/main/scala/icache.scala 9:14]
  output [2:0]  io_axi_master_aw_out_awprot, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_aw_out_awvalid, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_aw_awready, // @[src/main/scala/icache.scala 9:14]
  output [3:0]  io_axi_master_w_out_wid, // @[src/main/scala/icache.scala 9:14]
  output [31:0] io_axi_master_w_out_wdata, // @[src/main/scala/icache.scala 9:14]
  output [3:0]  io_axi_master_w_out_wstrb, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_w_out_wlast, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_w_out_wvalid, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_w_wready, // @[src/main/scala/icache.scala 9:14]
  input  [3:0]  io_axi_master_r_in_rid, // @[src/main/scala/icache.scala 9:14]
  input  [31:0] io_axi_master_r_in_rdata, // @[src/main/scala/icache.scala 9:14]
  input  [1:0]  io_axi_master_r_in_rresp, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_r_in_rlast, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_r_in_rvalid, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_r_rready, // @[src/main/scala/icache.scala 9:14]
  input  [3:0]  io_axi_master_b_in_bid, // @[src/main/scala/icache.scala 9:14]
  input  [1:0]  io_axi_master_b_in_bresp, // @[src/main/scala/icache.scala 9:14]
  input         io_axi_master_b_in_bvalid, // @[src/main/scala/icache.scala 9:14]
  output        io_axi_master_b_bready, // @[src/main/scala/icache.scala 9:14]
  input  [31:0] io_cpu_if_req_addr, // @[src/main/scala/icache.scala 9:14]
  input         io_cpu_if_req_valid, // @[src/main/scala/icache.scala 9:14]
  output [31:0] io_cpu_if_resp_data, // @[src/main/scala/icache.scala 9:14]
  output        io_cpu_if_resp_valid // @[src/main/scala/icache.scala 9:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [21:0] cache_tag [0:255]; // @[src/main/scala/icache.scala 48:33]
  wire  cache_tag_rd_tag_en; // @[src/main/scala/icache.scala 48:33]
  wire [7:0] cache_tag_rd_tag_addr; // @[src/main/scala/icache.scala 48:33]
  wire [21:0] cache_tag_rd_tag_data; // @[src/main/scala/icache.scala 48:33]
  wire [21:0] cache_tag_MPORT_data; // @[src/main/scala/icache.scala 48:33]
  wire [7:0] cache_tag_MPORT_addr; // @[src/main/scala/icache.scala 48:33]
  wire  cache_tag_MPORT_mask; // @[src/main/scala/icache.scala 48:33]
  wire  cache_tag_MPORT_en; // @[src/main/scala/icache.scala 48:33]
  reg  cache_tag_rd_tag_en_pipe_0;
  reg [7:0] cache_tag_rd_tag_addr_pipe_0;
  reg  cache_valid [0:255]; // @[src/main/scala/icache.scala 49:33]
  wire  cache_valid_rd_valid_en; // @[src/main/scala/icache.scala 49:33]
  wire [7:0] cache_valid_rd_valid_addr; // @[src/main/scala/icache.scala 49:33]
  wire  cache_valid_rd_valid_data; // @[src/main/scala/icache.scala 49:33]
  wire  cache_valid_MPORT_1_data; // @[src/main/scala/icache.scala 49:33]
  wire [7:0] cache_valid_MPORT_1_addr; // @[src/main/scala/icache.scala 49:33]
  wire  cache_valid_MPORT_1_mask; // @[src/main/scala/icache.scala 49:33]
  wire  cache_valid_MPORT_1_en; // @[src/main/scala/icache.scala 49:33]
  reg  cache_valid_rd_valid_en_pipe_0;
  reg [7:0] cache_valid_rd_valid_addr_pipe_0;
  reg [31:0] cache_data [0:255]; // @[src/main/scala/icache.scala 50:33]
  wire  cache_data_io_cpu_if_resp_data_MPORT_en; // @[src/main/scala/icache.scala 50:33]
  wire [7:0] cache_data_io_cpu_if_resp_data_MPORT_addr; // @[src/main/scala/icache.scala 50:33]
  wire [31:0] cache_data_io_cpu_if_resp_data_MPORT_data; // @[src/main/scala/icache.scala 50:33]
  wire [31:0] cache_data_MPORT_2_data; // @[src/main/scala/icache.scala 50:33]
  wire [7:0] cache_data_MPORT_2_addr; // @[src/main/scala/icache.scala 50:33]
  wire  cache_data_MPORT_2_mask; // @[src/main/scala/icache.scala 50:33]
  wire  cache_data_MPORT_2_en; // @[src/main/scala/icache.scala 50:33]
  reg  cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0;
  reg [7:0] cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0;
  wire [21:0] req_tag = io_cpu_if_req_addr[31:10]; // @[src/main/scala/icache.scala 56:27]
  wire  hit = cache_valid_rd_valid_data & cache_tag_rd_tag_data == req_tag; // @[src/main/scala/icache.scala 65:28]
  reg [31:0] miss_addr; // @[src/main/scala/icache.scala 71:25]
  reg [1:0] state; // @[src/main/scala/icache.scala 77:22]
  wire  _T = 2'h0 == state; // @[src/main/scala/icache.scala 83:17]
  wire [31:0] _GEN_12 = hit ? cache_data_io_cpu_if_resp_data_MPORT_data : 32'h0; // @[src/main/scala/icache.scala 86:19 24:24 88:32]
  wire  _GEN_17 = io_cpu_if_req_valid & hit; // @[src/main/scala/icache.scala 50:33 85:33]
  wire [31:0] _GEN_20 = io_cpu_if_req_valid ? _GEN_12 : 32'h0; // @[src/main/scala/icache.scala 85:33 99:30]
  wire [31:0] _GEN_32 = io_axi_master_r_in_rvalid ? io_axi_master_r_in_rdata : 32'h0; // @[src/main/scala/icache.scala 127:39 134:30 24:24]
  wire [1:0] _GEN_34 = io_axi_master_r_in_rvalid ? 2'h0 : state; // @[src/main/scala/icache.scala 127:39 139:22 77:22]
  wire [31:0] _GEN_42 = 2'h2 == state ? _GEN_32 : 32'h0; // @[src/main/scala/icache.scala 83:17 24:24]
  wire [31:0] _GEN_46 = 2'h1 == state ? miss_addr : 32'h0; // @[src/main/scala/icache.scala 83:17 116:28 81:24]
  wire [2:0] _GEN_48 = 2'h1 == state ? 3'h2 : 3'h0; // @[src/main/scala/icache.scala 83:17 116:28 81:24]
  wire [1:0] _GEN_49 = 2'h1 == state ? 2'h1 : 2'h0; // @[src/main/scala/icache.scala 83:17 116:28 81:24]
  wire  _GEN_55 = 2'h1 == state ? 1'h0 : 2'h2 == state; // @[src/main/scala/icache.scala 83:17 26:26]
  wire  _GEN_58 = 2'h1 == state ? 1'h0 : 2'h2 == state & io_axi_master_r_in_rvalid; // @[src/main/scala/icache.scala 83:17 48:33]
  wire [31:0] _GEN_62 = 2'h1 == state ? 32'h0 : _GEN_42; // @[src/main/scala/icache.scala 83:17 24:24]
  assign cache_tag_rd_tag_en = cache_tag_rd_tag_en_pipe_0;
  assign cache_tag_rd_tag_addr = cache_tag_rd_tag_addr_pipe_0;
  assign cache_tag_rd_tag_data = cache_tag[cache_tag_rd_tag_addr]; // @[src/main/scala/icache.scala 48:33]
  assign cache_tag_MPORT_data = io_cpu_if_req_addr[31:10];
  assign cache_tag_MPORT_addr = io_cpu_if_req_addr[9:2];
  assign cache_tag_MPORT_mask = 1'h1;
  assign cache_tag_MPORT_en = _T ? 1'h0 : _GEN_58;
  assign cache_valid_rd_valid_en = cache_valid_rd_valid_en_pipe_0;
  assign cache_valid_rd_valid_addr = cache_valid_rd_valid_addr_pipe_0;
  assign cache_valid_rd_valid_data = cache_valid[cache_valid_rd_valid_addr]; // @[src/main/scala/icache.scala 49:33]
  assign cache_valid_MPORT_1_data = 1'h1;
  assign cache_valid_MPORT_1_addr = io_cpu_if_req_addr[9:2];
  assign cache_valid_MPORT_1_mask = 1'h1;
  assign cache_valid_MPORT_1_en = _T ? 1'h0 : _GEN_58;
  assign cache_data_io_cpu_if_resp_data_MPORT_en = cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0;
  assign cache_data_io_cpu_if_resp_data_MPORT_addr = cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0;
  assign cache_data_io_cpu_if_resp_data_MPORT_data = cache_data[cache_data_io_cpu_if_resp_data_MPORT_addr]; // @[src/main/scala/icache.scala 50:33]
  assign cache_data_MPORT_2_data = io_axi_master_r_in_rdata;
  assign cache_data_MPORT_2_addr = io_cpu_if_req_addr[9:2];
  assign cache_data_MPORT_2_mask = 1'h1;
  assign cache_data_MPORT_2_en = _T ? 1'h0 : _GEN_58;
  assign io_axi_master_ar_out_arid = 4'h0; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_araddr = 2'h0 == state ? 32'h0 : _GEN_46; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arlen = 8'h0; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arsize = 2'h0 == state ? 3'h0 : _GEN_48; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arburst = 2'h0 == state ? 2'h0 : _GEN_49; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arlock = 2'h0; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arcache = 4'h0; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arprot = 3'h0; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_ar_out_arvalid = 2'h0 == state ? 1'h0 : 2'h1 == state; // @[src/main/scala/icache.scala 83:17 81:24]
  assign io_axi_master_aw_out_awid = 4'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awaddr = 32'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awlen = 8'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awsize = 3'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awburst = 2'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awlock = 2'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awcache = 4'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awprot = 3'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_aw_out_awvalid = 1'h0; // @[src/main/scala/icache.scala 30:{37,37}]
  assign io_axi_master_w_out_wid = 4'h0; // @[src/main/scala/icache.scala 31:{37,37}]
  assign io_axi_master_w_out_wdata = 32'h0; // @[src/main/scala/icache.scala 31:{37,37}]
  assign io_axi_master_w_out_wstrb = 4'h0; // @[src/main/scala/icache.scala 31:{37,37}]
  assign io_axi_master_w_out_wlast = 1'h0; // @[src/main/scala/icache.scala 31:{37,37}]
  assign io_axi_master_w_out_wvalid = 1'h0; // @[src/main/scala/icache.scala 31:{37,37}]
  assign io_axi_master_r_rready = 2'h0 == state ? 1'h0 : _GEN_55; // @[src/main/scala/icache.scala 83:17 26:26]
  assign io_axi_master_b_bready = 1'h0; // @[src/main/scala/icache.scala 27:26]
  assign io_cpu_if_resp_data = 2'h0 == state ? _GEN_20 : _GEN_62; // @[src/main/scala/icache.scala 83:17]
  assign io_cpu_if_resp_valid = 2'h0 == state ? _GEN_17 : _GEN_58; // @[src/main/scala/icache.scala 83:17]
  always @(posedge clock) begin
    if (cache_tag_MPORT_en & cache_tag_MPORT_mask) begin
      cache_tag[cache_tag_MPORT_addr] <= cache_tag_MPORT_data; // @[src/main/scala/icache.scala 48:33]
    end
    cache_tag_rd_tag_en_pipe_0 <= io_cpu_if_req_valid;
    if (io_cpu_if_req_valid) begin
      cache_tag_rd_tag_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (cache_valid_MPORT_1_en & cache_valid_MPORT_1_mask) begin
      cache_valid[cache_valid_MPORT_1_addr] <= cache_valid_MPORT_1_data; // @[src/main/scala/icache.scala 49:33]
    end
    cache_valid_rd_valid_en_pipe_0 <= io_cpu_if_req_valid;
    if (io_cpu_if_req_valid) begin
      cache_valid_rd_valid_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (cache_data_MPORT_2_en & cache_data_MPORT_2_mask) begin
      cache_data[cache_data_MPORT_2_addr] <= cache_data_MPORT_2_data; // @[src/main/scala/icache.scala 50:33]
    end
    cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 <= _T & _GEN_17;
    if (_T & _GEN_17) begin
      cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 <= io_cpu_if_req_addr[9:2];
    end
    if (2'h0 == state) begin // @[src/main/scala/icache.scala 83:17]
      if (io_cpu_if_req_valid) begin // @[src/main/scala/icache.scala 85:33]
        if (!(hit)) begin // @[src/main/scala/icache.scala 86:19]
          miss_addr <= io_cpu_if_req_addr; // @[src/main/scala/icache.scala 93:24]
        end
      end
    end
    if (reset) begin // @[src/main/scala/icache.scala 77:22]
      state <= 2'h0; // @[src/main/scala/icache.scala 77:22]
    end else if (2'h0 == state) begin // @[src/main/scala/icache.scala 83:17]
      if (io_cpu_if_req_valid) begin // @[src/main/scala/icache.scala 85:33]
        if (!(hit)) begin // @[src/main/scala/icache.scala 86:19]
          state <= 2'h1; // @[src/main/scala/icache.scala 94:24]
        end
      end
    end else if (2'h1 == state) begin // @[src/main/scala/icache.scala 83:17]
      if (io_axi_master_ar_arready) begin // @[src/main/scala/icache.scala 118:38]
        state <= 2'h2; // @[src/main/scala/icache.scala 120:15]
      end
    end else if (2'h2 == state) begin // @[src/main/scala/icache.scala 83:17]
      state <= _GEN_34;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_tag[initvar] = _RAND_0[21:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_valid[initvar] = _RAND_3[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    cache_data[initvar] = _RAND_6[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cache_tag_rd_tag_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cache_tag_rd_tag_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  cache_valid_rd_valid_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cache_valid_rd_valid_addr_pipe_0 = _RAND_5[7:0];
  _RAND_7 = {1{`RANDOM}};
  cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  miss_addr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
