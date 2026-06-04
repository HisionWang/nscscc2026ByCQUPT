module FlushableQueue(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input         io_enq_valid, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input  [31:0] io_enq_bits_fallThrough, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input         io_enq_bits_taken, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input  [31:0] io_enq_bits_target, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input  [1:0]  io_enq_bits_takenOffset, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input         io_deq_ready, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  output        io_deq_valid, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  output [31:0] io_deq_bits_fallThrough, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  output        io_deq_bits_taken, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  output [31:0] io_deq_bits_target, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  output [1:0]  io_deq_bits_takenOffset, // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
  input         io_flush // @[src/main/scala/frontend/FrontendBundle.scala 173:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] data_0_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_0_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_0_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_0_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_1_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_1_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_1_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_1_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_2_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_2_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_2_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_2_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_3_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_3_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_3_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_3_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_4_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_4_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_4_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_4_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_5_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_5_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_5_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_5_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_6_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_6_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_6_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_6_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_7_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg  data_7_taken; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [31:0] data_7_target; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [1:0] data_7_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
  reg [2:0] head; // @[src/main/scala/frontend/FrontendBundle.scala 182:23]
  reg [2:0] tail; // @[src/main/scala/frontend/FrontendBundle.scala 183:23]
  reg [3:0] count; // @[src/main/scala/frontend/FrontendBundle.scala 184:23]
  wire  full = count == 4'h8; // @[src/main/scala/frontend/FrontendBundle.scala 186:21]
  wire  empty = count == 4'h0; // @[src/main/scala/frontend/FrontendBundle.scala 187:21]
  wire [31:0] _GEN_9 = 3'h1 == head ? data_1_fallThrough : data_0_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_10 = 3'h2 == head ? data_2_fallThrough : _GEN_9; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_11 = 3'h3 == head ? data_3_fallThrough : _GEN_10; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_12 = 3'h4 == head ? data_4_fallThrough : _GEN_11; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_13 = 3'h5 == head ? data_5_fallThrough : _GEN_12; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_14 = 3'h6 == head ? data_6_fallThrough : _GEN_13; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_17 = 3'h1 == head ? data_1_taken : data_0_taken; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_18 = 3'h2 == head ? data_2_taken : _GEN_17; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_19 = 3'h3 == head ? data_3_taken : _GEN_18; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_20 = 3'h4 == head ? data_4_taken : _GEN_19; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_21 = 3'h5 == head ? data_5_taken : _GEN_20; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _GEN_22 = 3'h6 == head ? data_6_taken : _GEN_21; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_25 = 3'h1 == head ? data_1_target : data_0_target; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_26 = 3'h2 == head ? data_2_target : _GEN_25; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_27 = 3'h3 == head ? data_3_target : _GEN_26; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_28 = 3'h4 == head ? data_4_target : _GEN_27; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_29 = 3'h5 == head ? data_5_target : _GEN_28; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [31:0] _GEN_30 = 3'h6 == head ? data_6_target : _GEN_29; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_33 = 3'h1 == head ? data_1_takenOffset : data_0_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_34 = 3'h2 == head ? data_2_takenOffset : _GEN_33; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_35 = 3'h3 == head ? data_3_takenOffset : _GEN_34; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_36 = 3'h4 == head ? data_4_takenOffset : _GEN_35; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_37 = 3'h5 == head ? data_5_takenOffset : _GEN_36; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire [1:0] _GEN_38 = 3'h6 == head ? data_6_takenOffset : _GEN_37; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  wire  _T = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _T_1 = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [31:0] _GEN_128 = 3'h0 == tail ? io_enq_bits_fallThrough : data_0_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_129 = 3'h1 == tail ? io_enq_bits_fallThrough : data_1_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_130 = 3'h2 == tail ? io_enq_bits_fallThrough : data_2_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_131 = 3'h3 == tail ? io_enq_bits_fallThrough : data_3_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_132 = 3'h4 == tail ? io_enq_bits_fallThrough : data_4_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_133 = 3'h5 == tail ? io_enq_bits_fallThrough : data_5_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_134 = 3'h6 == tail ? io_enq_bits_fallThrough : data_6_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_135 = 3'h7 == tail ? io_enq_bits_fallThrough : data_7_fallThrough; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_136 = 3'h0 == tail ? io_enq_bits_taken : data_0_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_137 = 3'h1 == tail ? io_enq_bits_taken : data_1_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_138 = 3'h2 == tail ? io_enq_bits_taken : data_2_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_139 = 3'h3 == tail ? io_enq_bits_taken : data_3_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_140 = 3'h4 == tail ? io_enq_bits_taken : data_4_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_141 = 3'h5 == tail ? io_enq_bits_taken : data_5_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_142 = 3'h6 == tail ? io_enq_bits_taken : data_6_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire  _GEN_143 = 3'h7 == tail ? io_enq_bits_taken : data_7_taken; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_144 = 3'h0 == tail ? io_enq_bits_target : data_0_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_145 = 3'h1 == tail ? io_enq_bits_target : data_1_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_146 = 3'h2 == tail ? io_enq_bits_target : data_2_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_147 = 3'h3 == tail ? io_enq_bits_target : data_3_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_148 = 3'h4 == tail ? io_enq_bits_target : data_4_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_149 = 3'h5 == tail ? io_enq_bits_target : data_5_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_150 = 3'h6 == tail ? io_enq_bits_target : data_6_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [31:0] _GEN_151 = 3'h7 == tail ? io_enq_bits_target : data_7_target; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_152 = 3'h0 == tail ? io_enq_bits_takenOffset : data_0_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_153 = 3'h1 == tail ? io_enq_bits_takenOffset : data_1_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_154 = 3'h2 == tail ? io_enq_bits_takenOffset : data_2_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_155 = 3'h3 == tail ? io_enq_bits_takenOffset : data_3_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_156 = 3'h4 == tail ? io_enq_bits_takenOffset : data_4_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_157 = 3'h5 == tail ? io_enq_bits_takenOffset : data_5_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_158 = 3'h6 == tail ? io_enq_bits_takenOffset : data_6_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [1:0] _GEN_159 = 3'h7 == tail ? io_enq_bits_takenOffset : data_7_takenOffset; // @[src/main/scala/frontend/FrontendBundle.scala 201:{17,17} 180:23]
  wire [2:0] _head_T_2 = head + 3'h1; // @[src/main/scala/frontend/FrontendBundle.scala 204:53]
  wire [2:0] _head_T_3 = head == 3'h7 ? 3'h0 : _head_T_2; // @[src/main/scala/frontend/FrontendBundle.scala 204:16]
  wire [2:0] _tail_T_2 = tail + 3'h1; // @[src/main/scala/frontend/FrontendBundle.scala 205:53]
  wire [2:0] _tail_T_3 = tail == 3'h7 ? 3'h0 : _tail_T_2; // @[src/main/scala/frontend/FrontendBundle.scala 205:16]
  wire [3:0] _count_T_1 = count + 4'h1; // @[src/main/scala/frontend/FrontendBundle.scala 211:20]
  wire [3:0] _count_T_3 = count - 4'h1; // @[src/main/scala/frontend/FrontendBundle.scala 216:20]
  wire [2:0] _GEN_400 = _T_1 ? _head_T_3 : head; // @[src/main/scala/frontend/FrontendBundle.scala 212:27 215:10 182:23]
  wire [3:0] _GEN_401 = _T_1 ? _count_T_3 : count; // @[src/main/scala/frontend/FrontendBundle.scala 212:27 216:11 184:23]
  assign io_enq_ready = ~full; // @[src/main/scala/frontend/FrontendBundle.scala 189:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/frontend/FrontendBundle.scala 190:19]
  assign io_deq_bits_fallThrough = 3'h7 == head ? data_7_fallThrough : _GEN_14; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  assign io_deq_bits_taken = 3'h7 == head ? data_7_taken : _GEN_22; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  assign io_deq_bits_target = 3'h7 == head ? data_7_target : _GEN_30; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  assign io_deq_bits_takenOffset = 3'h7 == head ? data_7_takenOffset : _GEN_38; // @[src/main/scala/frontend/FrontendBundle.scala 191:{16,16}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_0_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_0_fallThrough <= _GEN_128;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_0_fallThrough <= _GEN_128;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_0_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_0_taken <= _GEN_136;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_0_taken <= _GEN_136;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_0_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_0_target <= _GEN_144;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_0_target <= _GEN_144;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_0_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_0_takenOffset <= _GEN_152;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_0_takenOffset <= _GEN_152;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_1_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_1_fallThrough <= _GEN_129;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_1_fallThrough <= _GEN_129;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_1_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_1_taken <= _GEN_137;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_1_taken <= _GEN_137;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_1_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_1_target <= _GEN_145;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_1_target <= _GEN_145;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_1_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_1_takenOffset <= _GEN_153;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_1_takenOffset <= _GEN_153;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_2_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_2_fallThrough <= _GEN_130;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_2_fallThrough <= _GEN_130;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_2_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_2_taken <= _GEN_138;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_2_taken <= _GEN_138;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_2_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_2_target <= _GEN_146;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_2_target <= _GEN_146;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_2_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_2_takenOffset <= _GEN_154;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_2_takenOffset <= _GEN_154;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_3_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_3_fallThrough <= _GEN_131;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_3_fallThrough <= _GEN_131;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_3_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_3_taken <= _GEN_139;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_3_taken <= _GEN_139;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_3_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_3_target <= _GEN_147;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_3_target <= _GEN_147;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_3_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_3_takenOffset <= _GEN_155;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_3_takenOffset <= _GEN_155;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_4_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_4_fallThrough <= _GEN_132;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_4_fallThrough <= _GEN_132;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_4_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_4_taken <= _GEN_140;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_4_taken <= _GEN_140;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_4_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_4_target <= _GEN_148;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_4_target <= _GEN_148;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_4_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_4_takenOffset <= _GEN_156;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_4_takenOffset <= _GEN_156;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_5_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_5_fallThrough <= _GEN_133;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_5_fallThrough <= _GEN_133;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_5_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_5_taken <= _GEN_141;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_5_taken <= _GEN_141;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_5_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_5_target <= _GEN_149;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_5_target <= _GEN_149;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_5_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_5_takenOffset <= _GEN_157;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_5_takenOffset <= _GEN_157;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_6_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_6_fallThrough <= _GEN_134;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_6_fallThrough <= _GEN_134;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_6_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_6_taken <= _GEN_142;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_6_taken <= _GEN_142;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_6_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_6_target <= _GEN_150;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_6_target <= _GEN_150;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_6_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_6_takenOffset <= _GEN_158;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_6_takenOffset <= _GEN_158;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_7_fallThrough <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_7_fallThrough <= _GEN_135;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_7_fallThrough <= _GEN_135;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_7_taken <= 1'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_7_taken <= _GEN_143;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_7_taken <= _GEN_143;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_7_target <= 32'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_7_target <= _GEN_151;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_7_target <= _GEN_151;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
      data_7_takenOffset <= 2'h0; // @[src/main/scala/frontend/FrontendBundle.scala 180:23]
    end else if (!(io_flush)) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
        data_7_takenOffset <= _GEN_159;
      end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        data_7_takenOffset <= _GEN_159;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 182:23]
      head <= 3'h0; // @[src/main/scala/frontend/FrontendBundle.scala 182:23]
    end else if (io_flush) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      head <= 3'h0; // @[src/main/scala/frontend/FrontendBundle.scala 196:11]
    end else if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
      if (head == 3'h7) begin // @[src/main/scala/frontend/FrontendBundle.scala 204:16]
        head <= 3'h0;
      end else begin
        head <= _head_T_2;
      end
    end else if (!(_T)) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
      head <= _GEN_400;
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 183:23]
      tail <= 3'h0; // @[src/main/scala/frontend/FrontendBundle.scala 183:23]
    end else if (io_flush) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      tail <= 3'h0; // @[src/main/scala/frontend/FrontendBundle.scala 197:11]
    end else if (_T & _T_1) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
      tail <= _tail_T_3; // @[src/main/scala/frontend/FrontendBundle.scala 205:10]
    end else if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
      tail <= _tail_T_3; // @[src/main/scala/frontend/FrontendBundle.scala 210:10]
    end
    if (reset) begin // @[src/main/scala/frontend/FrontendBundle.scala 184:23]
      count <= 4'h0; // @[src/main/scala/frontend/FrontendBundle.scala 184:23]
    end else if (io_flush) begin // @[src/main/scala/frontend/FrontendBundle.scala 194:18]
      count <= 4'h0; // @[src/main/scala/frontend/FrontendBundle.scala 198:11]
    end else if (!(_T & _T_1)) begin // @[src/main/scala/frontend/FrontendBundle.scala 199:42]
      if (_T) begin // @[src/main/scala/frontend/FrontendBundle.scala 206:27]
        count <= _count_T_1; // @[src/main/scala/frontend/FrontendBundle.scala 211:11]
      end else begin
        count <= _GEN_401;
      end
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  data_0_fallThrough = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  data_0_taken = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_target = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  data_0_takenOffset = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  data_1_fallThrough = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_1_taken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  data_1_target = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  data_1_takenOffset = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  data_2_fallThrough = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  data_2_taken = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  data_2_target = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  data_2_takenOffset = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  data_3_fallThrough = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  data_3_taken = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_3_target = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  data_3_takenOffset = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  data_4_fallThrough = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  data_4_taken = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  data_4_target = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  data_4_takenOffset = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  data_5_fallThrough = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  data_5_taken = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_5_target = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  data_5_takenOffset = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  data_6_fallThrough = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  data_6_taken = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_6_target = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  data_6_takenOffset = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  data_7_fallThrough = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  data_7_taken = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_7_target = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  data_7_takenOffset = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  head = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  tail = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  count = _RAND_34[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
