module CircularQueue(
  input         clock,
  input         reset,
  output        io_enq_0_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_1_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_2_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_2_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_3_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_3_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_enq_4_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_4_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_4_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_4_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input  [31:0] io_enq_4_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_0_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_0_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_1_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_1_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_deq_2_ready, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_instr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_pc, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_valid, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isBr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isJal, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isJalr, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isCall, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_pdInfo_isRet, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [31:0] io_deq_2_bits_pdInfo_jumpTarget, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_empty, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_full, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output [4:0]  io_count // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] deqPtr_value; // @[src/main/scala/util/CircularQueue.scala 101:23]
  reg  deqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 101:23]
  reg [3:0] enqPtr_value; // @[src/main/scala/util/CircularQueue.scala 102:23]
  reg  enqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 102:23]
  reg [31:0] data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 103:39]
  wire  empty = deqPtr_value == enqPtr_value & deqPtr_flag == enqPtr_flag; // @[src/main/scala/util/CircularQueuePtr.scala 103:54]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 129:47]
  wire [3:0] _count_T_2 = enqPtr_value - deqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 155:18]
  wire [4:0] _GEN_4036 = {{1'd0}, enqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 156:18]
  wire [5:0] _count_T_3 = 5'h10 + _GEN_4036; // @[src/main/scala/util/CircularQueuePtr.scala 156:18]
  wire [5:0] _GEN_4037 = {{2'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 156:33]
  wire [5:0] _count_T_5 = _count_T_3 - _GEN_4037; // @[src/main/scala/util/CircularQueuePtr.scala 156:33]
  wire [5:0] _count_T_6 = enqPtr_flag == deqPtr_flag ? {{2'd0}, _count_T_2} : _count_T_5; // @[src/main/scala/util/CircularQueuePtr.scala 154:8]
  wire  _T_1 = ~io_enq_0_valid & io_enq_1_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_6 = ~io_enq_1_valid & io_enq_2_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_11 = ~io_enq_2_valid & io_enq_3_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_16 = ~io_enq_3_valid & io_enq_4_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire [4:0] count = _count_T_6[4:0]; // @[src/main/scala/util/CircularQueue.scala 143:23 146:9]
  wire [5:0] _canEnq_T = {{1'd0}, count}; // @[src/main/scala/util/CircularQueue.scala 184:26]
  wire  canEnq = _canEnq_T < 6'h10; // @[src/main/scala/util/CircularQueue.scala 184:34]
  wire  _T_20 = io_enq_0_ready & io_enq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx = _GEN_4036[3:0]; // @[src/main/scala/util/CircularQueue.scala 191:36]
  wire  _GEN_48 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_49 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_50 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_51 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_52 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_53 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_54 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_55 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_56 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_57 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_58 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_valid : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_59 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_valid : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_60 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_valid : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_61 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_valid : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_62 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_valid : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_63 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_valid : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_64 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_65 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_66 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_67 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_68 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_69 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_70 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_71 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_72 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_73 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_74 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_75 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_76 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_77 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_78 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_79 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_80 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_81 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_82 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_83 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_84 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_85 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_86 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_87 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_88 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_89 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_90 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_91 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_92 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_93 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_94 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_95 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_96 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_97 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_98 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_99 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_100 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_101 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_102 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_103 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_104 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_105 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_106 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_107 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_108 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_109 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_110 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_111 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_112 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_113 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_114 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_115 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_116 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_117 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_118 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_119 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_120 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_121 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_122 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_123 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_124 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_125 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_126 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_127 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_128 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_129 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_130 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_131 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_132 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_133 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_134 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_135 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_136 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_137 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_138 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_139 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_140 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_141 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_142 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_143 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_144 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_145 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_146 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_147 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_148 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_149 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_150 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_151 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_152 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_153 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_154 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_155 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_156 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_157 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_158 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_159 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_160 = 4'h0 == writeIdx ? io_enq_0_bits_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_161 = 4'h1 == writeIdx ? io_enq_0_bits_pc : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_162 = 4'h2 == writeIdx ? io_enq_0_bits_pc : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_163 = 4'h3 == writeIdx ? io_enq_0_bits_pc : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_164 = 4'h4 == writeIdx ? io_enq_0_bits_pc : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_165 = 4'h5 == writeIdx ? io_enq_0_bits_pc : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_166 = 4'h6 == writeIdx ? io_enq_0_bits_pc : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_167 = 4'h7 == writeIdx ? io_enq_0_bits_pc : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_168 = 4'h8 == writeIdx ? io_enq_0_bits_pc : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_169 = 4'h9 == writeIdx ? io_enq_0_bits_pc : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_170 = 4'ha == writeIdx ? io_enq_0_bits_pc : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_171 = 4'hb == writeIdx ? io_enq_0_bits_pc : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_172 = 4'hc == writeIdx ? io_enq_0_bits_pc : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_173 = 4'hd == writeIdx ? io_enq_0_bits_pc : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_174 = 4'he == writeIdx ? io_enq_0_bits_pc : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_175 = 4'hf == writeIdx ? io_enq_0_bits_pc : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_176 = 4'h0 == writeIdx ? io_enq_0_bits_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_177 = 4'h1 == writeIdx ? io_enq_0_bits_instr : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_178 = 4'h2 == writeIdx ? io_enq_0_bits_instr : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_179 = 4'h3 == writeIdx ? io_enq_0_bits_instr : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_180 = 4'h4 == writeIdx ? io_enq_0_bits_instr : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_181 = 4'h5 == writeIdx ? io_enq_0_bits_instr : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_182 = 4'h6 == writeIdx ? io_enq_0_bits_instr : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_183 = 4'h7 == writeIdx ? io_enq_0_bits_instr : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_184 = 4'h8 == writeIdx ? io_enq_0_bits_instr : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_185 = 4'h9 == writeIdx ? io_enq_0_bits_instr : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_186 = 4'ha == writeIdx ? io_enq_0_bits_instr : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_187 = 4'hb == writeIdx ? io_enq_0_bits_instr : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_188 = 4'hc == writeIdx ? io_enq_0_bits_instr : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_189 = 4'hd == writeIdx ? io_enq_0_bits_instr : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_190 = 4'he == writeIdx ? io_enq_0_bits_instr : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire [31:0] _GEN_191 = 4'hf == writeIdx ? io_enq_0_bits_instr : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 193:{22,22}]
  wire  _GEN_240 = _T_20 ? _GEN_48 : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_241 = _T_20 ? _GEN_49 : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_242 = _T_20 ? _GEN_50 : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_243 = _T_20 ? _GEN_51 : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_244 = _T_20 ? _GEN_52 : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_245 = _T_20 ? _GEN_53 : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_246 = _T_20 ? _GEN_54 : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_247 = _T_20 ? _GEN_55 : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_248 = _T_20 ? _GEN_56 : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_249 = _T_20 ? _GEN_57 : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_250 = _T_20 ? _GEN_58 : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_251 = _T_20 ? _GEN_59 : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_252 = _T_20 ? _GEN_60 : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_253 = _T_20 ? _GEN_61 : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_254 = _T_20 ? _GEN_62 : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_255 = _T_20 ? _GEN_63 : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_256 = _T_20 ? _GEN_64 : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_257 = _T_20 ? _GEN_65 : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_258 = _T_20 ? _GEN_66 : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_259 = _T_20 ? _GEN_67 : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_260 = _T_20 ? _GEN_68 : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_261 = _T_20 ? _GEN_69 : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_262 = _T_20 ? _GEN_70 : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_263 = _T_20 ? _GEN_71 : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_264 = _T_20 ? _GEN_72 : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_265 = _T_20 ? _GEN_73 : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_266 = _T_20 ? _GEN_74 : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_267 = _T_20 ? _GEN_75 : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_268 = _T_20 ? _GEN_76 : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_269 = _T_20 ? _GEN_77 : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_270 = _T_20 ? _GEN_78 : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_271 = _T_20 ? _GEN_79 : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_272 = _T_20 ? _GEN_80 : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_273 = _T_20 ? _GEN_81 : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_274 = _T_20 ? _GEN_82 : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_275 = _T_20 ? _GEN_83 : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_276 = _T_20 ? _GEN_84 : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_277 = _T_20 ? _GEN_85 : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_278 = _T_20 ? _GEN_86 : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_279 = _T_20 ? _GEN_87 : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_280 = _T_20 ? _GEN_88 : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_281 = _T_20 ? _GEN_89 : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_282 = _T_20 ? _GEN_90 : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_283 = _T_20 ? _GEN_91 : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_284 = _T_20 ? _GEN_92 : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_285 = _T_20 ? _GEN_93 : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_286 = _T_20 ? _GEN_94 : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_287 = _T_20 ? _GEN_95 : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_288 = _T_20 ? _GEN_96 : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_289 = _T_20 ? _GEN_97 : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_290 = _T_20 ? _GEN_98 : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_291 = _T_20 ? _GEN_99 : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_292 = _T_20 ? _GEN_100 : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_293 = _T_20 ? _GEN_101 : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_294 = _T_20 ? _GEN_102 : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_295 = _T_20 ? _GEN_103 : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_296 = _T_20 ? _GEN_104 : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_297 = _T_20 ? _GEN_105 : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_298 = _T_20 ? _GEN_106 : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_299 = _T_20 ? _GEN_107 : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_300 = _T_20 ? _GEN_108 : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_301 = _T_20 ? _GEN_109 : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_302 = _T_20 ? _GEN_110 : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_303 = _T_20 ? _GEN_111 : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_304 = _T_20 ? _GEN_112 : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_305 = _T_20 ? _GEN_113 : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_306 = _T_20 ? _GEN_114 : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_307 = _T_20 ? _GEN_115 : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_308 = _T_20 ? _GEN_116 : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_309 = _T_20 ? _GEN_117 : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_310 = _T_20 ? _GEN_118 : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_311 = _T_20 ? _GEN_119 : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_312 = _T_20 ? _GEN_120 : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_313 = _T_20 ? _GEN_121 : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_314 = _T_20 ? _GEN_122 : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_315 = _T_20 ? _GEN_123 : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_316 = _T_20 ? _GEN_124 : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_317 = _T_20 ? _GEN_125 : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_318 = _T_20 ? _GEN_126 : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_319 = _T_20 ? _GEN_127 : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_320 = _T_20 ? _GEN_128 : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_321 = _T_20 ? _GEN_129 : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_322 = _T_20 ? _GEN_130 : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_323 = _T_20 ? _GEN_131 : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_324 = _T_20 ? _GEN_132 : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_325 = _T_20 ? _GEN_133 : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_326 = _T_20 ? _GEN_134 : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_327 = _T_20 ? _GEN_135 : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_328 = _T_20 ? _GEN_136 : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_329 = _T_20 ? _GEN_137 : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_330 = _T_20 ? _GEN_138 : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_331 = _T_20 ? _GEN_139 : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_332 = _T_20 ? _GEN_140 : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_333 = _T_20 ? _GEN_141 : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_334 = _T_20 ? _GEN_142 : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire  _GEN_335 = _T_20 ? _GEN_143 : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_336 = _T_20 ? _GEN_144 : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_337 = _T_20 ? _GEN_145 : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_338 = _T_20 ? _GEN_146 : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_339 = _T_20 ? _GEN_147 : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_340 = _T_20 ? _GEN_148 : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_341 = _T_20 ? _GEN_149 : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_342 = _T_20 ? _GEN_150 : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_343 = _T_20 ? _GEN_151 : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_344 = _T_20 ? _GEN_152 : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_345 = _T_20 ? _GEN_153 : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_346 = _T_20 ? _GEN_154 : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_347 = _T_20 ? _GEN_155 : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_348 = _T_20 ? _GEN_156 : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_349 = _T_20 ? _GEN_157 : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_350 = _T_20 ? _GEN_158 : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_351 = _T_20 ? _GEN_159 : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_352 = _T_20 ? _GEN_160 : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_353 = _T_20 ? _GEN_161 : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_354 = _T_20 ? _GEN_162 : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_355 = _T_20 ? _GEN_163 : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_356 = _T_20 ? _GEN_164 : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_357 = _T_20 ? _GEN_165 : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_358 = _T_20 ? _GEN_166 : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_359 = _T_20 ? _GEN_167 : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_360 = _T_20 ? _GEN_168 : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_361 = _T_20 ? _GEN_169 : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_362 = _T_20 ? _GEN_170 : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_363 = _T_20 ? _GEN_171 : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_364 = _T_20 ? _GEN_172 : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_365 = _T_20 ? _GEN_173 : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_366 = _T_20 ? _GEN_174 : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_367 = _T_20 ? _GEN_175 : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_368 = _T_20 ? _GEN_176 : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_369 = _T_20 ? _GEN_177 : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_370 = _T_20 ? _GEN_178 : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_371 = _T_20 ? _GEN_179 : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_372 = _T_20 ? _GEN_180 : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_373 = _T_20 ? _GEN_181 : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_374 = _T_20 ? _GEN_182 : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_375 = _T_20 ? _GEN_183 : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_376 = _T_20 ? _GEN_184 : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_377 = _T_20 ? _GEN_185 : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_378 = _T_20 ? _GEN_186 : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_379 = _T_20 ? _GEN_187 : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_380 = _T_20 ? _GEN_188 : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_381 = _T_20 ? _GEN_189 : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_382 = _T_20 ? _GEN_190 : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [31:0] _GEN_383 = _T_20 ? _GEN_191 : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 188:27]
  wire [5:0] _canEnq_T_1 = count + 5'h1; // @[src/main/scala/util/CircularQueue.scala 184:26]
  wire  canEnq_1 = _canEnq_T_1 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 184:34]
  wire  _T_21 = io_enq_1_ready & io_enq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_1 = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 191:36]
  wire  _GEN_432 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_240; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_433 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_241; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_434 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_242; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_435 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_243; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_436 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_244; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_437 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_245; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_438 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_246; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_439 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_247; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_440 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_248; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_441 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_249; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_442 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_250; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_443 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_251; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_444 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_252; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_445 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_253; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_446 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_254; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_447 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_255; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_448 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_256; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_449 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_257; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_450 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_258; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_451 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_259; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_452 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_260; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_453 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_261; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_454 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_262; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_455 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_263; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_456 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_264; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_457 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_265; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_458 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_266; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_459 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_267; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_460 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_268; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_461 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_269; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_462 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_270; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_463 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_271; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_464 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_272; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_465 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_273; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_466 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_274; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_467 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_275; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_468 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_276; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_469 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_277; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_470 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_278; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_471 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_279; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_472 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_280; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_473 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_281; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_474 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_282; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_475 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_283; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_476 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_284; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_477 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_285; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_478 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_286; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_479 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_287; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_480 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_288; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_481 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_289; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_482 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_290; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_483 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_291; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_484 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_292; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_485 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_293; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_486 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_294; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_487 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_295; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_488 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_296; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_489 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_297; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_490 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_298; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_491 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_299; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_492 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_300; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_493 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_301; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_494 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_302; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_495 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_303; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_496 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_304; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_497 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_305; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_498 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_306; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_499 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_307; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_500 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_308; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_501 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_309; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_502 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_310; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_503 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_311; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_504 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_312; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_505 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_313; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_506 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_314; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_507 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_315; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_508 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_316; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_509 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_317; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_510 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_318; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_511 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_319; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_512 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_320; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_513 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_321; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_514 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_322; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_515 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_323; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_516 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_324; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_517 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_325; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_518 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_326; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_519 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_327; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_520 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_328; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_521 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_329; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_522 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_330; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_523 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_331; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_524 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_332; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_525 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_333; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_526 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_334; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_527 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_335; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_528 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_336; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_529 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_337; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_530 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_338; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_531 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_339; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_532 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_340; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_533 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_341; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_534 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_342; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_535 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_343; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_536 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_344; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_537 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_345; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_538 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_346; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_539 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_347; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_540 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_348; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_541 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_349; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_542 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_350; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_543 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_351; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_544 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_352; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_545 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_353; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_546 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_354; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_547 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_355; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_548 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_356; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_549 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_357; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_550 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_358; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_551 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_359; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_552 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_360; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_553 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_361; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_554 = 4'ha == writeIdx_1 ? io_enq_1_bits_pc : _GEN_362; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_555 = 4'hb == writeIdx_1 ? io_enq_1_bits_pc : _GEN_363; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_556 = 4'hc == writeIdx_1 ? io_enq_1_bits_pc : _GEN_364; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_557 = 4'hd == writeIdx_1 ? io_enq_1_bits_pc : _GEN_365; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_558 = 4'he == writeIdx_1 ? io_enq_1_bits_pc : _GEN_366; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_559 = 4'hf == writeIdx_1 ? io_enq_1_bits_pc : _GEN_367; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_560 = 4'h0 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_368; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_561 = 4'h1 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_369; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_562 = 4'h2 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_370; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_563 = 4'h3 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_371; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_564 = 4'h4 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_372; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_565 = 4'h5 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_373; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_566 = 4'h6 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_374; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_567 = 4'h7 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_375; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_568 = 4'h8 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_376; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_569 = 4'h9 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_377; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_570 = 4'ha == writeIdx_1 ? io_enq_1_bits_instr : _GEN_378; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_571 = 4'hb == writeIdx_1 ? io_enq_1_bits_instr : _GEN_379; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_572 = 4'hc == writeIdx_1 ? io_enq_1_bits_instr : _GEN_380; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_573 = 4'hd == writeIdx_1 ? io_enq_1_bits_instr : _GEN_381; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_574 = 4'he == writeIdx_1 ? io_enq_1_bits_instr : _GEN_382; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_575 = 4'hf == writeIdx_1 ? io_enq_1_bits_instr : _GEN_383; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_624 = _T_21 ? _GEN_432 : _GEN_240; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_625 = _T_21 ? _GEN_433 : _GEN_241; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_626 = _T_21 ? _GEN_434 : _GEN_242; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_627 = _T_21 ? _GEN_435 : _GEN_243; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_628 = _T_21 ? _GEN_436 : _GEN_244; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_629 = _T_21 ? _GEN_437 : _GEN_245; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_630 = _T_21 ? _GEN_438 : _GEN_246; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_631 = _T_21 ? _GEN_439 : _GEN_247; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_632 = _T_21 ? _GEN_440 : _GEN_248; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_633 = _T_21 ? _GEN_441 : _GEN_249; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_634 = _T_21 ? _GEN_442 : _GEN_250; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_635 = _T_21 ? _GEN_443 : _GEN_251; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_636 = _T_21 ? _GEN_444 : _GEN_252; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_637 = _T_21 ? _GEN_445 : _GEN_253; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_638 = _T_21 ? _GEN_446 : _GEN_254; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_639 = _T_21 ? _GEN_447 : _GEN_255; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_640 = _T_21 ? _GEN_448 : _GEN_256; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_641 = _T_21 ? _GEN_449 : _GEN_257; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_642 = _T_21 ? _GEN_450 : _GEN_258; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_643 = _T_21 ? _GEN_451 : _GEN_259; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_644 = _T_21 ? _GEN_452 : _GEN_260; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_645 = _T_21 ? _GEN_453 : _GEN_261; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_646 = _T_21 ? _GEN_454 : _GEN_262; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_647 = _T_21 ? _GEN_455 : _GEN_263; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_648 = _T_21 ? _GEN_456 : _GEN_264; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_649 = _T_21 ? _GEN_457 : _GEN_265; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_650 = _T_21 ? _GEN_458 : _GEN_266; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_651 = _T_21 ? _GEN_459 : _GEN_267; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_652 = _T_21 ? _GEN_460 : _GEN_268; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_653 = _T_21 ? _GEN_461 : _GEN_269; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_654 = _T_21 ? _GEN_462 : _GEN_270; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_655 = _T_21 ? _GEN_463 : _GEN_271; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_656 = _T_21 ? _GEN_464 : _GEN_272; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_657 = _T_21 ? _GEN_465 : _GEN_273; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_658 = _T_21 ? _GEN_466 : _GEN_274; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_659 = _T_21 ? _GEN_467 : _GEN_275; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_660 = _T_21 ? _GEN_468 : _GEN_276; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_661 = _T_21 ? _GEN_469 : _GEN_277; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_662 = _T_21 ? _GEN_470 : _GEN_278; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_663 = _T_21 ? _GEN_471 : _GEN_279; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_664 = _T_21 ? _GEN_472 : _GEN_280; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_665 = _T_21 ? _GEN_473 : _GEN_281; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_666 = _T_21 ? _GEN_474 : _GEN_282; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_667 = _T_21 ? _GEN_475 : _GEN_283; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_668 = _T_21 ? _GEN_476 : _GEN_284; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_669 = _T_21 ? _GEN_477 : _GEN_285; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_670 = _T_21 ? _GEN_478 : _GEN_286; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_671 = _T_21 ? _GEN_479 : _GEN_287; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_672 = _T_21 ? _GEN_480 : _GEN_288; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_673 = _T_21 ? _GEN_481 : _GEN_289; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_674 = _T_21 ? _GEN_482 : _GEN_290; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_675 = _T_21 ? _GEN_483 : _GEN_291; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_676 = _T_21 ? _GEN_484 : _GEN_292; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_677 = _T_21 ? _GEN_485 : _GEN_293; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_678 = _T_21 ? _GEN_486 : _GEN_294; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_679 = _T_21 ? _GEN_487 : _GEN_295; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_680 = _T_21 ? _GEN_488 : _GEN_296; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_681 = _T_21 ? _GEN_489 : _GEN_297; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_682 = _T_21 ? _GEN_490 : _GEN_298; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_683 = _T_21 ? _GEN_491 : _GEN_299; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_684 = _T_21 ? _GEN_492 : _GEN_300; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_685 = _T_21 ? _GEN_493 : _GEN_301; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_686 = _T_21 ? _GEN_494 : _GEN_302; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_687 = _T_21 ? _GEN_495 : _GEN_303; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_688 = _T_21 ? _GEN_496 : _GEN_304; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_689 = _T_21 ? _GEN_497 : _GEN_305; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_690 = _T_21 ? _GEN_498 : _GEN_306; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_691 = _T_21 ? _GEN_499 : _GEN_307; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_692 = _T_21 ? _GEN_500 : _GEN_308; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_693 = _T_21 ? _GEN_501 : _GEN_309; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_694 = _T_21 ? _GEN_502 : _GEN_310; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_695 = _T_21 ? _GEN_503 : _GEN_311; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_696 = _T_21 ? _GEN_504 : _GEN_312; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_697 = _T_21 ? _GEN_505 : _GEN_313; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_698 = _T_21 ? _GEN_506 : _GEN_314; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_699 = _T_21 ? _GEN_507 : _GEN_315; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_700 = _T_21 ? _GEN_508 : _GEN_316; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_701 = _T_21 ? _GEN_509 : _GEN_317; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_702 = _T_21 ? _GEN_510 : _GEN_318; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_703 = _T_21 ? _GEN_511 : _GEN_319; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_704 = _T_21 ? _GEN_512 : _GEN_320; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_705 = _T_21 ? _GEN_513 : _GEN_321; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_706 = _T_21 ? _GEN_514 : _GEN_322; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_707 = _T_21 ? _GEN_515 : _GEN_323; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_708 = _T_21 ? _GEN_516 : _GEN_324; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_709 = _T_21 ? _GEN_517 : _GEN_325; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_710 = _T_21 ? _GEN_518 : _GEN_326; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_711 = _T_21 ? _GEN_519 : _GEN_327; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_712 = _T_21 ? _GEN_520 : _GEN_328; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_713 = _T_21 ? _GEN_521 : _GEN_329; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_714 = _T_21 ? _GEN_522 : _GEN_330; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_715 = _T_21 ? _GEN_523 : _GEN_331; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_716 = _T_21 ? _GEN_524 : _GEN_332; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_717 = _T_21 ? _GEN_525 : _GEN_333; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_718 = _T_21 ? _GEN_526 : _GEN_334; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_719 = _T_21 ? _GEN_527 : _GEN_335; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_720 = _T_21 ? _GEN_528 : _GEN_336; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_721 = _T_21 ? _GEN_529 : _GEN_337; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_722 = _T_21 ? _GEN_530 : _GEN_338; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_723 = _T_21 ? _GEN_531 : _GEN_339; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_724 = _T_21 ? _GEN_532 : _GEN_340; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_725 = _T_21 ? _GEN_533 : _GEN_341; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_726 = _T_21 ? _GEN_534 : _GEN_342; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_727 = _T_21 ? _GEN_535 : _GEN_343; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_728 = _T_21 ? _GEN_536 : _GEN_344; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_729 = _T_21 ? _GEN_537 : _GEN_345; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_730 = _T_21 ? _GEN_538 : _GEN_346; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_731 = _T_21 ? _GEN_539 : _GEN_347; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_732 = _T_21 ? _GEN_540 : _GEN_348; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_733 = _T_21 ? _GEN_541 : _GEN_349; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_734 = _T_21 ? _GEN_542 : _GEN_350; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_735 = _T_21 ? _GEN_543 : _GEN_351; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_736 = _T_21 ? _GEN_544 : _GEN_352; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_737 = _T_21 ? _GEN_545 : _GEN_353; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_738 = _T_21 ? _GEN_546 : _GEN_354; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_739 = _T_21 ? _GEN_547 : _GEN_355; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_740 = _T_21 ? _GEN_548 : _GEN_356; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_741 = _T_21 ? _GEN_549 : _GEN_357; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_742 = _T_21 ? _GEN_550 : _GEN_358; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_743 = _T_21 ? _GEN_551 : _GEN_359; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_744 = _T_21 ? _GEN_552 : _GEN_360; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_745 = _T_21 ? _GEN_553 : _GEN_361; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_746 = _T_21 ? _GEN_554 : _GEN_362; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_747 = _T_21 ? _GEN_555 : _GEN_363; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_748 = _T_21 ? _GEN_556 : _GEN_364; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_749 = _T_21 ? _GEN_557 : _GEN_365; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_750 = _T_21 ? _GEN_558 : _GEN_366; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_751 = _T_21 ? _GEN_559 : _GEN_367; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_752 = _T_21 ? _GEN_560 : _GEN_368; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_753 = _T_21 ? _GEN_561 : _GEN_369; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_754 = _T_21 ? _GEN_562 : _GEN_370; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_755 = _T_21 ? _GEN_563 : _GEN_371; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_756 = _T_21 ? _GEN_564 : _GEN_372; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_757 = _T_21 ? _GEN_565 : _GEN_373; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_758 = _T_21 ? _GEN_566 : _GEN_374; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_759 = _T_21 ? _GEN_567 : _GEN_375; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_760 = _T_21 ? _GEN_568 : _GEN_376; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_761 = _T_21 ? _GEN_569 : _GEN_377; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_762 = _T_21 ? _GEN_570 : _GEN_378; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_763 = _T_21 ? _GEN_571 : _GEN_379; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_764 = _T_21 ? _GEN_572 : _GEN_380; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_765 = _T_21 ? _GEN_573 : _GEN_381; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_766 = _T_21 ? _GEN_574 : _GEN_382; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_767 = _T_21 ? _GEN_575 : _GEN_383; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [5:0] _canEnq_T_2 = count + 5'h2; // @[src/main/scala/util/CircularQueue.scala 184:26]
  wire  canEnq_2 = _canEnq_T_2 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 184:34]
  wire  _T_22 = io_enq_2_ready & io_enq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_2 = enqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 191:36]
  wire  _GEN_816 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_817 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_818 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_819 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_820 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_821 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_822 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_823 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_824 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_825 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_826 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_827 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_828 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_829 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_830 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_831 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_832 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_833 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_834 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_835 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_836 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_837 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_838 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_839 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_840 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_841 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_842 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_843 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_844 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_845 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_846 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_847 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_848 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_849 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_850 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_851 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_852 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_853 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_854 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_855 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_856 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_857 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_858 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_859 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_860 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_861 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_862 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_863 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_864 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_865 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_866 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_867 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_868 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_869 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_870 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_871 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_872 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_873 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_874 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_875 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_876 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_877 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_878 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_879 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_880 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_881 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_882 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_883 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_884 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_885 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_886 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_887 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_888 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_889 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_890 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_891 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_892 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_893 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_894 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_895 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_896 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_897 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_898 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_899 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_900 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_901 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_902 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_903 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_904 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_905 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_906 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_907 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_908 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_909 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_910 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_911 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_912 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_913 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_914 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_915 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_916 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_917 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_918 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_919 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_920 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_921 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_922 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_923 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_924 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_925 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_926 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_927 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_928 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_929 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_930 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_931 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_932 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_933 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_934 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_935 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_936 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_937 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_938 = 4'ha == writeIdx_2 ? io_enq_2_bits_pc : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_939 = 4'hb == writeIdx_2 ? io_enq_2_bits_pc : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_940 = 4'hc == writeIdx_2 ? io_enq_2_bits_pc : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_941 = 4'hd == writeIdx_2 ? io_enq_2_bits_pc : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_942 = 4'he == writeIdx_2 ? io_enq_2_bits_pc : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_943 = 4'hf == writeIdx_2 ? io_enq_2_bits_pc : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_944 = 4'h0 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_945 = 4'h1 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_946 = 4'h2 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_947 = 4'h3 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_948 = 4'h4 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_949 = 4'h5 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_950 = 4'h6 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_951 = 4'h7 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_952 = 4'h8 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_953 = 4'h9 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_954 = 4'ha == writeIdx_2 ? io_enq_2_bits_instr : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_955 = 4'hb == writeIdx_2 ? io_enq_2_bits_instr : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_956 = 4'hc == writeIdx_2 ? io_enq_2_bits_instr : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_957 = 4'hd == writeIdx_2 ? io_enq_2_bits_instr : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_958 = 4'he == writeIdx_2 ? io_enq_2_bits_instr : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_959 = 4'hf == writeIdx_2 ? io_enq_2_bits_instr : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1008 = _T_22 ? _GEN_816 : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1009 = _T_22 ? _GEN_817 : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1010 = _T_22 ? _GEN_818 : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1011 = _T_22 ? _GEN_819 : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1012 = _T_22 ? _GEN_820 : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1013 = _T_22 ? _GEN_821 : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1014 = _T_22 ? _GEN_822 : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1015 = _T_22 ? _GEN_823 : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1016 = _T_22 ? _GEN_824 : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1017 = _T_22 ? _GEN_825 : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1018 = _T_22 ? _GEN_826 : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1019 = _T_22 ? _GEN_827 : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1020 = _T_22 ? _GEN_828 : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1021 = _T_22 ? _GEN_829 : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1022 = _T_22 ? _GEN_830 : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1023 = _T_22 ? _GEN_831 : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1024 = _T_22 ? _GEN_832 : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1025 = _T_22 ? _GEN_833 : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1026 = _T_22 ? _GEN_834 : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1027 = _T_22 ? _GEN_835 : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1028 = _T_22 ? _GEN_836 : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1029 = _T_22 ? _GEN_837 : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1030 = _T_22 ? _GEN_838 : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1031 = _T_22 ? _GEN_839 : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1032 = _T_22 ? _GEN_840 : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1033 = _T_22 ? _GEN_841 : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1034 = _T_22 ? _GEN_842 : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1035 = _T_22 ? _GEN_843 : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1036 = _T_22 ? _GEN_844 : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1037 = _T_22 ? _GEN_845 : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1038 = _T_22 ? _GEN_846 : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1039 = _T_22 ? _GEN_847 : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1040 = _T_22 ? _GEN_848 : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1041 = _T_22 ? _GEN_849 : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1042 = _T_22 ? _GEN_850 : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1043 = _T_22 ? _GEN_851 : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1044 = _T_22 ? _GEN_852 : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1045 = _T_22 ? _GEN_853 : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1046 = _T_22 ? _GEN_854 : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1047 = _T_22 ? _GEN_855 : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1048 = _T_22 ? _GEN_856 : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1049 = _T_22 ? _GEN_857 : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1050 = _T_22 ? _GEN_858 : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1051 = _T_22 ? _GEN_859 : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1052 = _T_22 ? _GEN_860 : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1053 = _T_22 ? _GEN_861 : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1054 = _T_22 ? _GEN_862 : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1055 = _T_22 ? _GEN_863 : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1056 = _T_22 ? _GEN_864 : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1057 = _T_22 ? _GEN_865 : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1058 = _T_22 ? _GEN_866 : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1059 = _T_22 ? _GEN_867 : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1060 = _T_22 ? _GEN_868 : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1061 = _T_22 ? _GEN_869 : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1062 = _T_22 ? _GEN_870 : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1063 = _T_22 ? _GEN_871 : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1064 = _T_22 ? _GEN_872 : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1065 = _T_22 ? _GEN_873 : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1066 = _T_22 ? _GEN_874 : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1067 = _T_22 ? _GEN_875 : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1068 = _T_22 ? _GEN_876 : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1069 = _T_22 ? _GEN_877 : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1070 = _T_22 ? _GEN_878 : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1071 = _T_22 ? _GEN_879 : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1072 = _T_22 ? _GEN_880 : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1073 = _T_22 ? _GEN_881 : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1074 = _T_22 ? _GEN_882 : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1075 = _T_22 ? _GEN_883 : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1076 = _T_22 ? _GEN_884 : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1077 = _T_22 ? _GEN_885 : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1078 = _T_22 ? _GEN_886 : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1079 = _T_22 ? _GEN_887 : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1080 = _T_22 ? _GEN_888 : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1081 = _T_22 ? _GEN_889 : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1082 = _T_22 ? _GEN_890 : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1083 = _T_22 ? _GEN_891 : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1084 = _T_22 ? _GEN_892 : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1085 = _T_22 ? _GEN_893 : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1086 = _T_22 ? _GEN_894 : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1087 = _T_22 ? _GEN_895 : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1088 = _T_22 ? _GEN_896 : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1089 = _T_22 ? _GEN_897 : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1090 = _T_22 ? _GEN_898 : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1091 = _T_22 ? _GEN_899 : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1092 = _T_22 ? _GEN_900 : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1093 = _T_22 ? _GEN_901 : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1094 = _T_22 ? _GEN_902 : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1095 = _T_22 ? _GEN_903 : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1096 = _T_22 ? _GEN_904 : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1097 = _T_22 ? _GEN_905 : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1098 = _T_22 ? _GEN_906 : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1099 = _T_22 ? _GEN_907 : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1100 = _T_22 ? _GEN_908 : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1101 = _T_22 ? _GEN_909 : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1102 = _T_22 ? _GEN_910 : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1103 = _T_22 ? _GEN_911 : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1104 = _T_22 ? _GEN_912 : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1105 = _T_22 ? _GEN_913 : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1106 = _T_22 ? _GEN_914 : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1107 = _T_22 ? _GEN_915 : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1108 = _T_22 ? _GEN_916 : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1109 = _T_22 ? _GEN_917 : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1110 = _T_22 ? _GEN_918 : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1111 = _T_22 ? _GEN_919 : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1112 = _T_22 ? _GEN_920 : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1113 = _T_22 ? _GEN_921 : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1114 = _T_22 ? _GEN_922 : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1115 = _T_22 ? _GEN_923 : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1116 = _T_22 ? _GEN_924 : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1117 = _T_22 ? _GEN_925 : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1118 = _T_22 ? _GEN_926 : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1119 = _T_22 ? _GEN_927 : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1120 = _T_22 ? _GEN_928 : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1121 = _T_22 ? _GEN_929 : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1122 = _T_22 ? _GEN_930 : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1123 = _T_22 ? _GEN_931 : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1124 = _T_22 ? _GEN_932 : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1125 = _T_22 ? _GEN_933 : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1126 = _T_22 ? _GEN_934 : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1127 = _T_22 ? _GEN_935 : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1128 = _T_22 ? _GEN_936 : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1129 = _T_22 ? _GEN_937 : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1130 = _T_22 ? _GEN_938 : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1131 = _T_22 ? _GEN_939 : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1132 = _T_22 ? _GEN_940 : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1133 = _T_22 ? _GEN_941 : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1134 = _T_22 ? _GEN_942 : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1135 = _T_22 ? _GEN_943 : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1136 = _T_22 ? _GEN_944 : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1137 = _T_22 ? _GEN_945 : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1138 = _T_22 ? _GEN_946 : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1139 = _T_22 ? _GEN_947 : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1140 = _T_22 ? _GEN_948 : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1141 = _T_22 ? _GEN_949 : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1142 = _T_22 ? _GEN_950 : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1143 = _T_22 ? _GEN_951 : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1144 = _T_22 ? _GEN_952 : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1145 = _T_22 ? _GEN_953 : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1146 = _T_22 ? _GEN_954 : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1147 = _T_22 ? _GEN_955 : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1148 = _T_22 ? _GEN_956 : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1149 = _T_22 ? _GEN_957 : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1150 = _T_22 ? _GEN_958 : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1151 = _T_22 ? _GEN_959 : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [5:0] _canEnq_T_3 = count + 5'h3; // @[src/main/scala/util/CircularQueue.scala 184:26]
  wire  canEnq_3 = _canEnq_T_3 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 184:34]
  wire  _T_23 = io_enq_3_ready & io_enq_3_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_3 = enqPtr_value + 4'h3; // @[src/main/scala/util/CircularQueue.scala 191:36]
  wire  _GEN_1200 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1008; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1201 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1009; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1202 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1010; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1203 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1011; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1204 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1012; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1205 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1013; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1206 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1014; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1207 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1015; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1208 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1016; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1209 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1017; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1210 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1018; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1211 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1019; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1212 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1020; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1213 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1021; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1214 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1022; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1215 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_valid : _GEN_1023; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1216 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1024; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1217 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1025; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1218 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1026; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1219 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1027; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1220 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1028; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1221 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1029; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1222 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1030; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1223 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1031; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1224 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1032; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1225 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1033; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1226 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1034; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1227 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1035; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1228 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1036; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1229 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1037; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1230 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1038; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1231 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_isBr : _GEN_1039; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1232 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1040; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1233 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1041; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1234 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1042; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1235 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1043; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1236 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1044; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1237 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1045; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1238 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1046; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1239 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1047; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1240 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1048; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1241 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1049; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1242 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1050; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1243 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1051; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1244 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1052; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1245 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1053; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1246 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1054; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1247 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_isJal : _GEN_1055; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1248 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1056; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1249 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1057; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1250 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1058; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1251 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1059; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1252 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1060; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1253 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1061; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1254 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1062; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1255 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1063; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1256 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1064; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1257 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1065; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1258 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1066; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1259 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1067; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1260 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1068; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1261 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1069; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1262 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1070; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1263 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_isJalr : _GEN_1071; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1264 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1072; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1265 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1073; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1266 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1074; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1267 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1075; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1268 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1076; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1269 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1077; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1270 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1078; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1271 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1079; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1272 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1080; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1273 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1081; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1274 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1082; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1275 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1083; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1276 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1084; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1277 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1085; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1278 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1086; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1279 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_isCall : _GEN_1087; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1280 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1088; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1281 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1089; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1282 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1090; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1283 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1091; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1284 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1092; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1285 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1093; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1286 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1094; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1287 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1095; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1288 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1096; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1289 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1097; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1290 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1098; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1291 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1099; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1292 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1100; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1293 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1101; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1294 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1102; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1295 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_isRet : _GEN_1103; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1296 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1104; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1297 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1105; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1298 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1106; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1299 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1107; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1300 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1108; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1301 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1109; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1302 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1110; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1303 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1111; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1304 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1112; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1305 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1113; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1306 = 4'ha == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1114; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1307 = 4'hb == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1115; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1308 = 4'hc == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1116; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1309 = 4'hd == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1117; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1310 = 4'he == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1118; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1311 = 4'hf == writeIdx_3 ? io_enq_3_bits_pdInfo_jumpTarget : _GEN_1119; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1312 = 4'h0 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1120; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1313 = 4'h1 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1121; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1314 = 4'h2 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1122; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1315 = 4'h3 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1123; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1316 = 4'h4 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1124; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1317 = 4'h5 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1125; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1318 = 4'h6 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1126; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1319 = 4'h7 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1127; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1320 = 4'h8 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1128; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1321 = 4'h9 == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1129; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1322 = 4'ha == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1130; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1323 = 4'hb == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1131; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1324 = 4'hc == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1132; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1325 = 4'hd == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1133; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1326 = 4'he == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1134; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1327 = 4'hf == writeIdx_3 ? io_enq_3_bits_pc : _GEN_1135; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1328 = 4'h0 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1136; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1329 = 4'h1 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1137; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1330 = 4'h2 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1138; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1331 = 4'h3 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1139; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1332 = 4'h4 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1140; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1333 = 4'h5 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1141; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1334 = 4'h6 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1142; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1335 = 4'h7 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1143; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1336 = 4'h8 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1144; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1337 = 4'h9 == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1145; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1338 = 4'ha == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1146; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1339 = 4'hb == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1147; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1340 = 4'hc == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1148; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1341 = 4'hd == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1149; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1342 = 4'he == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1150; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire [31:0] _GEN_1343 = 4'hf == writeIdx_3 ? io_enq_3_bits_instr : _GEN_1151; // @[src/main/scala/util/CircularQueue.scala 193:{22,22}]
  wire  _GEN_1392 = _T_23 ? _GEN_1200 : _GEN_1008; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1393 = _T_23 ? _GEN_1201 : _GEN_1009; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1394 = _T_23 ? _GEN_1202 : _GEN_1010; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1395 = _T_23 ? _GEN_1203 : _GEN_1011; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1396 = _T_23 ? _GEN_1204 : _GEN_1012; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1397 = _T_23 ? _GEN_1205 : _GEN_1013; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1398 = _T_23 ? _GEN_1206 : _GEN_1014; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1399 = _T_23 ? _GEN_1207 : _GEN_1015; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1400 = _T_23 ? _GEN_1208 : _GEN_1016; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1401 = _T_23 ? _GEN_1209 : _GEN_1017; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1402 = _T_23 ? _GEN_1210 : _GEN_1018; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1403 = _T_23 ? _GEN_1211 : _GEN_1019; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1404 = _T_23 ? _GEN_1212 : _GEN_1020; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1405 = _T_23 ? _GEN_1213 : _GEN_1021; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1406 = _T_23 ? _GEN_1214 : _GEN_1022; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1407 = _T_23 ? _GEN_1215 : _GEN_1023; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1408 = _T_23 ? _GEN_1216 : _GEN_1024; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1409 = _T_23 ? _GEN_1217 : _GEN_1025; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1410 = _T_23 ? _GEN_1218 : _GEN_1026; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1411 = _T_23 ? _GEN_1219 : _GEN_1027; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1412 = _T_23 ? _GEN_1220 : _GEN_1028; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1413 = _T_23 ? _GEN_1221 : _GEN_1029; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1414 = _T_23 ? _GEN_1222 : _GEN_1030; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1415 = _T_23 ? _GEN_1223 : _GEN_1031; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1416 = _T_23 ? _GEN_1224 : _GEN_1032; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1417 = _T_23 ? _GEN_1225 : _GEN_1033; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1418 = _T_23 ? _GEN_1226 : _GEN_1034; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1419 = _T_23 ? _GEN_1227 : _GEN_1035; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1420 = _T_23 ? _GEN_1228 : _GEN_1036; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1421 = _T_23 ? _GEN_1229 : _GEN_1037; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1422 = _T_23 ? _GEN_1230 : _GEN_1038; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1423 = _T_23 ? _GEN_1231 : _GEN_1039; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1424 = _T_23 ? _GEN_1232 : _GEN_1040; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1425 = _T_23 ? _GEN_1233 : _GEN_1041; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1426 = _T_23 ? _GEN_1234 : _GEN_1042; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1427 = _T_23 ? _GEN_1235 : _GEN_1043; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1428 = _T_23 ? _GEN_1236 : _GEN_1044; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1429 = _T_23 ? _GEN_1237 : _GEN_1045; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1430 = _T_23 ? _GEN_1238 : _GEN_1046; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1431 = _T_23 ? _GEN_1239 : _GEN_1047; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1432 = _T_23 ? _GEN_1240 : _GEN_1048; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1433 = _T_23 ? _GEN_1241 : _GEN_1049; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1434 = _T_23 ? _GEN_1242 : _GEN_1050; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1435 = _T_23 ? _GEN_1243 : _GEN_1051; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1436 = _T_23 ? _GEN_1244 : _GEN_1052; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1437 = _T_23 ? _GEN_1245 : _GEN_1053; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1438 = _T_23 ? _GEN_1246 : _GEN_1054; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1439 = _T_23 ? _GEN_1247 : _GEN_1055; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1440 = _T_23 ? _GEN_1248 : _GEN_1056; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1441 = _T_23 ? _GEN_1249 : _GEN_1057; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1442 = _T_23 ? _GEN_1250 : _GEN_1058; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1443 = _T_23 ? _GEN_1251 : _GEN_1059; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1444 = _T_23 ? _GEN_1252 : _GEN_1060; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1445 = _T_23 ? _GEN_1253 : _GEN_1061; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1446 = _T_23 ? _GEN_1254 : _GEN_1062; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1447 = _T_23 ? _GEN_1255 : _GEN_1063; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1448 = _T_23 ? _GEN_1256 : _GEN_1064; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1449 = _T_23 ? _GEN_1257 : _GEN_1065; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1450 = _T_23 ? _GEN_1258 : _GEN_1066; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1451 = _T_23 ? _GEN_1259 : _GEN_1067; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1452 = _T_23 ? _GEN_1260 : _GEN_1068; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1453 = _T_23 ? _GEN_1261 : _GEN_1069; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1454 = _T_23 ? _GEN_1262 : _GEN_1070; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1455 = _T_23 ? _GEN_1263 : _GEN_1071; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1456 = _T_23 ? _GEN_1264 : _GEN_1072; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1457 = _T_23 ? _GEN_1265 : _GEN_1073; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1458 = _T_23 ? _GEN_1266 : _GEN_1074; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1459 = _T_23 ? _GEN_1267 : _GEN_1075; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1460 = _T_23 ? _GEN_1268 : _GEN_1076; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1461 = _T_23 ? _GEN_1269 : _GEN_1077; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1462 = _T_23 ? _GEN_1270 : _GEN_1078; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1463 = _T_23 ? _GEN_1271 : _GEN_1079; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1464 = _T_23 ? _GEN_1272 : _GEN_1080; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1465 = _T_23 ? _GEN_1273 : _GEN_1081; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1466 = _T_23 ? _GEN_1274 : _GEN_1082; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1467 = _T_23 ? _GEN_1275 : _GEN_1083; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1468 = _T_23 ? _GEN_1276 : _GEN_1084; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1469 = _T_23 ? _GEN_1277 : _GEN_1085; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1470 = _T_23 ? _GEN_1278 : _GEN_1086; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1471 = _T_23 ? _GEN_1279 : _GEN_1087; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1472 = _T_23 ? _GEN_1280 : _GEN_1088; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1473 = _T_23 ? _GEN_1281 : _GEN_1089; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1474 = _T_23 ? _GEN_1282 : _GEN_1090; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1475 = _T_23 ? _GEN_1283 : _GEN_1091; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1476 = _T_23 ? _GEN_1284 : _GEN_1092; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1477 = _T_23 ? _GEN_1285 : _GEN_1093; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1478 = _T_23 ? _GEN_1286 : _GEN_1094; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1479 = _T_23 ? _GEN_1287 : _GEN_1095; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1480 = _T_23 ? _GEN_1288 : _GEN_1096; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1481 = _T_23 ? _GEN_1289 : _GEN_1097; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1482 = _T_23 ? _GEN_1290 : _GEN_1098; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1483 = _T_23 ? _GEN_1291 : _GEN_1099; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1484 = _T_23 ? _GEN_1292 : _GEN_1100; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1485 = _T_23 ? _GEN_1293 : _GEN_1101; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1486 = _T_23 ? _GEN_1294 : _GEN_1102; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire  _GEN_1487 = _T_23 ? _GEN_1295 : _GEN_1103; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1488 = _T_23 ? _GEN_1296 : _GEN_1104; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1489 = _T_23 ? _GEN_1297 : _GEN_1105; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1490 = _T_23 ? _GEN_1298 : _GEN_1106; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1491 = _T_23 ? _GEN_1299 : _GEN_1107; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1492 = _T_23 ? _GEN_1300 : _GEN_1108; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1493 = _T_23 ? _GEN_1301 : _GEN_1109; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1494 = _T_23 ? _GEN_1302 : _GEN_1110; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1495 = _T_23 ? _GEN_1303 : _GEN_1111; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1496 = _T_23 ? _GEN_1304 : _GEN_1112; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1497 = _T_23 ? _GEN_1305 : _GEN_1113; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1498 = _T_23 ? _GEN_1306 : _GEN_1114; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1499 = _T_23 ? _GEN_1307 : _GEN_1115; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1500 = _T_23 ? _GEN_1308 : _GEN_1116; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1501 = _T_23 ? _GEN_1309 : _GEN_1117; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1502 = _T_23 ? _GEN_1310 : _GEN_1118; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1503 = _T_23 ? _GEN_1311 : _GEN_1119; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1504 = _T_23 ? _GEN_1312 : _GEN_1120; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1505 = _T_23 ? _GEN_1313 : _GEN_1121; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1506 = _T_23 ? _GEN_1314 : _GEN_1122; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1507 = _T_23 ? _GEN_1315 : _GEN_1123; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1508 = _T_23 ? _GEN_1316 : _GEN_1124; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1509 = _T_23 ? _GEN_1317 : _GEN_1125; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1510 = _T_23 ? _GEN_1318 : _GEN_1126; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1511 = _T_23 ? _GEN_1319 : _GEN_1127; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1512 = _T_23 ? _GEN_1320 : _GEN_1128; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1513 = _T_23 ? _GEN_1321 : _GEN_1129; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1514 = _T_23 ? _GEN_1322 : _GEN_1130; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1515 = _T_23 ? _GEN_1323 : _GEN_1131; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1516 = _T_23 ? _GEN_1324 : _GEN_1132; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1517 = _T_23 ? _GEN_1325 : _GEN_1133; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1518 = _T_23 ? _GEN_1326 : _GEN_1134; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1519 = _T_23 ? _GEN_1327 : _GEN_1135; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1520 = _T_23 ? _GEN_1328 : _GEN_1136; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1521 = _T_23 ? _GEN_1329 : _GEN_1137; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1522 = _T_23 ? _GEN_1330 : _GEN_1138; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1523 = _T_23 ? _GEN_1331 : _GEN_1139; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1524 = _T_23 ? _GEN_1332 : _GEN_1140; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1525 = _T_23 ? _GEN_1333 : _GEN_1141; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1526 = _T_23 ? _GEN_1334 : _GEN_1142; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1527 = _T_23 ? _GEN_1335 : _GEN_1143; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1528 = _T_23 ? _GEN_1336 : _GEN_1144; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1529 = _T_23 ? _GEN_1337 : _GEN_1145; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1530 = _T_23 ? _GEN_1338 : _GEN_1146; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1531 = _T_23 ? _GEN_1339 : _GEN_1147; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1532 = _T_23 ? _GEN_1340 : _GEN_1148; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1533 = _T_23 ? _GEN_1341 : _GEN_1149; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1534 = _T_23 ? _GEN_1342 : _GEN_1150; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [31:0] _GEN_1535 = _T_23 ? _GEN_1343 : _GEN_1151; // @[src/main/scala/util/CircularQueue.scala 188:27]
  wire [5:0] _canEnq_T_4 = count + 5'h4; // @[src/main/scala/util/CircularQueue.scala 184:26]
  wire  canEnq_4 = _canEnq_T_4 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 184:34]
  wire  _T_24 = io_enq_4_ready & io_enq_4_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_4 = enqPtr_value + 4'h4; // @[src/main/scala/util/CircularQueue.scala 191:36]
  wire [1:0] _enqFireCnt_T_5 = _T_20 + _T_21; // @[src/main/scala/util/CircularQueue.scala 199:25]
  wire [1:0] _enqFireCnt_T_7 = _T_23 + _T_24; // @[src/main/scala/util/CircularQueue.scala 199:25]
  wire [1:0] _GEN_4038 = {{1'd0}, _T_22}; // @[src/main/scala/util/CircularQueue.scala 199:25]
  wire [2:0] _enqFireCnt_T_9 = _GEN_4038 + _enqFireCnt_T_7; // @[src/main/scala/util/CircularQueue.scala 199:25]
  wire [2:0] enqFireCnt = _enqFireCnt_T_5 + _enqFireCnt_T_9[1:0]; // @[src/main/scala/util/CircularQueue.scala 199:25]
  wire [3:0] _GEN_4039 = {{1'd0}, enqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + _GEN_4039; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  canDeq = count > 5'h0; // @[src/main/scala/util/CircularQueue.scala 220:24]
  wire [4:0] _readIdx_T = {{1'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueue.scala 225:33]
  wire [3:0] readIdx = _readIdx_T[3:0]; // @[src/main/scala/util/CircularQueue.scala 225:33]
  wire [31:0] _GEN_1921 = 4'h1 == readIdx ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1922 = 4'h2 == readIdx ? data_2_instr : _GEN_1921; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1923 = 4'h3 == readIdx ? data_3_instr : _GEN_1922; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1924 = 4'h4 == readIdx ? data_4_instr : _GEN_1923; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1925 = 4'h5 == readIdx ? data_5_instr : _GEN_1924; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1926 = 4'h6 == readIdx ? data_6_instr : _GEN_1925; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1927 = 4'h7 == readIdx ? data_7_instr : _GEN_1926; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1928 = 4'h8 == readIdx ? data_8_instr : _GEN_1927; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1929 = 4'h9 == readIdx ? data_9_instr : _GEN_1928; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1930 = 4'ha == readIdx ? data_10_instr : _GEN_1929; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1931 = 4'hb == readIdx ? data_11_instr : _GEN_1930; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1932 = 4'hc == readIdx ? data_12_instr : _GEN_1931; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1933 = 4'hd == readIdx ? data_13_instr : _GEN_1932; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1934 = 4'he == readIdx ? data_14_instr : _GEN_1933; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1937 = 4'h1 == readIdx ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1938 = 4'h2 == readIdx ? data_2_pc : _GEN_1937; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1939 = 4'h3 == readIdx ? data_3_pc : _GEN_1938; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1940 = 4'h4 == readIdx ? data_4_pc : _GEN_1939; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1941 = 4'h5 == readIdx ? data_5_pc : _GEN_1940; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1942 = 4'h6 == readIdx ? data_6_pc : _GEN_1941; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1943 = 4'h7 == readIdx ? data_7_pc : _GEN_1942; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1944 = 4'h8 == readIdx ? data_8_pc : _GEN_1943; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1945 = 4'h9 == readIdx ? data_9_pc : _GEN_1944; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1946 = 4'ha == readIdx ? data_10_pc : _GEN_1945; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1947 = 4'hb == readIdx ? data_11_pc : _GEN_1946; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1948 = 4'hc == readIdx ? data_12_pc : _GEN_1947; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1949 = 4'hd == readIdx ? data_13_pc : _GEN_1948; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_1950 = 4'he == readIdx ? data_14_pc : _GEN_1949; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1953 = 4'h1 == readIdx ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1954 = 4'h2 == readIdx ? data_2_pdInfo_valid : _GEN_1953; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1955 = 4'h3 == readIdx ? data_3_pdInfo_valid : _GEN_1954; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1956 = 4'h4 == readIdx ? data_4_pdInfo_valid : _GEN_1955; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1957 = 4'h5 == readIdx ? data_5_pdInfo_valid : _GEN_1956; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1958 = 4'h6 == readIdx ? data_6_pdInfo_valid : _GEN_1957; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1959 = 4'h7 == readIdx ? data_7_pdInfo_valid : _GEN_1958; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1960 = 4'h8 == readIdx ? data_8_pdInfo_valid : _GEN_1959; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1961 = 4'h9 == readIdx ? data_9_pdInfo_valid : _GEN_1960; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1962 = 4'ha == readIdx ? data_10_pdInfo_valid : _GEN_1961; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1963 = 4'hb == readIdx ? data_11_pdInfo_valid : _GEN_1962; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1964 = 4'hc == readIdx ? data_12_pdInfo_valid : _GEN_1963; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1965 = 4'hd == readIdx ? data_13_pdInfo_valid : _GEN_1964; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1966 = 4'he == readIdx ? data_14_pdInfo_valid : _GEN_1965; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1969 = 4'h1 == readIdx ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1970 = 4'h2 == readIdx ? data_2_pdInfo_isBr : _GEN_1969; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1971 = 4'h3 == readIdx ? data_3_pdInfo_isBr : _GEN_1970; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1972 = 4'h4 == readIdx ? data_4_pdInfo_isBr : _GEN_1971; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1973 = 4'h5 == readIdx ? data_5_pdInfo_isBr : _GEN_1972; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1974 = 4'h6 == readIdx ? data_6_pdInfo_isBr : _GEN_1973; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1975 = 4'h7 == readIdx ? data_7_pdInfo_isBr : _GEN_1974; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1976 = 4'h8 == readIdx ? data_8_pdInfo_isBr : _GEN_1975; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1977 = 4'h9 == readIdx ? data_9_pdInfo_isBr : _GEN_1976; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1978 = 4'ha == readIdx ? data_10_pdInfo_isBr : _GEN_1977; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1979 = 4'hb == readIdx ? data_11_pdInfo_isBr : _GEN_1978; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1980 = 4'hc == readIdx ? data_12_pdInfo_isBr : _GEN_1979; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1981 = 4'hd == readIdx ? data_13_pdInfo_isBr : _GEN_1980; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1982 = 4'he == readIdx ? data_14_pdInfo_isBr : _GEN_1981; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1985 = 4'h1 == readIdx ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1986 = 4'h2 == readIdx ? data_2_pdInfo_isJal : _GEN_1985; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1987 = 4'h3 == readIdx ? data_3_pdInfo_isJal : _GEN_1986; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1988 = 4'h4 == readIdx ? data_4_pdInfo_isJal : _GEN_1987; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1989 = 4'h5 == readIdx ? data_5_pdInfo_isJal : _GEN_1988; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1990 = 4'h6 == readIdx ? data_6_pdInfo_isJal : _GEN_1989; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1991 = 4'h7 == readIdx ? data_7_pdInfo_isJal : _GEN_1990; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1992 = 4'h8 == readIdx ? data_8_pdInfo_isJal : _GEN_1991; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1993 = 4'h9 == readIdx ? data_9_pdInfo_isJal : _GEN_1992; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1994 = 4'ha == readIdx ? data_10_pdInfo_isJal : _GEN_1993; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1995 = 4'hb == readIdx ? data_11_pdInfo_isJal : _GEN_1994; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1996 = 4'hc == readIdx ? data_12_pdInfo_isJal : _GEN_1995; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1997 = 4'hd == readIdx ? data_13_pdInfo_isJal : _GEN_1996; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_1998 = 4'he == readIdx ? data_14_pdInfo_isJal : _GEN_1997; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2001 = 4'h1 == readIdx ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2002 = 4'h2 == readIdx ? data_2_pdInfo_isJalr : _GEN_2001; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2003 = 4'h3 == readIdx ? data_3_pdInfo_isJalr : _GEN_2002; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2004 = 4'h4 == readIdx ? data_4_pdInfo_isJalr : _GEN_2003; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2005 = 4'h5 == readIdx ? data_5_pdInfo_isJalr : _GEN_2004; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2006 = 4'h6 == readIdx ? data_6_pdInfo_isJalr : _GEN_2005; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2007 = 4'h7 == readIdx ? data_7_pdInfo_isJalr : _GEN_2006; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2008 = 4'h8 == readIdx ? data_8_pdInfo_isJalr : _GEN_2007; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2009 = 4'h9 == readIdx ? data_9_pdInfo_isJalr : _GEN_2008; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2010 = 4'ha == readIdx ? data_10_pdInfo_isJalr : _GEN_2009; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2011 = 4'hb == readIdx ? data_11_pdInfo_isJalr : _GEN_2010; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2012 = 4'hc == readIdx ? data_12_pdInfo_isJalr : _GEN_2011; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2013 = 4'hd == readIdx ? data_13_pdInfo_isJalr : _GEN_2012; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2014 = 4'he == readIdx ? data_14_pdInfo_isJalr : _GEN_2013; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2017 = 4'h1 == readIdx ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2018 = 4'h2 == readIdx ? data_2_pdInfo_isCall : _GEN_2017; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2019 = 4'h3 == readIdx ? data_3_pdInfo_isCall : _GEN_2018; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2020 = 4'h4 == readIdx ? data_4_pdInfo_isCall : _GEN_2019; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2021 = 4'h5 == readIdx ? data_5_pdInfo_isCall : _GEN_2020; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2022 = 4'h6 == readIdx ? data_6_pdInfo_isCall : _GEN_2021; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2023 = 4'h7 == readIdx ? data_7_pdInfo_isCall : _GEN_2022; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2024 = 4'h8 == readIdx ? data_8_pdInfo_isCall : _GEN_2023; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2025 = 4'h9 == readIdx ? data_9_pdInfo_isCall : _GEN_2024; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2026 = 4'ha == readIdx ? data_10_pdInfo_isCall : _GEN_2025; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2027 = 4'hb == readIdx ? data_11_pdInfo_isCall : _GEN_2026; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2028 = 4'hc == readIdx ? data_12_pdInfo_isCall : _GEN_2027; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2029 = 4'hd == readIdx ? data_13_pdInfo_isCall : _GEN_2028; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2030 = 4'he == readIdx ? data_14_pdInfo_isCall : _GEN_2029; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2033 = 4'h1 == readIdx ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2034 = 4'h2 == readIdx ? data_2_pdInfo_isRet : _GEN_2033; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2035 = 4'h3 == readIdx ? data_3_pdInfo_isRet : _GEN_2034; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2036 = 4'h4 == readIdx ? data_4_pdInfo_isRet : _GEN_2035; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2037 = 4'h5 == readIdx ? data_5_pdInfo_isRet : _GEN_2036; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2038 = 4'h6 == readIdx ? data_6_pdInfo_isRet : _GEN_2037; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2039 = 4'h7 == readIdx ? data_7_pdInfo_isRet : _GEN_2038; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2040 = 4'h8 == readIdx ? data_8_pdInfo_isRet : _GEN_2039; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2041 = 4'h9 == readIdx ? data_9_pdInfo_isRet : _GEN_2040; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2042 = 4'ha == readIdx ? data_10_pdInfo_isRet : _GEN_2041; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2043 = 4'hb == readIdx ? data_11_pdInfo_isRet : _GEN_2042; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2044 = 4'hc == readIdx ? data_12_pdInfo_isRet : _GEN_2043; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2045 = 4'hd == readIdx ? data_13_pdInfo_isRet : _GEN_2044; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2046 = 4'he == readIdx ? data_14_pdInfo_isRet : _GEN_2045; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2049 = 4'h1 == readIdx ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2050 = 4'h2 == readIdx ? data_2_pdInfo_jumpTarget : _GEN_2049; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2051 = 4'h3 == readIdx ? data_3_pdInfo_jumpTarget : _GEN_2050; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2052 = 4'h4 == readIdx ? data_4_pdInfo_jumpTarget : _GEN_2051; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2053 = 4'h5 == readIdx ? data_5_pdInfo_jumpTarget : _GEN_2052; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2054 = 4'h6 == readIdx ? data_6_pdInfo_jumpTarget : _GEN_2053; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2055 = 4'h7 == readIdx ? data_7_pdInfo_jumpTarget : _GEN_2054; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2056 = 4'h8 == readIdx ? data_8_pdInfo_jumpTarget : _GEN_2055; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2057 = 4'h9 == readIdx ? data_9_pdInfo_jumpTarget : _GEN_2056; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2058 = 4'ha == readIdx ? data_10_pdInfo_jumpTarget : _GEN_2057; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2059 = 4'hb == readIdx ? data_11_pdInfo_jumpTarget : _GEN_2058; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2060 = 4'hc == readIdx ? data_12_pdInfo_jumpTarget : _GEN_2059; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2061 = 4'hd == readIdx ? data_13_pdInfo_jumpTarget : _GEN_2060; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2062 = 4'he == readIdx ? data_14_pdInfo_jumpTarget : _GEN_2061; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  canDeq_1 = count > 5'h1; // @[src/main/scala/util/CircularQueue.scala 220:24]
  wire [3:0] readIdx_1 = deqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 225:33]
  wire [31:0] _GEN_2113 = 4'h1 == readIdx_1 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2114 = 4'h2 == readIdx_1 ? data_2_instr : _GEN_2113; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2115 = 4'h3 == readIdx_1 ? data_3_instr : _GEN_2114; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2116 = 4'h4 == readIdx_1 ? data_4_instr : _GEN_2115; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2117 = 4'h5 == readIdx_1 ? data_5_instr : _GEN_2116; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2118 = 4'h6 == readIdx_1 ? data_6_instr : _GEN_2117; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2119 = 4'h7 == readIdx_1 ? data_7_instr : _GEN_2118; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2120 = 4'h8 == readIdx_1 ? data_8_instr : _GEN_2119; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2121 = 4'h9 == readIdx_1 ? data_9_instr : _GEN_2120; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2122 = 4'ha == readIdx_1 ? data_10_instr : _GEN_2121; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2123 = 4'hb == readIdx_1 ? data_11_instr : _GEN_2122; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2124 = 4'hc == readIdx_1 ? data_12_instr : _GEN_2123; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2125 = 4'hd == readIdx_1 ? data_13_instr : _GEN_2124; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2126 = 4'he == readIdx_1 ? data_14_instr : _GEN_2125; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2129 = 4'h1 == readIdx_1 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2130 = 4'h2 == readIdx_1 ? data_2_pc : _GEN_2129; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2131 = 4'h3 == readIdx_1 ? data_3_pc : _GEN_2130; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2132 = 4'h4 == readIdx_1 ? data_4_pc : _GEN_2131; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2133 = 4'h5 == readIdx_1 ? data_5_pc : _GEN_2132; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2134 = 4'h6 == readIdx_1 ? data_6_pc : _GEN_2133; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2135 = 4'h7 == readIdx_1 ? data_7_pc : _GEN_2134; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2136 = 4'h8 == readIdx_1 ? data_8_pc : _GEN_2135; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2137 = 4'h9 == readIdx_1 ? data_9_pc : _GEN_2136; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2138 = 4'ha == readIdx_1 ? data_10_pc : _GEN_2137; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2139 = 4'hb == readIdx_1 ? data_11_pc : _GEN_2138; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2140 = 4'hc == readIdx_1 ? data_12_pc : _GEN_2139; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2141 = 4'hd == readIdx_1 ? data_13_pc : _GEN_2140; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2142 = 4'he == readIdx_1 ? data_14_pc : _GEN_2141; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2145 = 4'h1 == readIdx_1 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2146 = 4'h2 == readIdx_1 ? data_2_pdInfo_valid : _GEN_2145; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2147 = 4'h3 == readIdx_1 ? data_3_pdInfo_valid : _GEN_2146; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2148 = 4'h4 == readIdx_1 ? data_4_pdInfo_valid : _GEN_2147; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2149 = 4'h5 == readIdx_1 ? data_5_pdInfo_valid : _GEN_2148; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2150 = 4'h6 == readIdx_1 ? data_6_pdInfo_valid : _GEN_2149; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2151 = 4'h7 == readIdx_1 ? data_7_pdInfo_valid : _GEN_2150; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2152 = 4'h8 == readIdx_1 ? data_8_pdInfo_valid : _GEN_2151; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2153 = 4'h9 == readIdx_1 ? data_9_pdInfo_valid : _GEN_2152; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2154 = 4'ha == readIdx_1 ? data_10_pdInfo_valid : _GEN_2153; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2155 = 4'hb == readIdx_1 ? data_11_pdInfo_valid : _GEN_2154; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2156 = 4'hc == readIdx_1 ? data_12_pdInfo_valid : _GEN_2155; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2157 = 4'hd == readIdx_1 ? data_13_pdInfo_valid : _GEN_2156; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2158 = 4'he == readIdx_1 ? data_14_pdInfo_valid : _GEN_2157; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2161 = 4'h1 == readIdx_1 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2162 = 4'h2 == readIdx_1 ? data_2_pdInfo_isBr : _GEN_2161; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2163 = 4'h3 == readIdx_1 ? data_3_pdInfo_isBr : _GEN_2162; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2164 = 4'h4 == readIdx_1 ? data_4_pdInfo_isBr : _GEN_2163; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2165 = 4'h5 == readIdx_1 ? data_5_pdInfo_isBr : _GEN_2164; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2166 = 4'h6 == readIdx_1 ? data_6_pdInfo_isBr : _GEN_2165; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2167 = 4'h7 == readIdx_1 ? data_7_pdInfo_isBr : _GEN_2166; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2168 = 4'h8 == readIdx_1 ? data_8_pdInfo_isBr : _GEN_2167; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2169 = 4'h9 == readIdx_1 ? data_9_pdInfo_isBr : _GEN_2168; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2170 = 4'ha == readIdx_1 ? data_10_pdInfo_isBr : _GEN_2169; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2171 = 4'hb == readIdx_1 ? data_11_pdInfo_isBr : _GEN_2170; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2172 = 4'hc == readIdx_1 ? data_12_pdInfo_isBr : _GEN_2171; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2173 = 4'hd == readIdx_1 ? data_13_pdInfo_isBr : _GEN_2172; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2174 = 4'he == readIdx_1 ? data_14_pdInfo_isBr : _GEN_2173; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2177 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2178 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJal : _GEN_2177; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2179 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJal : _GEN_2178; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2180 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJal : _GEN_2179; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2181 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJal : _GEN_2180; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2182 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJal : _GEN_2181; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2183 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJal : _GEN_2182; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2184 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJal : _GEN_2183; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2185 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJal : _GEN_2184; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2186 = 4'ha == readIdx_1 ? data_10_pdInfo_isJal : _GEN_2185; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2187 = 4'hb == readIdx_1 ? data_11_pdInfo_isJal : _GEN_2186; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2188 = 4'hc == readIdx_1 ? data_12_pdInfo_isJal : _GEN_2187; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2189 = 4'hd == readIdx_1 ? data_13_pdInfo_isJal : _GEN_2188; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2190 = 4'he == readIdx_1 ? data_14_pdInfo_isJal : _GEN_2189; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2193 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2194 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJalr : _GEN_2193; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2195 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJalr : _GEN_2194; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2196 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJalr : _GEN_2195; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2197 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJalr : _GEN_2196; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2198 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJalr : _GEN_2197; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2199 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJalr : _GEN_2198; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2200 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJalr : _GEN_2199; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2201 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJalr : _GEN_2200; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2202 = 4'ha == readIdx_1 ? data_10_pdInfo_isJalr : _GEN_2201; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2203 = 4'hb == readIdx_1 ? data_11_pdInfo_isJalr : _GEN_2202; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2204 = 4'hc == readIdx_1 ? data_12_pdInfo_isJalr : _GEN_2203; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2205 = 4'hd == readIdx_1 ? data_13_pdInfo_isJalr : _GEN_2204; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2206 = 4'he == readIdx_1 ? data_14_pdInfo_isJalr : _GEN_2205; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2209 = 4'h1 == readIdx_1 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2210 = 4'h2 == readIdx_1 ? data_2_pdInfo_isCall : _GEN_2209; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2211 = 4'h3 == readIdx_1 ? data_3_pdInfo_isCall : _GEN_2210; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2212 = 4'h4 == readIdx_1 ? data_4_pdInfo_isCall : _GEN_2211; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2213 = 4'h5 == readIdx_1 ? data_5_pdInfo_isCall : _GEN_2212; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2214 = 4'h6 == readIdx_1 ? data_6_pdInfo_isCall : _GEN_2213; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2215 = 4'h7 == readIdx_1 ? data_7_pdInfo_isCall : _GEN_2214; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2216 = 4'h8 == readIdx_1 ? data_8_pdInfo_isCall : _GEN_2215; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2217 = 4'h9 == readIdx_1 ? data_9_pdInfo_isCall : _GEN_2216; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2218 = 4'ha == readIdx_1 ? data_10_pdInfo_isCall : _GEN_2217; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2219 = 4'hb == readIdx_1 ? data_11_pdInfo_isCall : _GEN_2218; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2220 = 4'hc == readIdx_1 ? data_12_pdInfo_isCall : _GEN_2219; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2221 = 4'hd == readIdx_1 ? data_13_pdInfo_isCall : _GEN_2220; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2222 = 4'he == readIdx_1 ? data_14_pdInfo_isCall : _GEN_2221; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2225 = 4'h1 == readIdx_1 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2226 = 4'h2 == readIdx_1 ? data_2_pdInfo_isRet : _GEN_2225; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2227 = 4'h3 == readIdx_1 ? data_3_pdInfo_isRet : _GEN_2226; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2228 = 4'h4 == readIdx_1 ? data_4_pdInfo_isRet : _GEN_2227; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2229 = 4'h5 == readIdx_1 ? data_5_pdInfo_isRet : _GEN_2228; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2230 = 4'h6 == readIdx_1 ? data_6_pdInfo_isRet : _GEN_2229; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2231 = 4'h7 == readIdx_1 ? data_7_pdInfo_isRet : _GEN_2230; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2232 = 4'h8 == readIdx_1 ? data_8_pdInfo_isRet : _GEN_2231; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2233 = 4'h9 == readIdx_1 ? data_9_pdInfo_isRet : _GEN_2232; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2234 = 4'ha == readIdx_1 ? data_10_pdInfo_isRet : _GEN_2233; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2235 = 4'hb == readIdx_1 ? data_11_pdInfo_isRet : _GEN_2234; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2236 = 4'hc == readIdx_1 ? data_12_pdInfo_isRet : _GEN_2235; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2237 = 4'hd == readIdx_1 ? data_13_pdInfo_isRet : _GEN_2236; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2238 = 4'he == readIdx_1 ? data_14_pdInfo_isRet : _GEN_2237; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2241 = 4'h1 == readIdx_1 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2242 = 4'h2 == readIdx_1 ? data_2_pdInfo_jumpTarget : _GEN_2241; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2243 = 4'h3 == readIdx_1 ? data_3_pdInfo_jumpTarget : _GEN_2242; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2244 = 4'h4 == readIdx_1 ? data_4_pdInfo_jumpTarget : _GEN_2243; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2245 = 4'h5 == readIdx_1 ? data_5_pdInfo_jumpTarget : _GEN_2244; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2246 = 4'h6 == readIdx_1 ? data_6_pdInfo_jumpTarget : _GEN_2245; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2247 = 4'h7 == readIdx_1 ? data_7_pdInfo_jumpTarget : _GEN_2246; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2248 = 4'h8 == readIdx_1 ? data_8_pdInfo_jumpTarget : _GEN_2247; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2249 = 4'h9 == readIdx_1 ? data_9_pdInfo_jumpTarget : _GEN_2248; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2250 = 4'ha == readIdx_1 ? data_10_pdInfo_jumpTarget : _GEN_2249; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2251 = 4'hb == readIdx_1 ? data_11_pdInfo_jumpTarget : _GEN_2250; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2252 = 4'hc == readIdx_1 ? data_12_pdInfo_jumpTarget : _GEN_2251; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2253 = 4'hd == readIdx_1 ? data_13_pdInfo_jumpTarget : _GEN_2252; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2254 = 4'he == readIdx_1 ? data_14_pdInfo_jumpTarget : _GEN_2253; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  canDeq_2 = count > 5'h2; // @[src/main/scala/util/CircularQueue.scala 220:24]
  wire [3:0] readIdx_2 = deqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 225:33]
  wire [31:0] _GEN_2305 = 4'h1 == readIdx_2 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2306 = 4'h2 == readIdx_2 ? data_2_instr : _GEN_2305; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2307 = 4'h3 == readIdx_2 ? data_3_instr : _GEN_2306; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2308 = 4'h4 == readIdx_2 ? data_4_instr : _GEN_2307; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2309 = 4'h5 == readIdx_2 ? data_5_instr : _GEN_2308; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2310 = 4'h6 == readIdx_2 ? data_6_instr : _GEN_2309; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2311 = 4'h7 == readIdx_2 ? data_7_instr : _GEN_2310; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2312 = 4'h8 == readIdx_2 ? data_8_instr : _GEN_2311; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2313 = 4'h9 == readIdx_2 ? data_9_instr : _GEN_2312; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2314 = 4'ha == readIdx_2 ? data_10_instr : _GEN_2313; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2315 = 4'hb == readIdx_2 ? data_11_instr : _GEN_2314; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2316 = 4'hc == readIdx_2 ? data_12_instr : _GEN_2315; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2317 = 4'hd == readIdx_2 ? data_13_instr : _GEN_2316; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2318 = 4'he == readIdx_2 ? data_14_instr : _GEN_2317; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2321 = 4'h1 == readIdx_2 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2322 = 4'h2 == readIdx_2 ? data_2_pc : _GEN_2321; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2323 = 4'h3 == readIdx_2 ? data_3_pc : _GEN_2322; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2324 = 4'h4 == readIdx_2 ? data_4_pc : _GEN_2323; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2325 = 4'h5 == readIdx_2 ? data_5_pc : _GEN_2324; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2326 = 4'h6 == readIdx_2 ? data_6_pc : _GEN_2325; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2327 = 4'h7 == readIdx_2 ? data_7_pc : _GEN_2326; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2328 = 4'h8 == readIdx_2 ? data_8_pc : _GEN_2327; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2329 = 4'h9 == readIdx_2 ? data_9_pc : _GEN_2328; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2330 = 4'ha == readIdx_2 ? data_10_pc : _GEN_2329; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2331 = 4'hb == readIdx_2 ? data_11_pc : _GEN_2330; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2332 = 4'hc == readIdx_2 ? data_12_pc : _GEN_2331; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2333 = 4'hd == readIdx_2 ? data_13_pc : _GEN_2332; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2334 = 4'he == readIdx_2 ? data_14_pc : _GEN_2333; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2337 = 4'h1 == readIdx_2 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2338 = 4'h2 == readIdx_2 ? data_2_pdInfo_valid : _GEN_2337; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2339 = 4'h3 == readIdx_2 ? data_3_pdInfo_valid : _GEN_2338; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2340 = 4'h4 == readIdx_2 ? data_4_pdInfo_valid : _GEN_2339; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2341 = 4'h5 == readIdx_2 ? data_5_pdInfo_valid : _GEN_2340; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2342 = 4'h6 == readIdx_2 ? data_6_pdInfo_valid : _GEN_2341; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2343 = 4'h7 == readIdx_2 ? data_7_pdInfo_valid : _GEN_2342; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2344 = 4'h8 == readIdx_2 ? data_8_pdInfo_valid : _GEN_2343; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2345 = 4'h9 == readIdx_2 ? data_9_pdInfo_valid : _GEN_2344; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2346 = 4'ha == readIdx_2 ? data_10_pdInfo_valid : _GEN_2345; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2347 = 4'hb == readIdx_2 ? data_11_pdInfo_valid : _GEN_2346; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2348 = 4'hc == readIdx_2 ? data_12_pdInfo_valid : _GEN_2347; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2349 = 4'hd == readIdx_2 ? data_13_pdInfo_valid : _GEN_2348; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2350 = 4'he == readIdx_2 ? data_14_pdInfo_valid : _GEN_2349; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2353 = 4'h1 == readIdx_2 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2354 = 4'h2 == readIdx_2 ? data_2_pdInfo_isBr : _GEN_2353; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2355 = 4'h3 == readIdx_2 ? data_3_pdInfo_isBr : _GEN_2354; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2356 = 4'h4 == readIdx_2 ? data_4_pdInfo_isBr : _GEN_2355; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2357 = 4'h5 == readIdx_2 ? data_5_pdInfo_isBr : _GEN_2356; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2358 = 4'h6 == readIdx_2 ? data_6_pdInfo_isBr : _GEN_2357; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2359 = 4'h7 == readIdx_2 ? data_7_pdInfo_isBr : _GEN_2358; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2360 = 4'h8 == readIdx_2 ? data_8_pdInfo_isBr : _GEN_2359; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2361 = 4'h9 == readIdx_2 ? data_9_pdInfo_isBr : _GEN_2360; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2362 = 4'ha == readIdx_2 ? data_10_pdInfo_isBr : _GEN_2361; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2363 = 4'hb == readIdx_2 ? data_11_pdInfo_isBr : _GEN_2362; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2364 = 4'hc == readIdx_2 ? data_12_pdInfo_isBr : _GEN_2363; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2365 = 4'hd == readIdx_2 ? data_13_pdInfo_isBr : _GEN_2364; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2366 = 4'he == readIdx_2 ? data_14_pdInfo_isBr : _GEN_2365; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2369 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2370 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJal : _GEN_2369; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2371 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJal : _GEN_2370; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2372 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJal : _GEN_2371; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2373 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJal : _GEN_2372; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2374 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJal : _GEN_2373; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2375 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJal : _GEN_2374; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2376 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJal : _GEN_2375; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2377 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJal : _GEN_2376; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2378 = 4'ha == readIdx_2 ? data_10_pdInfo_isJal : _GEN_2377; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2379 = 4'hb == readIdx_2 ? data_11_pdInfo_isJal : _GEN_2378; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2380 = 4'hc == readIdx_2 ? data_12_pdInfo_isJal : _GEN_2379; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2381 = 4'hd == readIdx_2 ? data_13_pdInfo_isJal : _GEN_2380; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2382 = 4'he == readIdx_2 ? data_14_pdInfo_isJal : _GEN_2381; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2385 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2386 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJalr : _GEN_2385; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2387 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJalr : _GEN_2386; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2388 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJalr : _GEN_2387; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2389 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJalr : _GEN_2388; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2390 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJalr : _GEN_2389; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2391 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJalr : _GEN_2390; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2392 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJalr : _GEN_2391; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2393 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJalr : _GEN_2392; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2394 = 4'ha == readIdx_2 ? data_10_pdInfo_isJalr : _GEN_2393; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2395 = 4'hb == readIdx_2 ? data_11_pdInfo_isJalr : _GEN_2394; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2396 = 4'hc == readIdx_2 ? data_12_pdInfo_isJalr : _GEN_2395; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2397 = 4'hd == readIdx_2 ? data_13_pdInfo_isJalr : _GEN_2396; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2398 = 4'he == readIdx_2 ? data_14_pdInfo_isJalr : _GEN_2397; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2401 = 4'h1 == readIdx_2 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2402 = 4'h2 == readIdx_2 ? data_2_pdInfo_isCall : _GEN_2401; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2403 = 4'h3 == readIdx_2 ? data_3_pdInfo_isCall : _GEN_2402; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2404 = 4'h4 == readIdx_2 ? data_4_pdInfo_isCall : _GEN_2403; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2405 = 4'h5 == readIdx_2 ? data_5_pdInfo_isCall : _GEN_2404; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2406 = 4'h6 == readIdx_2 ? data_6_pdInfo_isCall : _GEN_2405; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2407 = 4'h7 == readIdx_2 ? data_7_pdInfo_isCall : _GEN_2406; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2408 = 4'h8 == readIdx_2 ? data_8_pdInfo_isCall : _GEN_2407; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2409 = 4'h9 == readIdx_2 ? data_9_pdInfo_isCall : _GEN_2408; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2410 = 4'ha == readIdx_2 ? data_10_pdInfo_isCall : _GEN_2409; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2411 = 4'hb == readIdx_2 ? data_11_pdInfo_isCall : _GEN_2410; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2412 = 4'hc == readIdx_2 ? data_12_pdInfo_isCall : _GEN_2411; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2413 = 4'hd == readIdx_2 ? data_13_pdInfo_isCall : _GEN_2412; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2414 = 4'he == readIdx_2 ? data_14_pdInfo_isCall : _GEN_2413; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2417 = 4'h1 == readIdx_2 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2418 = 4'h2 == readIdx_2 ? data_2_pdInfo_isRet : _GEN_2417; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2419 = 4'h3 == readIdx_2 ? data_3_pdInfo_isRet : _GEN_2418; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2420 = 4'h4 == readIdx_2 ? data_4_pdInfo_isRet : _GEN_2419; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2421 = 4'h5 == readIdx_2 ? data_5_pdInfo_isRet : _GEN_2420; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2422 = 4'h6 == readIdx_2 ? data_6_pdInfo_isRet : _GEN_2421; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2423 = 4'h7 == readIdx_2 ? data_7_pdInfo_isRet : _GEN_2422; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2424 = 4'h8 == readIdx_2 ? data_8_pdInfo_isRet : _GEN_2423; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2425 = 4'h9 == readIdx_2 ? data_9_pdInfo_isRet : _GEN_2424; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2426 = 4'ha == readIdx_2 ? data_10_pdInfo_isRet : _GEN_2425; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2427 = 4'hb == readIdx_2 ? data_11_pdInfo_isRet : _GEN_2426; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2428 = 4'hc == readIdx_2 ? data_12_pdInfo_isRet : _GEN_2427; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2429 = 4'hd == readIdx_2 ? data_13_pdInfo_isRet : _GEN_2428; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _GEN_2430 = 4'he == readIdx_2 ? data_14_pdInfo_isRet : _GEN_2429; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2433 = 4'h1 == readIdx_2 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2434 = 4'h2 == readIdx_2 ? data_2_pdInfo_jumpTarget : _GEN_2433; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2435 = 4'h3 == readIdx_2 ? data_3_pdInfo_jumpTarget : _GEN_2434; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2436 = 4'h4 == readIdx_2 ? data_4_pdInfo_jumpTarget : _GEN_2435; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2437 = 4'h5 == readIdx_2 ? data_5_pdInfo_jumpTarget : _GEN_2436; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2438 = 4'h6 == readIdx_2 ? data_6_pdInfo_jumpTarget : _GEN_2437; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2439 = 4'h7 == readIdx_2 ? data_7_pdInfo_jumpTarget : _GEN_2438; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2440 = 4'h8 == readIdx_2 ? data_8_pdInfo_jumpTarget : _GEN_2439; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2441 = 4'h9 == readIdx_2 ? data_9_pdInfo_jumpTarget : _GEN_2440; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2442 = 4'ha == readIdx_2 ? data_10_pdInfo_jumpTarget : _GEN_2441; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2443 = 4'hb == readIdx_2 ? data_11_pdInfo_jumpTarget : _GEN_2442; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2444 = 4'hc == readIdx_2 ? data_12_pdInfo_jumpTarget : _GEN_2443; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2445 = 4'hd == readIdx_2 ? data_13_pdInfo_jumpTarget : _GEN_2444; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire [31:0] _GEN_2446 = 4'he == readIdx_2 ? data_14_pdInfo_jumpTarget : _GEN_2445; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  wire  _deqFireCnt_T = io_deq_0_ready & io_deq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_1 = io_deq_1_ready & io_deq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_2 = io_deq_2_ready & io_deq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _deqFireCnt_T_3 = _deqFireCnt_T_1 + _deqFireCnt_T_2; // @[src/main/scala/util/CircularQueue.scala 230:25]
  wire [1:0] _GEN_4040 = {{1'd0}, _deqFireCnt_T}; // @[src/main/scala/util/CircularQueue.scala 230:25]
  wire [2:0] _deqFireCnt_T_5 = _GEN_4040 + _deqFireCnt_T_3; // @[src/main/scala/util/CircularQueue.scala 230:25]
  wire [1:0] deqFireCnt = _deqFireCnt_T_5[1:0]; // @[src/main/scala/util/CircularQueue.scala 230:25]
  wire [3:0] _GEN_4041 = {{2'd0}, deqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] deqPtr_newIncValue = deqPtr_value + _GEN_4041; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  deqPtr_wrap = deqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] deqPtr_newPtr_value = deqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_enq_0_ready = canEnq & ~full; // @[src/main/scala/util/CircularQueue.scala 186:31]
  assign io_enq_1_ready = canEnq_1 & ~full; // @[src/main/scala/util/CircularQueue.scala 186:31]
  assign io_enq_2_ready = canEnq_2 & ~full; // @[src/main/scala/util/CircularQueue.scala 186:31]
  assign io_enq_3_ready = canEnq_3 & ~full; // @[src/main/scala/util/CircularQueue.scala 186:31]
  assign io_enq_4_ready = canEnq_4 & ~full; // @[src/main/scala/util/CircularQueue.scala 186:31]
  assign io_deq_0_valid = canDeq & ~empty; // @[src/main/scala/util/CircularQueue.scala 222:31]
  assign io_deq_0_bits_instr = 4'hf == readIdx ? data_15_instr : _GEN_1934; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pc = 4'hf == readIdx ? data_15_pc : _GEN_1950; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_valid = 4'hf == readIdx ? data_15_pdInfo_valid : _GEN_1966; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_isBr = 4'hf == readIdx ? data_15_pdInfo_isBr : _GEN_1982; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_isJal = 4'hf == readIdx ? data_15_pdInfo_isJal : _GEN_1998; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_isJalr = 4'hf == readIdx ? data_15_pdInfo_isJalr : _GEN_2014; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_isCall = 4'hf == readIdx ? data_15_pdInfo_isCall : _GEN_2030; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_isRet = 4'hf == readIdx ? data_15_pdInfo_isRet : _GEN_2046; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_0_bits_pdInfo_jumpTarget = 4'hf == readIdx ? data_15_pdInfo_jumpTarget : _GEN_2062; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_valid = canDeq_1 & ~empty; // @[src/main/scala/util/CircularQueue.scala 222:31]
  assign io_deq_1_bits_instr = 4'hf == readIdx_1 ? data_15_instr : _GEN_2126; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pc = 4'hf == readIdx_1 ? data_15_pc : _GEN_2142; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_valid = 4'hf == readIdx_1 ? data_15_pdInfo_valid : _GEN_2158; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_isBr = 4'hf == readIdx_1 ? data_15_pdInfo_isBr : _GEN_2174; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_isJal = 4'hf == readIdx_1 ? data_15_pdInfo_isJal : _GEN_2190; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_isJalr = 4'hf == readIdx_1 ? data_15_pdInfo_isJalr : _GEN_2206; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_isCall = 4'hf == readIdx_1 ? data_15_pdInfo_isCall : _GEN_2222; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_isRet = 4'hf == readIdx_1 ? data_15_pdInfo_isRet : _GEN_2238; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_1_bits_pdInfo_jumpTarget = 4'hf == readIdx_1 ? data_15_pdInfo_jumpTarget : _GEN_2254; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_valid = canDeq_2 & ~empty; // @[src/main/scala/util/CircularQueue.scala 222:31]
  assign io_deq_2_bits_instr = 4'hf == readIdx_2 ? data_15_instr : _GEN_2318; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pc = 4'hf == readIdx_2 ? data_15_pc : _GEN_2334; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_valid = 4'hf == readIdx_2 ? data_15_pdInfo_valid : _GEN_2350; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_isBr = 4'hf == readIdx_2 ? data_15_pdInfo_isBr : _GEN_2366; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_isJal = 4'hf == readIdx_2 ? data_15_pdInfo_isJal : _GEN_2382; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_isJalr = 4'hf == readIdx_2 ? data_15_pdInfo_isJalr : _GEN_2398; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_isCall = 4'hf == readIdx_2 ? data_15_pdInfo_isCall : _GEN_2414; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_isRet = 4'hf == readIdx_2 ? data_15_pdInfo_isRet : _GEN_2430; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_deq_2_bits_pdInfo_jumpTarget = 4'hf == readIdx_2 ? data_15_pdInfo_jumpTarget : _GEN_2446; // @[src/main/scala/util/CircularQueue.scala 226:{20,20}]
  assign io_empty = empty; // @[src/main/scala/util/CircularQueue.scala 132:12]
  assign io_full = full; // @[src/main/scala/util/CircularQueue.scala 133:12]
  assign io_count = _count_T_6[4:0]; // @[src/main/scala/util/CircularQueue.scala 143:23 146:9]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else begin
      deqPtr_value <= deqPtr_newPtr_value;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else if (deqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      deqPtr_flag <= ~deqPtr_flag;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else begin
      enqPtr_value <= enqPtr_newPtr_value;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      enqPtr_flag <= ~enqPtr_flag;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_instr <= _GEN_1520;
      end
    end else begin
      data_0_instr <= _GEN_1520;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pc <= _GEN_1504;
      end
    end else begin
      data_0_pc <= _GEN_1504;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_valid <= _GEN_1392;
      end
    end else begin
      data_0_pdInfo_valid <= _GEN_1392;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_isBr <= _GEN_1408;
      end
    end else begin
      data_0_pdInfo_isBr <= _GEN_1408;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_isJal <= _GEN_1424;
      end
    end else begin
      data_0_pdInfo_isJal <= _GEN_1424;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_isJalr <= _GEN_1440;
      end
    end else begin
      data_0_pdInfo_isJalr <= _GEN_1440;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_isCall <= _GEN_1456;
      end
    end else begin
      data_0_pdInfo_isCall <= _GEN_1456;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_isRet <= _GEN_1472;
      end
    end else begin
      data_0_pdInfo_isRet <= _GEN_1472;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h0 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_0_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_0_pdInfo_jumpTarget <= _GEN_1488;
      end
    end else begin
      data_0_pdInfo_jumpTarget <= _GEN_1488;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_instr <= _GEN_1521;
      end
    end else begin
      data_1_instr <= _GEN_1521;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pc <= _GEN_1505;
      end
    end else begin
      data_1_pc <= _GEN_1505;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_valid <= _GEN_1393;
      end
    end else begin
      data_1_pdInfo_valid <= _GEN_1393;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_isBr <= _GEN_1409;
      end
    end else begin
      data_1_pdInfo_isBr <= _GEN_1409;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_isJal <= _GEN_1425;
      end
    end else begin
      data_1_pdInfo_isJal <= _GEN_1425;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_isJalr <= _GEN_1441;
      end
    end else begin
      data_1_pdInfo_isJalr <= _GEN_1441;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_isCall <= _GEN_1457;
      end
    end else begin
      data_1_pdInfo_isCall <= _GEN_1457;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_isRet <= _GEN_1473;
      end
    end else begin
      data_1_pdInfo_isRet <= _GEN_1473;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h1 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_1_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_1_pdInfo_jumpTarget <= _GEN_1489;
      end
    end else begin
      data_1_pdInfo_jumpTarget <= _GEN_1489;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_instr <= _GEN_1522;
      end
    end else begin
      data_2_instr <= _GEN_1522;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pc <= _GEN_1506;
      end
    end else begin
      data_2_pc <= _GEN_1506;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_valid <= _GEN_1394;
      end
    end else begin
      data_2_pdInfo_valid <= _GEN_1394;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_isBr <= _GEN_1410;
      end
    end else begin
      data_2_pdInfo_isBr <= _GEN_1410;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_isJal <= _GEN_1426;
      end
    end else begin
      data_2_pdInfo_isJal <= _GEN_1426;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_isJalr <= _GEN_1442;
      end
    end else begin
      data_2_pdInfo_isJalr <= _GEN_1442;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_isCall <= _GEN_1458;
      end
    end else begin
      data_2_pdInfo_isCall <= _GEN_1458;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_isRet <= _GEN_1474;
      end
    end else begin
      data_2_pdInfo_isRet <= _GEN_1474;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h2 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_2_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_2_pdInfo_jumpTarget <= _GEN_1490;
      end
    end else begin
      data_2_pdInfo_jumpTarget <= _GEN_1490;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_instr <= _GEN_1523;
      end
    end else begin
      data_3_instr <= _GEN_1523;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pc <= _GEN_1507;
      end
    end else begin
      data_3_pc <= _GEN_1507;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_valid <= _GEN_1395;
      end
    end else begin
      data_3_pdInfo_valid <= _GEN_1395;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_isBr <= _GEN_1411;
      end
    end else begin
      data_3_pdInfo_isBr <= _GEN_1411;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_isJal <= _GEN_1427;
      end
    end else begin
      data_3_pdInfo_isJal <= _GEN_1427;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_isJalr <= _GEN_1443;
      end
    end else begin
      data_3_pdInfo_isJalr <= _GEN_1443;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_isCall <= _GEN_1459;
      end
    end else begin
      data_3_pdInfo_isCall <= _GEN_1459;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_isRet <= _GEN_1475;
      end
    end else begin
      data_3_pdInfo_isRet <= _GEN_1475;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h3 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_3_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_3_pdInfo_jumpTarget <= _GEN_1491;
      end
    end else begin
      data_3_pdInfo_jumpTarget <= _GEN_1491;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_instr <= _GEN_1524;
      end
    end else begin
      data_4_instr <= _GEN_1524;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pc <= _GEN_1508;
      end
    end else begin
      data_4_pc <= _GEN_1508;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_valid <= _GEN_1396;
      end
    end else begin
      data_4_pdInfo_valid <= _GEN_1396;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_isBr <= _GEN_1412;
      end
    end else begin
      data_4_pdInfo_isBr <= _GEN_1412;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_isJal <= _GEN_1428;
      end
    end else begin
      data_4_pdInfo_isJal <= _GEN_1428;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_isJalr <= _GEN_1444;
      end
    end else begin
      data_4_pdInfo_isJalr <= _GEN_1444;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_isCall <= _GEN_1460;
      end
    end else begin
      data_4_pdInfo_isCall <= _GEN_1460;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_isRet <= _GEN_1476;
      end
    end else begin
      data_4_pdInfo_isRet <= _GEN_1476;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h4 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_4_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_4_pdInfo_jumpTarget <= _GEN_1492;
      end
    end else begin
      data_4_pdInfo_jumpTarget <= _GEN_1492;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_instr <= _GEN_1525;
      end
    end else begin
      data_5_instr <= _GEN_1525;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pc <= _GEN_1509;
      end
    end else begin
      data_5_pc <= _GEN_1509;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_valid <= _GEN_1397;
      end
    end else begin
      data_5_pdInfo_valid <= _GEN_1397;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_isBr <= _GEN_1413;
      end
    end else begin
      data_5_pdInfo_isBr <= _GEN_1413;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_isJal <= _GEN_1429;
      end
    end else begin
      data_5_pdInfo_isJal <= _GEN_1429;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_isJalr <= _GEN_1445;
      end
    end else begin
      data_5_pdInfo_isJalr <= _GEN_1445;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_isCall <= _GEN_1461;
      end
    end else begin
      data_5_pdInfo_isCall <= _GEN_1461;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_isRet <= _GEN_1477;
      end
    end else begin
      data_5_pdInfo_isRet <= _GEN_1477;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h5 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_5_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_5_pdInfo_jumpTarget <= _GEN_1493;
      end
    end else begin
      data_5_pdInfo_jumpTarget <= _GEN_1493;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_instr <= _GEN_1526;
      end
    end else begin
      data_6_instr <= _GEN_1526;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pc <= _GEN_1510;
      end
    end else begin
      data_6_pc <= _GEN_1510;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_valid <= _GEN_1398;
      end
    end else begin
      data_6_pdInfo_valid <= _GEN_1398;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_isBr <= _GEN_1414;
      end
    end else begin
      data_6_pdInfo_isBr <= _GEN_1414;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_isJal <= _GEN_1430;
      end
    end else begin
      data_6_pdInfo_isJal <= _GEN_1430;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_isJalr <= _GEN_1446;
      end
    end else begin
      data_6_pdInfo_isJalr <= _GEN_1446;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_isCall <= _GEN_1462;
      end
    end else begin
      data_6_pdInfo_isCall <= _GEN_1462;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_isRet <= _GEN_1478;
      end
    end else begin
      data_6_pdInfo_isRet <= _GEN_1478;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h6 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_6_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_6_pdInfo_jumpTarget <= _GEN_1494;
      end
    end else begin
      data_6_pdInfo_jumpTarget <= _GEN_1494;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_instr <= _GEN_1527;
      end
    end else begin
      data_7_instr <= _GEN_1527;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pc <= _GEN_1511;
      end
    end else begin
      data_7_pc <= _GEN_1511;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_valid <= _GEN_1399;
      end
    end else begin
      data_7_pdInfo_valid <= _GEN_1399;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_isBr <= _GEN_1415;
      end
    end else begin
      data_7_pdInfo_isBr <= _GEN_1415;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_isJal <= _GEN_1431;
      end
    end else begin
      data_7_pdInfo_isJal <= _GEN_1431;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_isJalr <= _GEN_1447;
      end
    end else begin
      data_7_pdInfo_isJalr <= _GEN_1447;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_isCall <= _GEN_1463;
      end
    end else begin
      data_7_pdInfo_isCall <= _GEN_1463;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_isRet <= _GEN_1479;
      end
    end else begin
      data_7_pdInfo_isRet <= _GEN_1479;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h7 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_7_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_7_pdInfo_jumpTarget <= _GEN_1495;
      end
    end else begin
      data_7_pdInfo_jumpTarget <= _GEN_1495;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_instr <= _GEN_1528;
      end
    end else begin
      data_8_instr <= _GEN_1528;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pc <= _GEN_1512;
      end
    end else begin
      data_8_pc <= _GEN_1512;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_valid <= _GEN_1400;
      end
    end else begin
      data_8_pdInfo_valid <= _GEN_1400;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_isBr <= _GEN_1416;
      end
    end else begin
      data_8_pdInfo_isBr <= _GEN_1416;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_isJal <= _GEN_1432;
      end
    end else begin
      data_8_pdInfo_isJal <= _GEN_1432;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_isJalr <= _GEN_1448;
      end
    end else begin
      data_8_pdInfo_isJalr <= _GEN_1448;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_isCall <= _GEN_1464;
      end
    end else begin
      data_8_pdInfo_isCall <= _GEN_1464;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_isRet <= _GEN_1480;
      end
    end else begin
      data_8_pdInfo_isRet <= _GEN_1480;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h8 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_8_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_8_pdInfo_jumpTarget <= _GEN_1496;
      end
    end else begin
      data_8_pdInfo_jumpTarget <= _GEN_1496;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_instr <= _GEN_1529;
      end
    end else begin
      data_9_instr <= _GEN_1529;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pc <= _GEN_1513;
      end
    end else begin
      data_9_pc <= _GEN_1513;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_valid <= _GEN_1401;
      end
    end else begin
      data_9_pdInfo_valid <= _GEN_1401;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_isBr <= _GEN_1417;
      end
    end else begin
      data_9_pdInfo_isBr <= _GEN_1417;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_isJal <= _GEN_1433;
      end
    end else begin
      data_9_pdInfo_isJal <= _GEN_1433;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_isJalr <= _GEN_1449;
      end
    end else begin
      data_9_pdInfo_isJalr <= _GEN_1449;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_isCall <= _GEN_1465;
      end
    end else begin
      data_9_pdInfo_isCall <= _GEN_1465;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_isRet <= _GEN_1481;
      end
    end else begin
      data_9_pdInfo_isRet <= _GEN_1481;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'h9 == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_9_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_9_pdInfo_jumpTarget <= _GEN_1497;
      end
    end else begin
      data_9_pdInfo_jumpTarget <= _GEN_1497;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_instr <= _GEN_1530;
      end
    end else begin
      data_10_instr <= _GEN_1530;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pc <= _GEN_1514;
      end
    end else begin
      data_10_pc <= _GEN_1514;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_valid <= _GEN_1402;
      end
    end else begin
      data_10_pdInfo_valid <= _GEN_1402;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_isBr <= _GEN_1418;
      end
    end else begin
      data_10_pdInfo_isBr <= _GEN_1418;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_isJal <= _GEN_1434;
      end
    end else begin
      data_10_pdInfo_isJal <= _GEN_1434;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_isJalr <= _GEN_1450;
      end
    end else begin
      data_10_pdInfo_isJalr <= _GEN_1450;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_isCall <= _GEN_1466;
      end
    end else begin
      data_10_pdInfo_isCall <= _GEN_1466;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_isRet <= _GEN_1482;
      end
    end else begin
      data_10_pdInfo_isRet <= _GEN_1482;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'ha == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_10_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_10_pdInfo_jumpTarget <= _GEN_1498;
      end
    end else begin
      data_10_pdInfo_jumpTarget <= _GEN_1498;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_instr <= _GEN_1531;
      end
    end else begin
      data_11_instr <= _GEN_1531;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pc <= _GEN_1515;
      end
    end else begin
      data_11_pc <= _GEN_1515;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_valid <= _GEN_1403;
      end
    end else begin
      data_11_pdInfo_valid <= _GEN_1403;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_isBr <= _GEN_1419;
      end
    end else begin
      data_11_pdInfo_isBr <= _GEN_1419;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_isJal <= _GEN_1435;
      end
    end else begin
      data_11_pdInfo_isJal <= _GEN_1435;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_isJalr <= _GEN_1451;
      end
    end else begin
      data_11_pdInfo_isJalr <= _GEN_1451;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_isCall <= _GEN_1467;
      end
    end else begin
      data_11_pdInfo_isCall <= _GEN_1467;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_isRet <= _GEN_1483;
      end
    end else begin
      data_11_pdInfo_isRet <= _GEN_1483;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hb == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_11_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_11_pdInfo_jumpTarget <= _GEN_1499;
      end
    end else begin
      data_11_pdInfo_jumpTarget <= _GEN_1499;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_instr <= _GEN_1532;
      end
    end else begin
      data_12_instr <= _GEN_1532;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pc <= _GEN_1516;
      end
    end else begin
      data_12_pc <= _GEN_1516;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_valid <= _GEN_1404;
      end
    end else begin
      data_12_pdInfo_valid <= _GEN_1404;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_isBr <= _GEN_1420;
      end
    end else begin
      data_12_pdInfo_isBr <= _GEN_1420;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_isJal <= _GEN_1436;
      end
    end else begin
      data_12_pdInfo_isJal <= _GEN_1436;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_isJalr <= _GEN_1452;
      end
    end else begin
      data_12_pdInfo_isJalr <= _GEN_1452;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_isCall <= _GEN_1468;
      end
    end else begin
      data_12_pdInfo_isCall <= _GEN_1468;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_isRet <= _GEN_1484;
      end
    end else begin
      data_12_pdInfo_isRet <= _GEN_1484;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hc == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_12_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_12_pdInfo_jumpTarget <= _GEN_1500;
      end
    end else begin
      data_12_pdInfo_jumpTarget <= _GEN_1500;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_instr <= _GEN_1533;
      end
    end else begin
      data_13_instr <= _GEN_1533;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pc <= _GEN_1517;
      end
    end else begin
      data_13_pc <= _GEN_1517;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_valid <= _GEN_1405;
      end
    end else begin
      data_13_pdInfo_valid <= _GEN_1405;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_isBr <= _GEN_1421;
      end
    end else begin
      data_13_pdInfo_isBr <= _GEN_1421;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_isJal <= _GEN_1437;
      end
    end else begin
      data_13_pdInfo_isJal <= _GEN_1437;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_isJalr <= _GEN_1453;
      end
    end else begin
      data_13_pdInfo_isJalr <= _GEN_1453;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_isCall <= _GEN_1469;
      end
    end else begin
      data_13_pdInfo_isCall <= _GEN_1469;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_isRet <= _GEN_1485;
      end
    end else begin
      data_13_pdInfo_isRet <= _GEN_1485;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hd == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_13_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_13_pdInfo_jumpTarget <= _GEN_1501;
      end
    end else begin
      data_13_pdInfo_jumpTarget <= _GEN_1501;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_instr <= _GEN_1534;
      end
    end else begin
      data_14_instr <= _GEN_1534;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pc <= _GEN_1518;
      end
    end else begin
      data_14_pc <= _GEN_1518;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_valid <= _GEN_1406;
      end
    end else begin
      data_14_pdInfo_valid <= _GEN_1406;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_isBr <= _GEN_1422;
      end
    end else begin
      data_14_pdInfo_isBr <= _GEN_1422;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_isJal <= _GEN_1438;
      end
    end else begin
      data_14_pdInfo_isJal <= _GEN_1438;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_isJalr <= _GEN_1454;
      end
    end else begin
      data_14_pdInfo_isJalr <= _GEN_1454;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_isCall <= _GEN_1470;
      end
    end else begin
      data_14_pdInfo_isCall <= _GEN_1470;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_isRet <= _GEN_1486;
      end
    end else begin
      data_14_pdInfo_isRet <= _GEN_1486;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'he == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_14_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_14_pdInfo_jumpTarget <= _GEN_1502;
      end
    end else begin
      data_14_pdInfo_jumpTarget <= _GEN_1502;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_instr <= io_enq_4_bits_instr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_instr <= _GEN_1535;
      end
    end else begin
      data_15_instr <= _GEN_1535;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pc <= io_enq_4_bits_pc; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pc <= _GEN_1519;
      end
    end else begin
      data_15_pc <= _GEN_1519;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_valid <= io_enq_4_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_valid <= _GEN_1407;
      end
    end else begin
      data_15_pdInfo_valid <= _GEN_1407;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_isBr <= io_enq_4_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_isBr <= _GEN_1423;
      end
    end else begin
      data_15_pdInfo_isBr <= _GEN_1423;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_isJal <= io_enq_4_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_isJal <= _GEN_1439;
      end
    end else begin
      data_15_pdInfo_isJal <= _GEN_1439;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_isJalr <= io_enq_4_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_isJalr <= _GEN_1455;
      end
    end else begin
      data_15_pdInfo_isJalr <= _GEN_1455;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_isCall <= io_enq_4_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_isCall <= _GEN_1471;
      end
    end else begin
      data_15_pdInfo_isCall <= _GEN_1471;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_isRet <= io_enq_4_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_isRet <= _GEN_1487;
      end
    end else begin
      data_15_pdInfo_isRet <= _GEN_1487;
    end
    if (_T_24) begin // @[src/main/scala/util/CircularQueue.scala 188:27]
      if (4'hf == writeIdx_4) begin // @[src/main/scala/util/CircularQueue.scala 193:22]
        data_15_pdInfo_jumpTarget <= io_enq_4_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 193:22]
      end else begin
        data_15_pdInfo_jumpTarget <= _GEN_1503;
      end
    end else begin
      data_15_pdInfo_jumpTarget <= _GEN_1503;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_11 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_16 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: IBF input invalid\n    at CircularQueue.scala:175 assert(false.B, \"IBF input invalid\")\n"
            ); // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_16 & ~reset) begin
          $fatal; // @[src/main/scala/util/CircularQueue.scala 175:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  deqPtr_value = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  deqPtr_flag = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  enqPtr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  enqPtr_flag = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  data_0_instr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  data_0_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  data_0_pdInfo_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  data_0_pdInfo_isBr = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_0_pdInfo_isJal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  data_0_pdInfo_isJalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  data_0_pdInfo_isCall = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_0_pdInfo_isRet = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  data_0_pdInfo_jumpTarget = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  data_1_instr = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  data_1_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  data_1_pdInfo_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_1_pdInfo_isBr = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  data_1_pdInfo_isJal = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  data_1_pdInfo_isJalr = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  data_1_pdInfo_isCall = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_1_pdInfo_isRet = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_1_pdInfo_jumpTarget = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  data_2_instr = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  data_2_pc = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  data_2_pdInfo_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_2_pdInfo_isBr = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  data_2_pdInfo_isJal = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  data_2_pdInfo_isJalr = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  data_2_pdInfo_isCall = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_2_pdInfo_isRet = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_2_pdInfo_jumpTarget = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  data_3_instr = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  data_3_pc = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  data_3_pdInfo_valid = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_3_pdInfo_isBr = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_3_pdInfo_isJal = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_3_pdInfo_isJalr = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_3_pdInfo_isCall = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_3_pdInfo_isRet = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  data_3_pdInfo_jumpTarget = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  data_4_instr = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  data_4_pc = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  data_4_pdInfo_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_4_pdInfo_isBr = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  data_4_pdInfo_isJal = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  data_4_pdInfo_isJalr = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_4_pdInfo_isCall = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_4_pdInfo_isRet = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  data_4_pdInfo_jumpTarget = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  data_5_instr = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  data_5_pc = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  data_5_pdInfo_valid = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  data_5_pdInfo_isBr = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  data_5_pdInfo_isJal = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_5_pdInfo_isJalr = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_5_pdInfo_isCall = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  data_5_pdInfo_isRet = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  data_5_pdInfo_jumpTarget = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  data_6_instr = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  data_6_pc = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  data_6_pdInfo_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  data_6_pdInfo_isBr = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  data_6_pdInfo_isJal = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_6_pdInfo_isJalr = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_6_pdInfo_isCall = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  data_6_pdInfo_isRet = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_6_pdInfo_jumpTarget = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  data_7_instr = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  data_7_pc = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  data_7_pdInfo_valid = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  data_7_pdInfo_isBr = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  data_7_pdInfo_isJal = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  data_7_pdInfo_isJalr = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  data_7_pdInfo_isCall = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_7_pdInfo_isRet = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  data_7_pdInfo_jumpTarget = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  data_8_instr = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  data_8_pc = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  data_8_pdInfo_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_8_pdInfo_isBr = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_8_pdInfo_isJal = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  data_8_pdInfo_isJalr = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  data_8_pdInfo_isCall = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  data_8_pdInfo_isRet = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  data_8_pdInfo_jumpTarget = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  data_9_instr = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  data_9_pc = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  data_9_pdInfo_valid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  data_9_pdInfo_isBr = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  data_9_pdInfo_isJal = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  data_9_pdInfo_isJalr = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  data_9_pdInfo_isCall = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  data_9_pdInfo_isRet = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  data_9_pdInfo_jumpTarget = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  data_10_instr = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  data_10_pc = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  data_10_pdInfo_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  data_10_pdInfo_isBr = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  data_10_pdInfo_isJal = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  data_10_pdInfo_isJalr = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  data_10_pdInfo_isCall = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  data_10_pdInfo_isRet = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  data_10_pdInfo_jumpTarget = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  data_11_instr = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  data_11_pc = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  data_11_pdInfo_valid = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  data_11_pdInfo_isBr = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  data_11_pdInfo_isJal = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  data_11_pdInfo_isJalr = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  data_11_pdInfo_isCall = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  data_11_pdInfo_isRet = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  data_11_pdInfo_jumpTarget = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  data_12_instr = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  data_12_pc = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  data_12_pdInfo_valid = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  data_12_pdInfo_isBr = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  data_12_pdInfo_isJal = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  data_12_pdInfo_isJalr = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  data_12_pdInfo_isCall = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  data_12_pdInfo_isRet = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  data_12_pdInfo_jumpTarget = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  data_13_instr = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  data_13_pc = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  data_13_pdInfo_valid = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  data_13_pdInfo_isBr = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  data_13_pdInfo_isJal = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  data_13_pdInfo_isJalr = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  data_13_pdInfo_isCall = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  data_13_pdInfo_isRet = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  data_13_pdInfo_jumpTarget = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  data_14_instr = _RAND_130[31:0];
  _RAND_131 = {1{`RANDOM}};
  data_14_pc = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  data_14_pdInfo_valid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  data_14_pdInfo_isBr = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  data_14_pdInfo_isJal = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  data_14_pdInfo_isJalr = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  data_14_pdInfo_isCall = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  data_14_pdInfo_isRet = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  data_14_pdInfo_jumpTarget = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  data_15_instr = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  data_15_pc = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  data_15_pdInfo_valid = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  data_15_pdInfo_isBr = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  data_15_pdInfo_isJal = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  data_15_pdInfo_isJalr = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  data_15_pdInfo_isCall = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  data_15_pdInfo_isRet = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  data_15_pdInfo_jumpTarget = _RAND_147[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
