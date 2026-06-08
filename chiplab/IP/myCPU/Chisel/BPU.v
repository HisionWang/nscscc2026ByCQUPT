module BPU(
  input         clock,
  input         reset,
  input  [31:0] io_predictReq_pc, // @[src/main/scala/frontend/BPU.scala 11:14]
  output        io_predictResp_taken, // @[src/main/scala/frontend/BPU.scala 11:14]
  output [31:0] io_predictResp_target, // @[src/main/scala/frontend/BPU.scala 11:14]
  output [2:0]  io_predictResp_takenOffset, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_predictFire, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_update_pd_valid, // @[src/main/scala/frontend/BPU.scala 11:14]
  input  [31:0] io_update_pd_pc, // @[src/main/scala/frontend/BPU.scala 11:14]
  input  [31:0] io_update_pd_target, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_update_pd_isJalr, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_update_pd_isJal, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_update_pd_isCall, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_update_pd_isRet, // @[src/main/scala/frontend/BPU.scala 11:14]
  input         io_rasRestore // @[src/main/scala/frontend/BPU.scala 11:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] rasStack [0:7]; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire  rasStack_rasTarget_MPORT_en; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [2:0] rasStack_rasTarget_MPORT_addr; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [31:0] rasStack_rasTarget_MPORT_data; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [31:0] rasStack_MPORT_data; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [2:0] rasStack_MPORT_addr; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire  rasStack_MPORT_mask; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire  rasStack_MPORT_en; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [31:0] rasStack_MPORT_1_data; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire [2:0] rasStack_MPORT_1_addr; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire  rasStack_MPORT_1_mask; // @[src/main/scala/frontend/BPU.scala 59:21]
  wire  rasStack_MPORT_1_en; // @[src/main/scala/frontend/BPU.scala 59:21]
  reg  btbMem_0_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_0_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_0_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_0_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_0_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_0_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_0_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_0_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_1_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_1_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_1_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_1_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_1_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_1_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_1_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_1_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_2_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_2_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_2_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_2_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_2_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_2_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_2_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_2_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_3_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_3_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_3_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_3_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_3_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_3_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_3_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_3_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_4_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_4_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_4_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_4_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_4_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_4_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_4_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_4_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_5_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_5_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_5_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_5_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_5_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_5_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_5_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_5_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_6_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_6_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_6_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_6_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_6_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_6_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_6_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_6_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_7_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_7_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_7_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_7_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_7_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_7_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_7_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_7_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_8_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_8_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_8_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_8_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_8_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_8_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_8_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_8_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_9_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_9_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_9_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_9_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_9_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_9_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_9_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_9_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_10_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_10_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_10_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_10_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_10_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_10_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_10_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_10_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_11_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_11_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_11_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_11_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_11_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_11_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_11_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_11_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_12_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_12_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_12_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_12_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_12_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_12_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_12_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_12_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_13_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_13_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_13_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_13_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_13_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_13_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_13_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_13_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_14_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_14_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_14_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_14_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_14_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_14_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_14_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_14_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_15_valid; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [22:0] btbMem_15_tag; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [31:0] btbMem_15_target; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_15_isJalr; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_15_isJal; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_15_isCall; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg  btbMem_15_isRet; // @[src/main/scala/frontend/BPU.scala 41:23]
  reg [2:0] btbMem_15_offset; // @[src/main/scala/frontend/BPU.scala 41:23]
  wire [3:0] btbIdx = io_predictReq_pc[8:5]; // @[src/main/scala/frontend/BPU.scala 44:32]
  wire [22:0] btbTag = io_predictReq_pc[31:9]; // @[src/main/scala/frontend/BPU.scala 45:32]
  wire [22:0] _GEN_1 = 4'h1 == btbIdx ? btbMem_1_tag : btbMem_0_tag; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_2 = 4'h2 == btbIdx ? btbMem_2_tag : _GEN_1; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_3 = 4'h3 == btbIdx ? btbMem_3_tag : _GEN_2; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_4 = 4'h4 == btbIdx ? btbMem_4_tag : _GEN_3; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_5 = 4'h5 == btbIdx ? btbMem_5_tag : _GEN_4; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_6 = 4'h6 == btbIdx ? btbMem_6_tag : _GEN_5; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_7 = 4'h7 == btbIdx ? btbMem_7_tag : _GEN_6; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_8 = 4'h8 == btbIdx ? btbMem_8_tag : _GEN_7; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_9 = 4'h9 == btbIdx ? btbMem_9_tag : _GEN_8; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_10 = 4'ha == btbIdx ? btbMem_10_tag : _GEN_9; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_11 = 4'hb == btbIdx ? btbMem_11_tag : _GEN_10; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_12 = 4'hc == btbIdx ? btbMem_12_tag : _GEN_11; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_13 = 4'hd == btbIdx ? btbMem_13_tag : _GEN_12; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_14 = 4'he == btbIdx ? btbMem_14_tag : _GEN_13; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire [22:0] _GEN_15 = 4'hf == btbIdx ? btbMem_15_tag : _GEN_14; // @[src/main/scala/frontend/BPU.scala 49:{49,49}]
  wire  _GEN_17 = 4'h1 == btbIdx ? btbMem_1_valid : btbMem_0_valid; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_18 = 4'h2 == btbIdx ? btbMem_2_valid : _GEN_17; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_19 = 4'h3 == btbIdx ? btbMem_3_valid : _GEN_18; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_20 = 4'h4 == btbIdx ? btbMem_4_valid : _GEN_19; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_21 = 4'h5 == btbIdx ? btbMem_5_valid : _GEN_20; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_22 = 4'h6 == btbIdx ? btbMem_6_valid : _GEN_21; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_23 = 4'h7 == btbIdx ? btbMem_7_valid : _GEN_22; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_24 = 4'h8 == btbIdx ? btbMem_8_valid : _GEN_23; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_25 = 4'h9 == btbIdx ? btbMem_9_valid : _GEN_24; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_26 = 4'ha == btbIdx ? btbMem_10_valid : _GEN_25; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_27 = 4'hb == btbIdx ? btbMem_11_valid : _GEN_26; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_28 = 4'hc == btbIdx ? btbMem_12_valid : _GEN_27; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_29 = 4'hd == btbIdx ? btbMem_13_valid : _GEN_28; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_30 = 4'he == btbIdx ? btbMem_14_valid : _GEN_29; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  _GEN_31 = 4'hf == btbIdx ? btbMem_15_valid : _GEN_30; // @[src/main/scala/frontend/BPU.scala 49:{33,33}]
  wire  btbHit = _GEN_31 & _GEN_15 == btbTag; // @[src/main/scala/frontend/BPU.scala 49:33]
  reg [1:0] phtMem_0; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_1; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_2; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_3; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_4; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_5; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_6; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_7; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_8; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_9; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_10; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_11; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_12; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_13; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_14; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_15; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_16; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_17; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_18; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_19; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_20; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_21; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_22; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_23; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_24; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_25; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_26; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_27; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_28; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_29; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_30; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_31; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_32; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_33; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_34; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_35; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_36; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_37; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_38; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_39; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_40; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_41; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_42; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_43; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_44; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_45; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_46; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_47; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_48; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_49; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_50; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_51; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_52; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_53; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_54; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_55; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_56; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_57; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_58; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_59; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_60; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_61; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_62; // @[src/main/scala/frontend/BPU.scala 52:23]
  reg [1:0] phtMem_63; // @[src/main/scala/frontend/BPU.scala 52:23]
  wire [5:0] phtIdx = io_predictReq_pc[10:5]; // @[src/main/scala/frontend/BPU.scala 54:36]
  wire [1:0] _GEN_33 = 6'h1 == phtIdx ? phtMem_1 : phtMem_0; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_34 = 6'h2 == phtIdx ? phtMem_2 : _GEN_33; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_35 = 6'h3 == phtIdx ? phtMem_3 : _GEN_34; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_36 = 6'h4 == phtIdx ? phtMem_4 : _GEN_35; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_37 = 6'h5 == phtIdx ? phtMem_5 : _GEN_36; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_38 = 6'h6 == phtIdx ? phtMem_6 : _GEN_37; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_39 = 6'h7 == phtIdx ? phtMem_7 : _GEN_38; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_40 = 6'h8 == phtIdx ? phtMem_8 : _GEN_39; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_41 = 6'h9 == phtIdx ? phtMem_9 : _GEN_40; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_42 = 6'ha == phtIdx ? phtMem_10 : _GEN_41; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_43 = 6'hb == phtIdx ? phtMem_11 : _GEN_42; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_44 = 6'hc == phtIdx ? phtMem_12 : _GEN_43; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_45 = 6'hd == phtIdx ? phtMem_13 : _GEN_44; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_46 = 6'he == phtIdx ? phtMem_14 : _GEN_45; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_47 = 6'hf == phtIdx ? phtMem_15 : _GEN_46; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_48 = 6'h10 == phtIdx ? phtMem_16 : _GEN_47; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_49 = 6'h11 == phtIdx ? phtMem_17 : _GEN_48; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_50 = 6'h12 == phtIdx ? phtMem_18 : _GEN_49; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_51 = 6'h13 == phtIdx ? phtMem_19 : _GEN_50; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_52 = 6'h14 == phtIdx ? phtMem_20 : _GEN_51; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_53 = 6'h15 == phtIdx ? phtMem_21 : _GEN_52; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_54 = 6'h16 == phtIdx ? phtMem_22 : _GEN_53; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_55 = 6'h17 == phtIdx ? phtMem_23 : _GEN_54; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_56 = 6'h18 == phtIdx ? phtMem_24 : _GEN_55; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_57 = 6'h19 == phtIdx ? phtMem_25 : _GEN_56; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_58 = 6'h1a == phtIdx ? phtMem_26 : _GEN_57; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_59 = 6'h1b == phtIdx ? phtMem_27 : _GEN_58; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_60 = 6'h1c == phtIdx ? phtMem_28 : _GEN_59; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_61 = 6'h1d == phtIdx ? phtMem_29 : _GEN_60; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_62 = 6'h1e == phtIdx ? phtMem_30 : _GEN_61; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_63 = 6'h1f == phtIdx ? phtMem_31 : _GEN_62; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_64 = 6'h20 == phtIdx ? phtMem_32 : _GEN_63; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_65 = 6'h21 == phtIdx ? phtMem_33 : _GEN_64; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_66 = 6'h22 == phtIdx ? phtMem_34 : _GEN_65; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_67 = 6'h23 == phtIdx ? phtMem_35 : _GEN_66; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_68 = 6'h24 == phtIdx ? phtMem_36 : _GEN_67; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_69 = 6'h25 == phtIdx ? phtMem_37 : _GEN_68; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_70 = 6'h26 == phtIdx ? phtMem_38 : _GEN_69; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_71 = 6'h27 == phtIdx ? phtMem_39 : _GEN_70; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_72 = 6'h28 == phtIdx ? phtMem_40 : _GEN_71; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_73 = 6'h29 == phtIdx ? phtMem_41 : _GEN_72; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_74 = 6'h2a == phtIdx ? phtMem_42 : _GEN_73; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_75 = 6'h2b == phtIdx ? phtMem_43 : _GEN_74; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_76 = 6'h2c == phtIdx ? phtMem_44 : _GEN_75; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_77 = 6'h2d == phtIdx ? phtMem_45 : _GEN_76; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_78 = 6'h2e == phtIdx ? phtMem_46 : _GEN_77; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_79 = 6'h2f == phtIdx ? phtMem_47 : _GEN_78; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_80 = 6'h30 == phtIdx ? phtMem_48 : _GEN_79; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_81 = 6'h31 == phtIdx ? phtMem_49 : _GEN_80; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_82 = 6'h32 == phtIdx ? phtMem_50 : _GEN_81; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_83 = 6'h33 == phtIdx ? phtMem_51 : _GEN_82; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_84 = 6'h34 == phtIdx ? phtMem_52 : _GEN_83; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_85 = 6'h35 == phtIdx ? phtMem_53 : _GEN_84; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_86 = 6'h36 == phtIdx ? phtMem_54 : _GEN_85; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_87 = 6'h37 == phtIdx ? phtMem_55 : _GEN_86; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_88 = 6'h38 == phtIdx ? phtMem_56 : _GEN_87; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_89 = 6'h39 == phtIdx ? phtMem_57 : _GEN_88; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_90 = 6'h3a == phtIdx ? phtMem_58 : _GEN_89; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_91 = 6'h3b == phtIdx ? phtMem_59 : _GEN_90; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_92 = 6'h3c == phtIdx ? phtMem_60 : _GEN_91; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_93 = 6'h3d == phtIdx ? phtMem_61 : _GEN_92; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_94 = 6'h3e == phtIdx ? phtMem_62 : _GEN_93; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire [1:0] _GEN_95 = 6'h3f == phtIdx ? phtMem_63 : _GEN_94; // @[src/main/scala/frontend/BPU.scala 56:{30,30}]
  wire  phtTaken = _GEN_95[1]; // @[src/main/scala/frontend/BPU.scala 56:30]
  reg [2:0] rasTop; // @[src/main/scala/frontend/BPU.scala 60:25]
  wire [2:0] _GEN_96 = io_rasRestore ? 3'h0 : rasTop; // @[src/main/scala/frontend/BPU.scala 63:23 64:12 60:25]
  wire  _GEN_98 = 4'h1 == btbIdx ? btbMem_1_isJalr : btbMem_0_isJalr; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_99 = 4'h2 == btbIdx ? btbMem_2_isJalr : _GEN_98; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_100 = 4'h3 == btbIdx ? btbMem_3_isJalr : _GEN_99; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_101 = 4'h4 == btbIdx ? btbMem_4_isJalr : _GEN_100; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_102 = 4'h5 == btbIdx ? btbMem_5_isJalr : _GEN_101; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_103 = 4'h6 == btbIdx ? btbMem_6_isJalr : _GEN_102; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_104 = 4'h7 == btbIdx ? btbMem_7_isJalr : _GEN_103; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_105 = 4'h8 == btbIdx ? btbMem_8_isJalr : _GEN_104; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_106 = 4'h9 == btbIdx ? btbMem_9_isJalr : _GEN_105; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_107 = 4'ha == btbIdx ? btbMem_10_isJalr : _GEN_106; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_108 = 4'hb == btbIdx ? btbMem_11_isJalr : _GEN_107; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_109 = 4'hc == btbIdx ? btbMem_12_isJalr : _GEN_108; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_110 = 4'hd == btbIdx ? btbMem_13_isJalr : _GEN_109; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_111 = 4'he == btbIdx ? btbMem_14_isJalr : _GEN_110; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_112 = 4'hf == btbIdx ? btbMem_15_isJalr : _GEN_111; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_114 = 4'h1 == btbIdx ? btbMem_1_isJal : btbMem_0_isJal; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_115 = 4'h2 == btbIdx ? btbMem_2_isJal : _GEN_114; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_116 = 4'h3 == btbIdx ? btbMem_3_isJal : _GEN_115; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_117 = 4'h4 == btbIdx ? btbMem_4_isJal : _GEN_116; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_118 = 4'h5 == btbIdx ? btbMem_5_isJal : _GEN_117; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_119 = 4'h6 == btbIdx ? btbMem_6_isJal : _GEN_118; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_120 = 4'h7 == btbIdx ? btbMem_7_isJal : _GEN_119; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_121 = 4'h8 == btbIdx ? btbMem_8_isJal : _GEN_120; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_122 = 4'h9 == btbIdx ? btbMem_9_isJal : _GEN_121; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_123 = 4'ha == btbIdx ? btbMem_10_isJal : _GEN_122; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_124 = 4'hb == btbIdx ? btbMem_11_isJal : _GEN_123; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_125 = 4'hc == btbIdx ? btbMem_12_isJal : _GEN_124; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_126 = 4'hd == btbIdx ? btbMem_13_isJal : _GEN_125; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_127 = 4'he == btbIdx ? btbMem_14_isJal : _GEN_126; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _GEN_128 = 4'hf == btbIdx ? btbMem_15_isJal : _GEN_127; // @[src/main/scala/frontend/BPU.scala 80:{42,42}]
  wire  _rasTarget_T = rasTop == 3'h0; // @[src/main/scala/frontend/BPU.scala 81:32]
  wire [2:0] _rasTarget_T_2 = rasTop - 3'h1; // @[src/main/scala/frontend/BPU.scala 81:62]
  wire [31:0] rasTarget = rasTop == 3'h0 ? 32'h0 : rasStack_rasTarget_MPORT_data; // @[src/main/scala/frontend/BPU.scala 81:24]
  wire [31:0] _GEN_130 = 4'h1 == btbIdx ? btbMem_1_target : btbMem_0_target; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_131 = 4'h2 == btbIdx ? btbMem_2_target : _GEN_130; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_132 = 4'h3 == btbIdx ? btbMem_3_target : _GEN_131; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_133 = 4'h4 == btbIdx ? btbMem_4_target : _GEN_132; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_134 = 4'h5 == btbIdx ? btbMem_5_target : _GEN_133; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_135 = 4'h6 == btbIdx ? btbMem_6_target : _GEN_134; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_136 = 4'h7 == btbIdx ? btbMem_7_target : _GEN_135; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_137 = 4'h8 == btbIdx ? btbMem_8_target : _GEN_136; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_138 = 4'h9 == btbIdx ? btbMem_9_target : _GEN_137; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_139 = 4'ha == btbIdx ? btbMem_10_target : _GEN_138; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_140 = 4'hb == btbIdx ? btbMem_11_target : _GEN_139; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_141 = 4'hc == btbIdx ? btbMem_12_target : _GEN_140; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_142 = 4'hd == btbIdx ? btbMem_13_target : _GEN_141; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_143 = 4'he == btbIdx ? btbMem_14_target : _GEN_142; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] _GEN_144 = 4'hf == btbIdx ? btbMem_15_target : _GEN_143; // @[src/main/scala/frontend/BPU.scala 82:{24,24}]
  wire [31:0] finalTarget = _GEN_112 ? rasTarget : _GEN_144; // @[src/main/scala/frontend/BPU.scala 82:24]
  wire [2:0] _GEN_146 = 4'h1 == btbIdx ? btbMem_1_offset : btbMem_0_offset; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_147 = 4'h2 == btbIdx ? btbMem_2_offset : _GEN_146; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_148 = 4'h3 == btbIdx ? btbMem_3_offset : _GEN_147; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_149 = 4'h4 == btbIdx ? btbMem_4_offset : _GEN_148; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_150 = 4'h5 == btbIdx ? btbMem_5_offset : _GEN_149; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_151 = 4'h6 == btbIdx ? btbMem_6_offset : _GEN_150; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_152 = 4'h7 == btbIdx ? btbMem_7_offset : _GEN_151; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_153 = 4'h8 == btbIdx ? btbMem_8_offset : _GEN_152; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_154 = 4'h9 == btbIdx ? btbMem_9_offset : _GEN_153; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_155 = 4'ha == btbIdx ? btbMem_10_offset : _GEN_154; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_156 = 4'hb == btbIdx ? btbMem_11_offset : _GEN_155; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_157 = 4'hc == btbIdx ? btbMem_12_offset : _GEN_156; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_158 = 4'hd == btbIdx ? btbMem_13_offset : _GEN_157; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_159 = 4'he == btbIdx ? btbMem_14_offset : _GEN_158; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire [2:0] _GEN_160 = 4'hf == btbIdx ? btbMem_15_offset : _GEN_159; // @[src/main/scala/frontend/BPU.scala 87:{36,36}]
  wire  _GEN_162 = 4'h1 == btbIdx ? btbMem_1_isCall : btbMem_0_isCall; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_163 = 4'h2 == btbIdx ? btbMem_2_isCall : _GEN_162; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_164 = 4'h3 == btbIdx ? btbMem_3_isCall : _GEN_163; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_165 = 4'h4 == btbIdx ? btbMem_4_isCall : _GEN_164; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_166 = 4'h5 == btbIdx ? btbMem_5_isCall : _GEN_165; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_167 = 4'h6 == btbIdx ? btbMem_6_isCall : _GEN_166; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_168 = 4'h7 == btbIdx ? btbMem_7_isCall : _GEN_167; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_169 = 4'h8 == btbIdx ? btbMem_8_isCall : _GEN_168; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_170 = 4'h9 == btbIdx ? btbMem_9_isCall : _GEN_169; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_171 = 4'ha == btbIdx ? btbMem_10_isCall : _GEN_170; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_172 = 4'hb == btbIdx ? btbMem_11_isCall : _GEN_171; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_173 = 4'hc == btbIdx ? btbMem_12_isCall : _GEN_172; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_174 = 4'hd == btbIdx ? btbMem_13_isCall : _GEN_173; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_175 = 4'he == btbIdx ? btbMem_14_isCall : _GEN_174; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_176 = 4'hf == btbIdx ? btbMem_15_isCall : _GEN_175; // @[src/main/scala/frontend/BPU.scala 93:{34,34}]
  wire  _GEN_178 = 4'h1 == btbIdx ? btbMem_1_isRet : btbMem_0_isRet; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_179 = 4'h2 == btbIdx ? btbMem_2_isRet : _GEN_178; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_180 = 4'h3 == btbIdx ? btbMem_3_isRet : _GEN_179; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_181 = 4'h4 == btbIdx ? btbMem_4_isRet : _GEN_180; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_182 = 4'h5 == btbIdx ? btbMem_5_isRet : _GEN_181; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_183 = 4'h6 == btbIdx ? btbMem_6_isRet : _GEN_182; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_184 = 4'h7 == btbIdx ? btbMem_7_isRet : _GEN_183; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_185 = 4'h8 == btbIdx ? btbMem_8_isRet : _GEN_184; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_186 = 4'h9 == btbIdx ? btbMem_9_isRet : _GEN_185; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_187 = 4'ha == btbIdx ? btbMem_10_isRet : _GEN_186; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_188 = 4'hb == btbIdx ? btbMem_11_isRet : _GEN_187; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_189 = 4'hc == btbIdx ? btbMem_12_isRet : _GEN_188; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_190 = 4'hd == btbIdx ? btbMem_13_isRet : _GEN_189; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_191 = 4'he == btbIdx ? btbMem_14_isRet : _GEN_190; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _GEN_192 = 4'hf == btbIdx ? btbMem_15_isRet : _GEN_191; // @[src/main/scala/frontend/BPU.scala 94:{34,34}]
  wire  _T = io_predictFire & btbHit; // @[src/main/scala/frontend/BPU.scala 103:23]
  wire [2:0] _returnAddr_T_1 = _GEN_160 + 3'h1; // @[src/main/scala/frontend/BPU.scala 107:54]
  wire [5:0] _returnAddr_T_2 = _returnAddr_T_1 * 3'h4; // @[src/main/scala/frontend/BPU.scala 107:61]
  wire [31:0] _GEN_865 = {{26'd0}, _returnAddr_T_2}; // @[src/main/scala/frontend/BPU.scala 107:41]
  wire [2:0] _nextTop_T_2 = rasTop + 3'h1; // @[src/main/scala/frontend/BPU.scala 109:65]
  wire [2:0] nextTop = rasTop == 3'h7 ? 3'h0 : _nextTop_T_2; // @[src/main/scala/frontend/BPU.scala 109:24]
  wire [3:0] updateIdx = io_update_pd_pc[8:5]; // @[src/main/scala/frontend/BPU.scala 125:30]
  wire [22:0] updateTag = io_update_pd_pc[31:9]; // @[src/main/scala/frontend/BPU.scala 126:30]
  wire [2:0] updateOffset = io_update_pd_pc[4:2]; // @[src/main/scala/frontend/BPU.scala 127:33]
  wire  _GEN_206 = 4'h0 == updateIdx | btbMem_0_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_207 = 4'h1 == updateIdx | btbMem_1_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_208 = 4'h2 == updateIdx | btbMem_2_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_209 = 4'h3 == updateIdx | btbMem_3_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_210 = 4'h4 == updateIdx | btbMem_4_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_211 = 4'h5 == updateIdx | btbMem_5_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_212 = 4'h6 == updateIdx | btbMem_6_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_213 = 4'h7 == updateIdx | btbMem_7_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_214 = 4'h8 == updateIdx | btbMem_8_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_215 = 4'h9 == updateIdx | btbMem_9_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_216 = 4'ha == updateIdx | btbMem_10_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_217 = 4'hb == updateIdx | btbMem_11_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_218 = 4'hc == updateIdx | btbMem_12_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_219 = 4'hd == updateIdx | btbMem_13_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_220 = 4'he == updateIdx | btbMem_14_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire  _GEN_221 = 4'hf == updateIdx | btbMem_15_valid; // @[src/main/scala/frontend/BPU.scala 139:{23,23} 41:23]
  wire [5:0] updatePhtIdx = io_update_pd_pc[10:5]; // @[src/main/scala/frontend/BPU.scala 142:33]
  wire [1:0] _GEN_335 = 6'h1 == updatePhtIdx ? phtMem_1 : phtMem_0; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_336 = 6'h2 == updatePhtIdx ? phtMem_2 : _GEN_335; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_337 = 6'h3 == updatePhtIdx ? phtMem_3 : _GEN_336; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_338 = 6'h4 == updatePhtIdx ? phtMem_4 : _GEN_337; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_339 = 6'h5 == updatePhtIdx ? phtMem_5 : _GEN_338; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_340 = 6'h6 == updatePhtIdx ? phtMem_6 : _GEN_339; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_341 = 6'h7 == updatePhtIdx ? phtMem_7 : _GEN_340; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_342 = 6'h8 == updatePhtIdx ? phtMem_8 : _GEN_341; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_343 = 6'h9 == updatePhtIdx ? phtMem_9 : _GEN_342; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_344 = 6'ha == updatePhtIdx ? phtMem_10 : _GEN_343; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_345 = 6'hb == updatePhtIdx ? phtMem_11 : _GEN_344; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_346 = 6'hc == updatePhtIdx ? phtMem_12 : _GEN_345; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_347 = 6'hd == updatePhtIdx ? phtMem_13 : _GEN_346; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_348 = 6'he == updatePhtIdx ? phtMem_14 : _GEN_347; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_349 = 6'hf == updatePhtIdx ? phtMem_15 : _GEN_348; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_350 = 6'h10 == updatePhtIdx ? phtMem_16 : _GEN_349; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_351 = 6'h11 == updatePhtIdx ? phtMem_17 : _GEN_350; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_352 = 6'h12 == updatePhtIdx ? phtMem_18 : _GEN_351; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_353 = 6'h13 == updatePhtIdx ? phtMem_19 : _GEN_352; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_354 = 6'h14 == updatePhtIdx ? phtMem_20 : _GEN_353; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_355 = 6'h15 == updatePhtIdx ? phtMem_21 : _GEN_354; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_356 = 6'h16 == updatePhtIdx ? phtMem_22 : _GEN_355; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_357 = 6'h17 == updatePhtIdx ? phtMem_23 : _GEN_356; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_358 = 6'h18 == updatePhtIdx ? phtMem_24 : _GEN_357; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_359 = 6'h19 == updatePhtIdx ? phtMem_25 : _GEN_358; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_360 = 6'h1a == updatePhtIdx ? phtMem_26 : _GEN_359; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_361 = 6'h1b == updatePhtIdx ? phtMem_27 : _GEN_360; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_362 = 6'h1c == updatePhtIdx ? phtMem_28 : _GEN_361; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_363 = 6'h1d == updatePhtIdx ? phtMem_29 : _GEN_362; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_364 = 6'h1e == updatePhtIdx ? phtMem_30 : _GEN_363; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_365 = 6'h1f == updatePhtIdx ? phtMem_31 : _GEN_364; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_366 = 6'h20 == updatePhtIdx ? phtMem_32 : _GEN_365; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_367 = 6'h21 == updatePhtIdx ? phtMem_33 : _GEN_366; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_368 = 6'h22 == updatePhtIdx ? phtMem_34 : _GEN_367; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_369 = 6'h23 == updatePhtIdx ? phtMem_35 : _GEN_368; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_370 = 6'h24 == updatePhtIdx ? phtMem_36 : _GEN_369; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_371 = 6'h25 == updatePhtIdx ? phtMem_37 : _GEN_370; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_372 = 6'h26 == updatePhtIdx ? phtMem_38 : _GEN_371; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_373 = 6'h27 == updatePhtIdx ? phtMem_39 : _GEN_372; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_374 = 6'h28 == updatePhtIdx ? phtMem_40 : _GEN_373; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_375 = 6'h29 == updatePhtIdx ? phtMem_41 : _GEN_374; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_376 = 6'h2a == updatePhtIdx ? phtMem_42 : _GEN_375; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_377 = 6'h2b == updatePhtIdx ? phtMem_43 : _GEN_376; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_378 = 6'h2c == updatePhtIdx ? phtMem_44 : _GEN_377; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_379 = 6'h2d == updatePhtIdx ? phtMem_45 : _GEN_378; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_380 = 6'h2e == updatePhtIdx ? phtMem_46 : _GEN_379; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_381 = 6'h2f == updatePhtIdx ? phtMem_47 : _GEN_380; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_382 = 6'h30 == updatePhtIdx ? phtMem_48 : _GEN_381; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_383 = 6'h31 == updatePhtIdx ? phtMem_49 : _GEN_382; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_384 = 6'h32 == updatePhtIdx ? phtMem_50 : _GEN_383; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_385 = 6'h33 == updatePhtIdx ? phtMem_51 : _GEN_384; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_386 = 6'h34 == updatePhtIdx ? phtMem_52 : _GEN_385; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_387 = 6'h35 == updatePhtIdx ? phtMem_53 : _GEN_386; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_388 = 6'h36 == updatePhtIdx ? phtMem_54 : _GEN_387; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_389 = 6'h37 == updatePhtIdx ? phtMem_55 : _GEN_388; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_390 = 6'h38 == updatePhtIdx ? phtMem_56 : _GEN_389; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_391 = 6'h39 == updatePhtIdx ? phtMem_57 : _GEN_390; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_392 = 6'h3a == updatePhtIdx ? phtMem_58 : _GEN_391; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_393 = 6'h3b == updatePhtIdx ? phtMem_59 : _GEN_392; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_394 = 6'h3c == updatePhtIdx ? phtMem_60 : _GEN_393; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_395 = 6'h3d == updatePhtIdx ? phtMem_61 : _GEN_394; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_396 = 6'h3e == updatePhtIdx ? phtMem_62 : _GEN_395; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _GEN_397 = 6'h3f == updatePhtIdx ? phtMem_63 : _GEN_396; // @[src/main/scala/frontend/BPU.scala 144:{37,37}]
  wire [1:0] _phtMem_T_1 = _GEN_397 + 2'h1; // @[src/main/scala/frontend/BPU.scala 145:42]
  assign rasStack_rasTarget_MPORT_en = 1'h1;
  assign rasStack_rasTarget_MPORT_addr = rasTop - 3'h1;
  assign rasStack_rasTarget_MPORT_data = rasStack[rasStack_rasTarget_MPORT_addr]; // @[src/main/scala/frontend/BPU.scala 59:21]
  assign rasStack_MPORT_data = io_predictReq_pc + _GEN_865;
  assign rasStack_MPORT_addr = rasTop;
  assign rasStack_MPORT_mask = 1'h1;
  assign rasStack_MPORT_en = _T & _GEN_176;
  assign rasStack_MPORT_1_data = io_update_pd_pc + 32'h4;
  assign rasStack_MPORT_1_addr = rasTop;
  assign rasStack_MPORT_1_mask = 1'h1;
  assign rasStack_MPORT_1_en = 1'h0;
  assign io_predictResp_taken = btbHit & (_GEN_112 | _GEN_128 | phtTaken); // @[src/main/scala/frontend/BPU.scala 80:28]
  assign io_predictResp_target = btbHit ? finalTarget : 32'h0; // @[src/main/scala/frontend/BPU.scala 86:36]
  assign io_predictResp_takenOffset = btbHit ? _GEN_160 : 3'h0; // @[src/main/scala/frontend/BPU.scala 87:36]
  always @(posedge clock) begin
    if (rasStack_MPORT_en & rasStack_MPORT_mask) begin
      rasStack[rasStack_MPORT_addr] <= rasStack_MPORT_data; // @[src/main/scala/frontend/BPU.scala 59:21]
    end
    if (rasStack_MPORT_1_en & rasStack_MPORT_1_mask) begin
      rasStack[rasStack_MPORT_1_addr] <= rasStack_MPORT_1_data; // @[src/main/scala/frontend/BPU.scala 59:21]
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_0_valid <= _GEN_206;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_0_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h0 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_0_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_1_valid <= _GEN_207;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_1_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h1 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_1_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_2_valid <= _GEN_208;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_2_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h2 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_2_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_3_valid <= _GEN_209;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_3_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h3 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_3_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_4_valid <= _GEN_210;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_4_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h4 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_4_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_5_valid <= _GEN_211;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_5_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h5 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_5_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_6_valid <= _GEN_212;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_6_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h6 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_6_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_7_valid <= _GEN_213;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_7_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h7 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_7_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_8_valid <= _GEN_214;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_8_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h8 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_8_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_9_valid <= _GEN_215;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_9_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'h9 == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_9_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_10_valid <= _GEN_216;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_10_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'ha == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_10_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_11_valid <= _GEN_217;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_11_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hb == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_11_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_12_valid <= _GEN_218;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_12_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hc == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_12_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_13_valid <= _GEN_219;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_13_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hd == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_13_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_14_valid <= _GEN_220;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_14_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'he == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_14_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_valid <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      btbMem_15_valid <= _GEN_221;
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_tag <= 23'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_tag <= updateTag; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_target <= 32'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_target <= io_update_pd_target; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_isJalr <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_isJalr <= io_update_pd_isJalr; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_isJal <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_isJal <= io_update_pd_isJal; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_isCall <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_isCall <= io_update_pd_isCall; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_isRet <= 1'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_isRet <= io_update_pd_isRet; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 41:23]
      btbMem_15_offset <= 3'h0; // @[src/main/scala/frontend/BPU.scala 41:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (4'hf == updateIdx) begin // @[src/main/scala/frontend/BPU.scala 139:23]
        btbMem_15_offset <= updateOffset; // @[src/main/scala/frontend/BPU.scala 139:23]
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_0 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h0 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_0 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_1 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_1 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_2 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_2 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_3 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_3 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_4 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h4 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_4 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_5 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h5 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_5 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_6 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h6 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_6 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_7 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h7 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_7 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_8 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h8 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_8 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_9 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h9 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_9 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_10 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'ha == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_10 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_11 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'hb == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_11 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_12 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'hc == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_12 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_13 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'hd == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_13 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_14 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'he == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_14 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_15 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'hf == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_15 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_16 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h10 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_16 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_17 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h11 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_17 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_18 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h12 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_18 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_19 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h13 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_19 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_20 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h14 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_20 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_21 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h15 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_21 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_22 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h16 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_22 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_23 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h17 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_23 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_24 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h18 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_24 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_25 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h19 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_25 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_26 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1a == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_26 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_27 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1b == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_27 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_28 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1c == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_28 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_29 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1d == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_29 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_30 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1e == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_30 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_31 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h1f == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_31 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_32 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h20 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_32 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_33 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h21 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_33 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_34 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h22 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_34 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_35 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h23 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_35 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_36 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h24 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_36 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_37 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h25 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_37 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_38 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h26 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_38 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_39 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h27 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_39 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_40 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h28 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_40 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_41 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h29 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_41 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_42 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2a == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_42 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_43 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2b == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_43 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_44 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2c == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_44 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_45 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2d == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_45 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_46 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2e == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_46 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_47 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h2f == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_47 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_48 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h30 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_48 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_49 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h31 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_49 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_50 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h32 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_50 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_51 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h33 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_51 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_52 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h34 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_52 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_53 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h35 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_53 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_54 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h36 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_54 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_55 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h37 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_55 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_56 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h38 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_56 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_57 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h39 == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_57 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_58 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3a == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_58 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_59 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3b == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_59 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_60 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3c == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_60 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_61 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3d == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_61 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_62 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3e == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_62 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 52:23]
      phtMem_63 <= 2'h0; // @[src/main/scala/frontend/BPU.scala 52:23]
    end else if (io_update_pd_valid) begin // @[src/main/scala/frontend/BPU.scala 124:18]
      if (_GEN_397 != 2'h3) begin // @[src/main/scala/frontend/BPU.scala 144:46]
        if (6'h3f == updatePhtIdx) begin // @[src/main/scala/frontend/BPU.scala 145:28]
          phtMem_63 <= _phtMem_T_1; // @[src/main/scala/frontend/BPU.scala 145:28]
        end
      end
    end
    if (reset) begin // @[src/main/scala/frontend/BPU.scala 60:25]
      rasTop <= 3'h0; // @[src/main/scala/frontend/BPU.scala 60:25]
    end else if (io_predictFire & btbHit) begin // @[src/main/scala/frontend/BPU.scala 103:34]
      if (_GEN_192) begin // @[src/main/scala/frontend/BPU.scala 112:20]
        if (_rasTarget_T) begin // @[src/main/scala/frontend/BPU.scala 114:24]
          rasTop <= 3'h7;
        end else begin
          rasTop <= _rasTarget_T_2;
        end
      end else if (_GEN_176) begin // @[src/main/scala/frontend/BPU.scala 104:21]
        rasTop <= nextTop; // @[src/main/scala/frontend/BPU.scala 110:14]
      end else begin
        rasTop <= _GEN_96;
      end
    end else begin
      rasTop <= _GEN_96;
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    rasStack[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  btbMem_0_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  btbMem_0_tag = _RAND_2[22:0];
  _RAND_3 = {1{`RANDOM}};
  btbMem_0_target = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  btbMem_0_isJalr = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  btbMem_0_isJal = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  btbMem_0_isCall = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  btbMem_0_isRet = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  btbMem_0_offset = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  btbMem_1_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  btbMem_1_tag = _RAND_10[22:0];
  _RAND_11 = {1{`RANDOM}};
  btbMem_1_target = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  btbMem_1_isJalr = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  btbMem_1_isJal = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  btbMem_1_isCall = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  btbMem_1_isRet = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  btbMem_1_offset = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  btbMem_2_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  btbMem_2_tag = _RAND_18[22:0];
  _RAND_19 = {1{`RANDOM}};
  btbMem_2_target = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  btbMem_2_isJalr = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  btbMem_2_isJal = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  btbMem_2_isCall = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  btbMem_2_isRet = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  btbMem_2_offset = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  btbMem_3_valid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  btbMem_3_tag = _RAND_26[22:0];
  _RAND_27 = {1{`RANDOM}};
  btbMem_3_target = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  btbMem_3_isJalr = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  btbMem_3_isJal = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  btbMem_3_isCall = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  btbMem_3_isRet = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  btbMem_3_offset = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  btbMem_4_valid = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  btbMem_4_tag = _RAND_34[22:0];
  _RAND_35 = {1{`RANDOM}};
  btbMem_4_target = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  btbMem_4_isJalr = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  btbMem_4_isJal = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  btbMem_4_isCall = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  btbMem_4_isRet = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  btbMem_4_offset = _RAND_40[2:0];
  _RAND_41 = {1{`RANDOM}};
  btbMem_5_valid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  btbMem_5_tag = _RAND_42[22:0];
  _RAND_43 = {1{`RANDOM}};
  btbMem_5_target = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  btbMem_5_isJalr = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  btbMem_5_isJal = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  btbMem_5_isCall = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  btbMem_5_isRet = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  btbMem_5_offset = _RAND_48[2:0];
  _RAND_49 = {1{`RANDOM}};
  btbMem_6_valid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  btbMem_6_tag = _RAND_50[22:0];
  _RAND_51 = {1{`RANDOM}};
  btbMem_6_target = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  btbMem_6_isJalr = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  btbMem_6_isJal = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  btbMem_6_isCall = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  btbMem_6_isRet = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  btbMem_6_offset = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  btbMem_7_valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  btbMem_7_tag = _RAND_58[22:0];
  _RAND_59 = {1{`RANDOM}};
  btbMem_7_target = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  btbMem_7_isJalr = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  btbMem_7_isJal = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  btbMem_7_isCall = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  btbMem_7_isRet = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  btbMem_7_offset = _RAND_64[2:0];
  _RAND_65 = {1{`RANDOM}};
  btbMem_8_valid = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  btbMem_8_tag = _RAND_66[22:0];
  _RAND_67 = {1{`RANDOM}};
  btbMem_8_target = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  btbMem_8_isJalr = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  btbMem_8_isJal = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  btbMem_8_isCall = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  btbMem_8_isRet = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  btbMem_8_offset = _RAND_72[2:0];
  _RAND_73 = {1{`RANDOM}};
  btbMem_9_valid = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  btbMem_9_tag = _RAND_74[22:0];
  _RAND_75 = {1{`RANDOM}};
  btbMem_9_target = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  btbMem_9_isJalr = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  btbMem_9_isJal = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  btbMem_9_isCall = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  btbMem_9_isRet = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  btbMem_9_offset = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  btbMem_10_valid = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  btbMem_10_tag = _RAND_82[22:0];
  _RAND_83 = {1{`RANDOM}};
  btbMem_10_target = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  btbMem_10_isJalr = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  btbMem_10_isJal = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  btbMem_10_isCall = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  btbMem_10_isRet = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  btbMem_10_offset = _RAND_88[2:0];
  _RAND_89 = {1{`RANDOM}};
  btbMem_11_valid = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  btbMem_11_tag = _RAND_90[22:0];
  _RAND_91 = {1{`RANDOM}};
  btbMem_11_target = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  btbMem_11_isJalr = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  btbMem_11_isJal = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  btbMem_11_isCall = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  btbMem_11_isRet = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  btbMem_11_offset = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  btbMem_12_valid = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  btbMem_12_tag = _RAND_98[22:0];
  _RAND_99 = {1{`RANDOM}};
  btbMem_12_target = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  btbMem_12_isJalr = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  btbMem_12_isJal = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  btbMem_12_isCall = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  btbMem_12_isRet = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  btbMem_12_offset = _RAND_104[2:0];
  _RAND_105 = {1{`RANDOM}};
  btbMem_13_valid = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  btbMem_13_tag = _RAND_106[22:0];
  _RAND_107 = {1{`RANDOM}};
  btbMem_13_target = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  btbMem_13_isJalr = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  btbMem_13_isJal = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  btbMem_13_isCall = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  btbMem_13_isRet = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  btbMem_13_offset = _RAND_112[2:0];
  _RAND_113 = {1{`RANDOM}};
  btbMem_14_valid = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  btbMem_14_tag = _RAND_114[22:0];
  _RAND_115 = {1{`RANDOM}};
  btbMem_14_target = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  btbMem_14_isJalr = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  btbMem_14_isJal = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  btbMem_14_isCall = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  btbMem_14_isRet = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  btbMem_14_offset = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  btbMem_15_valid = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  btbMem_15_tag = _RAND_122[22:0];
  _RAND_123 = {1{`RANDOM}};
  btbMem_15_target = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  btbMem_15_isJalr = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  btbMem_15_isJal = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  btbMem_15_isCall = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  btbMem_15_isRet = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  btbMem_15_offset = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  phtMem_0 = _RAND_129[1:0];
  _RAND_130 = {1{`RANDOM}};
  phtMem_1 = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  phtMem_2 = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  phtMem_3 = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  phtMem_4 = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  phtMem_5 = _RAND_134[1:0];
  _RAND_135 = {1{`RANDOM}};
  phtMem_6 = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  phtMem_7 = _RAND_136[1:0];
  _RAND_137 = {1{`RANDOM}};
  phtMem_8 = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  phtMem_9 = _RAND_138[1:0];
  _RAND_139 = {1{`RANDOM}};
  phtMem_10 = _RAND_139[1:0];
  _RAND_140 = {1{`RANDOM}};
  phtMem_11 = _RAND_140[1:0];
  _RAND_141 = {1{`RANDOM}};
  phtMem_12 = _RAND_141[1:0];
  _RAND_142 = {1{`RANDOM}};
  phtMem_13 = _RAND_142[1:0];
  _RAND_143 = {1{`RANDOM}};
  phtMem_14 = _RAND_143[1:0];
  _RAND_144 = {1{`RANDOM}};
  phtMem_15 = _RAND_144[1:0];
  _RAND_145 = {1{`RANDOM}};
  phtMem_16 = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  phtMem_17 = _RAND_146[1:0];
  _RAND_147 = {1{`RANDOM}};
  phtMem_18 = _RAND_147[1:0];
  _RAND_148 = {1{`RANDOM}};
  phtMem_19 = _RAND_148[1:0];
  _RAND_149 = {1{`RANDOM}};
  phtMem_20 = _RAND_149[1:0];
  _RAND_150 = {1{`RANDOM}};
  phtMem_21 = _RAND_150[1:0];
  _RAND_151 = {1{`RANDOM}};
  phtMem_22 = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  phtMem_23 = _RAND_152[1:0];
  _RAND_153 = {1{`RANDOM}};
  phtMem_24 = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  phtMem_25 = _RAND_154[1:0];
  _RAND_155 = {1{`RANDOM}};
  phtMem_26 = _RAND_155[1:0];
  _RAND_156 = {1{`RANDOM}};
  phtMem_27 = _RAND_156[1:0];
  _RAND_157 = {1{`RANDOM}};
  phtMem_28 = _RAND_157[1:0];
  _RAND_158 = {1{`RANDOM}};
  phtMem_29 = _RAND_158[1:0];
  _RAND_159 = {1{`RANDOM}};
  phtMem_30 = _RAND_159[1:0];
  _RAND_160 = {1{`RANDOM}};
  phtMem_31 = _RAND_160[1:0];
  _RAND_161 = {1{`RANDOM}};
  phtMem_32 = _RAND_161[1:0];
  _RAND_162 = {1{`RANDOM}};
  phtMem_33 = _RAND_162[1:0];
  _RAND_163 = {1{`RANDOM}};
  phtMem_34 = _RAND_163[1:0];
  _RAND_164 = {1{`RANDOM}};
  phtMem_35 = _RAND_164[1:0];
  _RAND_165 = {1{`RANDOM}};
  phtMem_36 = _RAND_165[1:0];
  _RAND_166 = {1{`RANDOM}};
  phtMem_37 = _RAND_166[1:0];
  _RAND_167 = {1{`RANDOM}};
  phtMem_38 = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  phtMem_39 = _RAND_168[1:0];
  _RAND_169 = {1{`RANDOM}};
  phtMem_40 = _RAND_169[1:0];
  _RAND_170 = {1{`RANDOM}};
  phtMem_41 = _RAND_170[1:0];
  _RAND_171 = {1{`RANDOM}};
  phtMem_42 = _RAND_171[1:0];
  _RAND_172 = {1{`RANDOM}};
  phtMem_43 = _RAND_172[1:0];
  _RAND_173 = {1{`RANDOM}};
  phtMem_44 = _RAND_173[1:0];
  _RAND_174 = {1{`RANDOM}};
  phtMem_45 = _RAND_174[1:0];
  _RAND_175 = {1{`RANDOM}};
  phtMem_46 = _RAND_175[1:0];
  _RAND_176 = {1{`RANDOM}};
  phtMem_47 = _RAND_176[1:0];
  _RAND_177 = {1{`RANDOM}};
  phtMem_48 = _RAND_177[1:0];
  _RAND_178 = {1{`RANDOM}};
  phtMem_49 = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  phtMem_50 = _RAND_179[1:0];
  _RAND_180 = {1{`RANDOM}};
  phtMem_51 = _RAND_180[1:0];
  _RAND_181 = {1{`RANDOM}};
  phtMem_52 = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  phtMem_53 = _RAND_182[1:0];
  _RAND_183 = {1{`RANDOM}};
  phtMem_54 = _RAND_183[1:0];
  _RAND_184 = {1{`RANDOM}};
  phtMem_55 = _RAND_184[1:0];
  _RAND_185 = {1{`RANDOM}};
  phtMem_56 = _RAND_185[1:0];
  _RAND_186 = {1{`RANDOM}};
  phtMem_57 = _RAND_186[1:0];
  _RAND_187 = {1{`RANDOM}};
  phtMem_58 = _RAND_187[1:0];
  _RAND_188 = {1{`RANDOM}};
  phtMem_59 = _RAND_188[1:0];
  _RAND_189 = {1{`RANDOM}};
  phtMem_60 = _RAND_189[1:0];
  _RAND_190 = {1{`RANDOM}};
  phtMem_61 = _RAND_190[1:0];
  _RAND_191 = {1{`RANDOM}};
  phtMem_62 = _RAND_191[1:0];
  _RAND_192 = {1{`RANDOM}};
  phtMem_63 = _RAND_192[1:0];
  _RAND_193 = {1{`RANDOM}};
  rasTop = _RAND_193[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
