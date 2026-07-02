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
  input         io_enq_0_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_0_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  input         io_enq_1_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_1_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  input         io_enq_2_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_2_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  input         io_enq_3_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_enq_3_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  output        io_deq_0_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_0_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  output        io_deq_1_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_1_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  output        io_deq_2_bits_exception_excpTlbRefill, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpTlbPif, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpTlbPpi, // @[src/main/scala/util/CircularQueue.scala 83:14]
  output        io_deq_2_bits_exception_excpAdef, // @[src/main/scala/util/CircularQueue.scala 83:14]
  input         io_flush // @[src/main/scala/util/CircularQueue.scala 83:14]
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
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
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
  reg  data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg [31:0] data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17]
  reg  data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 103:39]
  wire  empty = deqPtr_value == enqPtr_value & deqPtr_flag == enqPtr_flag; // @[src/main/scala/util/CircularQueuePtr.scala 103:54]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/util/CircularQueue.scala 129:47]
  wire [3:0] _count_T_2 = enqPtr_value - deqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 146:18]
  wire [4:0] _GEN_3748 = {{1'd0}, enqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 147:18]
  wire [5:0] _count_T_3 = 5'h10 + _GEN_3748; // @[src/main/scala/util/CircularQueuePtr.scala 147:18]
  wire [5:0] _GEN_3749 = {{2'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueuePtr.scala 147:33]
  wire [5:0] _count_T_5 = _count_T_3 - _GEN_3749; // @[src/main/scala/util/CircularQueuePtr.scala 147:33]
  wire [5:0] _count_T_6 = enqPtr_flag == deqPtr_flag ? {{2'd0}, _count_T_2} : _count_T_5; // @[src/main/scala/util/CircularQueuePtr.scala 145:8]
  wire  _T_1 = ~io_enq_0_valid & io_enq_1_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_3 = ~reset; // @[src/main/scala/util/CircularQueue.scala 175:13]
  wire  _T_6 = ~io_enq_1_valid & io_enq_2_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire  _T_11 = ~io_enq_2_valid & io_enq_3_valid; // @[src/main/scala/util/CircularQueue.scala 174:27]
  wire [4:0] count = _count_T_6[4:0]; // @[src/main/scala/util/CircularQueue.scala 143:23 146:9]
  wire [5:0] _canEnq_T = {{1'd0}, count}; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq = _canEnq_T < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_15 = io_enq_0_ready & io_enq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx = _GEN_3748[3:0]; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_0 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_1 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_2 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_3 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_4 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_5 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_6 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_7 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_8 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_9 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_10 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_11 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_12 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_13 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_14 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_15 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbRefill : data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_16 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_17 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_18 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_19 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_20 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_21 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_22 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_23 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_24 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_25 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_26 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_27 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_28 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_29 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_30 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_31 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbPif : data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_32 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_33 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_34 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_35 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_36 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_37 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_38 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_39 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_40 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_41 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_42 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_43 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_44 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_45 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_46 = 4'he == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_47 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpTlbPpi : data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_48 = 4'h0 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_49 = 4'h1 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_50 = 4'h2 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_51 = 4'h3 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_52 = 4'h4 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_53 = 4'h5 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_54 = 4'h6 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_55 = 4'h7 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_56 = 4'h8 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_57 = 4'h9 == writeIdx ? io_enq_0_bits_exception_excpAdef : data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_58 = 4'ha == writeIdx ? io_enq_0_bits_exception_excpAdef : data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_59 = 4'hb == writeIdx ? io_enq_0_bits_exception_excpAdef : data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_60 = 4'hc == writeIdx ? io_enq_0_bits_exception_excpAdef : data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_61 = 4'hd == writeIdx ? io_enq_0_bits_exception_excpAdef : data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_62 = 4'he == writeIdx ? io_enq_0_bits_exception_excpAdef : data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_63 = 4'hf == writeIdx ? io_enq_0_bits_exception_excpAdef : data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_64 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_65 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_66 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_67 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_68 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_69 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_70 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_71 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_72 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_73 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_valid : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_74 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_valid : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_75 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_valid : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_76 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_valid : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_77 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_valid : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_78 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_valid : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_79 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_valid : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_80 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_81 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_82 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_83 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_84 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_85 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_86 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_87 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_88 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_89 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_90 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_91 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_92 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_93 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_94 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_95 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isBr : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_96 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_97 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_98 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_99 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_100 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_101 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_102 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_103 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_104 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_105 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_106 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_107 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_108 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_109 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_110 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_111 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJal : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_112 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_113 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_114 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_115 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_116 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_117 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_118 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_119 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_120 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_121 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_122 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_123 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_124 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_125 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_126 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_127 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isJalr : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_128 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_129 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_130 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_131 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_132 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_133 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_134 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_135 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_136 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_137 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_138 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_139 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_140 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_141 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_142 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_143 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isCall : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_144 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_145 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_146 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_147 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_148 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_149 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_150 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_151 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_152 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_153 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_154 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_155 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_156 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_157 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_158 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_159 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_isRet : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_160 = 4'h0 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_161 = 4'h1 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_162 = 4'h2 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_163 = 4'h3 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_164 = 4'h4 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_165 = 4'h5 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_166 = 4'h6 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_167 = 4'h7 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_168 = 4'h8 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_169 = 4'h9 == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_170 = 4'ha == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_171 = 4'hb == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_172 = 4'hc == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_173 = 4'hd == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_174 = 4'he == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_175 = 4'hf == writeIdx ? io_enq_0_bits_pdInfo_jumpTarget : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_176 = 4'h0 == writeIdx ? io_enq_0_bits_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_177 = 4'h1 == writeIdx ? io_enq_0_bits_pc : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_178 = 4'h2 == writeIdx ? io_enq_0_bits_pc : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_179 = 4'h3 == writeIdx ? io_enq_0_bits_pc : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_180 = 4'h4 == writeIdx ? io_enq_0_bits_pc : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_181 = 4'h5 == writeIdx ? io_enq_0_bits_pc : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_182 = 4'h6 == writeIdx ? io_enq_0_bits_pc : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_183 = 4'h7 == writeIdx ? io_enq_0_bits_pc : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_184 = 4'h8 == writeIdx ? io_enq_0_bits_pc : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_185 = 4'h9 == writeIdx ? io_enq_0_bits_pc : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_186 = 4'ha == writeIdx ? io_enq_0_bits_pc : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_187 = 4'hb == writeIdx ? io_enq_0_bits_pc : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_188 = 4'hc == writeIdx ? io_enq_0_bits_pc : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_189 = 4'hd == writeIdx ? io_enq_0_bits_pc : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_190 = 4'he == writeIdx ? io_enq_0_bits_pc : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_191 = 4'hf == writeIdx ? io_enq_0_bits_pc : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_192 = 4'h0 == writeIdx ? io_enq_0_bits_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_193 = 4'h1 == writeIdx ? io_enq_0_bits_instr : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_194 = 4'h2 == writeIdx ? io_enq_0_bits_instr : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_195 = 4'h3 == writeIdx ? io_enq_0_bits_instr : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_196 = 4'h4 == writeIdx ? io_enq_0_bits_instr : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_197 = 4'h5 == writeIdx ? io_enq_0_bits_instr : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_198 = 4'h6 == writeIdx ? io_enq_0_bits_instr : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_199 = 4'h7 == writeIdx ? io_enq_0_bits_instr : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_200 = 4'h8 == writeIdx ? io_enq_0_bits_instr : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_201 = 4'h9 == writeIdx ? io_enq_0_bits_instr : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_202 = 4'ha == writeIdx ? io_enq_0_bits_instr : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_203 = 4'hb == writeIdx ? io_enq_0_bits_instr : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_204 = 4'hc == writeIdx ? io_enq_0_bits_instr : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_205 = 4'hd == writeIdx ? io_enq_0_bits_instr : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_206 = 4'he == writeIdx ? io_enq_0_bits_instr : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire [31:0] _GEN_207 = 4'hf == writeIdx ? io_enq_0_bits_instr : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 192:{22,22}]
  wire  _GEN_208 = _T_15 ? _GEN_0 : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_209 = _T_15 ? _GEN_1 : data_1_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_210 = _T_15 ? _GEN_2 : data_2_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_211 = _T_15 ? _GEN_3 : data_3_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_212 = _T_15 ? _GEN_4 : data_4_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_213 = _T_15 ? _GEN_5 : data_5_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_214 = _T_15 ? _GEN_6 : data_6_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_215 = _T_15 ? _GEN_7 : data_7_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_216 = _T_15 ? _GEN_8 : data_8_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_217 = _T_15 ? _GEN_9 : data_9_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_218 = _T_15 ? _GEN_10 : data_10_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_219 = _T_15 ? _GEN_11 : data_11_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_220 = _T_15 ? _GEN_12 : data_12_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_221 = _T_15 ? _GEN_13 : data_13_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_222 = _T_15 ? _GEN_14 : data_14_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_223 = _T_15 ? _GEN_15 : data_15_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_224 = _T_15 ? _GEN_16 : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_225 = _T_15 ? _GEN_17 : data_1_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_226 = _T_15 ? _GEN_18 : data_2_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_227 = _T_15 ? _GEN_19 : data_3_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_228 = _T_15 ? _GEN_20 : data_4_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_229 = _T_15 ? _GEN_21 : data_5_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_230 = _T_15 ? _GEN_22 : data_6_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_231 = _T_15 ? _GEN_23 : data_7_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_232 = _T_15 ? _GEN_24 : data_8_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_233 = _T_15 ? _GEN_25 : data_9_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_234 = _T_15 ? _GEN_26 : data_10_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_235 = _T_15 ? _GEN_27 : data_11_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_236 = _T_15 ? _GEN_28 : data_12_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_237 = _T_15 ? _GEN_29 : data_13_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_238 = _T_15 ? _GEN_30 : data_14_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_239 = _T_15 ? _GEN_31 : data_15_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_240 = _T_15 ? _GEN_32 : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_241 = _T_15 ? _GEN_33 : data_1_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_242 = _T_15 ? _GEN_34 : data_2_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_243 = _T_15 ? _GEN_35 : data_3_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_244 = _T_15 ? _GEN_36 : data_4_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_245 = _T_15 ? _GEN_37 : data_5_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_246 = _T_15 ? _GEN_38 : data_6_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_247 = _T_15 ? _GEN_39 : data_7_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_248 = _T_15 ? _GEN_40 : data_8_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_249 = _T_15 ? _GEN_41 : data_9_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_250 = _T_15 ? _GEN_42 : data_10_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_251 = _T_15 ? _GEN_43 : data_11_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_252 = _T_15 ? _GEN_44 : data_12_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_253 = _T_15 ? _GEN_45 : data_13_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_254 = _T_15 ? _GEN_46 : data_14_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_255 = _T_15 ? _GEN_47 : data_15_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_256 = _T_15 ? _GEN_48 : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_257 = _T_15 ? _GEN_49 : data_1_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_258 = _T_15 ? _GEN_50 : data_2_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_259 = _T_15 ? _GEN_51 : data_3_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_260 = _T_15 ? _GEN_52 : data_4_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_261 = _T_15 ? _GEN_53 : data_5_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_262 = _T_15 ? _GEN_54 : data_6_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_263 = _T_15 ? _GEN_55 : data_7_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_264 = _T_15 ? _GEN_56 : data_8_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_265 = _T_15 ? _GEN_57 : data_9_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_266 = _T_15 ? _GEN_58 : data_10_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_267 = _T_15 ? _GEN_59 : data_11_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_268 = _T_15 ? _GEN_60 : data_12_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_269 = _T_15 ? _GEN_61 : data_13_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_270 = _T_15 ? _GEN_62 : data_14_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_271 = _T_15 ? _GEN_63 : data_15_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_272 = _T_15 ? _GEN_64 : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_273 = _T_15 ? _GEN_65 : data_1_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_274 = _T_15 ? _GEN_66 : data_2_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_275 = _T_15 ? _GEN_67 : data_3_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_276 = _T_15 ? _GEN_68 : data_4_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_277 = _T_15 ? _GEN_69 : data_5_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_278 = _T_15 ? _GEN_70 : data_6_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_279 = _T_15 ? _GEN_71 : data_7_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_280 = _T_15 ? _GEN_72 : data_8_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_281 = _T_15 ? _GEN_73 : data_9_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_282 = _T_15 ? _GEN_74 : data_10_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_283 = _T_15 ? _GEN_75 : data_11_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_284 = _T_15 ? _GEN_76 : data_12_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_285 = _T_15 ? _GEN_77 : data_13_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_286 = _T_15 ? _GEN_78 : data_14_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_287 = _T_15 ? _GEN_79 : data_15_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_288 = _T_15 ? _GEN_80 : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_289 = _T_15 ? _GEN_81 : data_1_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_290 = _T_15 ? _GEN_82 : data_2_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_291 = _T_15 ? _GEN_83 : data_3_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_292 = _T_15 ? _GEN_84 : data_4_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_293 = _T_15 ? _GEN_85 : data_5_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_294 = _T_15 ? _GEN_86 : data_6_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_295 = _T_15 ? _GEN_87 : data_7_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_296 = _T_15 ? _GEN_88 : data_8_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_297 = _T_15 ? _GEN_89 : data_9_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_298 = _T_15 ? _GEN_90 : data_10_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_299 = _T_15 ? _GEN_91 : data_11_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_300 = _T_15 ? _GEN_92 : data_12_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_301 = _T_15 ? _GEN_93 : data_13_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_302 = _T_15 ? _GEN_94 : data_14_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_303 = _T_15 ? _GEN_95 : data_15_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_304 = _T_15 ? _GEN_96 : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_305 = _T_15 ? _GEN_97 : data_1_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_306 = _T_15 ? _GEN_98 : data_2_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_307 = _T_15 ? _GEN_99 : data_3_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_308 = _T_15 ? _GEN_100 : data_4_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_309 = _T_15 ? _GEN_101 : data_5_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_310 = _T_15 ? _GEN_102 : data_6_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_311 = _T_15 ? _GEN_103 : data_7_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_312 = _T_15 ? _GEN_104 : data_8_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_313 = _T_15 ? _GEN_105 : data_9_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_314 = _T_15 ? _GEN_106 : data_10_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_315 = _T_15 ? _GEN_107 : data_11_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_316 = _T_15 ? _GEN_108 : data_12_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_317 = _T_15 ? _GEN_109 : data_13_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_318 = _T_15 ? _GEN_110 : data_14_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_319 = _T_15 ? _GEN_111 : data_15_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_320 = _T_15 ? _GEN_112 : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_321 = _T_15 ? _GEN_113 : data_1_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_322 = _T_15 ? _GEN_114 : data_2_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_323 = _T_15 ? _GEN_115 : data_3_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_324 = _T_15 ? _GEN_116 : data_4_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_325 = _T_15 ? _GEN_117 : data_5_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_326 = _T_15 ? _GEN_118 : data_6_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_327 = _T_15 ? _GEN_119 : data_7_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_328 = _T_15 ? _GEN_120 : data_8_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_329 = _T_15 ? _GEN_121 : data_9_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_330 = _T_15 ? _GEN_122 : data_10_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_331 = _T_15 ? _GEN_123 : data_11_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_332 = _T_15 ? _GEN_124 : data_12_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_333 = _T_15 ? _GEN_125 : data_13_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_334 = _T_15 ? _GEN_126 : data_14_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_335 = _T_15 ? _GEN_127 : data_15_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_336 = _T_15 ? _GEN_128 : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_337 = _T_15 ? _GEN_129 : data_1_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_338 = _T_15 ? _GEN_130 : data_2_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_339 = _T_15 ? _GEN_131 : data_3_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_340 = _T_15 ? _GEN_132 : data_4_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_341 = _T_15 ? _GEN_133 : data_5_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_342 = _T_15 ? _GEN_134 : data_6_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_343 = _T_15 ? _GEN_135 : data_7_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_344 = _T_15 ? _GEN_136 : data_8_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_345 = _T_15 ? _GEN_137 : data_9_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_346 = _T_15 ? _GEN_138 : data_10_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_347 = _T_15 ? _GEN_139 : data_11_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_348 = _T_15 ? _GEN_140 : data_12_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_349 = _T_15 ? _GEN_141 : data_13_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_350 = _T_15 ? _GEN_142 : data_14_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_351 = _T_15 ? _GEN_143 : data_15_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_352 = _T_15 ? _GEN_144 : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_353 = _T_15 ? _GEN_145 : data_1_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_354 = _T_15 ? _GEN_146 : data_2_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_355 = _T_15 ? _GEN_147 : data_3_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_356 = _T_15 ? _GEN_148 : data_4_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_357 = _T_15 ? _GEN_149 : data_5_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_358 = _T_15 ? _GEN_150 : data_6_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_359 = _T_15 ? _GEN_151 : data_7_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_360 = _T_15 ? _GEN_152 : data_8_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_361 = _T_15 ? _GEN_153 : data_9_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_362 = _T_15 ? _GEN_154 : data_10_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_363 = _T_15 ? _GEN_155 : data_11_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_364 = _T_15 ? _GEN_156 : data_12_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_365 = _T_15 ? _GEN_157 : data_13_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_366 = _T_15 ? _GEN_158 : data_14_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire  _GEN_367 = _T_15 ? _GEN_159 : data_15_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_368 = _T_15 ? _GEN_160 : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_369 = _T_15 ? _GEN_161 : data_1_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_370 = _T_15 ? _GEN_162 : data_2_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_371 = _T_15 ? _GEN_163 : data_3_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_372 = _T_15 ? _GEN_164 : data_4_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_373 = _T_15 ? _GEN_165 : data_5_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_374 = _T_15 ? _GEN_166 : data_6_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_375 = _T_15 ? _GEN_167 : data_7_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_376 = _T_15 ? _GEN_168 : data_8_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_377 = _T_15 ? _GEN_169 : data_9_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_378 = _T_15 ? _GEN_170 : data_10_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_379 = _T_15 ? _GEN_171 : data_11_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_380 = _T_15 ? _GEN_172 : data_12_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_381 = _T_15 ? _GEN_173 : data_13_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_382 = _T_15 ? _GEN_174 : data_14_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_383 = _T_15 ? _GEN_175 : data_15_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_384 = _T_15 ? _GEN_176 : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_385 = _T_15 ? _GEN_177 : data_1_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_386 = _T_15 ? _GEN_178 : data_2_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_387 = _T_15 ? _GEN_179 : data_3_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_388 = _T_15 ? _GEN_180 : data_4_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_389 = _T_15 ? _GEN_181 : data_5_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_390 = _T_15 ? _GEN_182 : data_6_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_391 = _T_15 ? _GEN_183 : data_7_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_392 = _T_15 ? _GEN_184 : data_8_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_393 = _T_15 ? _GEN_185 : data_9_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_394 = _T_15 ? _GEN_186 : data_10_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_395 = _T_15 ? _GEN_187 : data_11_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_396 = _T_15 ? _GEN_188 : data_12_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_397 = _T_15 ? _GEN_189 : data_13_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_398 = _T_15 ? _GEN_190 : data_14_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_399 = _T_15 ? _GEN_191 : data_15_pc; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_400 = _T_15 ? _GEN_192 : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_401 = _T_15 ? _GEN_193 : data_1_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_402 = _T_15 ? _GEN_194 : data_2_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_403 = _T_15 ? _GEN_195 : data_3_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_404 = _T_15 ? _GEN_196 : data_4_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_405 = _T_15 ? _GEN_197 : data_5_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_406 = _T_15 ? _GEN_198 : data_6_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_407 = _T_15 ? _GEN_199 : data_7_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_408 = _T_15 ? _GEN_200 : data_8_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_409 = _T_15 ? _GEN_201 : data_9_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_410 = _T_15 ? _GEN_202 : data_10_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_411 = _T_15 ? _GEN_203 : data_11_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_412 = _T_15 ? _GEN_204 : data_12_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_413 = _T_15 ? _GEN_205 : data_13_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_414 = _T_15 ? _GEN_206 : data_14_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [31:0] _GEN_415 = _T_15 ? _GEN_207 : data_15_instr; // @[src/main/scala/util/CircularQueue.scala 118:17 187:27]
  wire [5:0] _canEnq_T_1 = count + 5'h1; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_1 = _canEnq_T_1 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_16 = io_enq_1_ready & io_enq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_1 = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_416 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_208; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_417 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_209; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_418 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_210; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_419 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_211; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_420 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_212; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_421 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_213; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_422 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_214; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_423 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_215; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_424 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_216; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_425 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_217; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_426 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_218; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_427 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_219; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_428 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_220; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_429 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_221; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_430 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_222; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_431 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbRefill : _GEN_223; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_432 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_224; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_433 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_225; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_434 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_226; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_435 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_227; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_436 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_228; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_437 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_229; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_438 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_230; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_439 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_231; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_440 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_232; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_441 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_233; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_442 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_234; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_443 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_235; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_444 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_236; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_445 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_237; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_446 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_238; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_447 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPif : _GEN_239; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_448 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_240; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_449 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_241; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_450 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_242; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_451 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_243; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_452 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_244; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_453 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_245; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_454 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_246; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_455 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_247; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_456 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_248; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_457 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_249; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_458 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_250; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_459 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_251; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_460 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_252; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_461 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_253; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_462 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_254; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_463 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpTlbPpi : _GEN_255; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_464 = 4'h0 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_256; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_465 = 4'h1 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_257; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_466 = 4'h2 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_258; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_467 = 4'h3 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_259; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_468 = 4'h4 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_260; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_469 = 4'h5 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_261; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_470 = 4'h6 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_262; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_471 = 4'h7 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_263; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_472 = 4'h8 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_264; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_473 = 4'h9 == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_265; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_474 = 4'ha == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_266; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_475 = 4'hb == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_267; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_476 = 4'hc == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_268; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_477 = 4'hd == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_269; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_478 = 4'he == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_270; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_479 = 4'hf == writeIdx_1 ? io_enq_1_bits_exception_excpAdef : _GEN_271; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_480 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_272; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_481 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_273; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_482 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_274; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_483 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_275; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_484 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_276; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_485 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_277; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_486 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_278; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_487 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_279; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_488 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_280; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_489 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_281; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_490 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_282; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_491 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_283; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_492 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_284; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_493 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_285; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_494 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_286; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_495 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_valid : _GEN_287; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_496 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_288; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_497 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_289; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_498 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_290; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_499 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_291; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_500 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_292; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_501 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_293; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_502 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_294; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_503 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_295; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_504 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_296; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_505 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_297; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_506 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_298; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_507 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_299; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_508 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_300; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_509 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_301; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_510 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_302; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_511 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isBr : _GEN_303; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_512 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_304; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_513 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_305; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_514 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_306; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_515 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_307; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_516 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_308; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_517 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_309; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_518 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_310; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_519 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_311; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_520 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_312; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_521 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_313; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_522 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_314; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_523 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_315; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_524 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_316; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_525 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_317; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_526 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_318; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_527 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJal : _GEN_319; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_528 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_320; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_529 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_321; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_530 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_322; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_531 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_323; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_532 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_324; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_533 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_325; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_534 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_326; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_535 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_327; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_536 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_328; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_537 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_329; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_538 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_330; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_539 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_331; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_540 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_332; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_541 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_333; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_542 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_334; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_543 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isJalr : _GEN_335; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_544 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_336; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_545 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_337; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_546 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_338; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_547 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_339; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_548 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_340; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_549 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_341; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_550 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_342; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_551 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_343; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_552 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_344; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_553 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_345; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_554 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_346; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_555 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_347; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_556 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_348; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_557 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_349; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_558 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_350; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_559 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isCall : _GEN_351; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_560 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_352; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_561 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_353; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_562 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_354; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_563 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_355; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_564 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_356; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_565 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_357; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_566 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_358; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_567 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_359; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_568 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_360; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_569 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_361; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_570 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_362; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_571 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_363; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_572 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_364; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_573 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_365; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_574 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_366; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_575 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_isRet : _GEN_367; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_576 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_368; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_577 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_369; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_578 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_370; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_579 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_371; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_580 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_372; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_581 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_373; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_582 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_374; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_583 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_375; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_584 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_376; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_585 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_377; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_586 = 4'ha == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_378; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_587 = 4'hb == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_379; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_588 = 4'hc == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_380; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_589 = 4'hd == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_381; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_590 = 4'he == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_382; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_591 = 4'hf == writeIdx_1 ? io_enq_1_bits_pdInfo_jumpTarget : _GEN_383; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_592 = 4'h0 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_384; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_593 = 4'h1 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_385; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_594 = 4'h2 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_386; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_595 = 4'h3 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_387; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_596 = 4'h4 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_388; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_597 = 4'h5 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_389; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_598 = 4'h6 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_390; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_599 = 4'h7 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_391; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_600 = 4'h8 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_392; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_601 = 4'h9 == writeIdx_1 ? io_enq_1_bits_pc : _GEN_393; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_602 = 4'ha == writeIdx_1 ? io_enq_1_bits_pc : _GEN_394; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_603 = 4'hb == writeIdx_1 ? io_enq_1_bits_pc : _GEN_395; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_604 = 4'hc == writeIdx_1 ? io_enq_1_bits_pc : _GEN_396; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_605 = 4'hd == writeIdx_1 ? io_enq_1_bits_pc : _GEN_397; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_606 = 4'he == writeIdx_1 ? io_enq_1_bits_pc : _GEN_398; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_607 = 4'hf == writeIdx_1 ? io_enq_1_bits_pc : _GEN_399; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_608 = 4'h0 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_400; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_609 = 4'h1 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_401; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_610 = 4'h2 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_402; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_611 = 4'h3 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_403; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_612 = 4'h4 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_404; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_613 = 4'h5 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_405; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_614 = 4'h6 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_406; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_615 = 4'h7 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_407; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_616 = 4'h8 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_408; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_617 = 4'h9 == writeIdx_1 ? io_enq_1_bits_instr : _GEN_409; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_618 = 4'ha == writeIdx_1 ? io_enq_1_bits_instr : _GEN_410; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_619 = 4'hb == writeIdx_1 ? io_enq_1_bits_instr : _GEN_411; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_620 = 4'hc == writeIdx_1 ? io_enq_1_bits_instr : _GEN_412; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_621 = 4'hd == writeIdx_1 ? io_enq_1_bits_instr : _GEN_413; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_622 = 4'he == writeIdx_1 ? io_enq_1_bits_instr : _GEN_414; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_623 = 4'hf == writeIdx_1 ? io_enq_1_bits_instr : _GEN_415; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_624 = _T_16 ? _GEN_416 : _GEN_208; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_625 = _T_16 ? _GEN_417 : _GEN_209; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_626 = _T_16 ? _GEN_418 : _GEN_210; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_627 = _T_16 ? _GEN_419 : _GEN_211; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_628 = _T_16 ? _GEN_420 : _GEN_212; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_629 = _T_16 ? _GEN_421 : _GEN_213; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_630 = _T_16 ? _GEN_422 : _GEN_214; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_631 = _T_16 ? _GEN_423 : _GEN_215; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_632 = _T_16 ? _GEN_424 : _GEN_216; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_633 = _T_16 ? _GEN_425 : _GEN_217; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_634 = _T_16 ? _GEN_426 : _GEN_218; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_635 = _T_16 ? _GEN_427 : _GEN_219; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_636 = _T_16 ? _GEN_428 : _GEN_220; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_637 = _T_16 ? _GEN_429 : _GEN_221; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_638 = _T_16 ? _GEN_430 : _GEN_222; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_639 = _T_16 ? _GEN_431 : _GEN_223; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_640 = _T_16 ? _GEN_432 : _GEN_224; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_641 = _T_16 ? _GEN_433 : _GEN_225; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_642 = _T_16 ? _GEN_434 : _GEN_226; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_643 = _T_16 ? _GEN_435 : _GEN_227; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_644 = _T_16 ? _GEN_436 : _GEN_228; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_645 = _T_16 ? _GEN_437 : _GEN_229; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_646 = _T_16 ? _GEN_438 : _GEN_230; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_647 = _T_16 ? _GEN_439 : _GEN_231; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_648 = _T_16 ? _GEN_440 : _GEN_232; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_649 = _T_16 ? _GEN_441 : _GEN_233; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_650 = _T_16 ? _GEN_442 : _GEN_234; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_651 = _T_16 ? _GEN_443 : _GEN_235; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_652 = _T_16 ? _GEN_444 : _GEN_236; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_653 = _T_16 ? _GEN_445 : _GEN_237; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_654 = _T_16 ? _GEN_446 : _GEN_238; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_655 = _T_16 ? _GEN_447 : _GEN_239; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_656 = _T_16 ? _GEN_448 : _GEN_240; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_657 = _T_16 ? _GEN_449 : _GEN_241; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_658 = _T_16 ? _GEN_450 : _GEN_242; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_659 = _T_16 ? _GEN_451 : _GEN_243; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_660 = _T_16 ? _GEN_452 : _GEN_244; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_661 = _T_16 ? _GEN_453 : _GEN_245; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_662 = _T_16 ? _GEN_454 : _GEN_246; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_663 = _T_16 ? _GEN_455 : _GEN_247; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_664 = _T_16 ? _GEN_456 : _GEN_248; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_665 = _T_16 ? _GEN_457 : _GEN_249; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_666 = _T_16 ? _GEN_458 : _GEN_250; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_667 = _T_16 ? _GEN_459 : _GEN_251; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_668 = _T_16 ? _GEN_460 : _GEN_252; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_669 = _T_16 ? _GEN_461 : _GEN_253; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_670 = _T_16 ? _GEN_462 : _GEN_254; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_671 = _T_16 ? _GEN_463 : _GEN_255; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_672 = _T_16 ? _GEN_464 : _GEN_256; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_673 = _T_16 ? _GEN_465 : _GEN_257; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_674 = _T_16 ? _GEN_466 : _GEN_258; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_675 = _T_16 ? _GEN_467 : _GEN_259; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_676 = _T_16 ? _GEN_468 : _GEN_260; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_677 = _T_16 ? _GEN_469 : _GEN_261; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_678 = _T_16 ? _GEN_470 : _GEN_262; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_679 = _T_16 ? _GEN_471 : _GEN_263; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_680 = _T_16 ? _GEN_472 : _GEN_264; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_681 = _T_16 ? _GEN_473 : _GEN_265; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_682 = _T_16 ? _GEN_474 : _GEN_266; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_683 = _T_16 ? _GEN_475 : _GEN_267; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_684 = _T_16 ? _GEN_476 : _GEN_268; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_685 = _T_16 ? _GEN_477 : _GEN_269; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_686 = _T_16 ? _GEN_478 : _GEN_270; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_687 = _T_16 ? _GEN_479 : _GEN_271; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_688 = _T_16 ? _GEN_480 : _GEN_272; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_689 = _T_16 ? _GEN_481 : _GEN_273; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_690 = _T_16 ? _GEN_482 : _GEN_274; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_691 = _T_16 ? _GEN_483 : _GEN_275; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_692 = _T_16 ? _GEN_484 : _GEN_276; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_693 = _T_16 ? _GEN_485 : _GEN_277; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_694 = _T_16 ? _GEN_486 : _GEN_278; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_695 = _T_16 ? _GEN_487 : _GEN_279; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_696 = _T_16 ? _GEN_488 : _GEN_280; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_697 = _T_16 ? _GEN_489 : _GEN_281; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_698 = _T_16 ? _GEN_490 : _GEN_282; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_699 = _T_16 ? _GEN_491 : _GEN_283; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_700 = _T_16 ? _GEN_492 : _GEN_284; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_701 = _T_16 ? _GEN_493 : _GEN_285; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_702 = _T_16 ? _GEN_494 : _GEN_286; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_703 = _T_16 ? _GEN_495 : _GEN_287; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_704 = _T_16 ? _GEN_496 : _GEN_288; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_705 = _T_16 ? _GEN_497 : _GEN_289; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_706 = _T_16 ? _GEN_498 : _GEN_290; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_707 = _T_16 ? _GEN_499 : _GEN_291; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_708 = _T_16 ? _GEN_500 : _GEN_292; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_709 = _T_16 ? _GEN_501 : _GEN_293; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_710 = _T_16 ? _GEN_502 : _GEN_294; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_711 = _T_16 ? _GEN_503 : _GEN_295; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_712 = _T_16 ? _GEN_504 : _GEN_296; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_713 = _T_16 ? _GEN_505 : _GEN_297; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_714 = _T_16 ? _GEN_506 : _GEN_298; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_715 = _T_16 ? _GEN_507 : _GEN_299; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_716 = _T_16 ? _GEN_508 : _GEN_300; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_717 = _T_16 ? _GEN_509 : _GEN_301; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_718 = _T_16 ? _GEN_510 : _GEN_302; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_719 = _T_16 ? _GEN_511 : _GEN_303; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_720 = _T_16 ? _GEN_512 : _GEN_304; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_721 = _T_16 ? _GEN_513 : _GEN_305; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_722 = _T_16 ? _GEN_514 : _GEN_306; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_723 = _T_16 ? _GEN_515 : _GEN_307; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_724 = _T_16 ? _GEN_516 : _GEN_308; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_725 = _T_16 ? _GEN_517 : _GEN_309; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_726 = _T_16 ? _GEN_518 : _GEN_310; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_727 = _T_16 ? _GEN_519 : _GEN_311; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_728 = _T_16 ? _GEN_520 : _GEN_312; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_729 = _T_16 ? _GEN_521 : _GEN_313; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_730 = _T_16 ? _GEN_522 : _GEN_314; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_731 = _T_16 ? _GEN_523 : _GEN_315; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_732 = _T_16 ? _GEN_524 : _GEN_316; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_733 = _T_16 ? _GEN_525 : _GEN_317; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_734 = _T_16 ? _GEN_526 : _GEN_318; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_735 = _T_16 ? _GEN_527 : _GEN_319; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_736 = _T_16 ? _GEN_528 : _GEN_320; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_737 = _T_16 ? _GEN_529 : _GEN_321; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_738 = _T_16 ? _GEN_530 : _GEN_322; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_739 = _T_16 ? _GEN_531 : _GEN_323; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_740 = _T_16 ? _GEN_532 : _GEN_324; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_741 = _T_16 ? _GEN_533 : _GEN_325; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_742 = _T_16 ? _GEN_534 : _GEN_326; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_743 = _T_16 ? _GEN_535 : _GEN_327; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_744 = _T_16 ? _GEN_536 : _GEN_328; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_745 = _T_16 ? _GEN_537 : _GEN_329; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_746 = _T_16 ? _GEN_538 : _GEN_330; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_747 = _T_16 ? _GEN_539 : _GEN_331; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_748 = _T_16 ? _GEN_540 : _GEN_332; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_749 = _T_16 ? _GEN_541 : _GEN_333; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_750 = _T_16 ? _GEN_542 : _GEN_334; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_751 = _T_16 ? _GEN_543 : _GEN_335; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_752 = _T_16 ? _GEN_544 : _GEN_336; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_753 = _T_16 ? _GEN_545 : _GEN_337; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_754 = _T_16 ? _GEN_546 : _GEN_338; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_755 = _T_16 ? _GEN_547 : _GEN_339; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_756 = _T_16 ? _GEN_548 : _GEN_340; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_757 = _T_16 ? _GEN_549 : _GEN_341; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_758 = _T_16 ? _GEN_550 : _GEN_342; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_759 = _T_16 ? _GEN_551 : _GEN_343; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_760 = _T_16 ? _GEN_552 : _GEN_344; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_761 = _T_16 ? _GEN_553 : _GEN_345; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_762 = _T_16 ? _GEN_554 : _GEN_346; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_763 = _T_16 ? _GEN_555 : _GEN_347; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_764 = _T_16 ? _GEN_556 : _GEN_348; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_765 = _T_16 ? _GEN_557 : _GEN_349; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_766 = _T_16 ? _GEN_558 : _GEN_350; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_767 = _T_16 ? _GEN_559 : _GEN_351; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_768 = _T_16 ? _GEN_560 : _GEN_352; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_769 = _T_16 ? _GEN_561 : _GEN_353; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_770 = _T_16 ? _GEN_562 : _GEN_354; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_771 = _T_16 ? _GEN_563 : _GEN_355; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_772 = _T_16 ? _GEN_564 : _GEN_356; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_773 = _T_16 ? _GEN_565 : _GEN_357; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_774 = _T_16 ? _GEN_566 : _GEN_358; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_775 = _T_16 ? _GEN_567 : _GEN_359; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_776 = _T_16 ? _GEN_568 : _GEN_360; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_777 = _T_16 ? _GEN_569 : _GEN_361; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_778 = _T_16 ? _GEN_570 : _GEN_362; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_779 = _T_16 ? _GEN_571 : _GEN_363; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_780 = _T_16 ? _GEN_572 : _GEN_364; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_781 = _T_16 ? _GEN_573 : _GEN_365; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_782 = _T_16 ? _GEN_574 : _GEN_366; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_783 = _T_16 ? _GEN_575 : _GEN_367; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_784 = _T_16 ? _GEN_576 : _GEN_368; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_785 = _T_16 ? _GEN_577 : _GEN_369; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_786 = _T_16 ? _GEN_578 : _GEN_370; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_787 = _T_16 ? _GEN_579 : _GEN_371; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_788 = _T_16 ? _GEN_580 : _GEN_372; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_789 = _T_16 ? _GEN_581 : _GEN_373; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_790 = _T_16 ? _GEN_582 : _GEN_374; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_791 = _T_16 ? _GEN_583 : _GEN_375; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_792 = _T_16 ? _GEN_584 : _GEN_376; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_793 = _T_16 ? _GEN_585 : _GEN_377; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_794 = _T_16 ? _GEN_586 : _GEN_378; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_795 = _T_16 ? _GEN_587 : _GEN_379; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_796 = _T_16 ? _GEN_588 : _GEN_380; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_797 = _T_16 ? _GEN_589 : _GEN_381; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_798 = _T_16 ? _GEN_590 : _GEN_382; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_799 = _T_16 ? _GEN_591 : _GEN_383; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_800 = _T_16 ? _GEN_592 : _GEN_384; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_801 = _T_16 ? _GEN_593 : _GEN_385; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_802 = _T_16 ? _GEN_594 : _GEN_386; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_803 = _T_16 ? _GEN_595 : _GEN_387; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_804 = _T_16 ? _GEN_596 : _GEN_388; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_805 = _T_16 ? _GEN_597 : _GEN_389; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_806 = _T_16 ? _GEN_598 : _GEN_390; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_807 = _T_16 ? _GEN_599 : _GEN_391; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_808 = _T_16 ? _GEN_600 : _GEN_392; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_809 = _T_16 ? _GEN_601 : _GEN_393; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_810 = _T_16 ? _GEN_602 : _GEN_394; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_811 = _T_16 ? _GEN_603 : _GEN_395; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_812 = _T_16 ? _GEN_604 : _GEN_396; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_813 = _T_16 ? _GEN_605 : _GEN_397; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_814 = _T_16 ? _GEN_606 : _GEN_398; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_815 = _T_16 ? _GEN_607 : _GEN_399; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_816 = _T_16 ? _GEN_608 : _GEN_400; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_817 = _T_16 ? _GEN_609 : _GEN_401; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_818 = _T_16 ? _GEN_610 : _GEN_402; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_819 = _T_16 ? _GEN_611 : _GEN_403; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_820 = _T_16 ? _GEN_612 : _GEN_404; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_821 = _T_16 ? _GEN_613 : _GEN_405; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_822 = _T_16 ? _GEN_614 : _GEN_406; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_823 = _T_16 ? _GEN_615 : _GEN_407; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_824 = _T_16 ? _GEN_616 : _GEN_408; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_825 = _T_16 ? _GEN_617 : _GEN_409; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_826 = _T_16 ? _GEN_618 : _GEN_410; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_827 = _T_16 ? _GEN_619 : _GEN_411; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_828 = _T_16 ? _GEN_620 : _GEN_412; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_829 = _T_16 ? _GEN_621 : _GEN_413; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_830 = _T_16 ? _GEN_622 : _GEN_414; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_831 = _T_16 ? _GEN_623 : _GEN_415; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [5:0] _canEnq_T_2 = count + 5'h2; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_2 = _canEnq_T_2 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_17 = io_enq_2_ready & io_enq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_2 = enqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire  _GEN_832 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_833 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_834 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_835 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_836 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_837 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_838 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_839 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_840 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_841 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_842 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_843 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_844 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_845 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_846 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_847 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbRefill : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_848 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_849 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_850 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_851 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_852 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_853 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_854 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_855 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_856 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_857 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_858 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_859 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_860 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_861 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_862 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_863 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPif : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_864 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_865 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_866 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_867 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_868 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_869 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_870 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_871 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_872 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_873 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_874 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_875 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_876 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_877 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_878 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_879 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpTlbPpi : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_880 = 4'h0 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_881 = 4'h1 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_882 = 4'h2 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_883 = 4'h3 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_884 = 4'h4 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_885 = 4'h5 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_886 = 4'h6 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_887 = 4'h7 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_888 = 4'h8 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_889 = 4'h9 == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_890 = 4'ha == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_891 = 4'hb == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_892 = 4'hc == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_893 = 4'hd == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_894 = 4'he == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_895 = 4'hf == writeIdx_2 ? io_enq_2_bits_exception_excpAdef : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_896 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_897 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_898 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_899 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_900 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_901 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_902 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_903 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_904 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_905 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_906 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_907 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_908 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_909 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_910 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_911 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_valid : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_912 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_913 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_914 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_915 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_916 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_917 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_918 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_919 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_920 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_921 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_922 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_923 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_924 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_925 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_926 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_927 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isBr : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_928 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_929 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_930 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_931 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_932 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_933 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_934 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_935 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_936 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_937 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_938 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_939 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_940 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_941 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_942 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_943 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJal : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_944 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_945 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_946 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_947 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_948 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_949 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_950 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_951 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_952 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_953 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_954 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_955 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_956 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_957 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_958 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_959 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isJalr : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_960 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_961 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_962 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_963 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_964 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_965 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_966 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_967 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_968 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_969 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_970 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_971 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_972 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_973 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_974 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_975 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isCall : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_976 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_768; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_977 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_769; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_978 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_770; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_979 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_771; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_980 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_772; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_981 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_773; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_982 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_774; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_983 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_775; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_984 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_776; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_985 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_777; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_986 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_778; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_987 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_779; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_988 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_780; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_989 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_781; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_990 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_782; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_991 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_isRet : _GEN_783; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_992 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_784; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_993 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_785; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_994 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_786; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_995 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_787; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_996 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_788; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_997 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_789; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_998 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_790; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_999 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_791; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1000 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_792; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1001 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_793; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1002 = 4'ha == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_794; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1003 = 4'hb == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_795; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1004 = 4'hc == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_796; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1005 = 4'hd == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_797; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1006 = 4'he == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_798; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1007 = 4'hf == writeIdx_2 ? io_enq_2_bits_pdInfo_jumpTarget : _GEN_799; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1008 = 4'h0 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_800; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1009 = 4'h1 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_801; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1010 = 4'h2 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_802; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1011 = 4'h3 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_803; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1012 = 4'h4 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_804; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1013 = 4'h5 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_805; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1014 = 4'h6 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_806; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1015 = 4'h7 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_807; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1016 = 4'h8 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_808; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1017 = 4'h9 == writeIdx_2 ? io_enq_2_bits_pc : _GEN_809; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1018 = 4'ha == writeIdx_2 ? io_enq_2_bits_pc : _GEN_810; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1019 = 4'hb == writeIdx_2 ? io_enq_2_bits_pc : _GEN_811; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1020 = 4'hc == writeIdx_2 ? io_enq_2_bits_pc : _GEN_812; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1021 = 4'hd == writeIdx_2 ? io_enq_2_bits_pc : _GEN_813; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1022 = 4'he == writeIdx_2 ? io_enq_2_bits_pc : _GEN_814; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1023 = 4'hf == writeIdx_2 ? io_enq_2_bits_pc : _GEN_815; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1024 = 4'h0 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_816; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1025 = 4'h1 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_817; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1026 = 4'h2 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_818; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1027 = 4'h3 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_819; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1028 = 4'h4 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_820; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1029 = 4'h5 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_821; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1030 = 4'h6 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_822; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1031 = 4'h7 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_823; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1032 = 4'h8 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_824; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1033 = 4'h9 == writeIdx_2 ? io_enq_2_bits_instr : _GEN_825; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1034 = 4'ha == writeIdx_2 ? io_enq_2_bits_instr : _GEN_826; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1035 = 4'hb == writeIdx_2 ? io_enq_2_bits_instr : _GEN_827; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1036 = 4'hc == writeIdx_2 ? io_enq_2_bits_instr : _GEN_828; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1037 = 4'hd == writeIdx_2 ? io_enq_2_bits_instr : _GEN_829; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1038 = 4'he == writeIdx_2 ? io_enq_2_bits_instr : _GEN_830; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire [31:0] _GEN_1039 = 4'hf == writeIdx_2 ? io_enq_2_bits_instr : _GEN_831; // @[src/main/scala/util/CircularQueue.scala 192:{22,22}]
  wire  _GEN_1040 = _T_17 ? _GEN_832 : _GEN_624; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1041 = _T_17 ? _GEN_833 : _GEN_625; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1042 = _T_17 ? _GEN_834 : _GEN_626; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1043 = _T_17 ? _GEN_835 : _GEN_627; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1044 = _T_17 ? _GEN_836 : _GEN_628; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1045 = _T_17 ? _GEN_837 : _GEN_629; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1046 = _T_17 ? _GEN_838 : _GEN_630; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1047 = _T_17 ? _GEN_839 : _GEN_631; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1048 = _T_17 ? _GEN_840 : _GEN_632; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1049 = _T_17 ? _GEN_841 : _GEN_633; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1050 = _T_17 ? _GEN_842 : _GEN_634; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1051 = _T_17 ? _GEN_843 : _GEN_635; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1052 = _T_17 ? _GEN_844 : _GEN_636; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1053 = _T_17 ? _GEN_845 : _GEN_637; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1054 = _T_17 ? _GEN_846 : _GEN_638; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1055 = _T_17 ? _GEN_847 : _GEN_639; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1056 = _T_17 ? _GEN_848 : _GEN_640; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1057 = _T_17 ? _GEN_849 : _GEN_641; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1058 = _T_17 ? _GEN_850 : _GEN_642; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1059 = _T_17 ? _GEN_851 : _GEN_643; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1060 = _T_17 ? _GEN_852 : _GEN_644; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1061 = _T_17 ? _GEN_853 : _GEN_645; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1062 = _T_17 ? _GEN_854 : _GEN_646; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1063 = _T_17 ? _GEN_855 : _GEN_647; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1064 = _T_17 ? _GEN_856 : _GEN_648; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1065 = _T_17 ? _GEN_857 : _GEN_649; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1066 = _T_17 ? _GEN_858 : _GEN_650; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1067 = _T_17 ? _GEN_859 : _GEN_651; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1068 = _T_17 ? _GEN_860 : _GEN_652; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1069 = _T_17 ? _GEN_861 : _GEN_653; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1070 = _T_17 ? _GEN_862 : _GEN_654; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1071 = _T_17 ? _GEN_863 : _GEN_655; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1072 = _T_17 ? _GEN_864 : _GEN_656; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1073 = _T_17 ? _GEN_865 : _GEN_657; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1074 = _T_17 ? _GEN_866 : _GEN_658; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1075 = _T_17 ? _GEN_867 : _GEN_659; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1076 = _T_17 ? _GEN_868 : _GEN_660; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1077 = _T_17 ? _GEN_869 : _GEN_661; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1078 = _T_17 ? _GEN_870 : _GEN_662; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1079 = _T_17 ? _GEN_871 : _GEN_663; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1080 = _T_17 ? _GEN_872 : _GEN_664; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1081 = _T_17 ? _GEN_873 : _GEN_665; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1082 = _T_17 ? _GEN_874 : _GEN_666; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1083 = _T_17 ? _GEN_875 : _GEN_667; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1084 = _T_17 ? _GEN_876 : _GEN_668; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1085 = _T_17 ? _GEN_877 : _GEN_669; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1086 = _T_17 ? _GEN_878 : _GEN_670; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1087 = _T_17 ? _GEN_879 : _GEN_671; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1088 = _T_17 ? _GEN_880 : _GEN_672; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1089 = _T_17 ? _GEN_881 : _GEN_673; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1090 = _T_17 ? _GEN_882 : _GEN_674; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1091 = _T_17 ? _GEN_883 : _GEN_675; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1092 = _T_17 ? _GEN_884 : _GEN_676; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1093 = _T_17 ? _GEN_885 : _GEN_677; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1094 = _T_17 ? _GEN_886 : _GEN_678; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1095 = _T_17 ? _GEN_887 : _GEN_679; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1096 = _T_17 ? _GEN_888 : _GEN_680; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1097 = _T_17 ? _GEN_889 : _GEN_681; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1098 = _T_17 ? _GEN_890 : _GEN_682; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1099 = _T_17 ? _GEN_891 : _GEN_683; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1100 = _T_17 ? _GEN_892 : _GEN_684; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1101 = _T_17 ? _GEN_893 : _GEN_685; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1102 = _T_17 ? _GEN_894 : _GEN_686; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1103 = _T_17 ? _GEN_895 : _GEN_687; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1104 = _T_17 ? _GEN_896 : _GEN_688; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1105 = _T_17 ? _GEN_897 : _GEN_689; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1106 = _T_17 ? _GEN_898 : _GEN_690; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1107 = _T_17 ? _GEN_899 : _GEN_691; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1108 = _T_17 ? _GEN_900 : _GEN_692; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1109 = _T_17 ? _GEN_901 : _GEN_693; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1110 = _T_17 ? _GEN_902 : _GEN_694; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1111 = _T_17 ? _GEN_903 : _GEN_695; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1112 = _T_17 ? _GEN_904 : _GEN_696; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1113 = _T_17 ? _GEN_905 : _GEN_697; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1114 = _T_17 ? _GEN_906 : _GEN_698; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1115 = _T_17 ? _GEN_907 : _GEN_699; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1116 = _T_17 ? _GEN_908 : _GEN_700; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1117 = _T_17 ? _GEN_909 : _GEN_701; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1118 = _T_17 ? _GEN_910 : _GEN_702; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1119 = _T_17 ? _GEN_911 : _GEN_703; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1120 = _T_17 ? _GEN_912 : _GEN_704; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1121 = _T_17 ? _GEN_913 : _GEN_705; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1122 = _T_17 ? _GEN_914 : _GEN_706; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1123 = _T_17 ? _GEN_915 : _GEN_707; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1124 = _T_17 ? _GEN_916 : _GEN_708; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1125 = _T_17 ? _GEN_917 : _GEN_709; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1126 = _T_17 ? _GEN_918 : _GEN_710; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1127 = _T_17 ? _GEN_919 : _GEN_711; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1128 = _T_17 ? _GEN_920 : _GEN_712; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1129 = _T_17 ? _GEN_921 : _GEN_713; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1130 = _T_17 ? _GEN_922 : _GEN_714; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1131 = _T_17 ? _GEN_923 : _GEN_715; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1132 = _T_17 ? _GEN_924 : _GEN_716; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1133 = _T_17 ? _GEN_925 : _GEN_717; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1134 = _T_17 ? _GEN_926 : _GEN_718; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1135 = _T_17 ? _GEN_927 : _GEN_719; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1136 = _T_17 ? _GEN_928 : _GEN_720; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1137 = _T_17 ? _GEN_929 : _GEN_721; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1138 = _T_17 ? _GEN_930 : _GEN_722; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1139 = _T_17 ? _GEN_931 : _GEN_723; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1140 = _T_17 ? _GEN_932 : _GEN_724; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1141 = _T_17 ? _GEN_933 : _GEN_725; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1142 = _T_17 ? _GEN_934 : _GEN_726; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1143 = _T_17 ? _GEN_935 : _GEN_727; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1144 = _T_17 ? _GEN_936 : _GEN_728; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1145 = _T_17 ? _GEN_937 : _GEN_729; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1146 = _T_17 ? _GEN_938 : _GEN_730; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1147 = _T_17 ? _GEN_939 : _GEN_731; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1148 = _T_17 ? _GEN_940 : _GEN_732; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1149 = _T_17 ? _GEN_941 : _GEN_733; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1150 = _T_17 ? _GEN_942 : _GEN_734; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1151 = _T_17 ? _GEN_943 : _GEN_735; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1152 = _T_17 ? _GEN_944 : _GEN_736; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1153 = _T_17 ? _GEN_945 : _GEN_737; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1154 = _T_17 ? _GEN_946 : _GEN_738; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1155 = _T_17 ? _GEN_947 : _GEN_739; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1156 = _T_17 ? _GEN_948 : _GEN_740; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1157 = _T_17 ? _GEN_949 : _GEN_741; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1158 = _T_17 ? _GEN_950 : _GEN_742; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1159 = _T_17 ? _GEN_951 : _GEN_743; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1160 = _T_17 ? _GEN_952 : _GEN_744; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1161 = _T_17 ? _GEN_953 : _GEN_745; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1162 = _T_17 ? _GEN_954 : _GEN_746; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1163 = _T_17 ? _GEN_955 : _GEN_747; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1164 = _T_17 ? _GEN_956 : _GEN_748; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1165 = _T_17 ? _GEN_957 : _GEN_749; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1166 = _T_17 ? _GEN_958 : _GEN_750; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1167 = _T_17 ? _GEN_959 : _GEN_751; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1168 = _T_17 ? _GEN_960 : _GEN_752; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1169 = _T_17 ? _GEN_961 : _GEN_753; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1170 = _T_17 ? _GEN_962 : _GEN_754; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1171 = _T_17 ? _GEN_963 : _GEN_755; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1172 = _T_17 ? _GEN_964 : _GEN_756; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1173 = _T_17 ? _GEN_965 : _GEN_757; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1174 = _T_17 ? _GEN_966 : _GEN_758; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1175 = _T_17 ? _GEN_967 : _GEN_759; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1176 = _T_17 ? _GEN_968 : _GEN_760; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1177 = _T_17 ? _GEN_969 : _GEN_761; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1178 = _T_17 ? _GEN_970 : _GEN_762; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1179 = _T_17 ? _GEN_971 : _GEN_763; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1180 = _T_17 ? _GEN_972 : _GEN_764; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1181 = _T_17 ? _GEN_973 : _GEN_765; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1182 = _T_17 ? _GEN_974 : _GEN_766; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1183 = _T_17 ? _GEN_975 : _GEN_767; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1184 = _T_17 ? _GEN_976 : _GEN_768; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1185 = _T_17 ? _GEN_977 : _GEN_769; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1186 = _T_17 ? _GEN_978 : _GEN_770; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1187 = _T_17 ? _GEN_979 : _GEN_771; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1188 = _T_17 ? _GEN_980 : _GEN_772; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1189 = _T_17 ? _GEN_981 : _GEN_773; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1190 = _T_17 ? _GEN_982 : _GEN_774; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1191 = _T_17 ? _GEN_983 : _GEN_775; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1192 = _T_17 ? _GEN_984 : _GEN_776; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1193 = _T_17 ? _GEN_985 : _GEN_777; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1194 = _T_17 ? _GEN_986 : _GEN_778; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1195 = _T_17 ? _GEN_987 : _GEN_779; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1196 = _T_17 ? _GEN_988 : _GEN_780; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1197 = _T_17 ? _GEN_989 : _GEN_781; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1198 = _T_17 ? _GEN_990 : _GEN_782; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire  _GEN_1199 = _T_17 ? _GEN_991 : _GEN_783; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1200 = _T_17 ? _GEN_992 : _GEN_784; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1201 = _T_17 ? _GEN_993 : _GEN_785; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1202 = _T_17 ? _GEN_994 : _GEN_786; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1203 = _T_17 ? _GEN_995 : _GEN_787; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1204 = _T_17 ? _GEN_996 : _GEN_788; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1205 = _T_17 ? _GEN_997 : _GEN_789; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1206 = _T_17 ? _GEN_998 : _GEN_790; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1207 = _T_17 ? _GEN_999 : _GEN_791; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1208 = _T_17 ? _GEN_1000 : _GEN_792; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1209 = _T_17 ? _GEN_1001 : _GEN_793; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1210 = _T_17 ? _GEN_1002 : _GEN_794; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1211 = _T_17 ? _GEN_1003 : _GEN_795; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1212 = _T_17 ? _GEN_1004 : _GEN_796; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1213 = _T_17 ? _GEN_1005 : _GEN_797; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1214 = _T_17 ? _GEN_1006 : _GEN_798; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1215 = _T_17 ? _GEN_1007 : _GEN_799; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1216 = _T_17 ? _GEN_1008 : _GEN_800; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1217 = _T_17 ? _GEN_1009 : _GEN_801; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1218 = _T_17 ? _GEN_1010 : _GEN_802; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1219 = _T_17 ? _GEN_1011 : _GEN_803; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1220 = _T_17 ? _GEN_1012 : _GEN_804; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1221 = _T_17 ? _GEN_1013 : _GEN_805; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1222 = _T_17 ? _GEN_1014 : _GEN_806; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1223 = _T_17 ? _GEN_1015 : _GEN_807; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1224 = _T_17 ? _GEN_1016 : _GEN_808; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1225 = _T_17 ? _GEN_1017 : _GEN_809; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1226 = _T_17 ? _GEN_1018 : _GEN_810; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1227 = _T_17 ? _GEN_1019 : _GEN_811; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1228 = _T_17 ? _GEN_1020 : _GEN_812; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1229 = _T_17 ? _GEN_1021 : _GEN_813; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1230 = _T_17 ? _GEN_1022 : _GEN_814; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1231 = _T_17 ? _GEN_1023 : _GEN_815; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1232 = _T_17 ? _GEN_1024 : _GEN_816; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1233 = _T_17 ? _GEN_1025 : _GEN_817; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1234 = _T_17 ? _GEN_1026 : _GEN_818; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1235 = _T_17 ? _GEN_1027 : _GEN_819; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1236 = _T_17 ? _GEN_1028 : _GEN_820; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1237 = _T_17 ? _GEN_1029 : _GEN_821; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1238 = _T_17 ? _GEN_1030 : _GEN_822; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1239 = _T_17 ? _GEN_1031 : _GEN_823; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1240 = _T_17 ? _GEN_1032 : _GEN_824; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1241 = _T_17 ? _GEN_1033 : _GEN_825; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1242 = _T_17 ? _GEN_1034 : _GEN_826; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1243 = _T_17 ? _GEN_1035 : _GEN_827; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1244 = _T_17 ? _GEN_1036 : _GEN_828; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1245 = _T_17 ? _GEN_1037 : _GEN_829; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1246 = _T_17 ? _GEN_1038 : _GEN_830; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [31:0] _GEN_1247 = _T_17 ? _GEN_1039 : _GEN_831; // @[src/main/scala/util/CircularQueue.scala 187:27]
  wire [5:0] _canEnq_T_3 = count + 5'h3; // @[src/main/scala/util/CircularQueue.scala 183:26]
  wire  canEnq_3 = _canEnq_T_3 < 6'h10; // @[src/main/scala/util/CircularQueue.scala 183:34]
  wire  _T_18 = io_enq_3_ready & io_enq_3_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [3:0] writeIdx_3 = enqPtr_value + 4'h3; // @[src/main/scala/util/CircularQueue.scala 190:36]
  wire [1:0] _enqFireCnt_T_4 = _T_15 + _T_16; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [1:0] _enqFireCnt_T_6 = _T_17 + _T_18; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [2:0] enqFireCnt = _enqFireCnt_T_4 + _enqFireCnt_T_6; // @[src/main/scala/util/CircularQueue.scala 198:25]
  wire [3:0] _GEN_3750 = {{1'd0}, enqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + _GEN_3750; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  canDeq = count > 5'h0; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [4:0] _readIdx_T = {{1'd0}, deqPtr_value}; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [3:0] readIdx = _readIdx_T[3:0]; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_1665 = 4'h1 == readIdx ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1666 = 4'h2 == readIdx ? data_2_instr : _GEN_1665; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1667 = 4'h3 == readIdx ? data_3_instr : _GEN_1666; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1668 = 4'h4 == readIdx ? data_4_instr : _GEN_1667; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1669 = 4'h5 == readIdx ? data_5_instr : _GEN_1668; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1670 = 4'h6 == readIdx ? data_6_instr : _GEN_1669; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1671 = 4'h7 == readIdx ? data_7_instr : _GEN_1670; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1672 = 4'h8 == readIdx ? data_8_instr : _GEN_1671; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1673 = 4'h9 == readIdx ? data_9_instr : _GEN_1672; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1674 = 4'ha == readIdx ? data_10_instr : _GEN_1673; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1675 = 4'hb == readIdx ? data_11_instr : _GEN_1674; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1676 = 4'hc == readIdx ? data_12_instr : _GEN_1675; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1677 = 4'hd == readIdx ? data_13_instr : _GEN_1676; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1678 = 4'he == readIdx ? data_14_instr : _GEN_1677; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1681 = 4'h1 == readIdx ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1682 = 4'h2 == readIdx ? data_2_pc : _GEN_1681; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1683 = 4'h3 == readIdx ? data_3_pc : _GEN_1682; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1684 = 4'h4 == readIdx ? data_4_pc : _GEN_1683; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1685 = 4'h5 == readIdx ? data_5_pc : _GEN_1684; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1686 = 4'h6 == readIdx ? data_6_pc : _GEN_1685; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1687 = 4'h7 == readIdx ? data_7_pc : _GEN_1686; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1688 = 4'h8 == readIdx ? data_8_pc : _GEN_1687; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1689 = 4'h9 == readIdx ? data_9_pc : _GEN_1688; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1690 = 4'ha == readIdx ? data_10_pc : _GEN_1689; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1691 = 4'hb == readIdx ? data_11_pc : _GEN_1690; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1692 = 4'hc == readIdx ? data_12_pc : _GEN_1691; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1693 = 4'hd == readIdx ? data_13_pc : _GEN_1692; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1694 = 4'he == readIdx ? data_14_pc : _GEN_1693; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1697 = 4'h1 == readIdx ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1698 = 4'h2 == readIdx ? data_2_pdInfo_valid : _GEN_1697; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1699 = 4'h3 == readIdx ? data_3_pdInfo_valid : _GEN_1698; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1700 = 4'h4 == readIdx ? data_4_pdInfo_valid : _GEN_1699; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1701 = 4'h5 == readIdx ? data_5_pdInfo_valid : _GEN_1700; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1702 = 4'h6 == readIdx ? data_6_pdInfo_valid : _GEN_1701; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1703 = 4'h7 == readIdx ? data_7_pdInfo_valid : _GEN_1702; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1704 = 4'h8 == readIdx ? data_8_pdInfo_valid : _GEN_1703; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1705 = 4'h9 == readIdx ? data_9_pdInfo_valid : _GEN_1704; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1706 = 4'ha == readIdx ? data_10_pdInfo_valid : _GEN_1705; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1707 = 4'hb == readIdx ? data_11_pdInfo_valid : _GEN_1706; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1708 = 4'hc == readIdx ? data_12_pdInfo_valid : _GEN_1707; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1709 = 4'hd == readIdx ? data_13_pdInfo_valid : _GEN_1708; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1710 = 4'he == readIdx ? data_14_pdInfo_valid : _GEN_1709; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1713 = 4'h1 == readIdx ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1714 = 4'h2 == readIdx ? data_2_pdInfo_isBr : _GEN_1713; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1715 = 4'h3 == readIdx ? data_3_pdInfo_isBr : _GEN_1714; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1716 = 4'h4 == readIdx ? data_4_pdInfo_isBr : _GEN_1715; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1717 = 4'h5 == readIdx ? data_5_pdInfo_isBr : _GEN_1716; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1718 = 4'h6 == readIdx ? data_6_pdInfo_isBr : _GEN_1717; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1719 = 4'h7 == readIdx ? data_7_pdInfo_isBr : _GEN_1718; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1720 = 4'h8 == readIdx ? data_8_pdInfo_isBr : _GEN_1719; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1721 = 4'h9 == readIdx ? data_9_pdInfo_isBr : _GEN_1720; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1722 = 4'ha == readIdx ? data_10_pdInfo_isBr : _GEN_1721; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1723 = 4'hb == readIdx ? data_11_pdInfo_isBr : _GEN_1722; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1724 = 4'hc == readIdx ? data_12_pdInfo_isBr : _GEN_1723; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1725 = 4'hd == readIdx ? data_13_pdInfo_isBr : _GEN_1724; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1726 = 4'he == readIdx ? data_14_pdInfo_isBr : _GEN_1725; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1729 = 4'h1 == readIdx ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1730 = 4'h2 == readIdx ? data_2_pdInfo_isJal : _GEN_1729; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1731 = 4'h3 == readIdx ? data_3_pdInfo_isJal : _GEN_1730; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1732 = 4'h4 == readIdx ? data_4_pdInfo_isJal : _GEN_1731; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1733 = 4'h5 == readIdx ? data_5_pdInfo_isJal : _GEN_1732; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1734 = 4'h6 == readIdx ? data_6_pdInfo_isJal : _GEN_1733; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1735 = 4'h7 == readIdx ? data_7_pdInfo_isJal : _GEN_1734; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1736 = 4'h8 == readIdx ? data_8_pdInfo_isJal : _GEN_1735; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1737 = 4'h9 == readIdx ? data_9_pdInfo_isJal : _GEN_1736; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1738 = 4'ha == readIdx ? data_10_pdInfo_isJal : _GEN_1737; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1739 = 4'hb == readIdx ? data_11_pdInfo_isJal : _GEN_1738; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1740 = 4'hc == readIdx ? data_12_pdInfo_isJal : _GEN_1739; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1741 = 4'hd == readIdx ? data_13_pdInfo_isJal : _GEN_1740; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1742 = 4'he == readIdx ? data_14_pdInfo_isJal : _GEN_1741; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1745 = 4'h1 == readIdx ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1746 = 4'h2 == readIdx ? data_2_pdInfo_isJalr : _GEN_1745; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1747 = 4'h3 == readIdx ? data_3_pdInfo_isJalr : _GEN_1746; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1748 = 4'h4 == readIdx ? data_4_pdInfo_isJalr : _GEN_1747; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1749 = 4'h5 == readIdx ? data_5_pdInfo_isJalr : _GEN_1748; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1750 = 4'h6 == readIdx ? data_6_pdInfo_isJalr : _GEN_1749; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1751 = 4'h7 == readIdx ? data_7_pdInfo_isJalr : _GEN_1750; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1752 = 4'h8 == readIdx ? data_8_pdInfo_isJalr : _GEN_1751; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1753 = 4'h9 == readIdx ? data_9_pdInfo_isJalr : _GEN_1752; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1754 = 4'ha == readIdx ? data_10_pdInfo_isJalr : _GEN_1753; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1755 = 4'hb == readIdx ? data_11_pdInfo_isJalr : _GEN_1754; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1756 = 4'hc == readIdx ? data_12_pdInfo_isJalr : _GEN_1755; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1757 = 4'hd == readIdx ? data_13_pdInfo_isJalr : _GEN_1756; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1758 = 4'he == readIdx ? data_14_pdInfo_isJalr : _GEN_1757; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1761 = 4'h1 == readIdx ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1762 = 4'h2 == readIdx ? data_2_pdInfo_isCall : _GEN_1761; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1763 = 4'h3 == readIdx ? data_3_pdInfo_isCall : _GEN_1762; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1764 = 4'h4 == readIdx ? data_4_pdInfo_isCall : _GEN_1763; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1765 = 4'h5 == readIdx ? data_5_pdInfo_isCall : _GEN_1764; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1766 = 4'h6 == readIdx ? data_6_pdInfo_isCall : _GEN_1765; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1767 = 4'h7 == readIdx ? data_7_pdInfo_isCall : _GEN_1766; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1768 = 4'h8 == readIdx ? data_8_pdInfo_isCall : _GEN_1767; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1769 = 4'h9 == readIdx ? data_9_pdInfo_isCall : _GEN_1768; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1770 = 4'ha == readIdx ? data_10_pdInfo_isCall : _GEN_1769; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1771 = 4'hb == readIdx ? data_11_pdInfo_isCall : _GEN_1770; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1772 = 4'hc == readIdx ? data_12_pdInfo_isCall : _GEN_1771; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1773 = 4'hd == readIdx ? data_13_pdInfo_isCall : _GEN_1772; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1774 = 4'he == readIdx ? data_14_pdInfo_isCall : _GEN_1773; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1777 = 4'h1 == readIdx ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1778 = 4'h2 == readIdx ? data_2_pdInfo_isRet : _GEN_1777; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1779 = 4'h3 == readIdx ? data_3_pdInfo_isRet : _GEN_1778; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1780 = 4'h4 == readIdx ? data_4_pdInfo_isRet : _GEN_1779; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1781 = 4'h5 == readIdx ? data_5_pdInfo_isRet : _GEN_1780; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1782 = 4'h6 == readIdx ? data_6_pdInfo_isRet : _GEN_1781; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1783 = 4'h7 == readIdx ? data_7_pdInfo_isRet : _GEN_1782; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1784 = 4'h8 == readIdx ? data_8_pdInfo_isRet : _GEN_1783; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1785 = 4'h9 == readIdx ? data_9_pdInfo_isRet : _GEN_1784; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1786 = 4'ha == readIdx ? data_10_pdInfo_isRet : _GEN_1785; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1787 = 4'hb == readIdx ? data_11_pdInfo_isRet : _GEN_1786; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1788 = 4'hc == readIdx ? data_12_pdInfo_isRet : _GEN_1787; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1789 = 4'hd == readIdx ? data_13_pdInfo_isRet : _GEN_1788; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1790 = 4'he == readIdx ? data_14_pdInfo_isRet : _GEN_1789; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1793 = 4'h1 == readIdx ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1794 = 4'h2 == readIdx ? data_2_pdInfo_jumpTarget : _GEN_1793; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1795 = 4'h3 == readIdx ? data_3_pdInfo_jumpTarget : _GEN_1794; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1796 = 4'h4 == readIdx ? data_4_pdInfo_jumpTarget : _GEN_1795; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1797 = 4'h5 == readIdx ? data_5_pdInfo_jumpTarget : _GEN_1796; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1798 = 4'h6 == readIdx ? data_6_pdInfo_jumpTarget : _GEN_1797; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1799 = 4'h7 == readIdx ? data_7_pdInfo_jumpTarget : _GEN_1798; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1800 = 4'h8 == readIdx ? data_8_pdInfo_jumpTarget : _GEN_1799; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1801 = 4'h9 == readIdx ? data_9_pdInfo_jumpTarget : _GEN_1800; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1802 = 4'ha == readIdx ? data_10_pdInfo_jumpTarget : _GEN_1801; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1803 = 4'hb == readIdx ? data_11_pdInfo_jumpTarget : _GEN_1802; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1804 = 4'hc == readIdx ? data_12_pdInfo_jumpTarget : _GEN_1803; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1805 = 4'hd == readIdx ? data_13_pdInfo_jumpTarget : _GEN_1804; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1806 = 4'he == readIdx ? data_14_pdInfo_jumpTarget : _GEN_1805; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1809 = 4'h1 == readIdx ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1810 = 4'h2 == readIdx ? data_2_exception_excpTlbRefill : _GEN_1809; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1811 = 4'h3 == readIdx ? data_3_exception_excpTlbRefill : _GEN_1810; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1812 = 4'h4 == readIdx ? data_4_exception_excpTlbRefill : _GEN_1811; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1813 = 4'h5 == readIdx ? data_5_exception_excpTlbRefill : _GEN_1812; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1814 = 4'h6 == readIdx ? data_6_exception_excpTlbRefill : _GEN_1813; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1815 = 4'h7 == readIdx ? data_7_exception_excpTlbRefill : _GEN_1814; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1816 = 4'h8 == readIdx ? data_8_exception_excpTlbRefill : _GEN_1815; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1817 = 4'h9 == readIdx ? data_9_exception_excpTlbRefill : _GEN_1816; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1818 = 4'ha == readIdx ? data_10_exception_excpTlbRefill : _GEN_1817; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1819 = 4'hb == readIdx ? data_11_exception_excpTlbRefill : _GEN_1818; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1820 = 4'hc == readIdx ? data_12_exception_excpTlbRefill : _GEN_1819; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1821 = 4'hd == readIdx ? data_13_exception_excpTlbRefill : _GEN_1820; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1822 = 4'he == readIdx ? data_14_exception_excpTlbRefill : _GEN_1821; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1825 = 4'h1 == readIdx ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1826 = 4'h2 == readIdx ? data_2_exception_excpTlbPif : _GEN_1825; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1827 = 4'h3 == readIdx ? data_3_exception_excpTlbPif : _GEN_1826; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1828 = 4'h4 == readIdx ? data_4_exception_excpTlbPif : _GEN_1827; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1829 = 4'h5 == readIdx ? data_5_exception_excpTlbPif : _GEN_1828; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1830 = 4'h6 == readIdx ? data_6_exception_excpTlbPif : _GEN_1829; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1831 = 4'h7 == readIdx ? data_7_exception_excpTlbPif : _GEN_1830; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1832 = 4'h8 == readIdx ? data_8_exception_excpTlbPif : _GEN_1831; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1833 = 4'h9 == readIdx ? data_9_exception_excpTlbPif : _GEN_1832; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1834 = 4'ha == readIdx ? data_10_exception_excpTlbPif : _GEN_1833; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1835 = 4'hb == readIdx ? data_11_exception_excpTlbPif : _GEN_1834; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1836 = 4'hc == readIdx ? data_12_exception_excpTlbPif : _GEN_1835; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1837 = 4'hd == readIdx ? data_13_exception_excpTlbPif : _GEN_1836; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1838 = 4'he == readIdx ? data_14_exception_excpTlbPif : _GEN_1837; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1841 = 4'h1 == readIdx ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1842 = 4'h2 == readIdx ? data_2_exception_excpTlbPpi : _GEN_1841; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1843 = 4'h3 == readIdx ? data_3_exception_excpTlbPpi : _GEN_1842; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1844 = 4'h4 == readIdx ? data_4_exception_excpTlbPpi : _GEN_1843; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1845 = 4'h5 == readIdx ? data_5_exception_excpTlbPpi : _GEN_1844; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1846 = 4'h6 == readIdx ? data_6_exception_excpTlbPpi : _GEN_1845; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1847 = 4'h7 == readIdx ? data_7_exception_excpTlbPpi : _GEN_1846; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1848 = 4'h8 == readIdx ? data_8_exception_excpTlbPpi : _GEN_1847; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1849 = 4'h9 == readIdx ? data_9_exception_excpTlbPpi : _GEN_1848; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1850 = 4'ha == readIdx ? data_10_exception_excpTlbPpi : _GEN_1849; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1851 = 4'hb == readIdx ? data_11_exception_excpTlbPpi : _GEN_1850; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1852 = 4'hc == readIdx ? data_12_exception_excpTlbPpi : _GEN_1851; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1853 = 4'hd == readIdx ? data_13_exception_excpTlbPpi : _GEN_1852; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1854 = 4'he == readIdx ? data_14_exception_excpTlbPpi : _GEN_1853; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1857 = 4'h1 == readIdx ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1858 = 4'h2 == readIdx ? data_2_exception_excpAdef : _GEN_1857; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1859 = 4'h3 == readIdx ? data_3_exception_excpAdef : _GEN_1858; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1860 = 4'h4 == readIdx ? data_4_exception_excpAdef : _GEN_1859; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1861 = 4'h5 == readIdx ? data_5_exception_excpAdef : _GEN_1860; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1862 = 4'h6 == readIdx ? data_6_exception_excpAdef : _GEN_1861; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1863 = 4'h7 == readIdx ? data_7_exception_excpAdef : _GEN_1862; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1864 = 4'h8 == readIdx ? data_8_exception_excpAdef : _GEN_1863; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1865 = 4'h9 == readIdx ? data_9_exception_excpAdef : _GEN_1864; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1866 = 4'ha == readIdx ? data_10_exception_excpAdef : _GEN_1865; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1867 = 4'hb == readIdx ? data_11_exception_excpAdef : _GEN_1866; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1868 = 4'hc == readIdx ? data_12_exception_excpAdef : _GEN_1867; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1869 = 4'hd == readIdx ? data_13_exception_excpAdef : _GEN_1868; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1870 = 4'he == readIdx ? data_14_exception_excpAdef : _GEN_1869; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  canDeq_1 = count > 5'h1; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [3:0] readIdx_1 = deqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_1873 = 4'h1 == readIdx_1 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1874 = 4'h2 == readIdx_1 ? data_2_instr : _GEN_1873; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1875 = 4'h3 == readIdx_1 ? data_3_instr : _GEN_1874; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1876 = 4'h4 == readIdx_1 ? data_4_instr : _GEN_1875; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1877 = 4'h5 == readIdx_1 ? data_5_instr : _GEN_1876; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1878 = 4'h6 == readIdx_1 ? data_6_instr : _GEN_1877; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1879 = 4'h7 == readIdx_1 ? data_7_instr : _GEN_1878; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1880 = 4'h8 == readIdx_1 ? data_8_instr : _GEN_1879; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1881 = 4'h9 == readIdx_1 ? data_9_instr : _GEN_1880; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1882 = 4'ha == readIdx_1 ? data_10_instr : _GEN_1881; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1883 = 4'hb == readIdx_1 ? data_11_instr : _GEN_1882; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1884 = 4'hc == readIdx_1 ? data_12_instr : _GEN_1883; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1885 = 4'hd == readIdx_1 ? data_13_instr : _GEN_1884; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1886 = 4'he == readIdx_1 ? data_14_instr : _GEN_1885; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1889 = 4'h1 == readIdx_1 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1890 = 4'h2 == readIdx_1 ? data_2_pc : _GEN_1889; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1891 = 4'h3 == readIdx_1 ? data_3_pc : _GEN_1890; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1892 = 4'h4 == readIdx_1 ? data_4_pc : _GEN_1891; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1893 = 4'h5 == readIdx_1 ? data_5_pc : _GEN_1892; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1894 = 4'h6 == readIdx_1 ? data_6_pc : _GEN_1893; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1895 = 4'h7 == readIdx_1 ? data_7_pc : _GEN_1894; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1896 = 4'h8 == readIdx_1 ? data_8_pc : _GEN_1895; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1897 = 4'h9 == readIdx_1 ? data_9_pc : _GEN_1896; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1898 = 4'ha == readIdx_1 ? data_10_pc : _GEN_1897; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1899 = 4'hb == readIdx_1 ? data_11_pc : _GEN_1898; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1900 = 4'hc == readIdx_1 ? data_12_pc : _GEN_1899; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1901 = 4'hd == readIdx_1 ? data_13_pc : _GEN_1900; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_1902 = 4'he == readIdx_1 ? data_14_pc : _GEN_1901; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1905 = 4'h1 == readIdx_1 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1906 = 4'h2 == readIdx_1 ? data_2_pdInfo_valid : _GEN_1905; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1907 = 4'h3 == readIdx_1 ? data_3_pdInfo_valid : _GEN_1906; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1908 = 4'h4 == readIdx_1 ? data_4_pdInfo_valid : _GEN_1907; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1909 = 4'h5 == readIdx_1 ? data_5_pdInfo_valid : _GEN_1908; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1910 = 4'h6 == readIdx_1 ? data_6_pdInfo_valid : _GEN_1909; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1911 = 4'h7 == readIdx_1 ? data_7_pdInfo_valid : _GEN_1910; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1912 = 4'h8 == readIdx_1 ? data_8_pdInfo_valid : _GEN_1911; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1913 = 4'h9 == readIdx_1 ? data_9_pdInfo_valid : _GEN_1912; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1914 = 4'ha == readIdx_1 ? data_10_pdInfo_valid : _GEN_1913; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1915 = 4'hb == readIdx_1 ? data_11_pdInfo_valid : _GEN_1914; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1916 = 4'hc == readIdx_1 ? data_12_pdInfo_valid : _GEN_1915; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1917 = 4'hd == readIdx_1 ? data_13_pdInfo_valid : _GEN_1916; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1918 = 4'he == readIdx_1 ? data_14_pdInfo_valid : _GEN_1917; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1921 = 4'h1 == readIdx_1 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1922 = 4'h2 == readIdx_1 ? data_2_pdInfo_isBr : _GEN_1921; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1923 = 4'h3 == readIdx_1 ? data_3_pdInfo_isBr : _GEN_1922; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1924 = 4'h4 == readIdx_1 ? data_4_pdInfo_isBr : _GEN_1923; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1925 = 4'h5 == readIdx_1 ? data_5_pdInfo_isBr : _GEN_1924; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1926 = 4'h6 == readIdx_1 ? data_6_pdInfo_isBr : _GEN_1925; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1927 = 4'h7 == readIdx_1 ? data_7_pdInfo_isBr : _GEN_1926; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1928 = 4'h8 == readIdx_1 ? data_8_pdInfo_isBr : _GEN_1927; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1929 = 4'h9 == readIdx_1 ? data_9_pdInfo_isBr : _GEN_1928; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1930 = 4'ha == readIdx_1 ? data_10_pdInfo_isBr : _GEN_1929; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1931 = 4'hb == readIdx_1 ? data_11_pdInfo_isBr : _GEN_1930; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1932 = 4'hc == readIdx_1 ? data_12_pdInfo_isBr : _GEN_1931; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1933 = 4'hd == readIdx_1 ? data_13_pdInfo_isBr : _GEN_1932; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1934 = 4'he == readIdx_1 ? data_14_pdInfo_isBr : _GEN_1933; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1937 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1938 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJal : _GEN_1937; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1939 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJal : _GEN_1938; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1940 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJal : _GEN_1939; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1941 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJal : _GEN_1940; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1942 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJal : _GEN_1941; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1943 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJal : _GEN_1942; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1944 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJal : _GEN_1943; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1945 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJal : _GEN_1944; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1946 = 4'ha == readIdx_1 ? data_10_pdInfo_isJal : _GEN_1945; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1947 = 4'hb == readIdx_1 ? data_11_pdInfo_isJal : _GEN_1946; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1948 = 4'hc == readIdx_1 ? data_12_pdInfo_isJal : _GEN_1947; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1949 = 4'hd == readIdx_1 ? data_13_pdInfo_isJal : _GEN_1948; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1950 = 4'he == readIdx_1 ? data_14_pdInfo_isJal : _GEN_1949; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1953 = 4'h1 == readIdx_1 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1954 = 4'h2 == readIdx_1 ? data_2_pdInfo_isJalr : _GEN_1953; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1955 = 4'h3 == readIdx_1 ? data_3_pdInfo_isJalr : _GEN_1954; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1956 = 4'h4 == readIdx_1 ? data_4_pdInfo_isJalr : _GEN_1955; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1957 = 4'h5 == readIdx_1 ? data_5_pdInfo_isJalr : _GEN_1956; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1958 = 4'h6 == readIdx_1 ? data_6_pdInfo_isJalr : _GEN_1957; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1959 = 4'h7 == readIdx_1 ? data_7_pdInfo_isJalr : _GEN_1958; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1960 = 4'h8 == readIdx_1 ? data_8_pdInfo_isJalr : _GEN_1959; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1961 = 4'h9 == readIdx_1 ? data_9_pdInfo_isJalr : _GEN_1960; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1962 = 4'ha == readIdx_1 ? data_10_pdInfo_isJalr : _GEN_1961; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1963 = 4'hb == readIdx_1 ? data_11_pdInfo_isJalr : _GEN_1962; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1964 = 4'hc == readIdx_1 ? data_12_pdInfo_isJalr : _GEN_1963; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1965 = 4'hd == readIdx_1 ? data_13_pdInfo_isJalr : _GEN_1964; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1966 = 4'he == readIdx_1 ? data_14_pdInfo_isJalr : _GEN_1965; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1969 = 4'h1 == readIdx_1 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1970 = 4'h2 == readIdx_1 ? data_2_pdInfo_isCall : _GEN_1969; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1971 = 4'h3 == readIdx_1 ? data_3_pdInfo_isCall : _GEN_1970; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1972 = 4'h4 == readIdx_1 ? data_4_pdInfo_isCall : _GEN_1971; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1973 = 4'h5 == readIdx_1 ? data_5_pdInfo_isCall : _GEN_1972; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1974 = 4'h6 == readIdx_1 ? data_6_pdInfo_isCall : _GEN_1973; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1975 = 4'h7 == readIdx_1 ? data_7_pdInfo_isCall : _GEN_1974; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1976 = 4'h8 == readIdx_1 ? data_8_pdInfo_isCall : _GEN_1975; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1977 = 4'h9 == readIdx_1 ? data_9_pdInfo_isCall : _GEN_1976; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1978 = 4'ha == readIdx_1 ? data_10_pdInfo_isCall : _GEN_1977; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1979 = 4'hb == readIdx_1 ? data_11_pdInfo_isCall : _GEN_1978; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1980 = 4'hc == readIdx_1 ? data_12_pdInfo_isCall : _GEN_1979; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1981 = 4'hd == readIdx_1 ? data_13_pdInfo_isCall : _GEN_1980; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1982 = 4'he == readIdx_1 ? data_14_pdInfo_isCall : _GEN_1981; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1985 = 4'h1 == readIdx_1 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1986 = 4'h2 == readIdx_1 ? data_2_pdInfo_isRet : _GEN_1985; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1987 = 4'h3 == readIdx_1 ? data_3_pdInfo_isRet : _GEN_1986; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1988 = 4'h4 == readIdx_1 ? data_4_pdInfo_isRet : _GEN_1987; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1989 = 4'h5 == readIdx_1 ? data_5_pdInfo_isRet : _GEN_1988; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1990 = 4'h6 == readIdx_1 ? data_6_pdInfo_isRet : _GEN_1989; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1991 = 4'h7 == readIdx_1 ? data_7_pdInfo_isRet : _GEN_1990; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1992 = 4'h8 == readIdx_1 ? data_8_pdInfo_isRet : _GEN_1991; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1993 = 4'h9 == readIdx_1 ? data_9_pdInfo_isRet : _GEN_1992; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1994 = 4'ha == readIdx_1 ? data_10_pdInfo_isRet : _GEN_1993; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1995 = 4'hb == readIdx_1 ? data_11_pdInfo_isRet : _GEN_1994; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1996 = 4'hc == readIdx_1 ? data_12_pdInfo_isRet : _GEN_1995; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1997 = 4'hd == readIdx_1 ? data_13_pdInfo_isRet : _GEN_1996; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_1998 = 4'he == readIdx_1 ? data_14_pdInfo_isRet : _GEN_1997; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2001 = 4'h1 == readIdx_1 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2002 = 4'h2 == readIdx_1 ? data_2_pdInfo_jumpTarget : _GEN_2001; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2003 = 4'h3 == readIdx_1 ? data_3_pdInfo_jumpTarget : _GEN_2002; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2004 = 4'h4 == readIdx_1 ? data_4_pdInfo_jumpTarget : _GEN_2003; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2005 = 4'h5 == readIdx_1 ? data_5_pdInfo_jumpTarget : _GEN_2004; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2006 = 4'h6 == readIdx_1 ? data_6_pdInfo_jumpTarget : _GEN_2005; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2007 = 4'h7 == readIdx_1 ? data_7_pdInfo_jumpTarget : _GEN_2006; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2008 = 4'h8 == readIdx_1 ? data_8_pdInfo_jumpTarget : _GEN_2007; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2009 = 4'h9 == readIdx_1 ? data_9_pdInfo_jumpTarget : _GEN_2008; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2010 = 4'ha == readIdx_1 ? data_10_pdInfo_jumpTarget : _GEN_2009; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2011 = 4'hb == readIdx_1 ? data_11_pdInfo_jumpTarget : _GEN_2010; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2012 = 4'hc == readIdx_1 ? data_12_pdInfo_jumpTarget : _GEN_2011; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2013 = 4'hd == readIdx_1 ? data_13_pdInfo_jumpTarget : _GEN_2012; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2014 = 4'he == readIdx_1 ? data_14_pdInfo_jumpTarget : _GEN_2013; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2017 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2018 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbRefill : _GEN_2017; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2019 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbRefill : _GEN_2018; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2020 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbRefill : _GEN_2019; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2021 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbRefill : _GEN_2020; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2022 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbRefill : _GEN_2021; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2023 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbRefill : _GEN_2022; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2024 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbRefill : _GEN_2023; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2025 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbRefill : _GEN_2024; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2026 = 4'ha == readIdx_1 ? data_10_exception_excpTlbRefill : _GEN_2025; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2027 = 4'hb == readIdx_1 ? data_11_exception_excpTlbRefill : _GEN_2026; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2028 = 4'hc == readIdx_1 ? data_12_exception_excpTlbRefill : _GEN_2027; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2029 = 4'hd == readIdx_1 ? data_13_exception_excpTlbRefill : _GEN_2028; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2030 = 4'he == readIdx_1 ? data_14_exception_excpTlbRefill : _GEN_2029; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2033 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2034 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbPif : _GEN_2033; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2035 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbPif : _GEN_2034; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2036 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbPif : _GEN_2035; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2037 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbPif : _GEN_2036; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2038 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbPif : _GEN_2037; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2039 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbPif : _GEN_2038; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2040 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbPif : _GEN_2039; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2041 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbPif : _GEN_2040; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2042 = 4'ha == readIdx_1 ? data_10_exception_excpTlbPif : _GEN_2041; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2043 = 4'hb == readIdx_1 ? data_11_exception_excpTlbPif : _GEN_2042; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2044 = 4'hc == readIdx_1 ? data_12_exception_excpTlbPif : _GEN_2043; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2045 = 4'hd == readIdx_1 ? data_13_exception_excpTlbPif : _GEN_2044; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2046 = 4'he == readIdx_1 ? data_14_exception_excpTlbPif : _GEN_2045; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2049 = 4'h1 == readIdx_1 ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2050 = 4'h2 == readIdx_1 ? data_2_exception_excpTlbPpi : _GEN_2049; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2051 = 4'h3 == readIdx_1 ? data_3_exception_excpTlbPpi : _GEN_2050; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2052 = 4'h4 == readIdx_1 ? data_4_exception_excpTlbPpi : _GEN_2051; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2053 = 4'h5 == readIdx_1 ? data_5_exception_excpTlbPpi : _GEN_2052; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2054 = 4'h6 == readIdx_1 ? data_6_exception_excpTlbPpi : _GEN_2053; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2055 = 4'h7 == readIdx_1 ? data_7_exception_excpTlbPpi : _GEN_2054; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2056 = 4'h8 == readIdx_1 ? data_8_exception_excpTlbPpi : _GEN_2055; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2057 = 4'h9 == readIdx_1 ? data_9_exception_excpTlbPpi : _GEN_2056; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2058 = 4'ha == readIdx_1 ? data_10_exception_excpTlbPpi : _GEN_2057; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2059 = 4'hb == readIdx_1 ? data_11_exception_excpTlbPpi : _GEN_2058; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2060 = 4'hc == readIdx_1 ? data_12_exception_excpTlbPpi : _GEN_2059; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2061 = 4'hd == readIdx_1 ? data_13_exception_excpTlbPpi : _GEN_2060; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2062 = 4'he == readIdx_1 ? data_14_exception_excpTlbPpi : _GEN_2061; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2065 = 4'h1 == readIdx_1 ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2066 = 4'h2 == readIdx_1 ? data_2_exception_excpAdef : _GEN_2065; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2067 = 4'h3 == readIdx_1 ? data_3_exception_excpAdef : _GEN_2066; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2068 = 4'h4 == readIdx_1 ? data_4_exception_excpAdef : _GEN_2067; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2069 = 4'h5 == readIdx_1 ? data_5_exception_excpAdef : _GEN_2068; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2070 = 4'h6 == readIdx_1 ? data_6_exception_excpAdef : _GEN_2069; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2071 = 4'h7 == readIdx_1 ? data_7_exception_excpAdef : _GEN_2070; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2072 = 4'h8 == readIdx_1 ? data_8_exception_excpAdef : _GEN_2071; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2073 = 4'h9 == readIdx_1 ? data_9_exception_excpAdef : _GEN_2072; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2074 = 4'ha == readIdx_1 ? data_10_exception_excpAdef : _GEN_2073; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2075 = 4'hb == readIdx_1 ? data_11_exception_excpAdef : _GEN_2074; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2076 = 4'hc == readIdx_1 ? data_12_exception_excpAdef : _GEN_2075; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2077 = 4'hd == readIdx_1 ? data_13_exception_excpAdef : _GEN_2076; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2078 = 4'he == readIdx_1 ? data_14_exception_excpAdef : _GEN_2077; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  canDeq_2 = count > 5'h2; // @[src/main/scala/util/CircularQueue.scala 211:24]
  wire [3:0] readIdx_2 = deqPtr_value + 4'h2; // @[src/main/scala/util/CircularQueue.scala 216:33]
  wire [31:0] _GEN_2081 = 4'h1 == readIdx_2 ? data_1_instr : data_0_instr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2082 = 4'h2 == readIdx_2 ? data_2_instr : _GEN_2081; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2083 = 4'h3 == readIdx_2 ? data_3_instr : _GEN_2082; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2084 = 4'h4 == readIdx_2 ? data_4_instr : _GEN_2083; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2085 = 4'h5 == readIdx_2 ? data_5_instr : _GEN_2084; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2086 = 4'h6 == readIdx_2 ? data_6_instr : _GEN_2085; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2087 = 4'h7 == readIdx_2 ? data_7_instr : _GEN_2086; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2088 = 4'h8 == readIdx_2 ? data_8_instr : _GEN_2087; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2089 = 4'h9 == readIdx_2 ? data_9_instr : _GEN_2088; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2090 = 4'ha == readIdx_2 ? data_10_instr : _GEN_2089; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2091 = 4'hb == readIdx_2 ? data_11_instr : _GEN_2090; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2092 = 4'hc == readIdx_2 ? data_12_instr : _GEN_2091; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2093 = 4'hd == readIdx_2 ? data_13_instr : _GEN_2092; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2094 = 4'he == readIdx_2 ? data_14_instr : _GEN_2093; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2097 = 4'h1 == readIdx_2 ? data_1_pc : data_0_pc; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2098 = 4'h2 == readIdx_2 ? data_2_pc : _GEN_2097; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2099 = 4'h3 == readIdx_2 ? data_3_pc : _GEN_2098; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2100 = 4'h4 == readIdx_2 ? data_4_pc : _GEN_2099; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2101 = 4'h5 == readIdx_2 ? data_5_pc : _GEN_2100; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2102 = 4'h6 == readIdx_2 ? data_6_pc : _GEN_2101; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2103 = 4'h7 == readIdx_2 ? data_7_pc : _GEN_2102; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2104 = 4'h8 == readIdx_2 ? data_8_pc : _GEN_2103; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2105 = 4'h9 == readIdx_2 ? data_9_pc : _GEN_2104; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2106 = 4'ha == readIdx_2 ? data_10_pc : _GEN_2105; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2107 = 4'hb == readIdx_2 ? data_11_pc : _GEN_2106; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2108 = 4'hc == readIdx_2 ? data_12_pc : _GEN_2107; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2109 = 4'hd == readIdx_2 ? data_13_pc : _GEN_2108; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2110 = 4'he == readIdx_2 ? data_14_pc : _GEN_2109; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2113 = 4'h1 == readIdx_2 ? data_1_pdInfo_valid : data_0_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2114 = 4'h2 == readIdx_2 ? data_2_pdInfo_valid : _GEN_2113; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2115 = 4'h3 == readIdx_2 ? data_3_pdInfo_valid : _GEN_2114; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2116 = 4'h4 == readIdx_2 ? data_4_pdInfo_valid : _GEN_2115; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2117 = 4'h5 == readIdx_2 ? data_5_pdInfo_valid : _GEN_2116; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2118 = 4'h6 == readIdx_2 ? data_6_pdInfo_valid : _GEN_2117; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2119 = 4'h7 == readIdx_2 ? data_7_pdInfo_valid : _GEN_2118; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2120 = 4'h8 == readIdx_2 ? data_8_pdInfo_valid : _GEN_2119; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2121 = 4'h9 == readIdx_2 ? data_9_pdInfo_valid : _GEN_2120; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2122 = 4'ha == readIdx_2 ? data_10_pdInfo_valid : _GEN_2121; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2123 = 4'hb == readIdx_2 ? data_11_pdInfo_valid : _GEN_2122; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2124 = 4'hc == readIdx_2 ? data_12_pdInfo_valid : _GEN_2123; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2125 = 4'hd == readIdx_2 ? data_13_pdInfo_valid : _GEN_2124; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2126 = 4'he == readIdx_2 ? data_14_pdInfo_valid : _GEN_2125; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2129 = 4'h1 == readIdx_2 ? data_1_pdInfo_isBr : data_0_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2130 = 4'h2 == readIdx_2 ? data_2_pdInfo_isBr : _GEN_2129; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2131 = 4'h3 == readIdx_2 ? data_3_pdInfo_isBr : _GEN_2130; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2132 = 4'h4 == readIdx_2 ? data_4_pdInfo_isBr : _GEN_2131; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2133 = 4'h5 == readIdx_2 ? data_5_pdInfo_isBr : _GEN_2132; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2134 = 4'h6 == readIdx_2 ? data_6_pdInfo_isBr : _GEN_2133; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2135 = 4'h7 == readIdx_2 ? data_7_pdInfo_isBr : _GEN_2134; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2136 = 4'h8 == readIdx_2 ? data_8_pdInfo_isBr : _GEN_2135; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2137 = 4'h9 == readIdx_2 ? data_9_pdInfo_isBr : _GEN_2136; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2138 = 4'ha == readIdx_2 ? data_10_pdInfo_isBr : _GEN_2137; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2139 = 4'hb == readIdx_2 ? data_11_pdInfo_isBr : _GEN_2138; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2140 = 4'hc == readIdx_2 ? data_12_pdInfo_isBr : _GEN_2139; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2141 = 4'hd == readIdx_2 ? data_13_pdInfo_isBr : _GEN_2140; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2142 = 4'he == readIdx_2 ? data_14_pdInfo_isBr : _GEN_2141; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2145 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJal : data_0_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2146 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJal : _GEN_2145; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2147 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJal : _GEN_2146; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2148 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJal : _GEN_2147; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2149 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJal : _GEN_2148; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2150 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJal : _GEN_2149; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2151 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJal : _GEN_2150; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2152 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJal : _GEN_2151; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2153 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJal : _GEN_2152; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2154 = 4'ha == readIdx_2 ? data_10_pdInfo_isJal : _GEN_2153; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2155 = 4'hb == readIdx_2 ? data_11_pdInfo_isJal : _GEN_2154; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2156 = 4'hc == readIdx_2 ? data_12_pdInfo_isJal : _GEN_2155; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2157 = 4'hd == readIdx_2 ? data_13_pdInfo_isJal : _GEN_2156; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2158 = 4'he == readIdx_2 ? data_14_pdInfo_isJal : _GEN_2157; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2161 = 4'h1 == readIdx_2 ? data_1_pdInfo_isJalr : data_0_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2162 = 4'h2 == readIdx_2 ? data_2_pdInfo_isJalr : _GEN_2161; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2163 = 4'h3 == readIdx_2 ? data_3_pdInfo_isJalr : _GEN_2162; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2164 = 4'h4 == readIdx_2 ? data_4_pdInfo_isJalr : _GEN_2163; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2165 = 4'h5 == readIdx_2 ? data_5_pdInfo_isJalr : _GEN_2164; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2166 = 4'h6 == readIdx_2 ? data_6_pdInfo_isJalr : _GEN_2165; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2167 = 4'h7 == readIdx_2 ? data_7_pdInfo_isJalr : _GEN_2166; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2168 = 4'h8 == readIdx_2 ? data_8_pdInfo_isJalr : _GEN_2167; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2169 = 4'h9 == readIdx_2 ? data_9_pdInfo_isJalr : _GEN_2168; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2170 = 4'ha == readIdx_2 ? data_10_pdInfo_isJalr : _GEN_2169; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2171 = 4'hb == readIdx_2 ? data_11_pdInfo_isJalr : _GEN_2170; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2172 = 4'hc == readIdx_2 ? data_12_pdInfo_isJalr : _GEN_2171; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2173 = 4'hd == readIdx_2 ? data_13_pdInfo_isJalr : _GEN_2172; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2174 = 4'he == readIdx_2 ? data_14_pdInfo_isJalr : _GEN_2173; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2177 = 4'h1 == readIdx_2 ? data_1_pdInfo_isCall : data_0_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2178 = 4'h2 == readIdx_2 ? data_2_pdInfo_isCall : _GEN_2177; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2179 = 4'h3 == readIdx_2 ? data_3_pdInfo_isCall : _GEN_2178; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2180 = 4'h4 == readIdx_2 ? data_4_pdInfo_isCall : _GEN_2179; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2181 = 4'h5 == readIdx_2 ? data_5_pdInfo_isCall : _GEN_2180; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2182 = 4'h6 == readIdx_2 ? data_6_pdInfo_isCall : _GEN_2181; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2183 = 4'h7 == readIdx_2 ? data_7_pdInfo_isCall : _GEN_2182; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2184 = 4'h8 == readIdx_2 ? data_8_pdInfo_isCall : _GEN_2183; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2185 = 4'h9 == readIdx_2 ? data_9_pdInfo_isCall : _GEN_2184; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2186 = 4'ha == readIdx_2 ? data_10_pdInfo_isCall : _GEN_2185; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2187 = 4'hb == readIdx_2 ? data_11_pdInfo_isCall : _GEN_2186; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2188 = 4'hc == readIdx_2 ? data_12_pdInfo_isCall : _GEN_2187; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2189 = 4'hd == readIdx_2 ? data_13_pdInfo_isCall : _GEN_2188; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2190 = 4'he == readIdx_2 ? data_14_pdInfo_isCall : _GEN_2189; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2193 = 4'h1 == readIdx_2 ? data_1_pdInfo_isRet : data_0_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2194 = 4'h2 == readIdx_2 ? data_2_pdInfo_isRet : _GEN_2193; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2195 = 4'h3 == readIdx_2 ? data_3_pdInfo_isRet : _GEN_2194; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2196 = 4'h4 == readIdx_2 ? data_4_pdInfo_isRet : _GEN_2195; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2197 = 4'h5 == readIdx_2 ? data_5_pdInfo_isRet : _GEN_2196; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2198 = 4'h6 == readIdx_2 ? data_6_pdInfo_isRet : _GEN_2197; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2199 = 4'h7 == readIdx_2 ? data_7_pdInfo_isRet : _GEN_2198; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2200 = 4'h8 == readIdx_2 ? data_8_pdInfo_isRet : _GEN_2199; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2201 = 4'h9 == readIdx_2 ? data_9_pdInfo_isRet : _GEN_2200; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2202 = 4'ha == readIdx_2 ? data_10_pdInfo_isRet : _GEN_2201; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2203 = 4'hb == readIdx_2 ? data_11_pdInfo_isRet : _GEN_2202; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2204 = 4'hc == readIdx_2 ? data_12_pdInfo_isRet : _GEN_2203; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2205 = 4'hd == readIdx_2 ? data_13_pdInfo_isRet : _GEN_2204; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2206 = 4'he == readIdx_2 ? data_14_pdInfo_isRet : _GEN_2205; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2209 = 4'h1 == readIdx_2 ? data_1_pdInfo_jumpTarget : data_0_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2210 = 4'h2 == readIdx_2 ? data_2_pdInfo_jumpTarget : _GEN_2209; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2211 = 4'h3 == readIdx_2 ? data_3_pdInfo_jumpTarget : _GEN_2210; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2212 = 4'h4 == readIdx_2 ? data_4_pdInfo_jumpTarget : _GEN_2211; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2213 = 4'h5 == readIdx_2 ? data_5_pdInfo_jumpTarget : _GEN_2212; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2214 = 4'h6 == readIdx_2 ? data_6_pdInfo_jumpTarget : _GEN_2213; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2215 = 4'h7 == readIdx_2 ? data_7_pdInfo_jumpTarget : _GEN_2214; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2216 = 4'h8 == readIdx_2 ? data_8_pdInfo_jumpTarget : _GEN_2215; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2217 = 4'h9 == readIdx_2 ? data_9_pdInfo_jumpTarget : _GEN_2216; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2218 = 4'ha == readIdx_2 ? data_10_pdInfo_jumpTarget : _GEN_2217; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2219 = 4'hb == readIdx_2 ? data_11_pdInfo_jumpTarget : _GEN_2218; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2220 = 4'hc == readIdx_2 ? data_12_pdInfo_jumpTarget : _GEN_2219; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2221 = 4'hd == readIdx_2 ? data_13_pdInfo_jumpTarget : _GEN_2220; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire [31:0] _GEN_2222 = 4'he == readIdx_2 ? data_14_pdInfo_jumpTarget : _GEN_2221; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2225 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbRefill : data_0_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2226 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbRefill : _GEN_2225; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2227 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbRefill : _GEN_2226; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2228 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbRefill : _GEN_2227; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2229 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbRefill : _GEN_2228; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2230 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbRefill : _GEN_2229; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2231 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbRefill : _GEN_2230; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2232 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbRefill : _GEN_2231; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2233 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbRefill : _GEN_2232; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2234 = 4'ha == readIdx_2 ? data_10_exception_excpTlbRefill : _GEN_2233; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2235 = 4'hb == readIdx_2 ? data_11_exception_excpTlbRefill : _GEN_2234; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2236 = 4'hc == readIdx_2 ? data_12_exception_excpTlbRefill : _GEN_2235; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2237 = 4'hd == readIdx_2 ? data_13_exception_excpTlbRefill : _GEN_2236; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2238 = 4'he == readIdx_2 ? data_14_exception_excpTlbRefill : _GEN_2237; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2241 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbPif : data_0_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2242 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbPif : _GEN_2241; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2243 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbPif : _GEN_2242; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2244 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbPif : _GEN_2243; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2245 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbPif : _GEN_2244; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2246 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbPif : _GEN_2245; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2247 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbPif : _GEN_2246; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2248 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbPif : _GEN_2247; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2249 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbPif : _GEN_2248; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2250 = 4'ha == readIdx_2 ? data_10_exception_excpTlbPif : _GEN_2249; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2251 = 4'hb == readIdx_2 ? data_11_exception_excpTlbPif : _GEN_2250; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2252 = 4'hc == readIdx_2 ? data_12_exception_excpTlbPif : _GEN_2251; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2253 = 4'hd == readIdx_2 ? data_13_exception_excpTlbPif : _GEN_2252; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2254 = 4'he == readIdx_2 ? data_14_exception_excpTlbPif : _GEN_2253; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2257 = 4'h1 == readIdx_2 ? data_1_exception_excpTlbPpi : data_0_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2258 = 4'h2 == readIdx_2 ? data_2_exception_excpTlbPpi : _GEN_2257; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2259 = 4'h3 == readIdx_2 ? data_3_exception_excpTlbPpi : _GEN_2258; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2260 = 4'h4 == readIdx_2 ? data_4_exception_excpTlbPpi : _GEN_2259; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2261 = 4'h5 == readIdx_2 ? data_5_exception_excpTlbPpi : _GEN_2260; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2262 = 4'h6 == readIdx_2 ? data_6_exception_excpTlbPpi : _GEN_2261; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2263 = 4'h7 == readIdx_2 ? data_7_exception_excpTlbPpi : _GEN_2262; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2264 = 4'h8 == readIdx_2 ? data_8_exception_excpTlbPpi : _GEN_2263; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2265 = 4'h9 == readIdx_2 ? data_9_exception_excpTlbPpi : _GEN_2264; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2266 = 4'ha == readIdx_2 ? data_10_exception_excpTlbPpi : _GEN_2265; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2267 = 4'hb == readIdx_2 ? data_11_exception_excpTlbPpi : _GEN_2266; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2268 = 4'hc == readIdx_2 ? data_12_exception_excpTlbPpi : _GEN_2267; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2269 = 4'hd == readIdx_2 ? data_13_exception_excpTlbPpi : _GEN_2268; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2270 = 4'he == readIdx_2 ? data_14_exception_excpTlbPpi : _GEN_2269; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2273 = 4'h1 == readIdx_2 ? data_1_exception_excpAdef : data_0_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2274 = 4'h2 == readIdx_2 ? data_2_exception_excpAdef : _GEN_2273; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2275 = 4'h3 == readIdx_2 ? data_3_exception_excpAdef : _GEN_2274; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2276 = 4'h4 == readIdx_2 ? data_4_exception_excpAdef : _GEN_2275; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2277 = 4'h5 == readIdx_2 ? data_5_exception_excpAdef : _GEN_2276; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2278 = 4'h6 == readIdx_2 ? data_6_exception_excpAdef : _GEN_2277; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2279 = 4'h7 == readIdx_2 ? data_7_exception_excpAdef : _GEN_2278; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2280 = 4'h8 == readIdx_2 ? data_8_exception_excpAdef : _GEN_2279; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2281 = 4'h9 == readIdx_2 ? data_9_exception_excpAdef : _GEN_2280; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2282 = 4'ha == readIdx_2 ? data_10_exception_excpAdef : _GEN_2281; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2283 = 4'hb == readIdx_2 ? data_11_exception_excpAdef : _GEN_2282; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2284 = 4'hc == readIdx_2 ? data_12_exception_excpAdef : _GEN_2283; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2285 = 4'hd == readIdx_2 ? data_13_exception_excpAdef : _GEN_2284; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _GEN_2286 = 4'he == readIdx_2 ? data_14_exception_excpAdef : _GEN_2285; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  wire  _deqFireCnt_T = io_deq_0_ready & io_deq_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_1 = io_deq_1_ready & io_deq_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _deqFireCnt_T_2 = io_deq_2_ready & io_deq_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _deqFireCnt_T_3 = _deqFireCnt_T_1 + _deqFireCnt_T_2; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [1:0] _GEN_3751 = {{1'd0}, _deqFireCnt_T}; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [2:0] _deqFireCnt_T_5 = _GEN_3751 + _deqFireCnt_T_3; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [1:0] deqFireCnt = _deqFireCnt_T_5[1:0]; // @[src/main/scala/util/CircularQueue.scala 221:25]
  wire [3:0] _GEN_3752 = {{2'd0}, deqFireCnt}; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire [4:0] deqPtr_newIncValue = deqPtr_value + _GEN_3752; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  deqPtr_wrap = deqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] deqPtr_newPtr_value = deqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_enq_0_ready = canEnq & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_1_ready = canEnq_1 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_2_ready = canEnq_2 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_enq_3_ready = canEnq_3 & ~full; // @[src/main/scala/util/CircularQueue.scala 185:31]
  assign io_deq_0_valid = canDeq & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_0_bits_instr = 4'hf == readIdx ? data_15_instr : _GEN_1678; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pc = 4'hf == readIdx ? data_15_pc : _GEN_1694; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_valid = 4'hf == readIdx ? data_15_pdInfo_valid : _GEN_1710; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isBr = 4'hf == readIdx ? data_15_pdInfo_isBr : _GEN_1726; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isJal = 4'hf == readIdx ? data_15_pdInfo_isJal : _GEN_1742; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isJalr = 4'hf == readIdx ? data_15_pdInfo_isJalr : _GEN_1758; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isCall = 4'hf == readIdx ? data_15_pdInfo_isCall : _GEN_1774; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_isRet = 4'hf == readIdx ? data_15_pdInfo_isRet : _GEN_1790; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_pdInfo_jumpTarget = 4'hf == readIdx ? data_15_pdInfo_jumpTarget : _GEN_1806; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbRefill = 4'hf == readIdx ? data_15_exception_excpTlbRefill : _GEN_1822; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbPif = 4'hf == readIdx ? data_15_exception_excpTlbPif : _GEN_1838; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpTlbPpi = 4'hf == readIdx ? data_15_exception_excpTlbPpi : _GEN_1854; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_0_bits_exception_excpAdef = 4'hf == readIdx ? data_15_exception_excpAdef : _GEN_1870; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_valid = canDeq_1 & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_1_bits_instr = 4'hf == readIdx_1 ? data_15_instr : _GEN_1886; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pc = 4'hf == readIdx_1 ? data_15_pc : _GEN_1902; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_valid = 4'hf == readIdx_1 ? data_15_pdInfo_valid : _GEN_1918; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isBr = 4'hf == readIdx_1 ? data_15_pdInfo_isBr : _GEN_1934; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isJal = 4'hf == readIdx_1 ? data_15_pdInfo_isJal : _GEN_1950; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isJalr = 4'hf == readIdx_1 ? data_15_pdInfo_isJalr : _GEN_1966; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isCall = 4'hf == readIdx_1 ? data_15_pdInfo_isCall : _GEN_1982; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_isRet = 4'hf == readIdx_1 ? data_15_pdInfo_isRet : _GEN_1998; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_pdInfo_jumpTarget = 4'hf == readIdx_1 ? data_15_pdInfo_jumpTarget : _GEN_2014; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbRefill = 4'hf == readIdx_1 ? data_15_exception_excpTlbRefill : _GEN_2030; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbPif = 4'hf == readIdx_1 ? data_15_exception_excpTlbPif : _GEN_2046; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpTlbPpi = 4'hf == readIdx_1 ? data_15_exception_excpTlbPpi : _GEN_2062; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_1_bits_exception_excpAdef = 4'hf == readIdx_1 ? data_15_exception_excpAdef : _GEN_2078; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_valid = canDeq_2 & ~empty; // @[src/main/scala/util/CircularQueue.scala 213:31]
  assign io_deq_2_bits_instr = 4'hf == readIdx_2 ? data_15_instr : _GEN_2094; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pc = 4'hf == readIdx_2 ? data_15_pc : _GEN_2110; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_valid = 4'hf == readIdx_2 ? data_15_pdInfo_valid : _GEN_2126; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isBr = 4'hf == readIdx_2 ? data_15_pdInfo_isBr : _GEN_2142; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isJal = 4'hf == readIdx_2 ? data_15_pdInfo_isJal : _GEN_2158; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isJalr = 4'hf == readIdx_2 ? data_15_pdInfo_isJalr : _GEN_2174; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isCall = 4'hf == readIdx_2 ? data_15_pdInfo_isCall : _GEN_2190; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_isRet = 4'hf == readIdx_2 ? data_15_pdInfo_isRet : _GEN_2206; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_pdInfo_jumpTarget = 4'hf == readIdx_2 ? data_15_pdInfo_jumpTarget : _GEN_2222; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbRefill = 4'hf == readIdx_2 ? data_15_exception_excpTlbRefill : _GEN_2238; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbPif = 4'hf == readIdx_2 ? data_15_exception_excpTlbPif : _GEN_2254; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpTlbPpi = 4'hf == readIdx_2 ? data_15_exception_excpTlbPpi : _GEN_2270; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  assign io_deq_2_bits_exception_excpAdef = 4'hf == readIdx_2 ? data_15_exception_excpAdef : _GEN_2286; // @[src/main/scala/util/CircularQueue.scala 217:{20,20}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      deqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 244:18]
    end else begin
      deqPtr_value <= deqPtr_newPtr_value; // @[src/main/scala/util/CircularQueue.scala 224:10]
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 101:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 101:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      deqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 245:17]
    end else if (deqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      deqPtr_flag <= ~deqPtr_flag;
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      enqPtr_value <= 4'h0; // @[src/main/scala/util/CircularQueue.scala 246:18]
    end else begin
      enqPtr_value <= enqPtr_newPtr_value; // @[src/main/scala/util/CircularQueue.scala 201:10]
    end
    if (reset) begin // @[src/main/scala/util/CircularQueue.scala 102:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 102:23]
    end else if (io_flush) begin // @[src/main/scala/util/CircularQueue.scala 242:18]
      enqPtr_flag <= 1'h0; // @[src/main/scala/util/CircularQueue.scala 247:17]
    end else if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
      enqPtr_flag <= ~enqPtr_flag;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_instr <= _GEN_1232;
      end
    end else begin
      data_0_instr <= _GEN_1232;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pc <= _GEN_1216;
      end
    end else begin
      data_0_pc <= _GEN_1216;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_valid <= _GEN_1104;
      end
    end else begin
      data_0_pdInfo_valid <= _GEN_1104;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isBr <= _GEN_1120;
      end
    end else begin
      data_0_pdInfo_isBr <= _GEN_1120;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isJal <= _GEN_1136;
      end
    end else begin
      data_0_pdInfo_isJal <= _GEN_1136;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isJalr <= _GEN_1152;
      end
    end else begin
      data_0_pdInfo_isJalr <= _GEN_1152;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isCall <= _GEN_1168;
      end
    end else begin
      data_0_pdInfo_isCall <= _GEN_1168;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_isRet <= _GEN_1184;
      end
    end else begin
      data_0_pdInfo_isRet <= _GEN_1184;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_pdInfo_jumpTarget <= _GEN_1200;
      end
    end else begin
      data_0_pdInfo_jumpTarget <= _GEN_1200;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbRefill <= _GEN_1040;
      end
    end else begin
      data_0_exception_excpTlbRefill <= _GEN_1040;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbPif <= _GEN_1056;
      end
    end else begin
      data_0_exception_excpTlbPif <= _GEN_1056;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpTlbPpi <= _GEN_1072;
      end
    end else begin
      data_0_exception_excpTlbPpi <= _GEN_1072;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h0 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_0_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_0_exception_excpAdef <= _GEN_1088;
      end
    end else begin
      data_0_exception_excpAdef <= _GEN_1088;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_instr <= _GEN_1233;
      end
    end else begin
      data_1_instr <= _GEN_1233;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pc <= _GEN_1217;
      end
    end else begin
      data_1_pc <= _GEN_1217;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_valid <= _GEN_1105;
      end
    end else begin
      data_1_pdInfo_valid <= _GEN_1105;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isBr <= _GEN_1121;
      end
    end else begin
      data_1_pdInfo_isBr <= _GEN_1121;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isJal <= _GEN_1137;
      end
    end else begin
      data_1_pdInfo_isJal <= _GEN_1137;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isJalr <= _GEN_1153;
      end
    end else begin
      data_1_pdInfo_isJalr <= _GEN_1153;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isCall <= _GEN_1169;
      end
    end else begin
      data_1_pdInfo_isCall <= _GEN_1169;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_isRet <= _GEN_1185;
      end
    end else begin
      data_1_pdInfo_isRet <= _GEN_1185;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_pdInfo_jumpTarget <= _GEN_1201;
      end
    end else begin
      data_1_pdInfo_jumpTarget <= _GEN_1201;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbRefill <= _GEN_1041;
      end
    end else begin
      data_1_exception_excpTlbRefill <= _GEN_1041;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbPif <= _GEN_1057;
      end
    end else begin
      data_1_exception_excpTlbPif <= _GEN_1057;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpTlbPpi <= _GEN_1073;
      end
    end else begin
      data_1_exception_excpTlbPpi <= _GEN_1073;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h1 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_1_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_1_exception_excpAdef <= _GEN_1089;
      end
    end else begin
      data_1_exception_excpAdef <= _GEN_1089;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_instr <= _GEN_1234;
      end
    end else begin
      data_2_instr <= _GEN_1234;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pc <= _GEN_1218;
      end
    end else begin
      data_2_pc <= _GEN_1218;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_valid <= _GEN_1106;
      end
    end else begin
      data_2_pdInfo_valid <= _GEN_1106;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isBr <= _GEN_1122;
      end
    end else begin
      data_2_pdInfo_isBr <= _GEN_1122;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isJal <= _GEN_1138;
      end
    end else begin
      data_2_pdInfo_isJal <= _GEN_1138;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isJalr <= _GEN_1154;
      end
    end else begin
      data_2_pdInfo_isJalr <= _GEN_1154;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isCall <= _GEN_1170;
      end
    end else begin
      data_2_pdInfo_isCall <= _GEN_1170;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_isRet <= _GEN_1186;
      end
    end else begin
      data_2_pdInfo_isRet <= _GEN_1186;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_pdInfo_jumpTarget <= _GEN_1202;
      end
    end else begin
      data_2_pdInfo_jumpTarget <= _GEN_1202;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbRefill <= _GEN_1042;
      end
    end else begin
      data_2_exception_excpTlbRefill <= _GEN_1042;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbPif <= _GEN_1058;
      end
    end else begin
      data_2_exception_excpTlbPif <= _GEN_1058;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpTlbPpi <= _GEN_1074;
      end
    end else begin
      data_2_exception_excpTlbPpi <= _GEN_1074;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h2 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_2_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_2_exception_excpAdef <= _GEN_1090;
      end
    end else begin
      data_2_exception_excpAdef <= _GEN_1090;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_instr <= _GEN_1235;
      end
    end else begin
      data_3_instr <= _GEN_1235;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pc <= _GEN_1219;
      end
    end else begin
      data_3_pc <= _GEN_1219;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_valid <= _GEN_1107;
      end
    end else begin
      data_3_pdInfo_valid <= _GEN_1107;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isBr <= _GEN_1123;
      end
    end else begin
      data_3_pdInfo_isBr <= _GEN_1123;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isJal <= _GEN_1139;
      end
    end else begin
      data_3_pdInfo_isJal <= _GEN_1139;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isJalr <= _GEN_1155;
      end
    end else begin
      data_3_pdInfo_isJalr <= _GEN_1155;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isCall <= _GEN_1171;
      end
    end else begin
      data_3_pdInfo_isCall <= _GEN_1171;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_isRet <= _GEN_1187;
      end
    end else begin
      data_3_pdInfo_isRet <= _GEN_1187;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_pdInfo_jumpTarget <= _GEN_1203;
      end
    end else begin
      data_3_pdInfo_jumpTarget <= _GEN_1203;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbRefill <= _GEN_1043;
      end
    end else begin
      data_3_exception_excpTlbRefill <= _GEN_1043;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbPif <= _GEN_1059;
      end
    end else begin
      data_3_exception_excpTlbPif <= _GEN_1059;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpTlbPpi <= _GEN_1075;
      end
    end else begin
      data_3_exception_excpTlbPpi <= _GEN_1075;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h3 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_3_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_3_exception_excpAdef <= _GEN_1091;
      end
    end else begin
      data_3_exception_excpAdef <= _GEN_1091;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_instr <= _GEN_1236;
      end
    end else begin
      data_4_instr <= _GEN_1236;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pc <= _GEN_1220;
      end
    end else begin
      data_4_pc <= _GEN_1220;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_valid <= _GEN_1108;
      end
    end else begin
      data_4_pdInfo_valid <= _GEN_1108;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isBr <= _GEN_1124;
      end
    end else begin
      data_4_pdInfo_isBr <= _GEN_1124;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isJal <= _GEN_1140;
      end
    end else begin
      data_4_pdInfo_isJal <= _GEN_1140;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isJalr <= _GEN_1156;
      end
    end else begin
      data_4_pdInfo_isJalr <= _GEN_1156;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isCall <= _GEN_1172;
      end
    end else begin
      data_4_pdInfo_isCall <= _GEN_1172;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_isRet <= _GEN_1188;
      end
    end else begin
      data_4_pdInfo_isRet <= _GEN_1188;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_pdInfo_jumpTarget <= _GEN_1204;
      end
    end else begin
      data_4_pdInfo_jumpTarget <= _GEN_1204;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbRefill <= _GEN_1044;
      end
    end else begin
      data_4_exception_excpTlbRefill <= _GEN_1044;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbPif <= _GEN_1060;
      end
    end else begin
      data_4_exception_excpTlbPif <= _GEN_1060;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpTlbPpi <= _GEN_1076;
      end
    end else begin
      data_4_exception_excpTlbPpi <= _GEN_1076;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h4 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_4_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_4_exception_excpAdef <= _GEN_1092;
      end
    end else begin
      data_4_exception_excpAdef <= _GEN_1092;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_instr <= _GEN_1237;
      end
    end else begin
      data_5_instr <= _GEN_1237;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pc <= _GEN_1221;
      end
    end else begin
      data_5_pc <= _GEN_1221;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_valid <= _GEN_1109;
      end
    end else begin
      data_5_pdInfo_valid <= _GEN_1109;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isBr <= _GEN_1125;
      end
    end else begin
      data_5_pdInfo_isBr <= _GEN_1125;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isJal <= _GEN_1141;
      end
    end else begin
      data_5_pdInfo_isJal <= _GEN_1141;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isJalr <= _GEN_1157;
      end
    end else begin
      data_5_pdInfo_isJalr <= _GEN_1157;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isCall <= _GEN_1173;
      end
    end else begin
      data_5_pdInfo_isCall <= _GEN_1173;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_isRet <= _GEN_1189;
      end
    end else begin
      data_5_pdInfo_isRet <= _GEN_1189;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_pdInfo_jumpTarget <= _GEN_1205;
      end
    end else begin
      data_5_pdInfo_jumpTarget <= _GEN_1205;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbRefill <= _GEN_1045;
      end
    end else begin
      data_5_exception_excpTlbRefill <= _GEN_1045;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbPif <= _GEN_1061;
      end
    end else begin
      data_5_exception_excpTlbPif <= _GEN_1061;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpTlbPpi <= _GEN_1077;
      end
    end else begin
      data_5_exception_excpTlbPpi <= _GEN_1077;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h5 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_5_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_5_exception_excpAdef <= _GEN_1093;
      end
    end else begin
      data_5_exception_excpAdef <= _GEN_1093;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_instr <= _GEN_1238;
      end
    end else begin
      data_6_instr <= _GEN_1238;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pc <= _GEN_1222;
      end
    end else begin
      data_6_pc <= _GEN_1222;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_valid <= _GEN_1110;
      end
    end else begin
      data_6_pdInfo_valid <= _GEN_1110;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isBr <= _GEN_1126;
      end
    end else begin
      data_6_pdInfo_isBr <= _GEN_1126;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isJal <= _GEN_1142;
      end
    end else begin
      data_6_pdInfo_isJal <= _GEN_1142;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isJalr <= _GEN_1158;
      end
    end else begin
      data_6_pdInfo_isJalr <= _GEN_1158;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isCall <= _GEN_1174;
      end
    end else begin
      data_6_pdInfo_isCall <= _GEN_1174;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_isRet <= _GEN_1190;
      end
    end else begin
      data_6_pdInfo_isRet <= _GEN_1190;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_pdInfo_jumpTarget <= _GEN_1206;
      end
    end else begin
      data_6_pdInfo_jumpTarget <= _GEN_1206;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbRefill <= _GEN_1046;
      end
    end else begin
      data_6_exception_excpTlbRefill <= _GEN_1046;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbPif <= _GEN_1062;
      end
    end else begin
      data_6_exception_excpTlbPif <= _GEN_1062;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpTlbPpi <= _GEN_1078;
      end
    end else begin
      data_6_exception_excpTlbPpi <= _GEN_1078;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h6 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_6_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_6_exception_excpAdef <= _GEN_1094;
      end
    end else begin
      data_6_exception_excpAdef <= _GEN_1094;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_instr <= _GEN_1239;
      end
    end else begin
      data_7_instr <= _GEN_1239;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pc <= _GEN_1223;
      end
    end else begin
      data_7_pc <= _GEN_1223;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_valid <= _GEN_1111;
      end
    end else begin
      data_7_pdInfo_valid <= _GEN_1111;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isBr <= _GEN_1127;
      end
    end else begin
      data_7_pdInfo_isBr <= _GEN_1127;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isJal <= _GEN_1143;
      end
    end else begin
      data_7_pdInfo_isJal <= _GEN_1143;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isJalr <= _GEN_1159;
      end
    end else begin
      data_7_pdInfo_isJalr <= _GEN_1159;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isCall <= _GEN_1175;
      end
    end else begin
      data_7_pdInfo_isCall <= _GEN_1175;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_isRet <= _GEN_1191;
      end
    end else begin
      data_7_pdInfo_isRet <= _GEN_1191;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_pdInfo_jumpTarget <= _GEN_1207;
      end
    end else begin
      data_7_pdInfo_jumpTarget <= _GEN_1207;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbRefill <= _GEN_1047;
      end
    end else begin
      data_7_exception_excpTlbRefill <= _GEN_1047;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbPif <= _GEN_1063;
      end
    end else begin
      data_7_exception_excpTlbPif <= _GEN_1063;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpTlbPpi <= _GEN_1079;
      end
    end else begin
      data_7_exception_excpTlbPpi <= _GEN_1079;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h7 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_7_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_7_exception_excpAdef <= _GEN_1095;
      end
    end else begin
      data_7_exception_excpAdef <= _GEN_1095;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_instr <= _GEN_1240;
      end
    end else begin
      data_8_instr <= _GEN_1240;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pc <= _GEN_1224;
      end
    end else begin
      data_8_pc <= _GEN_1224;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_valid <= _GEN_1112;
      end
    end else begin
      data_8_pdInfo_valid <= _GEN_1112;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isBr <= _GEN_1128;
      end
    end else begin
      data_8_pdInfo_isBr <= _GEN_1128;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isJal <= _GEN_1144;
      end
    end else begin
      data_8_pdInfo_isJal <= _GEN_1144;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isJalr <= _GEN_1160;
      end
    end else begin
      data_8_pdInfo_isJalr <= _GEN_1160;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isCall <= _GEN_1176;
      end
    end else begin
      data_8_pdInfo_isCall <= _GEN_1176;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_isRet <= _GEN_1192;
      end
    end else begin
      data_8_pdInfo_isRet <= _GEN_1192;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_pdInfo_jumpTarget <= _GEN_1208;
      end
    end else begin
      data_8_pdInfo_jumpTarget <= _GEN_1208;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbRefill <= _GEN_1048;
      end
    end else begin
      data_8_exception_excpTlbRefill <= _GEN_1048;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbPif <= _GEN_1064;
      end
    end else begin
      data_8_exception_excpTlbPif <= _GEN_1064;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpTlbPpi <= _GEN_1080;
      end
    end else begin
      data_8_exception_excpTlbPpi <= _GEN_1080;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h8 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_8_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_8_exception_excpAdef <= _GEN_1096;
      end
    end else begin
      data_8_exception_excpAdef <= _GEN_1096;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_instr <= _GEN_1241;
      end
    end else begin
      data_9_instr <= _GEN_1241;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pc <= _GEN_1225;
      end
    end else begin
      data_9_pc <= _GEN_1225;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_valid <= _GEN_1113;
      end
    end else begin
      data_9_pdInfo_valid <= _GEN_1113;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isBr <= _GEN_1129;
      end
    end else begin
      data_9_pdInfo_isBr <= _GEN_1129;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isJal <= _GEN_1145;
      end
    end else begin
      data_9_pdInfo_isJal <= _GEN_1145;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isJalr <= _GEN_1161;
      end
    end else begin
      data_9_pdInfo_isJalr <= _GEN_1161;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isCall <= _GEN_1177;
      end
    end else begin
      data_9_pdInfo_isCall <= _GEN_1177;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_isRet <= _GEN_1193;
      end
    end else begin
      data_9_pdInfo_isRet <= _GEN_1193;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_pdInfo_jumpTarget <= _GEN_1209;
      end
    end else begin
      data_9_pdInfo_jumpTarget <= _GEN_1209;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbRefill <= _GEN_1049;
      end
    end else begin
      data_9_exception_excpTlbRefill <= _GEN_1049;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbPif <= _GEN_1065;
      end
    end else begin
      data_9_exception_excpTlbPif <= _GEN_1065;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpTlbPpi <= _GEN_1081;
      end
    end else begin
      data_9_exception_excpTlbPpi <= _GEN_1081;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'h9 == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_9_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_9_exception_excpAdef <= _GEN_1097;
      end
    end else begin
      data_9_exception_excpAdef <= _GEN_1097;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_instr <= _GEN_1242;
      end
    end else begin
      data_10_instr <= _GEN_1242;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pc <= _GEN_1226;
      end
    end else begin
      data_10_pc <= _GEN_1226;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_valid <= _GEN_1114;
      end
    end else begin
      data_10_pdInfo_valid <= _GEN_1114;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isBr <= _GEN_1130;
      end
    end else begin
      data_10_pdInfo_isBr <= _GEN_1130;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isJal <= _GEN_1146;
      end
    end else begin
      data_10_pdInfo_isJal <= _GEN_1146;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isJalr <= _GEN_1162;
      end
    end else begin
      data_10_pdInfo_isJalr <= _GEN_1162;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isCall <= _GEN_1178;
      end
    end else begin
      data_10_pdInfo_isCall <= _GEN_1178;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_isRet <= _GEN_1194;
      end
    end else begin
      data_10_pdInfo_isRet <= _GEN_1194;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_pdInfo_jumpTarget <= _GEN_1210;
      end
    end else begin
      data_10_pdInfo_jumpTarget <= _GEN_1210;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbRefill <= _GEN_1050;
      end
    end else begin
      data_10_exception_excpTlbRefill <= _GEN_1050;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbPif <= _GEN_1066;
      end
    end else begin
      data_10_exception_excpTlbPif <= _GEN_1066;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpTlbPpi <= _GEN_1082;
      end
    end else begin
      data_10_exception_excpTlbPpi <= _GEN_1082;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'ha == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_10_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_10_exception_excpAdef <= _GEN_1098;
      end
    end else begin
      data_10_exception_excpAdef <= _GEN_1098;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_instr <= _GEN_1243;
      end
    end else begin
      data_11_instr <= _GEN_1243;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pc <= _GEN_1227;
      end
    end else begin
      data_11_pc <= _GEN_1227;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_valid <= _GEN_1115;
      end
    end else begin
      data_11_pdInfo_valid <= _GEN_1115;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isBr <= _GEN_1131;
      end
    end else begin
      data_11_pdInfo_isBr <= _GEN_1131;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isJal <= _GEN_1147;
      end
    end else begin
      data_11_pdInfo_isJal <= _GEN_1147;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isJalr <= _GEN_1163;
      end
    end else begin
      data_11_pdInfo_isJalr <= _GEN_1163;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isCall <= _GEN_1179;
      end
    end else begin
      data_11_pdInfo_isCall <= _GEN_1179;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_isRet <= _GEN_1195;
      end
    end else begin
      data_11_pdInfo_isRet <= _GEN_1195;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_pdInfo_jumpTarget <= _GEN_1211;
      end
    end else begin
      data_11_pdInfo_jumpTarget <= _GEN_1211;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbRefill <= _GEN_1051;
      end
    end else begin
      data_11_exception_excpTlbRefill <= _GEN_1051;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbPif <= _GEN_1067;
      end
    end else begin
      data_11_exception_excpTlbPif <= _GEN_1067;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpTlbPpi <= _GEN_1083;
      end
    end else begin
      data_11_exception_excpTlbPpi <= _GEN_1083;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hb == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_11_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_11_exception_excpAdef <= _GEN_1099;
      end
    end else begin
      data_11_exception_excpAdef <= _GEN_1099;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_instr <= _GEN_1244;
      end
    end else begin
      data_12_instr <= _GEN_1244;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pc <= _GEN_1228;
      end
    end else begin
      data_12_pc <= _GEN_1228;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_valid <= _GEN_1116;
      end
    end else begin
      data_12_pdInfo_valid <= _GEN_1116;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isBr <= _GEN_1132;
      end
    end else begin
      data_12_pdInfo_isBr <= _GEN_1132;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isJal <= _GEN_1148;
      end
    end else begin
      data_12_pdInfo_isJal <= _GEN_1148;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isJalr <= _GEN_1164;
      end
    end else begin
      data_12_pdInfo_isJalr <= _GEN_1164;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isCall <= _GEN_1180;
      end
    end else begin
      data_12_pdInfo_isCall <= _GEN_1180;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_isRet <= _GEN_1196;
      end
    end else begin
      data_12_pdInfo_isRet <= _GEN_1196;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_pdInfo_jumpTarget <= _GEN_1212;
      end
    end else begin
      data_12_pdInfo_jumpTarget <= _GEN_1212;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbRefill <= _GEN_1052;
      end
    end else begin
      data_12_exception_excpTlbRefill <= _GEN_1052;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbPif <= _GEN_1068;
      end
    end else begin
      data_12_exception_excpTlbPif <= _GEN_1068;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpTlbPpi <= _GEN_1084;
      end
    end else begin
      data_12_exception_excpTlbPpi <= _GEN_1084;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hc == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_12_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_12_exception_excpAdef <= _GEN_1100;
      end
    end else begin
      data_12_exception_excpAdef <= _GEN_1100;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_instr <= _GEN_1245;
      end
    end else begin
      data_13_instr <= _GEN_1245;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pc <= _GEN_1229;
      end
    end else begin
      data_13_pc <= _GEN_1229;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_valid <= _GEN_1117;
      end
    end else begin
      data_13_pdInfo_valid <= _GEN_1117;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isBr <= _GEN_1133;
      end
    end else begin
      data_13_pdInfo_isBr <= _GEN_1133;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isJal <= _GEN_1149;
      end
    end else begin
      data_13_pdInfo_isJal <= _GEN_1149;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isJalr <= _GEN_1165;
      end
    end else begin
      data_13_pdInfo_isJalr <= _GEN_1165;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isCall <= _GEN_1181;
      end
    end else begin
      data_13_pdInfo_isCall <= _GEN_1181;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_isRet <= _GEN_1197;
      end
    end else begin
      data_13_pdInfo_isRet <= _GEN_1197;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_pdInfo_jumpTarget <= _GEN_1213;
      end
    end else begin
      data_13_pdInfo_jumpTarget <= _GEN_1213;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbRefill <= _GEN_1053;
      end
    end else begin
      data_13_exception_excpTlbRefill <= _GEN_1053;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbPif <= _GEN_1069;
      end
    end else begin
      data_13_exception_excpTlbPif <= _GEN_1069;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpTlbPpi <= _GEN_1085;
      end
    end else begin
      data_13_exception_excpTlbPpi <= _GEN_1085;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hd == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_13_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_13_exception_excpAdef <= _GEN_1101;
      end
    end else begin
      data_13_exception_excpAdef <= _GEN_1101;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_instr <= _GEN_1246;
      end
    end else begin
      data_14_instr <= _GEN_1246;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pc <= _GEN_1230;
      end
    end else begin
      data_14_pc <= _GEN_1230;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_valid <= _GEN_1118;
      end
    end else begin
      data_14_pdInfo_valid <= _GEN_1118;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isBr <= _GEN_1134;
      end
    end else begin
      data_14_pdInfo_isBr <= _GEN_1134;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isJal <= _GEN_1150;
      end
    end else begin
      data_14_pdInfo_isJal <= _GEN_1150;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isJalr <= _GEN_1166;
      end
    end else begin
      data_14_pdInfo_isJalr <= _GEN_1166;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isCall <= _GEN_1182;
      end
    end else begin
      data_14_pdInfo_isCall <= _GEN_1182;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_isRet <= _GEN_1198;
      end
    end else begin
      data_14_pdInfo_isRet <= _GEN_1198;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_pdInfo_jumpTarget <= _GEN_1214;
      end
    end else begin
      data_14_pdInfo_jumpTarget <= _GEN_1214;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbRefill <= _GEN_1054;
      end
    end else begin
      data_14_exception_excpTlbRefill <= _GEN_1054;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbPif <= _GEN_1070;
      end
    end else begin
      data_14_exception_excpTlbPif <= _GEN_1070;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpTlbPpi <= _GEN_1086;
      end
    end else begin
      data_14_exception_excpTlbPpi <= _GEN_1086;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'he == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_14_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_14_exception_excpAdef <= _GEN_1102;
      end
    end else begin
      data_14_exception_excpAdef <= _GEN_1102;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_instr <= io_enq_3_bits_instr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_instr <= _GEN_1247;
      end
    end else begin
      data_15_instr <= _GEN_1247;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pc <= io_enq_3_bits_pc; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pc <= _GEN_1231;
      end
    end else begin
      data_15_pc <= _GEN_1231;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_valid <= io_enq_3_bits_pdInfo_valid; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_valid <= _GEN_1119;
      end
    end else begin
      data_15_pdInfo_valid <= _GEN_1119;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isBr <= io_enq_3_bits_pdInfo_isBr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isBr <= _GEN_1135;
      end
    end else begin
      data_15_pdInfo_isBr <= _GEN_1135;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isJal <= io_enq_3_bits_pdInfo_isJal; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isJal <= _GEN_1151;
      end
    end else begin
      data_15_pdInfo_isJal <= _GEN_1151;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isJalr <= io_enq_3_bits_pdInfo_isJalr; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isJalr <= _GEN_1167;
      end
    end else begin
      data_15_pdInfo_isJalr <= _GEN_1167;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isCall <= io_enq_3_bits_pdInfo_isCall; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isCall <= _GEN_1183;
      end
    end else begin
      data_15_pdInfo_isCall <= _GEN_1183;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_isRet <= io_enq_3_bits_pdInfo_isRet; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_isRet <= _GEN_1199;
      end
    end else begin
      data_15_pdInfo_isRet <= _GEN_1199;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_pdInfo_jumpTarget <= io_enq_3_bits_pdInfo_jumpTarget; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_pdInfo_jumpTarget <= _GEN_1215;
      end
    end else begin
      data_15_pdInfo_jumpTarget <= _GEN_1215;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbRefill <= io_enq_3_bits_exception_excpTlbRefill; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbRefill <= _GEN_1055;
      end
    end else begin
      data_15_exception_excpTlbRefill <= _GEN_1055;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbPif <= io_enq_3_bits_exception_excpTlbPif; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbPif <= _GEN_1071;
      end
    end else begin
      data_15_exception_excpTlbPif <= _GEN_1071;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpTlbPpi <= io_enq_3_bits_exception_excpTlbPpi; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpTlbPpi <= _GEN_1087;
      end
    end else begin
      data_15_exception_excpTlbPpi <= _GEN_1087;
    end
    if (_T_18) begin // @[src/main/scala/util/CircularQueue.scala 187:27]
      if (4'hf == writeIdx_3) begin // @[src/main/scala/util/CircularQueue.scala 192:22]
        data_15_exception_excpAdef <= io_enq_3_bits_exception_excpAdef; // @[src/main/scala/util/CircularQueue.scala 192:22]
      end else begin
        data_15_exception_excpAdef <= _GEN_1103;
      end
    end else begin
      data_15_exception_excpAdef <= _GEN_1103;
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
        if (io_flush & _T_3) begin
          $fwrite(32'h80000002,"[CircularQueue] Flush activated. Queue cleared.\n"); // @[src/main/scala/util/CircularQueue.scala 256:11]
        end
    `ifdef PRINTF_COND
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
  data_0_exception_excpTlbRefill = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  data_0_exception_excpTlbPif = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  data_0_exception_excpTlbPpi = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  data_0_exception_excpAdef = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  data_1_instr = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  data_1_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  data_1_pdInfo_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  data_1_pdInfo_isBr = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  data_1_pdInfo_isJal = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  data_1_pdInfo_isJalr = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  data_1_pdInfo_isCall = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  data_1_pdInfo_isRet = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  data_1_pdInfo_jumpTarget = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  data_1_exception_excpTlbRefill = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  data_1_exception_excpTlbPif = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  data_1_exception_excpTlbPpi = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  data_1_exception_excpAdef = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  data_2_instr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  data_2_pc = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  data_2_pdInfo_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  data_2_pdInfo_isBr = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  data_2_pdInfo_isJal = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  data_2_pdInfo_isJalr = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  data_2_pdInfo_isCall = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  data_2_pdInfo_isRet = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  data_2_pdInfo_jumpTarget = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  data_2_exception_excpTlbRefill = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  data_2_exception_excpTlbPif = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  data_2_exception_excpTlbPpi = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  data_2_exception_excpAdef = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  data_3_instr = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  data_3_pc = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  data_3_pdInfo_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  data_3_pdInfo_isBr = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  data_3_pdInfo_isJal = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  data_3_pdInfo_isJalr = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  data_3_pdInfo_isCall = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  data_3_pdInfo_isRet = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  data_3_pdInfo_jumpTarget = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  data_3_exception_excpTlbRefill = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  data_3_exception_excpTlbPif = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  data_3_exception_excpTlbPpi = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  data_3_exception_excpAdef = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  data_4_instr = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  data_4_pc = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  data_4_pdInfo_valid = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  data_4_pdInfo_isBr = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  data_4_pdInfo_isJal = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  data_4_pdInfo_isJalr = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  data_4_pdInfo_isCall = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_4_pdInfo_isRet = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  data_4_pdInfo_jumpTarget = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  data_4_exception_excpTlbRefill = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  data_4_exception_excpTlbPif = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  data_4_exception_excpTlbPpi = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  data_4_exception_excpAdef = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  data_5_instr = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  data_5_pc = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  data_5_pdInfo_valid = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  data_5_pdInfo_isBr = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  data_5_pdInfo_isJal = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  data_5_pdInfo_isJalr = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  data_5_pdInfo_isCall = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  data_5_pdInfo_isRet = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  data_5_pdInfo_jumpTarget = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  data_5_exception_excpTlbRefill = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  data_5_exception_excpTlbPif = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  data_5_exception_excpTlbPpi = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  data_5_exception_excpAdef = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  data_6_instr = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  data_6_pc = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  data_6_pdInfo_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  data_6_pdInfo_isBr = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  data_6_pdInfo_isJal = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  data_6_pdInfo_isJalr = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  data_6_pdInfo_isCall = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  data_6_pdInfo_isRet = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  data_6_pdInfo_jumpTarget = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  data_6_exception_excpTlbRefill = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  data_6_exception_excpTlbPif = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  data_6_exception_excpTlbPpi = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  data_6_exception_excpAdef = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  data_7_instr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  data_7_pc = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  data_7_pdInfo_valid = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  data_7_pdInfo_isBr = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  data_7_pdInfo_isJal = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  data_7_pdInfo_isJalr = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  data_7_pdInfo_isCall = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  data_7_pdInfo_isRet = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  data_7_pdInfo_jumpTarget = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  data_7_exception_excpTlbRefill = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  data_7_exception_excpTlbPif = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  data_7_exception_excpTlbPpi = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  data_7_exception_excpAdef = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  data_8_instr = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  data_8_pc = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  data_8_pdInfo_valid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  data_8_pdInfo_isBr = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  data_8_pdInfo_isJal = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  data_8_pdInfo_isJalr = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  data_8_pdInfo_isCall = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  data_8_pdInfo_isRet = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  data_8_pdInfo_jumpTarget = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  data_8_exception_excpTlbRefill = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  data_8_exception_excpTlbPif = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  data_8_exception_excpTlbPpi = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  data_8_exception_excpAdef = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  data_9_instr = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  data_9_pc = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  data_9_pdInfo_valid = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  data_9_pdInfo_isBr = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  data_9_pdInfo_isJal = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  data_9_pdInfo_isJalr = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  data_9_pdInfo_isCall = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  data_9_pdInfo_isRet = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  data_9_pdInfo_jumpTarget = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  data_9_exception_excpTlbRefill = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  data_9_exception_excpTlbPif = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  data_9_exception_excpTlbPpi = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  data_9_exception_excpAdef = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  data_10_instr = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  data_10_pc = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  data_10_pdInfo_valid = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  data_10_pdInfo_isBr = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  data_10_pdInfo_isJal = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  data_10_pdInfo_isJalr = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  data_10_pdInfo_isCall = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  data_10_pdInfo_isRet = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  data_10_pdInfo_jumpTarget = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  data_10_exception_excpTlbRefill = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  data_10_exception_excpTlbPif = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  data_10_exception_excpTlbPpi = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  data_10_exception_excpAdef = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  data_11_instr = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  data_11_pc = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  data_11_pdInfo_valid = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  data_11_pdInfo_isBr = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  data_11_pdInfo_isJal = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  data_11_pdInfo_isJalr = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  data_11_pdInfo_isCall = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  data_11_pdInfo_isRet = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  data_11_pdInfo_jumpTarget = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  data_11_exception_excpTlbRefill = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  data_11_exception_excpTlbPif = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  data_11_exception_excpTlbPpi = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  data_11_exception_excpAdef = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  data_12_instr = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  data_12_pc = _RAND_161[31:0];
  _RAND_162 = {1{`RANDOM}};
  data_12_pdInfo_valid = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  data_12_pdInfo_isBr = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  data_12_pdInfo_isJal = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  data_12_pdInfo_isJalr = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  data_12_pdInfo_isCall = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  data_12_pdInfo_isRet = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  data_12_pdInfo_jumpTarget = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  data_12_exception_excpTlbRefill = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  data_12_exception_excpTlbPif = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  data_12_exception_excpTlbPpi = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  data_12_exception_excpAdef = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  data_13_instr = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  data_13_pc = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  data_13_pdInfo_valid = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  data_13_pdInfo_isBr = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  data_13_pdInfo_isJal = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  data_13_pdInfo_isJalr = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  data_13_pdInfo_isCall = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  data_13_pdInfo_isRet = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  data_13_pdInfo_jumpTarget = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  data_13_exception_excpTlbRefill = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  data_13_exception_excpTlbPif = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  data_13_exception_excpTlbPpi = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  data_13_exception_excpAdef = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  data_14_instr = _RAND_186[31:0];
  _RAND_187 = {1{`RANDOM}};
  data_14_pc = _RAND_187[31:0];
  _RAND_188 = {1{`RANDOM}};
  data_14_pdInfo_valid = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  data_14_pdInfo_isBr = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  data_14_pdInfo_isJal = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  data_14_pdInfo_isJalr = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  data_14_pdInfo_isCall = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  data_14_pdInfo_isRet = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  data_14_pdInfo_jumpTarget = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  data_14_exception_excpTlbRefill = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  data_14_exception_excpTlbPif = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  data_14_exception_excpTlbPpi = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  data_14_exception_excpAdef = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  data_15_instr = _RAND_199[31:0];
  _RAND_200 = {1{`RANDOM}};
  data_15_pc = _RAND_200[31:0];
  _RAND_201 = {1{`RANDOM}};
  data_15_pdInfo_valid = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  data_15_pdInfo_isBr = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  data_15_pdInfo_isJal = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  data_15_pdInfo_isJalr = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  data_15_pdInfo_isCall = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  data_15_pdInfo_isRet = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  data_15_pdInfo_jumpTarget = _RAND_207[31:0];
  _RAND_208 = {1{`RANDOM}};
  data_15_exception_excpTlbRefill = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  data_15_exception_excpTlbPif = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  data_15_exception_excpTlbPpi = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  data_15_exception_excpAdef = _RAND_211[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
