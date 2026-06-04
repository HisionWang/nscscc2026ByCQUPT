module IBF(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_instrs_0, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_instrs_1, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_instrs_2, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_instrs_3, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pcs_0, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pcs_1, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pcs_2, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pcs_3, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_0_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pdInfo_0_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_1_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pdInfo_1_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_2_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pdInfo_2_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_pdInfo_3_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  input  [31:0] io_in_bits_pdInfo_3_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_enqMask_0, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_enqMask_1, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_enqMask_2, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_in_bits_enqMask_3, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_0_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_0_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_0_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_0_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_0_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_1_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_1_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_1_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_1_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_1_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_2_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_2_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_2_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_2_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_2_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_3_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_3_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_3_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_3_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_3_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_4_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_4_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_4_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_4_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_4_bits_pdInfo_jumpTarget, // @[src/main/scala/frontend/IBF.scala 12:14]
  input         io_out_5_ready, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_5_bits_instr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_5_bits_pc, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_valid, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_isBr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_isJal, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_isJalr, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_isCall, // @[src/main/scala/frontend/IBF.scala 12:14]
  output        io_out_5_bits_pdInfo_isRet, // @[src/main/scala/frontend/IBF.scala 12:14]
  output [31:0] io_out_5_bits_pdInfo_jumpTarget // @[src/main/scala/frontend/IBF.scala 12:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] entries_0_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_0_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_1_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_1_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_1_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_1_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_2_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_2_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_2_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_2_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_3_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_3_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_3_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_3_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_4_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_4_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_4_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_4_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_5_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_5_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_5_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_5_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_6_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_6_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_6_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_6_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_7_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_7_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_7_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_7_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_8_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_8_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_8_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_8_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_9_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_9_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_9_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_9_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_10_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_10_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_10_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_10_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_11_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_11_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_11_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_11_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_12_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_12_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_12_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_12_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_13_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_13_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_13_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_13_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_14_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_14_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_14_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_14_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_15_instr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_15_pc; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  entries_15_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg [31:0] entries_15_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26]
  reg  valids_0; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_1; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_2; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_3; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_4; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_5; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_6; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_7; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_8; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_9; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_10; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_11; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_12; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_13; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_14; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg  valids_15; // @[src/main/scala/frontend/IBF.scala 23:26]
  reg [3:0] head; // @[src/main/scala/frontend/IBF.scala 25:26]
  reg [3:0] tail; // @[src/main/scala/frontend/IBF.scala 26:26]
  reg [4:0] count; // @[src/main/scala/frontend/IBF.scala 27:26]
  wire  full = count >= 5'hc; // @[src/main/scala/frontend/IBF.scala 29:21]
  wire  empty = count == 5'h0; // @[src/main/scala/frontend/IBF.scala 30:21]
  wire  _T = io_in_ready & io_in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [4:0] _idx_T = {{1'd0}, head}; // @[src/main/scala/frontend/IBF.scala 43:23]
  wire [4:0] _GEN_144 = {{1'd0}, _idx_T[3:0]}; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [4:0] _GEN_145 = _GEN_144 % 5'h10; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [3:0] idx = _GEN_145[3:0]; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [31:0] _GEN_0 = 4'h0 == idx ? io_in_bits_instrs_0 : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_1 = 4'h1 == idx ? io_in_bits_instrs_0 : entries_1_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_2 = 4'h2 == idx ? io_in_bits_instrs_0 : entries_2_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_3 = 4'h3 == idx ? io_in_bits_instrs_0 : entries_3_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_4 = 4'h4 == idx ? io_in_bits_instrs_0 : entries_4_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_5 = 4'h5 == idx ? io_in_bits_instrs_0 : entries_5_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_6 = 4'h6 == idx ? io_in_bits_instrs_0 : entries_6_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_7 = 4'h7 == idx ? io_in_bits_instrs_0 : entries_7_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_8 = 4'h8 == idx ? io_in_bits_instrs_0 : entries_8_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_9 = 4'h9 == idx ? io_in_bits_instrs_0 : entries_9_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_10 = 4'ha == idx ? io_in_bits_instrs_0 : entries_10_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_11 = 4'hb == idx ? io_in_bits_instrs_0 : entries_11_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_12 = 4'hc == idx ? io_in_bits_instrs_0 : entries_12_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_13 = 4'hd == idx ? io_in_bits_instrs_0 : entries_13_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_14 = 4'he == idx ? io_in_bits_instrs_0 : entries_14_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_15 = 4'hf == idx ? io_in_bits_instrs_0 : entries_15_instr; // @[src/main/scala/frontend/IBF.scala 22:26 45:{33,33}]
  wire [31:0] _GEN_16 = 4'h0 == idx ? io_in_bits_pcs_0 : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_17 = 4'h1 == idx ? io_in_bits_pcs_0 : entries_1_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_18 = 4'h2 == idx ? io_in_bits_pcs_0 : entries_2_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_19 = 4'h3 == idx ? io_in_bits_pcs_0 : entries_3_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_20 = 4'h4 == idx ? io_in_bits_pcs_0 : entries_4_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_21 = 4'h5 == idx ? io_in_bits_pcs_0 : entries_5_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_22 = 4'h6 == idx ? io_in_bits_pcs_0 : entries_6_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_23 = 4'h7 == idx ? io_in_bits_pcs_0 : entries_7_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_24 = 4'h8 == idx ? io_in_bits_pcs_0 : entries_8_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_25 = 4'h9 == idx ? io_in_bits_pcs_0 : entries_9_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_26 = 4'ha == idx ? io_in_bits_pcs_0 : entries_10_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_27 = 4'hb == idx ? io_in_bits_pcs_0 : entries_11_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_28 = 4'hc == idx ? io_in_bits_pcs_0 : entries_12_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_29 = 4'hd == idx ? io_in_bits_pcs_0 : entries_13_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_30 = 4'he == idx ? io_in_bits_pcs_0 : entries_14_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire [31:0] _GEN_31 = 4'hf == idx ? io_in_bits_pcs_0 : entries_15_pc; // @[src/main/scala/frontend/IBF.scala 22:26 46:{33,33}]
  wire  _GEN_32 = 4'h0 == idx ? io_in_bits_pdInfo_0_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_33 = 4'h1 == idx ? io_in_bits_pdInfo_0_valid : entries_1_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_34 = 4'h2 == idx ? io_in_bits_pdInfo_0_valid : entries_2_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_35 = 4'h3 == idx ? io_in_bits_pdInfo_0_valid : entries_3_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_36 = 4'h4 == idx ? io_in_bits_pdInfo_0_valid : entries_4_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_37 = 4'h5 == idx ? io_in_bits_pdInfo_0_valid : entries_5_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_38 = 4'h6 == idx ? io_in_bits_pdInfo_0_valid : entries_6_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_39 = 4'h7 == idx ? io_in_bits_pdInfo_0_valid : entries_7_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_40 = 4'h8 == idx ? io_in_bits_pdInfo_0_valid : entries_8_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_41 = 4'h9 == idx ? io_in_bits_pdInfo_0_valid : entries_9_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_42 = 4'ha == idx ? io_in_bits_pdInfo_0_valid : entries_10_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_43 = 4'hb == idx ? io_in_bits_pdInfo_0_valid : entries_11_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_44 = 4'hc == idx ? io_in_bits_pdInfo_0_valid : entries_12_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_45 = 4'hd == idx ? io_in_bits_pdInfo_0_valid : entries_13_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_46 = 4'he == idx ? io_in_bits_pdInfo_0_valid : entries_14_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_47 = 4'hf == idx ? io_in_bits_pdInfo_0_valid : entries_15_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_48 = 4'h0 == idx ? io_in_bits_pdInfo_0_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_49 = 4'h1 == idx ? io_in_bits_pdInfo_0_isBr : entries_1_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_50 = 4'h2 == idx ? io_in_bits_pdInfo_0_isBr : entries_2_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_51 = 4'h3 == idx ? io_in_bits_pdInfo_0_isBr : entries_3_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_52 = 4'h4 == idx ? io_in_bits_pdInfo_0_isBr : entries_4_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_53 = 4'h5 == idx ? io_in_bits_pdInfo_0_isBr : entries_5_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_54 = 4'h6 == idx ? io_in_bits_pdInfo_0_isBr : entries_6_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_55 = 4'h7 == idx ? io_in_bits_pdInfo_0_isBr : entries_7_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_56 = 4'h8 == idx ? io_in_bits_pdInfo_0_isBr : entries_8_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_57 = 4'h9 == idx ? io_in_bits_pdInfo_0_isBr : entries_9_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_58 = 4'ha == idx ? io_in_bits_pdInfo_0_isBr : entries_10_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_59 = 4'hb == idx ? io_in_bits_pdInfo_0_isBr : entries_11_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_60 = 4'hc == idx ? io_in_bits_pdInfo_0_isBr : entries_12_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_61 = 4'hd == idx ? io_in_bits_pdInfo_0_isBr : entries_13_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_62 = 4'he == idx ? io_in_bits_pdInfo_0_isBr : entries_14_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_63 = 4'hf == idx ? io_in_bits_pdInfo_0_isBr : entries_15_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_64 = 4'h0 == idx ? io_in_bits_pdInfo_0_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_65 = 4'h1 == idx ? io_in_bits_pdInfo_0_isJal : entries_1_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_66 = 4'h2 == idx ? io_in_bits_pdInfo_0_isJal : entries_2_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_67 = 4'h3 == idx ? io_in_bits_pdInfo_0_isJal : entries_3_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_68 = 4'h4 == idx ? io_in_bits_pdInfo_0_isJal : entries_4_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_69 = 4'h5 == idx ? io_in_bits_pdInfo_0_isJal : entries_5_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_70 = 4'h6 == idx ? io_in_bits_pdInfo_0_isJal : entries_6_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_71 = 4'h7 == idx ? io_in_bits_pdInfo_0_isJal : entries_7_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_72 = 4'h8 == idx ? io_in_bits_pdInfo_0_isJal : entries_8_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_73 = 4'h9 == idx ? io_in_bits_pdInfo_0_isJal : entries_9_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_74 = 4'ha == idx ? io_in_bits_pdInfo_0_isJal : entries_10_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_75 = 4'hb == idx ? io_in_bits_pdInfo_0_isJal : entries_11_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_76 = 4'hc == idx ? io_in_bits_pdInfo_0_isJal : entries_12_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_77 = 4'hd == idx ? io_in_bits_pdInfo_0_isJal : entries_13_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_78 = 4'he == idx ? io_in_bits_pdInfo_0_isJal : entries_14_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_79 = 4'hf == idx ? io_in_bits_pdInfo_0_isJal : entries_15_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_80 = 4'h0 == idx ? io_in_bits_pdInfo_0_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_81 = 4'h1 == idx ? io_in_bits_pdInfo_0_isJalr : entries_1_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_82 = 4'h2 == idx ? io_in_bits_pdInfo_0_isJalr : entries_2_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_83 = 4'h3 == idx ? io_in_bits_pdInfo_0_isJalr : entries_3_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_84 = 4'h4 == idx ? io_in_bits_pdInfo_0_isJalr : entries_4_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_85 = 4'h5 == idx ? io_in_bits_pdInfo_0_isJalr : entries_5_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_86 = 4'h6 == idx ? io_in_bits_pdInfo_0_isJalr : entries_6_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_87 = 4'h7 == idx ? io_in_bits_pdInfo_0_isJalr : entries_7_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_88 = 4'h8 == idx ? io_in_bits_pdInfo_0_isJalr : entries_8_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_89 = 4'h9 == idx ? io_in_bits_pdInfo_0_isJalr : entries_9_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_90 = 4'ha == idx ? io_in_bits_pdInfo_0_isJalr : entries_10_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_91 = 4'hb == idx ? io_in_bits_pdInfo_0_isJalr : entries_11_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_92 = 4'hc == idx ? io_in_bits_pdInfo_0_isJalr : entries_12_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_93 = 4'hd == idx ? io_in_bits_pdInfo_0_isJalr : entries_13_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_94 = 4'he == idx ? io_in_bits_pdInfo_0_isJalr : entries_14_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_95 = 4'hf == idx ? io_in_bits_pdInfo_0_isJalr : entries_15_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_96 = 4'h0 == idx ? io_in_bits_pdInfo_0_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_97 = 4'h1 == idx ? io_in_bits_pdInfo_0_isCall : entries_1_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_98 = 4'h2 == idx ? io_in_bits_pdInfo_0_isCall : entries_2_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_99 = 4'h3 == idx ? io_in_bits_pdInfo_0_isCall : entries_3_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_100 = 4'h4 == idx ? io_in_bits_pdInfo_0_isCall : entries_4_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_101 = 4'h5 == idx ? io_in_bits_pdInfo_0_isCall : entries_5_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_102 = 4'h6 == idx ? io_in_bits_pdInfo_0_isCall : entries_6_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_103 = 4'h7 == idx ? io_in_bits_pdInfo_0_isCall : entries_7_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_104 = 4'h8 == idx ? io_in_bits_pdInfo_0_isCall : entries_8_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_105 = 4'h9 == idx ? io_in_bits_pdInfo_0_isCall : entries_9_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_106 = 4'ha == idx ? io_in_bits_pdInfo_0_isCall : entries_10_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_107 = 4'hb == idx ? io_in_bits_pdInfo_0_isCall : entries_11_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_108 = 4'hc == idx ? io_in_bits_pdInfo_0_isCall : entries_12_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_109 = 4'hd == idx ? io_in_bits_pdInfo_0_isCall : entries_13_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_110 = 4'he == idx ? io_in_bits_pdInfo_0_isCall : entries_14_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_111 = 4'hf == idx ? io_in_bits_pdInfo_0_isCall : entries_15_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_112 = 4'h0 == idx ? io_in_bits_pdInfo_0_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_113 = 4'h1 == idx ? io_in_bits_pdInfo_0_isRet : entries_1_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_114 = 4'h2 == idx ? io_in_bits_pdInfo_0_isRet : entries_2_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_115 = 4'h3 == idx ? io_in_bits_pdInfo_0_isRet : entries_3_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_116 = 4'h4 == idx ? io_in_bits_pdInfo_0_isRet : entries_4_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_117 = 4'h5 == idx ? io_in_bits_pdInfo_0_isRet : entries_5_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_118 = 4'h6 == idx ? io_in_bits_pdInfo_0_isRet : entries_6_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_119 = 4'h7 == idx ? io_in_bits_pdInfo_0_isRet : entries_7_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_120 = 4'h8 == idx ? io_in_bits_pdInfo_0_isRet : entries_8_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_121 = 4'h9 == idx ? io_in_bits_pdInfo_0_isRet : entries_9_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_122 = 4'ha == idx ? io_in_bits_pdInfo_0_isRet : entries_10_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_123 = 4'hb == idx ? io_in_bits_pdInfo_0_isRet : entries_11_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_124 = 4'hc == idx ? io_in_bits_pdInfo_0_isRet : entries_12_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_125 = 4'hd == idx ? io_in_bits_pdInfo_0_isRet : entries_13_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_126 = 4'he == idx ? io_in_bits_pdInfo_0_isRet : entries_14_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_127 = 4'hf == idx ? io_in_bits_pdInfo_0_isRet : entries_15_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_128 = 4'h0 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_129 = 4'h1 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_1_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_130 = 4'h2 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_2_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_131 = 4'h3 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_3_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_132 = 4'h4 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_4_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_133 = 4'h5 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_5_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_134 = 4'h6 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_6_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_135 = 4'h7 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_7_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_136 = 4'h8 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_8_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_137 = 4'h9 == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_9_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_138 = 4'ha == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_10_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_139 = 4'hb == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_11_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_140 = 4'hc == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_12_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_141 = 4'hd == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_13_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_142 = 4'he == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_14_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire [31:0] _GEN_143 = 4'hf == idx ? io_in_bits_pdInfo_0_jumpTarget : entries_15_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 47:{33,33}]
  wire  _GEN_192 = 4'h0 == idx | valids_0; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_193 = 4'h1 == idx | valids_1; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_194 = 4'h2 == idx | valids_2; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_195 = 4'h3 == idx | valids_3; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_196 = 4'h4 == idx | valids_4; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_197 = 4'h5 == idx | valids_5; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_198 = 4'h6 == idx | valids_6; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_199 = 4'h7 == idx | valids_7; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_200 = 4'h8 == idx | valids_8; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_201 = 4'h9 == idx | valids_9; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_202 = 4'ha == idx | valids_10; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_203 = 4'hb == idx | valids_11; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_204 = 4'hc == idx | valids_12; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_205 = 4'hd == idx | valids_13; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_206 = 4'he == idx | valids_14; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire  _GEN_207 = 4'hf == idx | valids_15; // @[src/main/scala/frontend/IBF.scala 49:{21,21} 23:26]
  wire [31:0] _GEN_208 = io_in_bits_enqMask_0 ? _GEN_0 : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_209 = io_in_bits_enqMask_0 ? _GEN_1 : entries_1_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_210 = io_in_bits_enqMask_0 ? _GEN_2 : entries_2_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_211 = io_in_bits_enqMask_0 ? _GEN_3 : entries_3_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_212 = io_in_bits_enqMask_0 ? _GEN_4 : entries_4_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_213 = io_in_bits_enqMask_0 ? _GEN_5 : entries_5_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_214 = io_in_bits_enqMask_0 ? _GEN_6 : entries_6_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_215 = io_in_bits_enqMask_0 ? _GEN_7 : entries_7_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_216 = io_in_bits_enqMask_0 ? _GEN_8 : entries_8_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_217 = io_in_bits_enqMask_0 ? _GEN_9 : entries_9_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_218 = io_in_bits_enqMask_0 ? _GEN_10 : entries_10_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_219 = io_in_bits_enqMask_0 ? _GEN_11 : entries_11_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_220 = io_in_bits_enqMask_0 ? _GEN_12 : entries_12_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_221 = io_in_bits_enqMask_0 ? _GEN_13 : entries_13_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_222 = io_in_bits_enqMask_0 ? _GEN_14 : entries_14_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_223 = io_in_bits_enqMask_0 ? _GEN_15 : entries_15_instr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_224 = io_in_bits_enqMask_0 ? _GEN_16 : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_225 = io_in_bits_enqMask_0 ? _GEN_17 : entries_1_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_226 = io_in_bits_enqMask_0 ? _GEN_18 : entries_2_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_227 = io_in_bits_enqMask_0 ? _GEN_19 : entries_3_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_228 = io_in_bits_enqMask_0 ? _GEN_20 : entries_4_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_229 = io_in_bits_enqMask_0 ? _GEN_21 : entries_5_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_230 = io_in_bits_enqMask_0 ? _GEN_22 : entries_6_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_231 = io_in_bits_enqMask_0 ? _GEN_23 : entries_7_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_232 = io_in_bits_enqMask_0 ? _GEN_24 : entries_8_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_233 = io_in_bits_enqMask_0 ? _GEN_25 : entries_9_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_234 = io_in_bits_enqMask_0 ? _GEN_26 : entries_10_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_235 = io_in_bits_enqMask_0 ? _GEN_27 : entries_11_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_236 = io_in_bits_enqMask_0 ? _GEN_28 : entries_12_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_237 = io_in_bits_enqMask_0 ? _GEN_29 : entries_13_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_238 = io_in_bits_enqMask_0 ? _GEN_30 : entries_14_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_239 = io_in_bits_enqMask_0 ? _GEN_31 : entries_15_pc; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_240 = io_in_bits_enqMask_0 ? _GEN_32 : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_241 = io_in_bits_enqMask_0 ? _GEN_33 : entries_1_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_242 = io_in_bits_enqMask_0 ? _GEN_34 : entries_2_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_243 = io_in_bits_enqMask_0 ? _GEN_35 : entries_3_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_244 = io_in_bits_enqMask_0 ? _GEN_36 : entries_4_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_245 = io_in_bits_enqMask_0 ? _GEN_37 : entries_5_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_246 = io_in_bits_enqMask_0 ? _GEN_38 : entries_6_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_247 = io_in_bits_enqMask_0 ? _GEN_39 : entries_7_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_248 = io_in_bits_enqMask_0 ? _GEN_40 : entries_8_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_249 = io_in_bits_enqMask_0 ? _GEN_41 : entries_9_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_250 = io_in_bits_enqMask_0 ? _GEN_42 : entries_10_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_251 = io_in_bits_enqMask_0 ? _GEN_43 : entries_11_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_252 = io_in_bits_enqMask_0 ? _GEN_44 : entries_12_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_253 = io_in_bits_enqMask_0 ? _GEN_45 : entries_13_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_254 = io_in_bits_enqMask_0 ? _GEN_46 : entries_14_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_255 = io_in_bits_enqMask_0 ? _GEN_47 : entries_15_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_256 = io_in_bits_enqMask_0 ? _GEN_48 : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_257 = io_in_bits_enqMask_0 ? _GEN_49 : entries_1_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_258 = io_in_bits_enqMask_0 ? _GEN_50 : entries_2_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_259 = io_in_bits_enqMask_0 ? _GEN_51 : entries_3_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_260 = io_in_bits_enqMask_0 ? _GEN_52 : entries_4_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_261 = io_in_bits_enqMask_0 ? _GEN_53 : entries_5_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_262 = io_in_bits_enqMask_0 ? _GEN_54 : entries_6_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_263 = io_in_bits_enqMask_0 ? _GEN_55 : entries_7_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_264 = io_in_bits_enqMask_0 ? _GEN_56 : entries_8_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_265 = io_in_bits_enqMask_0 ? _GEN_57 : entries_9_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_266 = io_in_bits_enqMask_0 ? _GEN_58 : entries_10_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_267 = io_in_bits_enqMask_0 ? _GEN_59 : entries_11_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_268 = io_in_bits_enqMask_0 ? _GEN_60 : entries_12_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_269 = io_in_bits_enqMask_0 ? _GEN_61 : entries_13_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_270 = io_in_bits_enqMask_0 ? _GEN_62 : entries_14_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_271 = io_in_bits_enqMask_0 ? _GEN_63 : entries_15_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_272 = io_in_bits_enqMask_0 ? _GEN_64 : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_273 = io_in_bits_enqMask_0 ? _GEN_65 : entries_1_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_274 = io_in_bits_enqMask_0 ? _GEN_66 : entries_2_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_275 = io_in_bits_enqMask_0 ? _GEN_67 : entries_3_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_276 = io_in_bits_enqMask_0 ? _GEN_68 : entries_4_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_277 = io_in_bits_enqMask_0 ? _GEN_69 : entries_5_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_278 = io_in_bits_enqMask_0 ? _GEN_70 : entries_6_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_279 = io_in_bits_enqMask_0 ? _GEN_71 : entries_7_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_280 = io_in_bits_enqMask_0 ? _GEN_72 : entries_8_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_281 = io_in_bits_enqMask_0 ? _GEN_73 : entries_9_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_282 = io_in_bits_enqMask_0 ? _GEN_74 : entries_10_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_283 = io_in_bits_enqMask_0 ? _GEN_75 : entries_11_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_284 = io_in_bits_enqMask_0 ? _GEN_76 : entries_12_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_285 = io_in_bits_enqMask_0 ? _GEN_77 : entries_13_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_286 = io_in_bits_enqMask_0 ? _GEN_78 : entries_14_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_287 = io_in_bits_enqMask_0 ? _GEN_79 : entries_15_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_288 = io_in_bits_enqMask_0 ? _GEN_80 : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_289 = io_in_bits_enqMask_0 ? _GEN_81 : entries_1_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_290 = io_in_bits_enqMask_0 ? _GEN_82 : entries_2_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_291 = io_in_bits_enqMask_0 ? _GEN_83 : entries_3_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_292 = io_in_bits_enqMask_0 ? _GEN_84 : entries_4_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_293 = io_in_bits_enqMask_0 ? _GEN_85 : entries_5_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_294 = io_in_bits_enqMask_0 ? _GEN_86 : entries_6_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_295 = io_in_bits_enqMask_0 ? _GEN_87 : entries_7_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_296 = io_in_bits_enqMask_0 ? _GEN_88 : entries_8_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_297 = io_in_bits_enqMask_0 ? _GEN_89 : entries_9_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_298 = io_in_bits_enqMask_0 ? _GEN_90 : entries_10_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_299 = io_in_bits_enqMask_0 ? _GEN_91 : entries_11_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_300 = io_in_bits_enqMask_0 ? _GEN_92 : entries_12_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_301 = io_in_bits_enqMask_0 ? _GEN_93 : entries_13_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_302 = io_in_bits_enqMask_0 ? _GEN_94 : entries_14_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_303 = io_in_bits_enqMask_0 ? _GEN_95 : entries_15_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_304 = io_in_bits_enqMask_0 ? _GEN_96 : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_305 = io_in_bits_enqMask_0 ? _GEN_97 : entries_1_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_306 = io_in_bits_enqMask_0 ? _GEN_98 : entries_2_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_307 = io_in_bits_enqMask_0 ? _GEN_99 : entries_3_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_308 = io_in_bits_enqMask_0 ? _GEN_100 : entries_4_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_309 = io_in_bits_enqMask_0 ? _GEN_101 : entries_5_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_310 = io_in_bits_enqMask_0 ? _GEN_102 : entries_6_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_311 = io_in_bits_enqMask_0 ? _GEN_103 : entries_7_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_312 = io_in_bits_enqMask_0 ? _GEN_104 : entries_8_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_313 = io_in_bits_enqMask_0 ? _GEN_105 : entries_9_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_314 = io_in_bits_enqMask_0 ? _GEN_106 : entries_10_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_315 = io_in_bits_enqMask_0 ? _GEN_107 : entries_11_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_316 = io_in_bits_enqMask_0 ? _GEN_108 : entries_12_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_317 = io_in_bits_enqMask_0 ? _GEN_109 : entries_13_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_318 = io_in_bits_enqMask_0 ? _GEN_110 : entries_14_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_319 = io_in_bits_enqMask_0 ? _GEN_111 : entries_15_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_320 = io_in_bits_enqMask_0 ? _GEN_112 : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_321 = io_in_bits_enqMask_0 ? _GEN_113 : entries_1_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_322 = io_in_bits_enqMask_0 ? _GEN_114 : entries_2_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_323 = io_in_bits_enqMask_0 ? _GEN_115 : entries_3_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_324 = io_in_bits_enqMask_0 ? _GEN_116 : entries_4_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_325 = io_in_bits_enqMask_0 ? _GEN_117 : entries_5_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_326 = io_in_bits_enqMask_0 ? _GEN_118 : entries_6_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_327 = io_in_bits_enqMask_0 ? _GEN_119 : entries_7_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_328 = io_in_bits_enqMask_0 ? _GEN_120 : entries_8_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_329 = io_in_bits_enqMask_0 ? _GEN_121 : entries_9_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_330 = io_in_bits_enqMask_0 ? _GEN_122 : entries_10_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_331 = io_in_bits_enqMask_0 ? _GEN_123 : entries_11_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_332 = io_in_bits_enqMask_0 ? _GEN_124 : entries_12_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_333 = io_in_bits_enqMask_0 ? _GEN_125 : entries_13_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_334 = io_in_bits_enqMask_0 ? _GEN_126 : entries_14_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_335 = io_in_bits_enqMask_0 ? _GEN_127 : entries_15_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_336 = io_in_bits_enqMask_0 ? _GEN_128 : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_337 = io_in_bits_enqMask_0 ? _GEN_129 : entries_1_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_338 = io_in_bits_enqMask_0 ? _GEN_130 : entries_2_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_339 = io_in_bits_enqMask_0 ? _GEN_131 : entries_3_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_340 = io_in_bits_enqMask_0 ? _GEN_132 : entries_4_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_341 = io_in_bits_enqMask_0 ? _GEN_133 : entries_5_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_342 = io_in_bits_enqMask_0 ? _GEN_134 : entries_6_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_343 = io_in_bits_enqMask_0 ? _GEN_135 : entries_7_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_344 = io_in_bits_enqMask_0 ? _GEN_136 : entries_8_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_345 = io_in_bits_enqMask_0 ? _GEN_137 : entries_9_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_346 = io_in_bits_enqMask_0 ? _GEN_138 : entries_10_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_347 = io_in_bits_enqMask_0 ? _GEN_139 : entries_11_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_348 = io_in_bits_enqMask_0 ? _GEN_140 : entries_12_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_349 = io_in_bits_enqMask_0 ? _GEN_141 : entries_13_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_350 = io_in_bits_enqMask_0 ? _GEN_142 : entries_14_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire [31:0] _GEN_351 = io_in_bits_enqMask_0 ? _GEN_143 : entries_15_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 22:26 44:27]
  wire  _GEN_400 = io_in_bits_enqMask_0 ? _GEN_192 : valids_0; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_401 = io_in_bits_enqMask_0 ? _GEN_193 : valids_1; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_402 = io_in_bits_enqMask_0 ? _GEN_194 : valids_2; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_403 = io_in_bits_enqMask_0 ? _GEN_195 : valids_3; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_404 = io_in_bits_enqMask_0 ? _GEN_196 : valids_4; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_405 = io_in_bits_enqMask_0 ? _GEN_197 : valids_5; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_406 = io_in_bits_enqMask_0 ? _GEN_198 : valids_6; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_407 = io_in_bits_enqMask_0 ? _GEN_199 : valids_7; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_408 = io_in_bits_enqMask_0 ? _GEN_200 : valids_8; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_409 = io_in_bits_enqMask_0 ? _GEN_201 : valids_9; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_410 = io_in_bits_enqMask_0 ? _GEN_202 : valids_10; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_411 = io_in_bits_enqMask_0 ? _GEN_203 : valids_11; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_412 = io_in_bits_enqMask_0 ? _GEN_204 : valids_12; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_413 = io_in_bits_enqMask_0 ? _GEN_205 : valids_13; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_414 = io_in_bits_enqMask_0 ? _GEN_206 : valids_14; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire  _GEN_415 = io_in_bits_enqMask_0 ? _GEN_207 : valids_15; // @[src/main/scala/frontend/IBF.scala 23:26 44:27]
  wire [3:0] _idx_T_3 = head + 4'h1; // @[src/main/scala/frontend/IBF.scala 43:23]
  wire [4:0] _GEN_146 = {{1'd0}, _idx_T_3}; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [4:0] _GEN_147 = _GEN_146 % 5'h10; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [3:0] idx_1 = _GEN_147[3:0]; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [31:0] _GEN_416 = 4'h0 == idx_1 ? io_in_bits_instrs_1 : _GEN_208; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_417 = 4'h1 == idx_1 ? io_in_bits_instrs_1 : _GEN_209; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_418 = 4'h2 == idx_1 ? io_in_bits_instrs_1 : _GEN_210; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_419 = 4'h3 == idx_1 ? io_in_bits_instrs_1 : _GEN_211; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_420 = 4'h4 == idx_1 ? io_in_bits_instrs_1 : _GEN_212; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_421 = 4'h5 == idx_1 ? io_in_bits_instrs_1 : _GEN_213; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_422 = 4'h6 == idx_1 ? io_in_bits_instrs_1 : _GEN_214; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_423 = 4'h7 == idx_1 ? io_in_bits_instrs_1 : _GEN_215; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_424 = 4'h8 == idx_1 ? io_in_bits_instrs_1 : _GEN_216; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_425 = 4'h9 == idx_1 ? io_in_bits_instrs_1 : _GEN_217; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_426 = 4'ha == idx_1 ? io_in_bits_instrs_1 : _GEN_218; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_427 = 4'hb == idx_1 ? io_in_bits_instrs_1 : _GEN_219; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_428 = 4'hc == idx_1 ? io_in_bits_instrs_1 : _GEN_220; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_429 = 4'hd == idx_1 ? io_in_bits_instrs_1 : _GEN_221; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_430 = 4'he == idx_1 ? io_in_bits_instrs_1 : _GEN_222; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_431 = 4'hf == idx_1 ? io_in_bits_instrs_1 : _GEN_223; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_432 = 4'h0 == idx_1 ? io_in_bits_pcs_1 : _GEN_224; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_433 = 4'h1 == idx_1 ? io_in_bits_pcs_1 : _GEN_225; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_434 = 4'h2 == idx_1 ? io_in_bits_pcs_1 : _GEN_226; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_435 = 4'h3 == idx_1 ? io_in_bits_pcs_1 : _GEN_227; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_436 = 4'h4 == idx_1 ? io_in_bits_pcs_1 : _GEN_228; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_437 = 4'h5 == idx_1 ? io_in_bits_pcs_1 : _GEN_229; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_438 = 4'h6 == idx_1 ? io_in_bits_pcs_1 : _GEN_230; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_439 = 4'h7 == idx_1 ? io_in_bits_pcs_1 : _GEN_231; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_440 = 4'h8 == idx_1 ? io_in_bits_pcs_1 : _GEN_232; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_441 = 4'h9 == idx_1 ? io_in_bits_pcs_1 : _GEN_233; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_442 = 4'ha == idx_1 ? io_in_bits_pcs_1 : _GEN_234; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_443 = 4'hb == idx_1 ? io_in_bits_pcs_1 : _GEN_235; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_444 = 4'hc == idx_1 ? io_in_bits_pcs_1 : _GEN_236; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_445 = 4'hd == idx_1 ? io_in_bits_pcs_1 : _GEN_237; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_446 = 4'he == idx_1 ? io_in_bits_pcs_1 : _GEN_238; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_447 = 4'hf == idx_1 ? io_in_bits_pcs_1 : _GEN_239; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire  _GEN_448 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_240; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_449 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_241; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_450 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_242; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_451 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_243; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_452 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_244; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_453 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_245; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_454 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_246; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_455 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_247; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_456 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_248; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_457 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_249; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_458 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_250; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_459 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_251; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_460 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_252; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_461 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_253; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_462 = 4'he == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_254; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_463 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_valid : _GEN_255; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_464 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_256; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_465 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_257; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_466 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_258; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_467 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_259; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_468 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_260; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_469 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_261; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_470 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_262; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_471 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_263; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_472 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_264; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_473 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_265; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_474 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_266; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_475 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_267; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_476 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_268; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_477 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_269; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_478 = 4'he == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_270; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_479 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_isBr : _GEN_271; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_480 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_272; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_481 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_273; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_482 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_274; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_483 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_275; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_484 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_276; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_485 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_277; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_486 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_278; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_487 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_279; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_488 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_280; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_489 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_281; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_490 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_282; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_491 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_283; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_492 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_284; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_493 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_285; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_494 = 4'he == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_286; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_495 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_isJal : _GEN_287; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_496 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_288; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_497 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_289; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_498 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_290; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_499 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_291; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_500 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_292; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_501 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_293; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_502 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_294; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_503 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_295; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_504 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_296; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_505 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_297; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_506 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_298; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_507 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_299; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_508 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_300; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_509 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_301; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_510 = 4'he == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_302; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_511 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_isJalr : _GEN_303; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_512 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_304; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_513 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_305; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_514 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_306; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_515 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_307; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_516 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_308; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_517 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_309; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_518 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_310; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_519 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_311; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_520 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_312; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_521 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_313; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_522 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_314; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_523 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_315; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_524 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_316; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_525 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_317; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_526 = 4'he == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_318; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_527 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_isCall : _GEN_319; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_528 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_320; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_529 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_321; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_530 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_322; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_531 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_323; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_532 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_324; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_533 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_325; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_534 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_326; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_535 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_327; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_536 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_328; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_537 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_329; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_538 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_330; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_539 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_331; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_540 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_332; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_541 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_333; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_542 = 4'he == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_334; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_543 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_isRet : _GEN_335; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_544 = 4'h0 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_336; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_545 = 4'h1 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_337; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_546 = 4'h2 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_338; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_547 = 4'h3 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_339; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_548 = 4'h4 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_340; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_549 = 4'h5 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_341; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_550 = 4'h6 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_342; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_551 = 4'h7 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_343; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_552 = 4'h8 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_344; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_553 = 4'h9 == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_345; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_554 = 4'ha == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_346; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_555 = 4'hb == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_347; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_556 = 4'hc == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_348; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_557 = 4'hd == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_349; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_558 = 4'he == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_350; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_559 = 4'hf == idx_1 ? io_in_bits_pdInfo_1_jumpTarget : _GEN_351; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_608 = 4'h0 == idx_1 | _GEN_400; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_609 = 4'h1 == idx_1 | _GEN_401; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_610 = 4'h2 == idx_1 | _GEN_402; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_611 = 4'h3 == idx_1 | _GEN_403; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_612 = 4'h4 == idx_1 | _GEN_404; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_613 = 4'h5 == idx_1 | _GEN_405; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_614 = 4'h6 == idx_1 | _GEN_406; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_615 = 4'h7 == idx_1 | _GEN_407; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_616 = 4'h8 == idx_1 | _GEN_408; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_617 = 4'h9 == idx_1 | _GEN_409; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_618 = 4'ha == idx_1 | _GEN_410; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_619 = 4'hb == idx_1 | _GEN_411; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_620 = 4'hc == idx_1 | _GEN_412; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_621 = 4'hd == idx_1 | _GEN_413; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_622 = 4'he == idx_1 | _GEN_414; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_623 = 4'hf == idx_1 | _GEN_415; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire [31:0] _GEN_624 = io_in_bits_enqMask_1 ? _GEN_416 : _GEN_208; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_625 = io_in_bits_enqMask_1 ? _GEN_417 : _GEN_209; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_626 = io_in_bits_enqMask_1 ? _GEN_418 : _GEN_210; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_627 = io_in_bits_enqMask_1 ? _GEN_419 : _GEN_211; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_628 = io_in_bits_enqMask_1 ? _GEN_420 : _GEN_212; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_629 = io_in_bits_enqMask_1 ? _GEN_421 : _GEN_213; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_630 = io_in_bits_enqMask_1 ? _GEN_422 : _GEN_214; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_631 = io_in_bits_enqMask_1 ? _GEN_423 : _GEN_215; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_632 = io_in_bits_enqMask_1 ? _GEN_424 : _GEN_216; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_633 = io_in_bits_enqMask_1 ? _GEN_425 : _GEN_217; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_634 = io_in_bits_enqMask_1 ? _GEN_426 : _GEN_218; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_635 = io_in_bits_enqMask_1 ? _GEN_427 : _GEN_219; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_636 = io_in_bits_enqMask_1 ? _GEN_428 : _GEN_220; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_637 = io_in_bits_enqMask_1 ? _GEN_429 : _GEN_221; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_638 = io_in_bits_enqMask_1 ? _GEN_430 : _GEN_222; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_639 = io_in_bits_enqMask_1 ? _GEN_431 : _GEN_223; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_640 = io_in_bits_enqMask_1 ? _GEN_432 : _GEN_224; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_641 = io_in_bits_enqMask_1 ? _GEN_433 : _GEN_225; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_642 = io_in_bits_enqMask_1 ? _GEN_434 : _GEN_226; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_643 = io_in_bits_enqMask_1 ? _GEN_435 : _GEN_227; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_644 = io_in_bits_enqMask_1 ? _GEN_436 : _GEN_228; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_645 = io_in_bits_enqMask_1 ? _GEN_437 : _GEN_229; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_646 = io_in_bits_enqMask_1 ? _GEN_438 : _GEN_230; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_647 = io_in_bits_enqMask_1 ? _GEN_439 : _GEN_231; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_648 = io_in_bits_enqMask_1 ? _GEN_440 : _GEN_232; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_649 = io_in_bits_enqMask_1 ? _GEN_441 : _GEN_233; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_650 = io_in_bits_enqMask_1 ? _GEN_442 : _GEN_234; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_651 = io_in_bits_enqMask_1 ? _GEN_443 : _GEN_235; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_652 = io_in_bits_enqMask_1 ? _GEN_444 : _GEN_236; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_653 = io_in_bits_enqMask_1 ? _GEN_445 : _GEN_237; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_654 = io_in_bits_enqMask_1 ? _GEN_446 : _GEN_238; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_655 = io_in_bits_enqMask_1 ? _GEN_447 : _GEN_239; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_656 = io_in_bits_enqMask_1 ? _GEN_448 : _GEN_240; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_657 = io_in_bits_enqMask_1 ? _GEN_449 : _GEN_241; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_658 = io_in_bits_enqMask_1 ? _GEN_450 : _GEN_242; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_659 = io_in_bits_enqMask_1 ? _GEN_451 : _GEN_243; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_660 = io_in_bits_enqMask_1 ? _GEN_452 : _GEN_244; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_661 = io_in_bits_enqMask_1 ? _GEN_453 : _GEN_245; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_662 = io_in_bits_enqMask_1 ? _GEN_454 : _GEN_246; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_663 = io_in_bits_enqMask_1 ? _GEN_455 : _GEN_247; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_664 = io_in_bits_enqMask_1 ? _GEN_456 : _GEN_248; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_665 = io_in_bits_enqMask_1 ? _GEN_457 : _GEN_249; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_666 = io_in_bits_enqMask_1 ? _GEN_458 : _GEN_250; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_667 = io_in_bits_enqMask_1 ? _GEN_459 : _GEN_251; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_668 = io_in_bits_enqMask_1 ? _GEN_460 : _GEN_252; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_669 = io_in_bits_enqMask_1 ? _GEN_461 : _GEN_253; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_670 = io_in_bits_enqMask_1 ? _GEN_462 : _GEN_254; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_671 = io_in_bits_enqMask_1 ? _GEN_463 : _GEN_255; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_672 = io_in_bits_enqMask_1 ? _GEN_464 : _GEN_256; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_673 = io_in_bits_enqMask_1 ? _GEN_465 : _GEN_257; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_674 = io_in_bits_enqMask_1 ? _GEN_466 : _GEN_258; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_675 = io_in_bits_enqMask_1 ? _GEN_467 : _GEN_259; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_676 = io_in_bits_enqMask_1 ? _GEN_468 : _GEN_260; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_677 = io_in_bits_enqMask_1 ? _GEN_469 : _GEN_261; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_678 = io_in_bits_enqMask_1 ? _GEN_470 : _GEN_262; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_679 = io_in_bits_enqMask_1 ? _GEN_471 : _GEN_263; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_680 = io_in_bits_enqMask_1 ? _GEN_472 : _GEN_264; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_681 = io_in_bits_enqMask_1 ? _GEN_473 : _GEN_265; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_682 = io_in_bits_enqMask_1 ? _GEN_474 : _GEN_266; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_683 = io_in_bits_enqMask_1 ? _GEN_475 : _GEN_267; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_684 = io_in_bits_enqMask_1 ? _GEN_476 : _GEN_268; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_685 = io_in_bits_enqMask_1 ? _GEN_477 : _GEN_269; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_686 = io_in_bits_enqMask_1 ? _GEN_478 : _GEN_270; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_687 = io_in_bits_enqMask_1 ? _GEN_479 : _GEN_271; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_688 = io_in_bits_enqMask_1 ? _GEN_480 : _GEN_272; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_689 = io_in_bits_enqMask_1 ? _GEN_481 : _GEN_273; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_690 = io_in_bits_enqMask_1 ? _GEN_482 : _GEN_274; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_691 = io_in_bits_enqMask_1 ? _GEN_483 : _GEN_275; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_692 = io_in_bits_enqMask_1 ? _GEN_484 : _GEN_276; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_693 = io_in_bits_enqMask_1 ? _GEN_485 : _GEN_277; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_694 = io_in_bits_enqMask_1 ? _GEN_486 : _GEN_278; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_695 = io_in_bits_enqMask_1 ? _GEN_487 : _GEN_279; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_696 = io_in_bits_enqMask_1 ? _GEN_488 : _GEN_280; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_697 = io_in_bits_enqMask_1 ? _GEN_489 : _GEN_281; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_698 = io_in_bits_enqMask_1 ? _GEN_490 : _GEN_282; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_699 = io_in_bits_enqMask_1 ? _GEN_491 : _GEN_283; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_700 = io_in_bits_enqMask_1 ? _GEN_492 : _GEN_284; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_701 = io_in_bits_enqMask_1 ? _GEN_493 : _GEN_285; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_702 = io_in_bits_enqMask_1 ? _GEN_494 : _GEN_286; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_703 = io_in_bits_enqMask_1 ? _GEN_495 : _GEN_287; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_704 = io_in_bits_enqMask_1 ? _GEN_496 : _GEN_288; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_705 = io_in_bits_enqMask_1 ? _GEN_497 : _GEN_289; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_706 = io_in_bits_enqMask_1 ? _GEN_498 : _GEN_290; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_707 = io_in_bits_enqMask_1 ? _GEN_499 : _GEN_291; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_708 = io_in_bits_enqMask_1 ? _GEN_500 : _GEN_292; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_709 = io_in_bits_enqMask_1 ? _GEN_501 : _GEN_293; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_710 = io_in_bits_enqMask_1 ? _GEN_502 : _GEN_294; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_711 = io_in_bits_enqMask_1 ? _GEN_503 : _GEN_295; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_712 = io_in_bits_enqMask_1 ? _GEN_504 : _GEN_296; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_713 = io_in_bits_enqMask_1 ? _GEN_505 : _GEN_297; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_714 = io_in_bits_enqMask_1 ? _GEN_506 : _GEN_298; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_715 = io_in_bits_enqMask_1 ? _GEN_507 : _GEN_299; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_716 = io_in_bits_enqMask_1 ? _GEN_508 : _GEN_300; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_717 = io_in_bits_enqMask_1 ? _GEN_509 : _GEN_301; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_718 = io_in_bits_enqMask_1 ? _GEN_510 : _GEN_302; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_719 = io_in_bits_enqMask_1 ? _GEN_511 : _GEN_303; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_720 = io_in_bits_enqMask_1 ? _GEN_512 : _GEN_304; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_721 = io_in_bits_enqMask_1 ? _GEN_513 : _GEN_305; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_722 = io_in_bits_enqMask_1 ? _GEN_514 : _GEN_306; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_723 = io_in_bits_enqMask_1 ? _GEN_515 : _GEN_307; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_724 = io_in_bits_enqMask_1 ? _GEN_516 : _GEN_308; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_725 = io_in_bits_enqMask_1 ? _GEN_517 : _GEN_309; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_726 = io_in_bits_enqMask_1 ? _GEN_518 : _GEN_310; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_727 = io_in_bits_enqMask_1 ? _GEN_519 : _GEN_311; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_728 = io_in_bits_enqMask_1 ? _GEN_520 : _GEN_312; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_729 = io_in_bits_enqMask_1 ? _GEN_521 : _GEN_313; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_730 = io_in_bits_enqMask_1 ? _GEN_522 : _GEN_314; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_731 = io_in_bits_enqMask_1 ? _GEN_523 : _GEN_315; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_732 = io_in_bits_enqMask_1 ? _GEN_524 : _GEN_316; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_733 = io_in_bits_enqMask_1 ? _GEN_525 : _GEN_317; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_734 = io_in_bits_enqMask_1 ? _GEN_526 : _GEN_318; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_735 = io_in_bits_enqMask_1 ? _GEN_527 : _GEN_319; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_736 = io_in_bits_enqMask_1 ? _GEN_528 : _GEN_320; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_737 = io_in_bits_enqMask_1 ? _GEN_529 : _GEN_321; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_738 = io_in_bits_enqMask_1 ? _GEN_530 : _GEN_322; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_739 = io_in_bits_enqMask_1 ? _GEN_531 : _GEN_323; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_740 = io_in_bits_enqMask_1 ? _GEN_532 : _GEN_324; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_741 = io_in_bits_enqMask_1 ? _GEN_533 : _GEN_325; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_742 = io_in_bits_enqMask_1 ? _GEN_534 : _GEN_326; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_743 = io_in_bits_enqMask_1 ? _GEN_535 : _GEN_327; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_744 = io_in_bits_enqMask_1 ? _GEN_536 : _GEN_328; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_745 = io_in_bits_enqMask_1 ? _GEN_537 : _GEN_329; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_746 = io_in_bits_enqMask_1 ? _GEN_538 : _GEN_330; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_747 = io_in_bits_enqMask_1 ? _GEN_539 : _GEN_331; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_748 = io_in_bits_enqMask_1 ? _GEN_540 : _GEN_332; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_749 = io_in_bits_enqMask_1 ? _GEN_541 : _GEN_333; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_750 = io_in_bits_enqMask_1 ? _GEN_542 : _GEN_334; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_751 = io_in_bits_enqMask_1 ? _GEN_543 : _GEN_335; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_752 = io_in_bits_enqMask_1 ? _GEN_544 : _GEN_336; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_753 = io_in_bits_enqMask_1 ? _GEN_545 : _GEN_337; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_754 = io_in_bits_enqMask_1 ? _GEN_546 : _GEN_338; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_755 = io_in_bits_enqMask_1 ? _GEN_547 : _GEN_339; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_756 = io_in_bits_enqMask_1 ? _GEN_548 : _GEN_340; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_757 = io_in_bits_enqMask_1 ? _GEN_549 : _GEN_341; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_758 = io_in_bits_enqMask_1 ? _GEN_550 : _GEN_342; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_759 = io_in_bits_enqMask_1 ? _GEN_551 : _GEN_343; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_760 = io_in_bits_enqMask_1 ? _GEN_552 : _GEN_344; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_761 = io_in_bits_enqMask_1 ? _GEN_553 : _GEN_345; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_762 = io_in_bits_enqMask_1 ? _GEN_554 : _GEN_346; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_763 = io_in_bits_enqMask_1 ? _GEN_555 : _GEN_347; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_764 = io_in_bits_enqMask_1 ? _GEN_556 : _GEN_348; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_765 = io_in_bits_enqMask_1 ? _GEN_557 : _GEN_349; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_766 = io_in_bits_enqMask_1 ? _GEN_558 : _GEN_350; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_767 = io_in_bits_enqMask_1 ? _GEN_559 : _GEN_351; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_816 = io_in_bits_enqMask_1 ? _GEN_608 : _GEN_400; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_817 = io_in_bits_enqMask_1 ? _GEN_609 : _GEN_401; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_818 = io_in_bits_enqMask_1 ? _GEN_610 : _GEN_402; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_819 = io_in_bits_enqMask_1 ? _GEN_611 : _GEN_403; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_820 = io_in_bits_enqMask_1 ? _GEN_612 : _GEN_404; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_821 = io_in_bits_enqMask_1 ? _GEN_613 : _GEN_405; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_822 = io_in_bits_enqMask_1 ? _GEN_614 : _GEN_406; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_823 = io_in_bits_enqMask_1 ? _GEN_615 : _GEN_407; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_824 = io_in_bits_enqMask_1 ? _GEN_616 : _GEN_408; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_825 = io_in_bits_enqMask_1 ? _GEN_617 : _GEN_409; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_826 = io_in_bits_enqMask_1 ? _GEN_618 : _GEN_410; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_827 = io_in_bits_enqMask_1 ? _GEN_619 : _GEN_411; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_828 = io_in_bits_enqMask_1 ? _GEN_620 : _GEN_412; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_829 = io_in_bits_enqMask_1 ? _GEN_621 : _GEN_413; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_830 = io_in_bits_enqMask_1 ? _GEN_622 : _GEN_414; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_831 = io_in_bits_enqMask_1 ? _GEN_623 : _GEN_415; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [3:0] _idx_T_5 = head + 4'h2; // @[src/main/scala/frontend/IBF.scala 43:23]
  wire [4:0] _GEN_148 = {{1'd0}, _idx_T_5}; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [4:0] _GEN_149 = _GEN_148 % 5'h10; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [3:0] idx_2 = _GEN_149[3:0]; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [31:0] _GEN_832 = 4'h0 == idx_2 ? io_in_bits_instrs_2 : _GEN_624; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_833 = 4'h1 == idx_2 ? io_in_bits_instrs_2 : _GEN_625; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_834 = 4'h2 == idx_2 ? io_in_bits_instrs_2 : _GEN_626; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_835 = 4'h3 == idx_2 ? io_in_bits_instrs_2 : _GEN_627; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_836 = 4'h4 == idx_2 ? io_in_bits_instrs_2 : _GEN_628; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_837 = 4'h5 == idx_2 ? io_in_bits_instrs_2 : _GEN_629; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_838 = 4'h6 == idx_2 ? io_in_bits_instrs_2 : _GEN_630; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_839 = 4'h7 == idx_2 ? io_in_bits_instrs_2 : _GEN_631; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_840 = 4'h8 == idx_2 ? io_in_bits_instrs_2 : _GEN_632; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_841 = 4'h9 == idx_2 ? io_in_bits_instrs_2 : _GEN_633; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_842 = 4'ha == idx_2 ? io_in_bits_instrs_2 : _GEN_634; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_843 = 4'hb == idx_2 ? io_in_bits_instrs_2 : _GEN_635; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_844 = 4'hc == idx_2 ? io_in_bits_instrs_2 : _GEN_636; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_845 = 4'hd == idx_2 ? io_in_bits_instrs_2 : _GEN_637; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_846 = 4'he == idx_2 ? io_in_bits_instrs_2 : _GEN_638; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_847 = 4'hf == idx_2 ? io_in_bits_instrs_2 : _GEN_639; // @[src/main/scala/frontend/IBF.scala 45:{33,33}]
  wire [31:0] _GEN_848 = 4'h0 == idx_2 ? io_in_bits_pcs_2 : _GEN_640; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_849 = 4'h1 == idx_2 ? io_in_bits_pcs_2 : _GEN_641; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_850 = 4'h2 == idx_2 ? io_in_bits_pcs_2 : _GEN_642; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_851 = 4'h3 == idx_2 ? io_in_bits_pcs_2 : _GEN_643; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_852 = 4'h4 == idx_2 ? io_in_bits_pcs_2 : _GEN_644; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_853 = 4'h5 == idx_2 ? io_in_bits_pcs_2 : _GEN_645; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_854 = 4'h6 == idx_2 ? io_in_bits_pcs_2 : _GEN_646; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_855 = 4'h7 == idx_2 ? io_in_bits_pcs_2 : _GEN_647; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_856 = 4'h8 == idx_2 ? io_in_bits_pcs_2 : _GEN_648; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_857 = 4'h9 == idx_2 ? io_in_bits_pcs_2 : _GEN_649; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_858 = 4'ha == idx_2 ? io_in_bits_pcs_2 : _GEN_650; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_859 = 4'hb == idx_2 ? io_in_bits_pcs_2 : _GEN_651; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_860 = 4'hc == idx_2 ? io_in_bits_pcs_2 : _GEN_652; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_861 = 4'hd == idx_2 ? io_in_bits_pcs_2 : _GEN_653; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_862 = 4'he == idx_2 ? io_in_bits_pcs_2 : _GEN_654; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire [31:0] _GEN_863 = 4'hf == idx_2 ? io_in_bits_pcs_2 : _GEN_655; // @[src/main/scala/frontend/IBF.scala 46:{33,33}]
  wire  _GEN_864 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_656; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_865 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_657; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_866 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_658; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_867 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_659; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_868 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_660; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_869 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_661; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_870 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_662; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_871 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_663; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_872 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_664; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_873 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_665; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_874 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_666; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_875 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_667; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_876 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_668; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_877 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_669; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_878 = 4'he == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_670; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_879 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_valid : _GEN_671; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_880 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_672; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_881 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_673; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_882 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_674; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_883 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_675; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_884 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_676; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_885 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_677; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_886 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_678; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_887 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_679; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_888 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_680; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_889 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_681; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_890 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_682; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_891 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_683; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_892 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_684; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_893 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_685; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_894 = 4'he == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_686; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_895 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_isBr : _GEN_687; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_896 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_688; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_897 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_689; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_898 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_690; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_899 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_691; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_900 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_692; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_901 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_693; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_902 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_694; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_903 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_695; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_904 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_696; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_905 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_697; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_906 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_698; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_907 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_699; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_908 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_700; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_909 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_701; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_910 = 4'he == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_702; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_911 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_isJal : _GEN_703; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_912 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_704; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_913 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_705; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_914 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_706; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_915 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_707; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_916 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_708; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_917 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_709; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_918 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_710; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_919 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_711; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_920 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_712; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_921 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_713; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_922 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_714; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_923 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_715; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_924 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_716; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_925 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_717; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_926 = 4'he == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_718; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_927 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_isJalr : _GEN_719; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_928 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_720; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_929 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_721; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_930 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_722; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_931 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_723; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_932 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_724; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_933 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_725; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_934 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_726; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_935 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_727; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_936 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_728; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_937 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_729; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_938 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_730; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_939 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_731; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_940 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_732; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_941 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_733; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_942 = 4'he == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_734; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_943 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_isCall : _GEN_735; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_944 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_736; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_945 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_737; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_946 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_738; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_947 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_739; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_948 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_740; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_949 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_741; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_950 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_742; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_951 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_743; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_952 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_744; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_953 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_745; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_954 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_746; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_955 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_747; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_956 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_748; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_957 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_749; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_958 = 4'he == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_750; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_959 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_isRet : _GEN_751; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_960 = 4'h0 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_752; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_961 = 4'h1 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_753; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_962 = 4'h2 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_754; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_963 = 4'h3 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_755; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_964 = 4'h4 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_756; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_965 = 4'h5 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_757; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_966 = 4'h6 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_758; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_967 = 4'h7 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_759; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_968 = 4'h8 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_760; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_969 = 4'h9 == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_761; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_970 = 4'ha == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_762; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_971 = 4'hb == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_763; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_972 = 4'hc == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_764; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_973 = 4'hd == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_765; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_974 = 4'he == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_766; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire [31:0] _GEN_975 = 4'hf == idx_2 ? io_in_bits_pdInfo_2_jumpTarget : _GEN_767; // @[src/main/scala/frontend/IBF.scala 47:{33,33}]
  wire  _GEN_1024 = 4'h0 == idx_2 | _GEN_816; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1025 = 4'h1 == idx_2 | _GEN_817; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1026 = 4'h2 == idx_2 | _GEN_818; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1027 = 4'h3 == idx_2 | _GEN_819; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1028 = 4'h4 == idx_2 | _GEN_820; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1029 = 4'h5 == idx_2 | _GEN_821; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1030 = 4'h6 == idx_2 | _GEN_822; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1031 = 4'h7 == idx_2 | _GEN_823; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1032 = 4'h8 == idx_2 | _GEN_824; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1033 = 4'h9 == idx_2 | _GEN_825; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1034 = 4'ha == idx_2 | _GEN_826; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1035 = 4'hb == idx_2 | _GEN_827; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1036 = 4'hc == idx_2 | _GEN_828; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1037 = 4'hd == idx_2 | _GEN_829; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1038 = 4'he == idx_2 | _GEN_830; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1039 = 4'hf == idx_2 | _GEN_831; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire [31:0] _GEN_1040 = io_in_bits_enqMask_2 ? _GEN_832 : _GEN_624; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1041 = io_in_bits_enqMask_2 ? _GEN_833 : _GEN_625; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1042 = io_in_bits_enqMask_2 ? _GEN_834 : _GEN_626; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1043 = io_in_bits_enqMask_2 ? _GEN_835 : _GEN_627; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1044 = io_in_bits_enqMask_2 ? _GEN_836 : _GEN_628; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1045 = io_in_bits_enqMask_2 ? _GEN_837 : _GEN_629; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1046 = io_in_bits_enqMask_2 ? _GEN_838 : _GEN_630; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1047 = io_in_bits_enqMask_2 ? _GEN_839 : _GEN_631; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1048 = io_in_bits_enqMask_2 ? _GEN_840 : _GEN_632; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1049 = io_in_bits_enqMask_2 ? _GEN_841 : _GEN_633; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1050 = io_in_bits_enqMask_2 ? _GEN_842 : _GEN_634; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1051 = io_in_bits_enqMask_2 ? _GEN_843 : _GEN_635; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1052 = io_in_bits_enqMask_2 ? _GEN_844 : _GEN_636; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1053 = io_in_bits_enqMask_2 ? _GEN_845 : _GEN_637; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1054 = io_in_bits_enqMask_2 ? _GEN_846 : _GEN_638; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1055 = io_in_bits_enqMask_2 ? _GEN_847 : _GEN_639; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1056 = io_in_bits_enqMask_2 ? _GEN_848 : _GEN_640; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1057 = io_in_bits_enqMask_2 ? _GEN_849 : _GEN_641; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1058 = io_in_bits_enqMask_2 ? _GEN_850 : _GEN_642; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1059 = io_in_bits_enqMask_2 ? _GEN_851 : _GEN_643; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1060 = io_in_bits_enqMask_2 ? _GEN_852 : _GEN_644; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1061 = io_in_bits_enqMask_2 ? _GEN_853 : _GEN_645; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1062 = io_in_bits_enqMask_2 ? _GEN_854 : _GEN_646; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1063 = io_in_bits_enqMask_2 ? _GEN_855 : _GEN_647; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1064 = io_in_bits_enqMask_2 ? _GEN_856 : _GEN_648; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1065 = io_in_bits_enqMask_2 ? _GEN_857 : _GEN_649; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1066 = io_in_bits_enqMask_2 ? _GEN_858 : _GEN_650; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1067 = io_in_bits_enqMask_2 ? _GEN_859 : _GEN_651; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1068 = io_in_bits_enqMask_2 ? _GEN_860 : _GEN_652; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1069 = io_in_bits_enqMask_2 ? _GEN_861 : _GEN_653; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1070 = io_in_bits_enqMask_2 ? _GEN_862 : _GEN_654; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1071 = io_in_bits_enqMask_2 ? _GEN_863 : _GEN_655; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1072 = io_in_bits_enqMask_2 ? _GEN_864 : _GEN_656; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1073 = io_in_bits_enqMask_2 ? _GEN_865 : _GEN_657; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1074 = io_in_bits_enqMask_2 ? _GEN_866 : _GEN_658; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1075 = io_in_bits_enqMask_2 ? _GEN_867 : _GEN_659; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1076 = io_in_bits_enqMask_2 ? _GEN_868 : _GEN_660; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1077 = io_in_bits_enqMask_2 ? _GEN_869 : _GEN_661; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1078 = io_in_bits_enqMask_2 ? _GEN_870 : _GEN_662; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1079 = io_in_bits_enqMask_2 ? _GEN_871 : _GEN_663; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1080 = io_in_bits_enqMask_2 ? _GEN_872 : _GEN_664; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1081 = io_in_bits_enqMask_2 ? _GEN_873 : _GEN_665; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1082 = io_in_bits_enqMask_2 ? _GEN_874 : _GEN_666; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1083 = io_in_bits_enqMask_2 ? _GEN_875 : _GEN_667; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1084 = io_in_bits_enqMask_2 ? _GEN_876 : _GEN_668; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1085 = io_in_bits_enqMask_2 ? _GEN_877 : _GEN_669; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1086 = io_in_bits_enqMask_2 ? _GEN_878 : _GEN_670; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1087 = io_in_bits_enqMask_2 ? _GEN_879 : _GEN_671; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1088 = io_in_bits_enqMask_2 ? _GEN_880 : _GEN_672; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1089 = io_in_bits_enqMask_2 ? _GEN_881 : _GEN_673; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1090 = io_in_bits_enqMask_2 ? _GEN_882 : _GEN_674; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1091 = io_in_bits_enqMask_2 ? _GEN_883 : _GEN_675; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1092 = io_in_bits_enqMask_2 ? _GEN_884 : _GEN_676; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1093 = io_in_bits_enqMask_2 ? _GEN_885 : _GEN_677; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1094 = io_in_bits_enqMask_2 ? _GEN_886 : _GEN_678; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1095 = io_in_bits_enqMask_2 ? _GEN_887 : _GEN_679; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1096 = io_in_bits_enqMask_2 ? _GEN_888 : _GEN_680; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1097 = io_in_bits_enqMask_2 ? _GEN_889 : _GEN_681; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1098 = io_in_bits_enqMask_2 ? _GEN_890 : _GEN_682; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1099 = io_in_bits_enqMask_2 ? _GEN_891 : _GEN_683; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1100 = io_in_bits_enqMask_2 ? _GEN_892 : _GEN_684; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1101 = io_in_bits_enqMask_2 ? _GEN_893 : _GEN_685; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1102 = io_in_bits_enqMask_2 ? _GEN_894 : _GEN_686; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1103 = io_in_bits_enqMask_2 ? _GEN_895 : _GEN_687; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1104 = io_in_bits_enqMask_2 ? _GEN_896 : _GEN_688; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1105 = io_in_bits_enqMask_2 ? _GEN_897 : _GEN_689; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1106 = io_in_bits_enqMask_2 ? _GEN_898 : _GEN_690; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1107 = io_in_bits_enqMask_2 ? _GEN_899 : _GEN_691; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1108 = io_in_bits_enqMask_2 ? _GEN_900 : _GEN_692; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1109 = io_in_bits_enqMask_2 ? _GEN_901 : _GEN_693; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1110 = io_in_bits_enqMask_2 ? _GEN_902 : _GEN_694; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1111 = io_in_bits_enqMask_2 ? _GEN_903 : _GEN_695; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1112 = io_in_bits_enqMask_2 ? _GEN_904 : _GEN_696; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1113 = io_in_bits_enqMask_2 ? _GEN_905 : _GEN_697; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1114 = io_in_bits_enqMask_2 ? _GEN_906 : _GEN_698; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1115 = io_in_bits_enqMask_2 ? _GEN_907 : _GEN_699; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1116 = io_in_bits_enqMask_2 ? _GEN_908 : _GEN_700; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1117 = io_in_bits_enqMask_2 ? _GEN_909 : _GEN_701; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1118 = io_in_bits_enqMask_2 ? _GEN_910 : _GEN_702; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1119 = io_in_bits_enqMask_2 ? _GEN_911 : _GEN_703; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1120 = io_in_bits_enqMask_2 ? _GEN_912 : _GEN_704; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1121 = io_in_bits_enqMask_2 ? _GEN_913 : _GEN_705; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1122 = io_in_bits_enqMask_2 ? _GEN_914 : _GEN_706; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1123 = io_in_bits_enqMask_2 ? _GEN_915 : _GEN_707; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1124 = io_in_bits_enqMask_2 ? _GEN_916 : _GEN_708; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1125 = io_in_bits_enqMask_2 ? _GEN_917 : _GEN_709; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1126 = io_in_bits_enqMask_2 ? _GEN_918 : _GEN_710; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1127 = io_in_bits_enqMask_2 ? _GEN_919 : _GEN_711; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1128 = io_in_bits_enqMask_2 ? _GEN_920 : _GEN_712; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1129 = io_in_bits_enqMask_2 ? _GEN_921 : _GEN_713; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1130 = io_in_bits_enqMask_2 ? _GEN_922 : _GEN_714; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1131 = io_in_bits_enqMask_2 ? _GEN_923 : _GEN_715; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1132 = io_in_bits_enqMask_2 ? _GEN_924 : _GEN_716; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1133 = io_in_bits_enqMask_2 ? _GEN_925 : _GEN_717; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1134 = io_in_bits_enqMask_2 ? _GEN_926 : _GEN_718; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1135 = io_in_bits_enqMask_2 ? _GEN_927 : _GEN_719; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1136 = io_in_bits_enqMask_2 ? _GEN_928 : _GEN_720; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1137 = io_in_bits_enqMask_2 ? _GEN_929 : _GEN_721; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1138 = io_in_bits_enqMask_2 ? _GEN_930 : _GEN_722; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1139 = io_in_bits_enqMask_2 ? _GEN_931 : _GEN_723; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1140 = io_in_bits_enqMask_2 ? _GEN_932 : _GEN_724; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1141 = io_in_bits_enqMask_2 ? _GEN_933 : _GEN_725; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1142 = io_in_bits_enqMask_2 ? _GEN_934 : _GEN_726; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1143 = io_in_bits_enqMask_2 ? _GEN_935 : _GEN_727; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1144 = io_in_bits_enqMask_2 ? _GEN_936 : _GEN_728; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1145 = io_in_bits_enqMask_2 ? _GEN_937 : _GEN_729; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1146 = io_in_bits_enqMask_2 ? _GEN_938 : _GEN_730; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1147 = io_in_bits_enqMask_2 ? _GEN_939 : _GEN_731; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1148 = io_in_bits_enqMask_2 ? _GEN_940 : _GEN_732; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1149 = io_in_bits_enqMask_2 ? _GEN_941 : _GEN_733; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1150 = io_in_bits_enqMask_2 ? _GEN_942 : _GEN_734; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1151 = io_in_bits_enqMask_2 ? _GEN_943 : _GEN_735; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1152 = io_in_bits_enqMask_2 ? _GEN_944 : _GEN_736; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1153 = io_in_bits_enqMask_2 ? _GEN_945 : _GEN_737; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1154 = io_in_bits_enqMask_2 ? _GEN_946 : _GEN_738; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1155 = io_in_bits_enqMask_2 ? _GEN_947 : _GEN_739; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1156 = io_in_bits_enqMask_2 ? _GEN_948 : _GEN_740; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1157 = io_in_bits_enqMask_2 ? _GEN_949 : _GEN_741; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1158 = io_in_bits_enqMask_2 ? _GEN_950 : _GEN_742; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1159 = io_in_bits_enqMask_2 ? _GEN_951 : _GEN_743; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1160 = io_in_bits_enqMask_2 ? _GEN_952 : _GEN_744; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1161 = io_in_bits_enqMask_2 ? _GEN_953 : _GEN_745; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1162 = io_in_bits_enqMask_2 ? _GEN_954 : _GEN_746; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1163 = io_in_bits_enqMask_2 ? _GEN_955 : _GEN_747; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1164 = io_in_bits_enqMask_2 ? _GEN_956 : _GEN_748; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1165 = io_in_bits_enqMask_2 ? _GEN_957 : _GEN_749; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1166 = io_in_bits_enqMask_2 ? _GEN_958 : _GEN_750; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1167 = io_in_bits_enqMask_2 ? _GEN_959 : _GEN_751; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1168 = io_in_bits_enqMask_2 ? _GEN_960 : _GEN_752; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1169 = io_in_bits_enqMask_2 ? _GEN_961 : _GEN_753; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1170 = io_in_bits_enqMask_2 ? _GEN_962 : _GEN_754; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1171 = io_in_bits_enqMask_2 ? _GEN_963 : _GEN_755; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1172 = io_in_bits_enqMask_2 ? _GEN_964 : _GEN_756; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1173 = io_in_bits_enqMask_2 ? _GEN_965 : _GEN_757; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1174 = io_in_bits_enqMask_2 ? _GEN_966 : _GEN_758; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1175 = io_in_bits_enqMask_2 ? _GEN_967 : _GEN_759; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1176 = io_in_bits_enqMask_2 ? _GEN_968 : _GEN_760; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1177 = io_in_bits_enqMask_2 ? _GEN_969 : _GEN_761; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1178 = io_in_bits_enqMask_2 ? _GEN_970 : _GEN_762; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1179 = io_in_bits_enqMask_2 ? _GEN_971 : _GEN_763; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1180 = io_in_bits_enqMask_2 ? _GEN_972 : _GEN_764; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1181 = io_in_bits_enqMask_2 ? _GEN_973 : _GEN_765; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1182 = io_in_bits_enqMask_2 ? _GEN_974 : _GEN_766; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [31:0] _GEN_1183 = io_in_bits_enqMask_2 ? _GEN_975 : _GEN_767; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1232 = io_in_bits_enqMask_2 ? _GEN_1024 : _GEN_816; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1233 = io_in_bits_enqMask_2 ? _GEN_1025 : _GEN_817; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1234 = io_in_bits_enqMask_2 ? _GEN_1026 : _GEN_818; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1235 = io_in_bits_enqMask_2 ? _GEN_1027 : _GEN_819; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1236 = io_in_bits_enqMask_2 ? _GEN_1028 : _GEN_820; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1237 = io_in_bits_enqMask_2 ? _GEN_1029 : _GEN_821; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1238 = io_in_bits_enqMask_2 ? _GEN_1030 : _GEN_822; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1239 = io_in_bits_enqMask_2 ? _GEN_1031 : _GEN_823; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1240 = io_in_bits_enqMask_2 ? _GEN_1032 : _GEN_824; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1241 = io_in_bits_enqMask_2 ? _GEN_1033 : _GEN_825; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1242 = io_in_bits_enqMask_2 ? _GEN_1034 : _GEN_826; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1243 = io_in_bits_enqMask_2 ? _GEN_1035 : _GEN_827; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1244 = io_in_bits_enqMask_2 ? _GEN_1036 : _GEN_828; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1245 = io_in_bits_enqMask_2 ? _GEN_1037 : _GEN_829; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1246 = io_in_bits_enqMask_2 ? _GEN_1038 : _GEN_830; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire  _GEN_1247 = io_in_bits_enqMask_2 ? _GEN_1039 : _GEN_831; // @[src/main/scala/frontend/IBF.scala 44:27]
  wire [3:0] _idx_T_7 = head + 4'h3; // @[src/main/scala/frontend/IBF.scala 43:23]
  wire [4:0] _GEN_150 = {{1'd0}, _idx_T_7}; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [4:0] _GEN_151 = _GEN_150 % 5'h10; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire [3:0] idx_3 = _GEN_151[3:0]; // @[src/main/scala/frontend/IBF.scala 43:30]
  wire  _GEN_1440 = 4'h0 == idx_3 | _GEN_1232; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1441 = 4'h1 == idx_3 | _GEN_1233; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1442 = 4'h2 == idx_3 | _GEN_1234; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1443 = 4'h3 == idx_3 | _GEN_1235; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1444 = 4'h4 == idx_3 | _GEN_1236; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1445 = 4'h5 == idx_3 | _GEN_1237; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1446 = 4'h6 == idx_3 | _GEN_1238; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1447 = 4'h7 == idx_3 | _GEN_1239; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1448 = 4'h8 == idx_3 | _GEN_1240; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1449 = 4'h9 == idx_3 | _GEN_1241; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1450 = 4'ha == idx_3 | _GEN_1242; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1451 = 4'hb == idx_3 | _GEN_1243; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1452 = 4'hc == idx_3 | _GEN_1244; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1453 = 4'hd == idx_3 | _GEN_1245; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1454 = 4'he == idx_3 | _GEN_1246; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire  _GEN_1455 = 4'hf == idx_3 | _GEN_1247; // @[src/main/scala/frontend/IBF.scala 49:{21,21}]
  wire [1:0] _enqueueCount_T = io_in_bits_enqMask_0 + io_in_bits_enqMask_1; // @[src/main/scala/frontend/IBF.scala 53:29]
  wire [1:0] _enqueueCount_T_2 = io_in_bits_enqMask_2 + io_in_bits_enqMask_3; // @[src/main/scala/frontend/IBF.scala 53:29]
  wire [2:0] _enqueueCount_T_4 = _enqueueCount_T + _enqueueCount_T_2; // @[src/main/scala/frontend/IBF.scala 53:29]
  wire [2:0] enqueueCount = _T ? _enqueueCount_T_4 : 3'h0; // @[src/main/scala/frontend/IBF.scala 37:16 39:33 53:18]
  wire [4:0] _tailIndices_0_T = {{1'd0}, tail}; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_152 = {{1'd0}, _tailIndices_0_T[3:0]}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_153 = _GEN_152 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_0 = _GEN_153[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] _tailIndices_1_T_1 = tail + 4'h1; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_154 = {{1'd0}, _tailIndices_1_T_1}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_155 = _GEN_154 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_1 = _GEN_155[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] _tailIndices_2_T_1 = tail + 4'h2; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_156 = {{1'd0}, _tailIndices_2_T_1}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_157 = _GEN_156 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_2 = _GEN_157[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] _tailIndices_3_T_1 = tail + 4'h3; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_158 = {{1'd0}, _tailIndices_3_T_1}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_159 = _GEN_158 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_3 = _GEN_159[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] _tailIndices_4_T_1 = tail + 4'h4; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_160 = {{1'd0}, _tailIndices_4_T_1}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_161 = _GEN_160 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_4 = _GEN_161[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] _tailIndices_5_T_1 = tail + 4'h5; // @[src/main/scala/frontend/IBF.scala 60:29]
  wire [4:0] _GEN_162 = {{1'd0}, _tailIndices_5_T_1}; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [4:0] _GEN_163 = _GEN_162 % 5'h10; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire [3:0] tailIndices_5 = _GEN_163[3:0]; // @[src/main/scala/frontend/IBF.scala 60:36]
  wire  _GEN_1874 = 4'h1 == tailIndices_0 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1875 = 4'h2 == tailIndices_0 ? valids_2 : _GEN_1874; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1876 = 4'h3 == tailIndices_0 ? valids_3 : _GEN_1875; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1877 = 4'h4 == tailIndices_0 ? valids_4 : _GEN_1876; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1878 = 4'h5 == tailIndices_0 ? valids_5 : _GEN_1877; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1879 = 4'h6 == tailIndices_0 ? valids_6 : _GEN_1878; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1880 = 4'h7 == tailIndices_0 ? valids_7 : _GEN_1879; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1881 = 4'h8 == tailIndices_0 ? valids_8 : _GEN_1880; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1882 = 4'h9 == tailIndices_0 ? valids_9 : _GEN_1881; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1883 = 4'ha == tailIndices_0 ? valids_10 : _GEN_1882; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1884 = 4'hb == tailIndices_0 ? valids_11 : _GEN_1883; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1885 = 4'hc == tailIndices_0 ? valids_12 : _GEN_1884; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1886 = 4'hd == tailIndices_0 ? valids_13 : _GEN_1885; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1887 = 4'he == tailIndices_0 ? valids_14 : _GEN_1886; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1888 = 4'hf == tailIndices_0 ? valids_15 : _GEN_1887; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_0 = 5'h0 < count & _GEN_1888; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  _GEN_1890 = 4'h1 == tailIndices_1 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1891 = 4'h2 == tailIndices_1 ? valids_2 : _GEN_1890; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1892 = 4'h3 == tailIndices_1 ? valids_3 : _GEN_1891; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1893 = 4'h4 == tailIndices_1 ? valids_4 : _GEN_1892; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1894 = 4'h5 == tailIndices_1 ? valids_5 : _GEN_1893; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1895 = 4'h6 == tailIndices_1 ? valids_6 : _GEN_1894; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1896 = 4'h7 == tailIndices_1 ? valids_7 : _GEN_1895; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1897 = 4'h8 == tailIndices_1 ? valids_8 : _GEN_1896; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1898 = 4'h9 == tailIndices_1 ? valids_9 : _GEN_1897; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1899 = 4'ha == tailIndices_1 ? valids_10 : _GEN_1898; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1900 = 4'hb == tailIndices_1 ? valids_11 : _GEN_1899; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1901 = 4'hc == tailIndices_1 ? valids_12 : _GEN_1900; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1902 = 4'hd == tailIndices_1 ? valids_13 : _GEN_1901; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1903 = 4'he == tailIndices_1 ? valids_14 : _GEN_1902; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1904 = 4'hf == tailIndices_1 ? valids_15 : _GEN_1903; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_1 = 5'h1 < count & _GEN_1904; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  _GEN_1906 = 4'h1 == tailIndices_2 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1907 = 4'h2 == tailIndices_2 ? valids_2 : _GEN_1906; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1908 = 4'h3 == tailIndices_2 ? valids_3 : _GEN_1907; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1909 = 4'h4 == tailIndices_2 ? valids_4 : _GEN_1908; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1910 = 4'h5 == tailIndices_2 ? valids_5 : _GEN_1909; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1911 = 4'h6 == tailIndices_2 ? valids_6 : _GEN_1910; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1912 = 4'h7 == tailIndices_2 ? valids_7 : _GEN_1911; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1913 = 4'h8 == tailIndices_2 ? valids_8 : _GEN_1912; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1914 = 4'h9 == tailIndices_2 ? valids_9 : _GEN_1913; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1915 = 4'ha == tailIndices_2 ? valids_10 : _GEN_1914; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1916 = 4'hb == tailIndices_2 ? valids_11 : _GEN_1915; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1917 = 4'hc == tailIndices_2 ? valids_12 : _GEN_1916; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1918 = 4'hd == tailIndices_2 ? valids_13 : _GEN_1917; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1919 = 4'he == tailIndices_2 ? valids_14 : _GEN_1918; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1920 = 4'hf == tailIndices_2 ? valids_15 : _GEN_1919; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_2 = 5'h2 < count & _GEN_1920; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  _GEN_1922 = 4'h1 == tailIndices_3 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1923 = 4'h2 == tailIndices_3 ? valids_2 : _GEN_1922; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1924 = 4'h3 == tailIndices_3 ? valids_3 : _GEN_1923; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1925 = 4'h4 == tailIndices_3 ? valids_4 : _GEN_1924; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1926 = 4'h5 == tailIndices_3 ? valids_5 : _GEN_1925; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1927 = 4'h6 == tailIndices_3 ? valids_6 : _GEN_1926; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1928 = 4'h7 == tailIndices_3 ? valids_7 : _GEN_1927; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1929 = 4'h8 == tailIndices_3 ? valids_8 : _GEN_1928; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1930 = 4'h9 == tailIndices_3 ? valids_9 : _GEN_1929; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1931 = 4'ha == tailIndices_3 ? valids_10 : _GEN_1930; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1932 = 4'hb == tailIndices_3 ? valids_11 : _GEN_1931; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1933 = 4'hc == tailIndices_3 ? valids_12 : _GEN_1932; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1934 = 4'hd == tailIndices_3 ? valids_13 : _GEN_1933; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1935 = 4'he == tailIndices_3 ? valids_14 : _GEN_1934; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1936 = 4'hf == tailIndices_3 ? valids_15 : _GEN_1935; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_3 = 5'h3 < count & _GEN_1936; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  _GEN_1938 = 4'h1 == tailIndices_4 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1939 = 4'h2 == tailIndices_4 ? valids_2 : _GEN_1938; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1940 = 4'h3 == tailIndices_4 ? valids_3 : _GEN_1939; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1941 = 4'h4 == tailIndices_4 ? valids_4 : _GEN_1940; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1942 = 4'h5 == tailIndices_4 ? valids_5 : _GEN_1941; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1943 = 4'h6 == tailIndices_4 ? valids_6 : _GEN_1942; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1944 = 4'h7 == tailIndices_4 ? valids_7 : _GEN_1943; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1945 = 4'h8 == tailIndices_4 ? valids_8 : _GEN_1944; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1946 = 4'h9 == tailIndices_4 ? valids_9 : _GEN_1945; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1947 = 4'ha == tailIndices_4 ? valids_10 : _GEN_1946; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1948 = 4'hb == tailIndices_4 ? valids_11 : _GEN_1947; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1949 = 4'hc == tailIndices_4 ? valids_12 : _GEN_1948; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1950 = 4'hd == tailIndices_4 ? valids_13 : _GEN_1949; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1951 = 4'he == tailIndices_4 ? valids_14 : _GEN_1950; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1952 = 4'hf == tailIndices_4 ? valids_15 : _GEN_1951; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_4 = 5'h4 < count & _GEN_1952; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  _GEN_1954 = 4'h1 == tailIndices_5 ? valids_1 : valids_0; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1955 = 4'h2 == tailIndices_5 ? valids_2 : _GEN_1954; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1956 = 4'h3 == tailIndices_5 ? valids_3 : _GEN_1955; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1957 = 4'h4 == tailIndices_5 ? valids_4 : _GEN_1956; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1958 = 4'h5 == tailIndices_5 ? valids_5 : _GEN_1957; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1959 = 4'h6 == tailIndices_5 ? valids_6 : _GEN_1958; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1960 = 4'h7 == tailIndices_5 ? valids_7 : _GEN_1959; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1961 = 4'h8 == tailIndices_5 ? valids_8 : _GEN_1960; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1962 = 4'h9 == tailIndices_5 ? valids_9 : _GEN_1961; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1963 = 4'ha == tailIndices_5 ? valids_10 : _GEN_1962; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1964 = 4'hb == tailIndices_5 ? valids_11 : _GEN_1963; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1965 = 4'hc == tailIndices_5 ? valids_12 : _GEN_1964; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1966 = 4'hd == tailIndices_5 ? valids_13 : _GEN_1965; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1967 = 4'he == tailIndices_5 ? valids_14 : _GEN_1966; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  _GEN_1968 = 4'hf == tailIndices_5 ? valids_15 : _GEN_1967; // @[src/main/scala/frontend/IBF.scala 66:{38,38}]
  wire  hasValidInst_5 = 5'h5 < count & _GEN_1968; // @[src/main/scala/frontend/IBF.scala 66:38]
  wire  baseAllocCond_0 = hasValidInst_0 & io_out_0_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  baseAllocCond_1 = hasValidInst_1 & io_out_1_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  baseAllocCond_2 = hasValidInst_2 & io_out_2_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  baseAllocCond_3 = hasValidInst_3 & io_out_3_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  baseAllocCond_4 = hasValidInst_4 & io_out_4_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  baseAllocCond_5 = hasValidInst_5 & io_out_5_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  wire  previousCannotAlloc = ~baseAllocCond_0; // @[src/main/scala/frontend/IBF.scala 83:52]
  wire  previousCannotAlloc_1 = previousCannotAlloc & ~baseAllocCond_1; // @[src/main/scala/frontend/IBF.scala 83:80]
  wire  previousCannotAlloc_2 = previousCannotAlloc_1 & ~baseAllocCond_2; // @[src/main/scala/frontend/IBF.scala 83:80]
  wire  previousCannotAlloc_3 = previousCannotAlloc_2 & ~baseAllocCond_3; // @[src/main/scala/frontend/IBF.scala 83:80]
  wire  previousCannotAlloc_4 = previousCannotAlloc_3 & ~baseAllocCond_4; // @[src/main/scala/frontend/IBF.scala 83:80]
  wire [31:0] _GEN_1970 = 4'h1 == tailIndices_0 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1971 = 4'h2 == tailIndices_0 ? entries_2_instr : _GEN_1970; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1972 = 4'h3 == tailIndices_0 ? entries_3_instr : _GEN_1971; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1973 = 4'h4 == tailIndices_0 ? entries_4_instr : _GEN_1972; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1974 = 4'h5 == tailIndices_0 ? entries_5_instr : _GEN_1973; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1975 = 4'h6 == tailIndices_0 ? entries_6_instr : _GEN_1974; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1976 = 4'h7 == tailIndices_0 ? entries_7_instr : _GEN_1975; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1977 = 4'h8 == tailIndices_0 ? entries_8_instr : _GEN_1976; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1978 = 4'h9 == tailIndices_0 ? entries_9_instr : _GEN_1977; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1979 = 4'ha == tailIndices_0 ? entries_10_instr : _GEN_1978; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1980 = 4'hb == tailIndices_0 ? entries_11_instr : _GEN_1979; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1981 = 4'hc == tailIndices_0 ? entries_12_instr : _GEN_1980; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1982 = 4'hd == tailIndices_0 ? entries_13_instr : _GEN_1981; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1983 = 4'he == tailIndices_0 ? entries_14_instr : _GEN_1982; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_1986 = 4'h1 == tailIndices_0 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1987 = 4'h2 == tailIndices_0 ? entries_2_pc : _GEN_1986; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1988 = 4'h3 == tailIndices_0 ? entries_3_pc : _GEN_1987; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1989 = 4'h4 == tailIndices_0 ? entries_4_pc : _GEN_1988; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1990 = 4'h5 == tailIndices_0 ? entries_5_pc : _GEN_1989; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1991 = 4'h6 == tailIndices_0 ? entries_6_pc : _GEN_1990; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1992 = 4'h7 == tailIndices_0 ? entries_7_pc : _GEN_1991; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1993 = 4'h8 == tailIndices_0 ? entries_8_pc : _GEN_1992; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1994 = 4'h9 == tailIndices_0 ? entries_9_pc : _GEN_1993; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1995 = 4'ha == tailIndices_0 ? entries_10_pc : _GEN_1994; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1996 = 4'hb == tailIndices_0 ? entries_11_pc : _GEN_1995; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1997 = 4'hc == tailIndices_0 ? entries_12_pc : _GEN_1996; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1998 = 4'hd == tailIndices_0 ? entries_13_pc : _GEN_1997; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_1999 = 4'he == tailIndices_0 ? entries_14_pc : _GEN_1998; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_2002 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2003 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_valid : _GEN_2002; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2004 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_valid : _GEN_2003; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2005 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_valid : _GEN_2004; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2006 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_valid : _GEN_2005; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2007 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_valid : _GEN_2006; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2008 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_valid : _GEN_2007; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2009 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_valid : _GEN_2008; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2010 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_valid : _GEN_2009; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2011 = 4'ha == tailIndices_0 ? entries_10_pdInfo_valid : _GEN_2010; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2012 = 4'hb == tailIndices_0 ? entries_11_pdInfo_valid : _GEN_2011; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2013 = 4'hc == tailIndices_0 ? entries_12_pdInfo_valid : _GEN_2012; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2014 = 4'hd == tailIndices_0 ? entries_13_pdInfo_valid : _GEN_2013; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2015 = 4'he == tailIndices_0 ? entries_14_pdInfo_valid : _GEN_2014; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2018 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2019 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_isBr : _GEN_2018; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2020 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_isBr : _GEN_2019; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2021 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_isBr : _GEN_2020; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2022 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_isBr : _GEN_2021; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2023 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_isBr : _GEN_2022; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2024 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_isBr : _GEN_2023; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2025 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_isBr : _GEN_2024; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2026 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_isBr : _GEN_2025; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2027 = 4'ha == tailIndices_0 ? entries_10_pdInfo_isBr : _GEN_2026; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2028 = 4'hb == tailIndices_0 ? entries_11_pdInfo_isBr : _GEN_2027; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2029 = 4'hc == tailIndices_0 ? entries_12_pdInfo_isBr : _GEN_2028; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2030 = 4'hd == tailIndices_0 ? entries_13_pdInfo_isBr : _GEN_2029; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2031 = 4'he == tailIndices_0 ? entries_14_pdInfo_isBr : _GEN_2030; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2034 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2035 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_isJal : _GEN_2034; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2036 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_isJal : _GEN_2035; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2037 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_isJal : _GEN_2036; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2038 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_isJal : _GEN_2037; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2039 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_isJal : _GEN_2038; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2040 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_isJal : _GEN_2039; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2041 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_isJal : _GEN_2040; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2042 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_isJal : _GEN_2041; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2043 = 4'ha == tailIndices_0 ? entries_10_pdInfo_isJal : _GEN_2042; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2044 = 4'hb == tailIndices_0 ? entries_11_pdInfo_isJal : _GEN_2043; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2045 = 4'hc == tailIndices_0 ? entries_12_pdInfo_isJal : _GEN_2044; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2046 = 4'hd == tailIndices_0 ? entries_13_pdInfo_isJal : _GEN_2045; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2047 = 4'he == tailIndices_0 ? entries_14_pdInfo_isJal : _GEN_2046; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2050 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2051 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_isJalr : _GEN_2050; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2052 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_isJalr : _GEN_2051; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2053 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_isJalr : _GEN_2052; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2054 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_isJalr : _GEN_2053; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2055 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_isJalr : _GEN_2054; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2056 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_isJalr : _GEN_2055; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2057 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_isJalr : _GEN_2056; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2058 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_isJalr : _GEN_2057; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2059 = 4'ha == tailIndices_0 ? entries_10_pdInfo_isJalr : _GEN_2058; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2060 = 4'hb == tailIndices_0 ? entries_11_pdInfo_isJalr : _GEN_2059; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2061 = 4'hc == tailIndices_0 ? entries_12_pdInfo_isJalr : _GEN_2060; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2062 = 4'hd == tailIndices_0 ? entries_13_pdInfo_isJalr : _GEN_2061; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2063 = 4'he == tailIndices_0 ? entries_14_pdInfo_isJalr : _GEN_2062; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2066 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2067 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_isCall : _GEN_2066; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2068 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_isCall : _GEN_2067; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2069 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_isCall : _GEN_2068; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2070 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_isCall : _GEN_2069; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2071 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_isCall : _GEN_2070; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2072 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_isCall : _GEN_2071; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2073 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_isCall : _GEN_2072; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2074 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_isCall : _GEN_2073; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2075 = 4'ha == tailIndices_0 ? entries_10_pdInfo_isCall : _GEN_2074; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2076 = 4'hb == tailIndices_0 ? entries_11_pdInfo_isCall : _GEN_2075; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2077 = 4'hc == tailIndices_0 ? entries_12_pdInfo_isCall : _GEN_2076; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2078 = 4'hd == tailIndices_0 ? entries_13_pdInfo_isCall : _GEN_2077; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2079 = 4'he == tailIndices_0 ? entries_14_pdInfo_isCall : _GEN_2078; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2082 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2083 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_isRet : _GEN_2082; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2084 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_isRet : _GEN_2083; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2085 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_isRet : _GEN_2084; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2086 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_isRet : _GEN_2085; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2087 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_isRet : _GEN_2086; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2088 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_isRet : _GEN_2087; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2089 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_isRet : _GEN_2088; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2090 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_isRet : _GEN_2089; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2091 = 4'ha == tailIndices_0 ? entries_10_pdInfo_isRet : _GEN_2090; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2092 = 4'hb == tailIndices_0 ? entries_11_pdInfo_isRet : _GEN_2091; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2093 = 4'hc == tailIndices_0 ? entries_12_pdInfo_isRet : _GEN_2092; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2094 = 4'hd == tailIndices_0 ? entries_13_pdInfo_isRet : _GEN_2093; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2095 = 4'he == tailIndices_0 ? entries_14_pdInfo_isRet : _GEN_2094; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2098 = 4'h1 == tailIndices_0 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2099 = 4'h2 == tailIndices_0 ? entries_2_pdInfo_jumpTarget : _GEN_2098; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2100 = 4'h3 == tailIndices_0 ? entries_3_pdInfo_jumpTarget : _GEN_2099; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2101 = 4'h4 == tailIndices_0 ? entries_4_pdInfo_jumpTarget : _GEN_2100; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2102 = 4'h5 == tailIndices_0 ? entries_5_pdInfo_jumpTarget : _GEN_2101; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2103 = 4'h6 == tailIndices_0 ? entries_6_pdInfo_jumpTarget : _GEN_2102; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2104 = 4'h7 == tailIndices_0 ? entries_7_pdInfo_jumpTarget : _GEN_2103; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2105 = 4'h8 == tailIndices_0 ? entries_8_pdInfo_jumpTarget : _GEN_2104; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2106 = 4'h9 == tailIndices_0 ? entries_9_pdInfo_jumpTarget : _GEN_2105; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2107 = 4'ha == tailIndices_0 ? entries_10_pdInfo_jumpTarget : _GEN_2106; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2108 = 4'hb == tailIndices_0 ? entries_11_pdInfo_jumpTarget : _GEN_2107; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2109 = 4'hc == tailIndices_0 ? entries_12_pdInfo_jumpTarget : _GEN_2108; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2110 = 4'hd == tailIndices_0 ? entries_13_pdInfo_jumpTarget : _GEN_2109; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2111 = 4'he == tailIndices_0 ? entries_14_pdInfo_jumpTarget : _GEN_2110; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2175 = 4'h1 == tailIndices_1 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2176 = 4'h2 == tailIndices_1 ? entries_2_instr : _GEN_2175; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2177 = 4'h3 == tailIndices_1 ? entries_3_instr : _GEN_2176; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2178 = 4'h4 == tailIndices_1 ? entries_4_instr : _GEN_2177; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2179 = 4'h5 == tailIndices_1 ? entries_5_instr : _GEN_2178; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2180 = 4'h6 == tailIndices_1 ? entries_6_instr : _GEN_2179; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2181 = 4'h7 == tailIndices_1 ? entries_7_instr : _GEN_2180; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2182 = 4'h8 == tailIndices_1 ? entries_8_instr : _GEN_2181; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2183 = 4'h9 == tailIndices_1 ? entries_9_instr : _GEN_2182; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2184 = 4'ha == tailIndices_1 ? entries_10_instr : _GEN_2183; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2185 = 4'hb == tailIndices_1 ? entries_11_instr : _GEN_2184; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2186 = 4'hc == tailIndices_1 ? entries_12_instr : _GEN_2185; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2187 = 4'hd == tailIndices_1 ? entries_13_instr : _GEN_2186; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2188 = 4'he == tailIndices_1 ? entries_14_instr : _GEN_2187; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2191 = 4'h1 == tailIndices_1 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2192 = 4'h2 == tailIndices_1 ? entries_2_pc : _GEN_2191; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2193 = 4'h3 == tailIndices_1 ? entries_3_pc : _GEN_2192; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2194 = 4'h4 == tailIndices_1 ? entries_4_pc : _GEN_2193; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2195 = 4'h5 == tailIndices_1 ? entries_5_pc : _GEN_2194; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2196 = 4'h6 == tailIndices_1 ? entries_6_pc : _GEN_2195; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2197 = 4'h7 == tailIndices_1 ? entries_7_pc : _GEN_2196; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2198 = 4'h8 == tailIndices_1 ? entries_8_pc : _GEN_2197; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2199 = 4'h9 == tailIndices_1 ? entries_9_pc : _GEN_2198; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2200 = 4'ha == tailIndices_1 ? entries_10_pc : _GEN_2199; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2201 = 4'hb == tailIndices_1 ? entries_11_pc : _GEN_2200; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2202 = 4'hc == tailIndices_1 ? entries_12_pc : _GEN_2201; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2203 = 4'hd == tailIndices_1 ? entries_13_pc : _GEN_2202; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2204 = 4'he == tailIndices_1 ? entries_14_pc : _GEN_2203; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_2207 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2208 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_valid : _GEN_2207; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2209 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_valid : _GEN_2208; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2210 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_valid : _GEN_2209; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2211 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_valid : _GEN_2210; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2212 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_valid : _GEN_2211; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2213 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_valid : _GEN_2212; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2214 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_valid : _GEN_2213; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2215 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_valid : _GEN_2214; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2216 = 4'ha == tailIndices_1 ? entries_10_pdInfo_valid : _GEN_2215; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2217 = 4'hb == tailIndices_1 ? entries_11_pdInfo_valid : _GEN_2216; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2218 = 4'hc == tailIndices_1 ? entries_12_pdInfo_valid : _GEN_2217; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2219 = 4'hd == tailIndices_1 ? entries_13_pdInfo_valid : _GEN_2218; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2220 = 4'he == tailIndices_1 ? entries_14_pdInfo_valid : _GEN_2219; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2223 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2224 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_isBr : _GEN_2223; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2225 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_isBr : _GEN_2224; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2226 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_isBr : _GEN_2225; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2227 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_isBr : _GEN_2226; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2228 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_isBr : _GEN_2227; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2229 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_isBr : _GEN_2228; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2230 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_isBr : _GEN_2229; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2231 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_isBr : _GEN_2230; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2232 = 4'ha == tailIndices_1 ? entries_10_pdInfo_isBr : _GEN_2231; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2233 = 4'hb == tailIndices_1 ? entries_11_pdInfo_isBr : _GEN_2232; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2234 = 4'hc == tailIndices_1 ? entries_12_pdInfo_isBr : _GEN_2233; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2235 = 4'hd == tailIndices_1 ? entries_13_pdInfo_isBr : _GEN_2234; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2236 = 4'he == tailIndices_1 ? entries_14_pdInfo_isBr : _GEN_2235; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2239 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2240 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_isJal : _GEN_2239; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2241 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_isJal : _GEN_2240; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2242 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_isJal : _GEN_2241; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2243 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_isJal : _GEN_2242; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2244 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_isJal : _GEN_2243; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2245 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_isJal : _GEN_2244; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2246 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_isJal : _GEN_2245; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2247 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_isJal : _GEN_2246; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2248 = 4'ha == tailIndices_1 ? entries_10_pdInfo_isJal : _GEN_2247; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2249 = 4'hb == tailIndices_1 ? entries_11_pdInfo_isJal : _GEN_2248; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2250 = 4'hc == tailIndices_1 ? entries_12_pdInfo_isJal : _GEN_2249; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2251 = 4'hd == tailIndices_1 ? entries_13_pdInfo_isJal : _GEN_2250; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2252 = 4'he == tailIndices_1 ? entries_14_pdInfo_isJal : _GEN_2251; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2255 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2256 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_isJalr : _GEN_2255; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2257 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_isJalr : _GEN_2256; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2258 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_isJalr : _GEN_2257; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2259 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_isJalr : _GEN_2258; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2260 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_isJalr : _GEN_2259; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2261 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_isJalr : _GEN_2260; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2262 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_isJalr : _GEN_2261; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2263 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_isJalr : _GEN_2262; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2264 = 4'ha == tailIndices_1 ? entries_10_pdInfo_isJalr : _GEN_2263; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2265 = 4'hb == tailIndices_1 ? entries_11_pdInfo_isJalr : _GEN_2264; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2266 = 4'hc == tailIndices_1 ? entries_12_pdInfo_isJalr : _GEN_2265; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2267 = 4'hd == tailIndices_1 ? entries_13_pdInfo_isJalr : _GEN_2266; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2268 = 4'he == tailIndices_1 ? entries_14_pdInfo_isJalr : _GEN_2267; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2271 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2272 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_isCall : _GEN_2271; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2273 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_isCall : _GEN_2272; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2274 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_isCall : _GEN_2273; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2275 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_isCall : _GEN_2274; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2276 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_isCall : _GEN_2275; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2277 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_isCall : _GEN_2276; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2278 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_isCall : _GEN_2277; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2279 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_isCall : _GEN_2278; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2280 = 4'ha == tailIndices_1 ? entries_10_pdInfo_isCall : _GEN_2279; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2281 = 4'hb == tailIndices_1 ? entries_11_pdInfo_isCall : _GEN_2280; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2282 = 4'hc == tailIndices_1 ? entries_12_pdInfo_isCall : _GEN_2281; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2283 = 4'hd == tailIndices_1 ? entries_13_pdInfo_isCall : _GEN_2282; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2284 = 4'he == tailIndices_1 ? entries_14_pdInfo_isCall : _GEN_2283; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2287 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2288 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_isRet : _GEN_2287; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2289 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_isRet : _GEN_2288; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2290 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_isRet : _GEN_2289; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2291 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_isRet : _GEN_2290; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2292 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_isRet : _GEN_2291; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2293 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_isRet : _GEN_2292; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2294 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_isRet : _GEN_2293; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2295 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_isRet : _GEN_2294; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2296 = 4'ha == tailIndices_1 ? entries_10_pdInfo_isRet : _GEN_2295; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2297 = 4'hb == tailIndices_1 ? entries_11_pdInfo_isRet : _GEN_2296; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2298 = 4'hc == tailIndices_1 ? entries_12_pdInfo_isRet : _GEN_2297; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2299 = 4'hd == tailIndices_1 ? entries_13_pdInfo_isRet : _GEN_2298; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2300 = 4'he == tailIndices_1 ? entries_14_pdInfo_isRet : _GEN_2299; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2303 = 4'h1 == tailIndices_1 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2304 = 4'h2 == tailIndices_1 ? entries_2_pdInfo_jumpTarget : _GEN_2303; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2305 = 4'h3 == tailIndices_1 ? entries_3_pdInfo_jumpTarget : _GEN_2304; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2306 = 4'h4 == tailIndices_1 ? entries_4_pdInfo_jumpTarget : _GEN_2305; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2307 = 4'h5 == tailIndices_1 ? entries_5_pdInfo_jumpTarget : _GEN_2306; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2308 = 4'h6 == tailIndices_1 ? entries_6_pdInfo_jumpTarget : _GEN_2307; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2309 = 4'h7 == tailIndices_1 ? entries_7_pdInfo_jumpTarget : _GEN_2308; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2310 = 4'h8 == tailIndices_1 ? entries_8_pdInfo_jumpTarget : _GEN_2309; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2311 = 4'h9 == tailIndices_1 ? entries_9_pdInfo_jumpTarget : _GEN_2310; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2312 = 4'ha == tailIndices_1 ? entries_10_pdInfo_jumpTarget : _GEN_2311; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2313 = 4'hb == tailIndices_1 ? entries_11_pdInfo_jumpTarget : _GEN_2312; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2314 = 4'hc == tailIndices_1 ? entries_12_pdInfo_jumpTarget : _GEN_2313; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2315 = 4'hd == tailIndices_1 ? entries_13_pdInfo_jumpTarget : _GEN_2314; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2316 = 4'he == tailIndices_1 ? entries_14_pdInfo_jumpTarget : _GEN_2315; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2380 = 4'h1 == tailIndices_2 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2381 = 4'h2 == tailIndices_2 ? entries_2_instr : _GEN_2380; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2382 = 4'h3 == tailIndices_2 ? entries_3_instr : _GEN_2381; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2383 = 4'h4 == tailIndices_2 ? entries_4_instr : _GEN_2382; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2384 = 4'h5 == tailIndices_2 ? entries_5_instr : _GEN_2383; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2385 = 4'h6 == tailIndices_2 ? entries_6_instr : _GEN_2384; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2386 = 4'h7 == tailIndices_2 ? entries_7_instr : _GEN_2385; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2387 = 4'h8 == tailIndices_2 ? entries_8_instr : _GEN_2386; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2388 = 4'h9 == tailIndices_2 ? entries_9_instr : _GEN_2387; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2389 = 4'ha == tailIndices_2 ? entries_10_instr : _GEN_2388; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2390 = 4'hb == tailIndices_2 ? entries_11_instr : _GEN_2389; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2391 = 4'hc == tailIndices_2 ? entries_12_instr : _GEN_2390; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2392 = 4'hd == tailIndices_2 ? entries_13_instr : _GEN_2391; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2393 = 4'he == tailIndices_2 ? entries_14_instr : _GEN_2392; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2396 = 4'h1 == tailIndices_2 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2397 = 4'h2 == tailIndices_2 ? entries_2_pc : _GEN_2396; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2398 = 4'h3 == tailIndices_2 ? entries_3_pc : _GEN_2397; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2399 = 4'h4 == tailIndices_2 ? entries_4_pc : _GEN_2398; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2400 = 4'h5 == tailIndices_2 ? entries_5_pc : _GEN_2399; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2401 = 4'h6 == tailIndices_2 ? entries_6_pc : _GEN_2400; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2402 = 4'h7 == tailIndices_2 ? entries_7_pc : _GEN_2401; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2403 = 4'h8 == tailIndices_2 ? entries_8_pc : _GEN_2402; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2404 = 4'h9 == tailIndices_2 ? entries_9_pc : _GEN_2403; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2405 = 4'ha == tailIndices_2 ? entries_10_pc : _GEN_2404; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2406 = 4'hb == tailIndices_2 ? entries_11_pc : _GEN_2405; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2407 = 4'hc == tailIndices_2 ? entries_12_pc : _GEN_2406; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2408 = 4'hd == tailIndices_2 ? entries_13_pc : _GEN_2407; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2409 = 4'he == tailIndices_2 ? entries_14_pc : _GEN_2408; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_2412 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2413 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_valid : _GEN_2412; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2414 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_valid : _GEN_2413; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2415 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_valid : _GEN_2414; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2416 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_valid : _GEN_2415; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2417 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_valid : _GEN_2416; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2418 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_valid : _GEN_2417; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2419 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_valid : _GEN_2418; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2420 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_valid : _GEN_2419; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2421 = 4'ha == tailIndices_2 ? entries_10_pdInfo_valid : _GEN_2420; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2422 = 4'hb == tailIndices_2 ? entries_11_pdInfo_valid : _GEN_2421; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2423 = 4'hc == tailIndices_2 ? entries_12_pdInfo_valid : _GEN_2422; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2424 = 4'hd == tailIndices_2 ? entries_13_pdInfo_valid : _GEN_2423; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2425 = 4'he == tailIndices_2 ? entries_14_pdInfo_valid : _GEN_2424; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2428 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2429 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_isBr : _GEN_2428; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2430 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_isBr : _GEN_2429; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2431 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_isBr : _GEN_2430; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2432 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_isBr : _GEN_2431; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2433 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_isBr : _GEN_2432; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2434 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_isBr : _GEN_2433; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2435 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_isBr : _GEN_2434; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2436 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_isBr : _GEN_2435; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2437 = 4'ha == tailIndices_2 ? entries_10_pdInfo_isBr : _GEN_2436; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2438 = 4'hb == tailIndices_2 ? entries_11_pdInfo_isBr : _GEN_2437; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2439 = 4'hc == tailIndices_2 ? entries_12_pdInfo_isBr : _GEN_2438; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2440 = 4'hd == tailIndices_2 ? entries_13_pdInfo_isBr : _GEN_2439; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2441 = 4'he == tailIndices_2 ? entries_14_pdInfo_isBr : _GEN_2440; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2444 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2445 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_isJal : _GEN_2444; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2446 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_isJal : _GEN_2445; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2447 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_isJal : _GEN_2446; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2448 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_isJal : _GEN_2447; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2449 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_isJal : _GEN_2448; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2450 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_isJal : _GEN_2449; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2451 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_isJal : _GEN_2450; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2452 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_isJal : _GEN_2451; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2453 = 4'ha == tailIndices_2 ? entries_10_pdInfo_isJal : _GEN_2452; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2454 = 4'hb == tailIndices_2 ? entries_11_pdInfo_isJal : _GEN_2453; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2455 = 4'hc == tailIndices_2 ? entries_12_pdInfo_isJal : _GEN_2454; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2456 = 4'hd == tailIndices_2 ? entries_13_pdInfo_isJal : _GEN_2455; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2457 = 4'he == tailIndices_2 ? entries_14_pdInfo_isJal : _GEN_2456; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2460 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2461 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_isJalr : _GEN_2460; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2462 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_isJalr : _GEN_2461; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2463 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_isJalr : _GEN_2462; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2464 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_isJalr : _GEN_2463; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2465 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_isJalr : _GEN_2464; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2466 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_isJalr : _GEN_2465; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2467 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_isJalr : _GEN_2466; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2468 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_isJalr : _GEN_2467; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2469 = 4'ha == tailIndices_2 ? entries_10_pdInfo_isJalr : _GEN_2468; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2470 = 4'hb == tailIndices_2 ? entries_11_pdInfo_isJalr : _GEN_2469; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2471 = 4'hc == tailIndices_2 ? entries_12_pdInfo_isJalr : _GEN_2470; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2472 = 4'hd == tailIndices_2 ? entries_13_pdInfo_isJalr : _GEN_2471; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2473 = 4'he == tailIndices_2 ? entries_14_pdInfo_isJalr : _GEN_2472; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2476 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2477 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_isCall : _GEN_2476; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2478 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_isCall : _GEN_2477; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2479 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_isCall : _GEN_2478; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2480 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_isCall : _GEN_2479; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2481 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_isCall : _GEN_2480; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2482 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_isCall : _GEN_2481; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2483 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_isCall : _GEN_2482; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2484 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_isCall : _GEN_2483; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2485 = 4'ha == tailIndices_2 ? entries_10_pdInfo_isCall : _GEN_2484; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2486 = 4'hb == tailIndices_2 ? entries_11_pdInfo_isCall : _GEN_2485; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2487 = 4'hc == tailIndices_2 ? entries_12_pdInfo_isCall : _GEN_2486; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2488 = 4'hd == tailIndices_2 ? entries_13_pdInfo_isCall : _GEN_2487; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2489 = 4'he == tailIndices_2 ? entries_14_pdInfo_isCall : _GEN_2488; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2492 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2493 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_isRet : _GEN_2492; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2494 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_isRet : _GEN_2493; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2495 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_isRet : _GEN_2494; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2496 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_isRet : _GEN_2495; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2497 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_isRet : _GEN_2496; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2498 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_isRet : _GEN_2497; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2499 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_isRet : _GEN_2498; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2500 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_isRet : _GEN_2499; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2501 = 4'ha == tailIndices_2 ? entries_10_pdInfo_isRet : _GEN_2500; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2502 = 4'hb == tailIndices_2 ? entries_11_pdInfo_isRet : _GEN_2501; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2503 = 4'hc == tailIndices_2 ? entries_12_pdInfo_isRet : _GEN_2502; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2504 = 4'hd == tailIndices_2 ? entries_13_pdInfo_isRet : _GEN_2503; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2505 = 4'he == tailIndices_2 ? entries_14_pdInfo_isRet : _GEN_2504; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2508 = 4'h1 == tailIndices_2 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2509 = 4'h2 == tailIndices_2 ? entries_2_pdInfo_jumpTarget : _GEN_2508; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2510 = 4'h3 == tailIndices_2 ? entries_3_pdInfo_jumpTarget : _GEN_2509; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2511 = 4'h4 == tailIndices_2 ? entries_4_pdInfo_jumpTarget : _GEN_2510; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2512 = 4'h5 == tailIndices_2 ? entries_5_pdInfo_jumpTarget : _GEN_2511; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2513 = 4'h6 == tailIndices_2 ? entries_6_pdInfo_jumpTarget : _GEN_2512; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2514 = 4'h7 == tailIndices_2 ? entries_7_pdInfo_jumpTarget : _GEN_2513; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2515 = 4'h8 == tailIndices_2 ? entries_8_pdInfo_jumpTarget : _GEN_2514; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2516 = 4'h9 == tailIndices_2 ? entries_9_pdInfo_jumpTarget : _GEN_2515; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2517 = 4'ha == tailIndices_2 ? entries_10_pdInfo_jumpTarget : _GEN_2516; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2518 = 4'hb == tailIndices_2 ? entries_11_pdInfo_jumpTarget : _GEN_2517; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2519 = 4'hc == tailIndices_2 ? entries_12_pdInfo_jumpTarget : _GEN_2518; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2520 = 4'hd == tailIndices_2 ? entries_13_pdInfo_jumpTarget : _GEN_2519; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2521 = 4'he == tailIndices_2 ? entries_14_pdInfo_jumpTarget : _GEN_2520; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2585 = 4'h1 == tailIndices_3 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2586 = 4'h2 == tailIndices_3 ? entries_2_instr : _GEN_2585; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2587 = 4'h3 == tailIndices_3 ? entries_3_instr : _GEN_2586; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2588 = 4'h4 == tailIndices_3 ? entries_4_instr : _GEN_2587; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2589 = 4'h5 == tailIndices_3 ? entries_5_instr : _GEN_2588; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2590 = 4'h6 == tailIndices_3 ? entries_6_instr : _GEN_2589; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2591 = 4'h7 == tailIndices_3 ? entries_7_instr : _GEN_2590; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2592 = 4'h8 == tailIndices_3 ? entries_8_instr : _GEN_2591; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2593 = 4'h9 == tailIndices_3 ? entries_9_instr : _GEN_2592; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2594 = 4'ha == tailIndices_3 ? entries_10_instr : _GEN_2593; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2595 = 4'hb == tailIndices_3 ? entries_11_instr : _GEN_2594; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2596 = 4'hc == tailIndices_3 ? entries_12_instr : _GEN_2595; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2597 = 4'hd == tailIndices_3 ? entries_13_instr : _GEN_2596; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2598 = 4'he == tailIndices_3 ? entries_14_instr : _GEN_2597; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2601 = 4'h1 == tailIndices_3 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2602 = 4'h2 == tailIndices_3 ? entries_2_pc : _GEN_2601; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2603 = 4'h3 == tailIndices_3 ? entries_3_pc : _GEN_2602; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2604 = 4'h4 == tailIndices_3 ? entries_4_pc : _GEN_2603; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2605 = 4'h5 == tailIndices_3 ? entries_5_pc : _GEN_2604; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2606 = 4'h6 == tailIndices_3 ? entries_6_pc : _GEN_2605; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2607 = 4'h7 == tailIndices_3 ? entries_7_pc : _GEN_2606; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2608 = 4'h8 == tailIndices_3 ? entries_8_pc : _GEN_2607; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2609 = 4'h9 == tailIndices_3 ? entries_9_pc : _GEN_2608; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2610 = 4'ha == tailIndices_3 ? entries_10_pc : _GEN_2609; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2611 = 4'hb == tailIndices_3 ? entries_11_pc : _GEN_2610; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2612 = 4'hc == tailIndices_3 ? entries_12_pc : _GEN_2611; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2613 = 4'hd == tailIndices_3 ? entries_13_pc : _GEN_2612; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2614 = 4'he == tailIndices_3 ? entries_14_pc : _GEN_2613; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_2617 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2618 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_valid : _GEN_2617; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2619 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_valid : _GEN_2618; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2620 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_valid : _GEN_2619; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2621 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_valid : _GEN_2620; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2622 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_valid : _GEN_2621; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2623 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_valid : _GEN_2622; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2624 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_valid : _GEN_2623; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2625 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_valid : _GEN_2624; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2626 = 4'ha == tailIndices_3 ? entries_10_pdInfo_valid : _GEN_2625; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2627 = 4'hb == tailIndices_3 ? entries_11_pdInfo_valid : _GEN_2626; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2628 = 4'hc == tailIndices_3 ? entries_12_pdInfo_valid : _GEN_2627; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2629 = 4'hd == tailIndices_3 ? entries_13_pdInfo_valid : _GEN_2628; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2630 = 4'he == tailIndices_3 ? entries_14_pdInfo_valid : _GEN_2629; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2633 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2634 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_isBr : _GEN_2633; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2635 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_isBr : _GEN_2634; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2636 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_isBr : _GEN_2635; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2637 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_isBr : _GEN_2636; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2638 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_isBr : _GEN_2637; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2639 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_isBr : _GEN_2638; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2640 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_isBr : _GEN_2639; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2641 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_isBr : _GEN_2640; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2642 = 4'ha == tailIndices_3 ? entries_10_pdInfo_isBr : _GEN_2641; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2643 = 4'hb == tailIndices_3 ? entries_11_pdInfo_isBr : _GEN_2642; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2644 = 4'hc == tailIndices_3 ? entries_12_pdInfo_isBr : _GEN_2643; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2645 = 4'hd == tailIndices_3 ? entries_13_pdInfo_isBr : _GEN_2644; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2646 = 4'he == tailIndices_3 ? entries_14_pdInfo_isBr : _GEN_2645; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2649 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2650 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_isJal : _GEN_2649; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2651 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_isJal : _GEN_2650; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2652 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_isJal : _GEN_2651; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2653 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_isJal : _GEN_2652; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2654 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_isJal : _GEN_2653; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2655 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_isJal : _GEN_2654; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2656 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_isJal : _GEN_2655; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2657 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_isJal : _GEN_2656; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2658 = 4'ha == tailIndices_3 ? entries_10_pdInfo_isJal : _GEN_2657; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2659 = 4'hb == tailIndices_3 ? entries_11_pdInfo_isJal : _GEN_2658; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2660 = 4'hc == tailIndices_3 ? entries_12_pdInfo_isJal : _GEN_2659; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2661 = 4'hd == tailIndices_3 ? entries_13_pdInfo_isJal : _GEN_2660; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2662 = 4'he == tailIndices_3 ? entries_14_pdInfo_isJal : _GEN_2661; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2665 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2666 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_isJalr : _GEN_2665; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2667 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_isJalr : _GEN_2666; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2668 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_isJalr : _GEN_2667; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2669 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_isJalr : _GEN_2668; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2670 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_isJalr : _GEN_2669; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2671 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_isJalr : _GEN_2670; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2672 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_isJalr : _GEN_2671; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2673 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_isJalr : _GEN_2672; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2674 = 4'ha == tailIndices_3 ? entries_10_pdInfo_isJalr : _GEN_2673; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2675 = 4'hb == tailIndices_3 ? entries_11_pdInfo_isJalr : _GEN_2674; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2676 = 4'hc == tailIndices_3 ? entries_12_pdInfo_isJalr : _GEN_2675; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2677 = 4'hd == tailIndices_3 ? entries_13_pdInfo_isJalr : _GEN_2676; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2678 = 4'he == tailIndices_3 ? entries_14_pdInfo_isJalr : _GEN_2677; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2681 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2682 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_isCall : _GEN_2681; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2683 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_isCall : _GEN_2682; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2684 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_isCall : _GEN_2683; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2685 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_isCall : _GEN_2684; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2686 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_isCall : _GEN_2685; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2687 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_isCall : _GEN_2686; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2688 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_isCall : _GEN_2687; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2689 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_isCall : _GEN_2688; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2690 = 4'ha == tailIndices_3 ? entries_10_pdInfo_isCall : _GEN_2689; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2691 = 4'hb == tailIndices_3 ? entries_11_pdInfo_isCall : _GEN_2690; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2692 = 4'hc == tailIndices_3 ? entries_12_pdInfo_isCall : _GEN_2691; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2693 = 4'hd == tailIndices_3 ? entries_13_pdInfo_isCall : _GEN_2692; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2694 = 4'he == tailIndices_3 ? entries_14_pdInfo_isCall : _GEN_2693; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2697 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2698 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_isRet : _GEN_2697; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2699 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_isRet : _GEN_2698; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2700 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_isRet : _GEN_2699; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2701 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_isRet : _GEN_2700; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2702 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_isRet : _GEN_2701; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2703 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_isRet : _GEN_2702; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2704 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_isRet : _GEN_2703; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2705 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_isRet : _GEN_2704; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2706 = 4'ha == tailIndices_3 ? entries_10_pdInfo_isRet : _GEN_2705; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2707 = 4'hb == tailIndices_3 ? entries_11_pdInfo_isRet : _GEN_2706; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2708 = 4'hc == tailIndices_3 ? entries_12_pdInfo_isRet : _GEN_2707; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2709 = 4'hd == tailIndices_3 ? entries_13_pdInfo_isRet : _GEN_2708; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2710 = 4'he == tailIndices_3 ? entries_14_pdInfo_isRet : _GEN_2709; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2713 = 4'h1 == tailIndices_3 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2714 = 4'h2 == tailIndices_3 ? entries_2_pdInfo_jumpTarget : _GEN_2713; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2715 = 4'h3 == tailIndices_3 ? entries_3_pdInfo_jumpTarget : _GEN_2714; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2716 = 4'h4 == tailIndices_3 ? entries_4_pdInfo_jumpTarget : _GEN_2715; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2717 = 4'h5 == tailIndices_3 ? entries_5_pdInfo_jumpTarget : _GEN_2716; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2718 = 4'h6 == tailIndices_3 ? entries_6_pdInfo_jumpTarget : _GEN_2717; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2719 = 4'h7 == tailIndices_3 ? entries_7_pdInfo_jumpTarget : _GEN_2718; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2720 = 4'h8 == tailIndices_3 ? entries_8_pdInfo_jumpTarget : _GEN_2719; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2721 = 4'h9 == tailIndices_3 ? entries_9_pdInfo_jumpTarget : _GEN_2720; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2722 = 4'ha == tailIndices_3 ? entries_10_pdInfo_jumpTarget : _GEN_2721; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2723 = 4'hb == tailIndices_3 ? entries_11_pdInfo_jumpTarget : _GEN_2722; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2724 = 4'hc == tailIndices_3 ? entries_12_pdInfo_jumpTarget : _GEN_2723; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2725 = 4'hd == tailIndices_3 ? entries_13_pdInfo_jumpTarget : _GEN_2724; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2726 = 4'he == tailIndices_3 ? entries_14_pdInfo_jumpTarget : _GEN_2725; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2790 = 4'h1 == tailIndices_4 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2791 = 4'h2 == tailIndices_4 ? entries_2_instr : _GEN_2790; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2792 = 4'h3 == tailIndices_4 ? entries_3_instr : _GEN_2791; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2793 = 4'h4 == tailIndices_4 ? entries_4_instr : _GEN_2792; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2794 = 4'h5 == tailIndices_4 ? entries_5_instr : _GEN_2793; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2795 = 4'h6 == tailIndices_4 ? entries_6_instr : _GEN_2794; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2796 = 4'h7 == tailIndices_4 ? entries_7_instr : _GEN_2795; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2797 = 4'h8 == tailIndices_4 ? entries_8_instr : _GEN_2796; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2798 = 4'h9 == tailIndices_4 ? entries_9_instr : _GEN_2797; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2799 = 4'ha == tailIndices_4 ? entries_10_instr : _GEN_2798; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2800 = 4'hb == tailIndices_4 ? entries_11_instr : _GEN_2799; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2801 = 4'hc == tailIndices_4 ? entries_12_instr : _GEN_2800; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2802 = 4'hd == tailIndices_4 ? entries_13_instr : _GEN_2801; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2803 = 4'he == tailIndices_4 ? entries_14_instr : _GEN_2802; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2806 = 4'h1 == tailIndices_4 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2807 = 4'h2 == tailIndices_4 ? entries_2_pc : _GEN_2806; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2808 = 4'h3 == tailIndices_4 ? entries_3_pc : _GEN_2807; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2809 = 4'h4 == tailIndices_4 ? entries_4_pc : _GEN_2808; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2810 = 4'h5 == tailIndices_4 ? entries_5_pc : _GEN_2809; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2811 = 4'h6 == tailIndices_4 ? entries_6_pc : _GEN_2810; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2812 = 4'h7 == tailIndices_4 ? entries_7_pc : _GEN_2811; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2813 = 4'h8 == tailIndices_4 ? entries_8_pc : _GEN_2812; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2814 = 4'h9 == tailIndices_4 ? entries_9_pc : _GEN_2813; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2815 = 4'ha == tailIndices_4 ? entries_10_pc : _GEN_2814; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2816 = 4'hb == tailIndices_4 ? entries_11_pc : _GEN_2815; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2817 = 4'hc == tailIndices_4 ? entries_12_pc : _GEN_2816; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2818 = 4'hd == tailIndices_4 ? entries_13_pc : _GEN_2817; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_2819 = 4'he == tailIndices_4 ? entries_14_pc : _GEN_2818; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_2822 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2823 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_valid : _GEN_2822; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2824 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_valid : _GEN_2823; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2825 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_valid : _GEN_2824; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2826 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_valid : _GEN_2825; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2827 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_valid : _GEN_2826; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2828 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_valid : _GEN_2827; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2829 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_valid : _GEN_2828; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2830 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_valid : _GEN_2829; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2831 = 4'ha == tailIndices_4 ? entries_10_pdInfo_valid : _GEN_2830; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2832 = 4'hb == tailIndices_4 ? entries_11_pdInfo_valid : _GEN_2831; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2833 = 4'hc == tailIndices_4 ? entries_12_pdInfo_valid : _GEN_2832; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2834 = 4'hd == tailIndices_4 ? entries_13_pdInfo_valid : _GEN_2833; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2835 = 4'he == tailIndices_4 ? entries_14_pdInfo_valid : _GEN_2834; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2838 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2839 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_isBr : _GEN_2838; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2840 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_isBr : _GEN_2839; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2841 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_isBr : _GEN_2840; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2842 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_isBr : _GEN_2841; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2843 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_isBr : _GEN_2842; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2844 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_isBr : _GEN_2843; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2845 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_isBr : _GEN_2844; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2846 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_isBr : _GEN_2845; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2847 = 4'ha == tailIndices_4 ? entries_10_pdInfo_isBr : _GEN_2846; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2848 = 4'hb == tailIndices_4 ? entries_11_pdInfo_isBr : _GEN_2847; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2849 = 4'hc == tailIndices_4 ? entries_12_pdInfo_isBr : _GEN_2848; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2850 = 4'hd == tailIndices_4 ? entries_13_pdInfo_isBr : _GEN_2849; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2851 = 4'he == tailIndices_4 ? entries_14_pdInfo_isBr : _GEN_2850; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2854 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2855 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_isJal : _GEN_2854; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2856 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_isJal : _GEN_2855; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2857 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_isJal : _GEN_2856; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2858 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_isJal : _GEN_2857; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2859 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_isJal : _GEN_2858; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2860 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_isJal : _GEN_2859; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2861 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_isJal : _GEN_2860; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2862 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_isJal : _GEN_2861; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2863 = 4'ha == tailIndices_4 ? entries_10_pdInfo_isJal : _GEN_2862; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2864 = 4'hb == tailIndices_4 ? entries_11_pdInfo_isJal : _GEN_2863; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2865 = 4'hc == tailIndices_4 ? entries_12_pdInfo_isJal : _GEN_2864; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2866 = 4'hd == tailIndices_4 ? entries_13_pdInfo_isJal : _GEN_2865; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2867 = 4'he == tailIndices_4 ? entries_14_pdInfo_isJal : _GEN_2866; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2870 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2871 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_isJalr : _GEN_2870; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2872 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_isJalr : _GEN_2871; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2873 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_isJalr : _GEN_2872; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2874 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_isJalr : _GEN_2873; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2875 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_isJalr : _GEN_2874; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2876 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_isJalr : _GEN_2875; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2877 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_isJalr : _GEN_2876; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2878 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_isJalr : _GEN_2877; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2879 = 4'ha == tailIndices_4 ? entries_10_pdInfo_isJalr : _GEN_2878; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2880 = 4'hb == tailIndices_4 ? entries_11_pdInfo_isJalr : _GEN_2879; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2881 = 4'hc == tailIndices_4 ? entries_12_pdInfo_isJalr : _GEN_2880; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2882 = 4'hd == tailIndices_4 ? entries_13_pdInfo_isJalr : _GEN_2881; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2883 = 4'he == tailIndices_4 ? entries_14_pdInfo_isJalr : _GEN_2882; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2886 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2887 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_isCall : _GEN_2886; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2888 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_isCall : _GEN_2887; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2889 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_isCall : _GEN_2888; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2890 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_isCall : _GEN_2889; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2891 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_isCall : _GEN_2890; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2892 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_isCall : _GEN_2891; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2893 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_isCall : _GEN_2892; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2894 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_isCall : _GEN_2893; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2895 = 4'ha == tailIndices_4 ? entries_10_pdInfo_isCall : _GEN_2894; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2896 = 4'hb == tailIndices_4 ? entries_11_pdInfo_isCall : _GEN_2895; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2897 = 4'hc == tailIndices_4 ? entries_12_pdInfo_isCall : _GEN_2896; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2898 = 4'hd == tailIndices_4 ? entries_13_pdInfo_isCall : _GEN_2897; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2899 = 4'he == tailIndices_4 ? entries_14_pdInfo_isCall : _GEN_2898; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2902 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2903 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_isRet : _GEN_2902; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2904 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_isRet : _GEN_2903; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2905 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_isRet : _GEN_2904; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2906 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_isRet : _GEN_2905; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2907 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_isRet : _GEN_2906; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2908 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_isRet : _GEN_2907; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2909 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_isRet : _GEN_2908; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2910 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_isRet : _GEN_2909; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2911 = 4'ha == tailIndices_4 ? entries_10_pdInfo_isRet : _GEN_2910; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2912 = 4'hb == tailIndices_4 ? entries_11_pdInfo_isRet : _GEN_2911; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2913 = 4'hc == tailIndices_4 ? entries_12_pdInfo_isRet : _GEN_2912; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2914 = 4'hd == tailIndices_4 ? entries_13_pdInfo_isRet : _GEN_2913; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_2915 = 4'he == tailIndices_4 ? entries_14_pdInfo_isRet : _GEN_2914; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2918 = 4'h1 == tailIndices_4 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2919 = 4'h2 == tailIndices_4 ? entries_2_pdInfo_jumpTarget : _GEN_2918; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2920 = 4'h3 == tailIndices_4 ? entries_3_pdInfo_jumpTarget : _GEN_2919; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2921 = 4'h4 == tailIndices_4 ? entries_4_pdInfo_jumpTarget : _GEN_2920; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2922 = 4'h5 == tailIndices_4 ? entries_5_pdInfo_jumpTarget : _GEN_2921; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2923 = 4'h6 == tailIndices_4 ? entries_6_pdInfo_jumpTarget : _GEN_2922; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2924 = 4'h7 == tailIndices_4 ? entries_7_pdInfo_jumpTarget : _GEN_2923; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2925 = 4'h8 == tailIndices_4 ? entries_8_pdInfo_jumpTarget : _GEN_2924; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2926 = 4'h9 == tailIndices_4 ? entries_9_pdInfo_jumpTarget : _GEN_2925; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2927 = 4'ha == tailIndices_4 ? entries_10_pdInfo_jumpTarget : _GEN_2926; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2928 = 4'hb == tailIndices_4 ? entries_11_pdInfo_jumpTarget : _GEN_2927; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2929 = 4'hc == tailIndices_4 ? entries_12_pdInfo_jumpTarget : _GEN_2928; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2930 = 4'hd == tailIndices_4 ? entries_13_pdInfo_jumpTarget : _GEN_2929; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2931 = 4'he == tailIndices_4 ? entries_14_pdInfo_jumpTarget : _GEN_2930; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_2995 = 4'h1 == tailIndices_5 ? entries_1_instr : entries_0_instr; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2996 = 4'h2 == tailIndices_5 ? entries_2_instr : _GEN_2995; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2997 = 4'h3 == tailIndices_5 ? entries_3_instr : _GEN_2996; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2998 = 4'h4 == tailIndices_5 ? entries_4_instr : _GEN_2997; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_2999 = 4'h5 == tailIndices_5 ? entries_5_instr : _GEN_2998; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3000 = 4'h6 == tailIndices_5 ? entries_6_instr : _GEN_2999; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3001 = 4'h7 == tailIndices_5 ? entries_7_instr : _GEN_3000; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3002 = 4'h8 == tailIndices_5 ? entries_8_instr : _GEN_3001; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3003 = 4'h9 == tailIndices_5 ? entries_9_instr : _GEN_3002; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3004 = 4'ha == tailIndices_5 ? entries_10_instr : _GEN_3003; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3005 = 4'hb == tailIndices_5 ? entries_11_instr : _GEN_3004; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3006 = 4'hc == tailIndices_5 ? entries_12_instr : _GEN_3005; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3007 = 4'hd == tailIndices_5 ? entries_13_instr : _GEN_3006; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3008 = 4'he == tailIndices_5 ? entries_14_instr : _GEN_3007; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  wire [31:0] _GEN_3011 = 4'h1 == tailIndices_5 ? entries_1_pc : entries_0_pc; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3012 = 4'h2 == tailIndices_5 ? entries_2_pc : _GEN_3011; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3013 = 4'h3 == tailIndices_5 ? entries_3_pc : _GEN_3012; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3014 = 4'h4 == tailIndices_5 ? entries_4_pc : _GEN_3013; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3015 = 4'h5 == tailIndices_5 ? entries_5_pc : _GEN_3014; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3016 = 4'h6 == tailIndices_5 ? entries_6_pc : _GEN_3015; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3017 = 4'h7 == tailIndices_5 ? entries_7_pc : _GEN_3016; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3018 = 4'h8 == tailIndices_5 ? entries_8_pc : _GEN_3017; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3019 = 4'h9 == tailIndices_5 ? entries_9_pc : _GEN_3018; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3020 = 4'ha == tailIndices_5 ? entries_10_pc : _GEN_3019; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3021 = 4'hb == tailIndices_5 ? entries_11_pc : _GEN_3020; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3022 = 4'hc == tailIndices_5 ? entries_12_pc : _GEN_3021; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3023 = 4'hd == tailIndices_5 ? entries_13_pc : _GEN_3022; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire [31:0] _GEN_3024 = 4'he == tailIndices_5 ? entries_14_pc : _GEN_3023; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  wire  _GEN_3027 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_valid : entries_0_pdInfo_valid; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3028 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_valid : _GEN_3027; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3029 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_valid : _GEN_3028; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3030 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_valid : _GEN_3029; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3031 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_valid : _GEN_3030; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3032 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_valid : _GEN_3031; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3033 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_valid : _GEN_3032; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3034 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_valid : _GEN_3033; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3035 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_valid : _GEN_3034; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3036 = 4'ha == tailIndices_5 ? entries_10_pdInfo_valid : _GEN_3035; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3037 = 4'hb == tailIndices_5 ? entries_11_pdInfo_valid : _GEN_3036; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3038 = 4'hc == tailIndices_5 ? entries_12_pdInfo_valid : _GEN_3037; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3039 = 4'hd == tailIndices_5 ? entries_13_pdInfo_valid : _GEN_3038; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3040 = 4'he == tailIndices_5 ? entries_14_pdInfo_valid : _GEN_3039; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3043 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_isBr : entries_0_pdInfo_isBr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3044 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_isBr : _GEN_3043; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3045 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_isBr : _GEN_3044; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3046 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_isBr : _GEN_3045; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3047 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_isBr : _GEN_3046; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3048 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_isBr : _GEN_3047; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3049 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_isBr : _GEN_3048; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3050 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_isBr : _GEN_3049; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3051 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_isBr : _GEN_3050; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3052 = 4'ha == tailIndices_5 ? entries_10_pdInfo_isBr : _GEN_3051; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3053 = 4'hb == tailIndices_5 ? entries_11_pdInfo_isBr : _GEN_3052; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3054 = 4'hc == tailIndices_5 ? entries_12_pdInfo_isBr : _GEN_3053; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3055 = 4'hd == tailIndices_5 ? entries_13_pdInfo_isBr : _GEN_3054; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3056 = 4'he == tailIndices_5 ? entries_14_pdInfo_isBr : _GEN_3055; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3059 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_isJal : entries_0_pdInfo_isJal; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3060 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_isJal : _GEN_3059; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3061 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_isJal : _GEN_3060; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3062 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_isJal : _GEN_3061; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3063 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_isJal : _GEN_3062; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3064 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_isJal : _GEN_3063; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3065 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_isJal : _GEN_3064; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3066 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_isJal : _GEN_3065; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3067 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_isJal : _GEN_3066; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3068 = 4'ha == tailIndices_5 ? entries_10_pdInfo_isJal : _GEN_3067; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3069 = 4'hb == tailIndices_5 ? entries_11_pdInfo_isJal : _GEN_3068; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3070 = 4'hc == tailIndices_5 ? entries_12_pdInfo_isJal : _GEN_3069; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3071 = 4'hd == tailIndices_5 ? entries_13_pdInfo_isJal : _GEN_3070; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3072 = 4'he == tailIndices_5 ? entries_14_pdInfo_isJal : _GEN_3071; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3075 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_isJalr : entries_0_pdInfo_isJalr; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3076 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_isJalr : _GEN_3075; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3077 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_isJalr : _GEN_3076; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3078 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_isJalr : _GEN_3077; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3079 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_isJalr : _GEN_3078; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3080 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_isJalr : _GEN_3079; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3081 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_isJalr : _GEN_3080; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3082 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_isJalr : _GEN_3081; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3083 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_isJalr : _GEN_3082; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3084 = 4'ha == tailIndices_5 ? entries_10_pdInfo_isJalr : _GEN_3083; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3085 = 4'hb == tailIndices_5 ? entries_11_pdInfo_isJalr : _GEN_3084; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3086 = 4'hc == tailIndices_5 ? entries_12_pdInfo_isJalr : _GEN_3085; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3087 = 4'hd == tailIndices_5 ? entries_13_pdInfo_isJalr : _GEN_3086; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3088 = 4'he == tailIndices_5 ? entries_14_pdInfo_isJalr : _GEN_3087; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3091 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_isCall : entries_0_pdInfo_isCall; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3092 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_isCall : _GEN_3091; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3093 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_isCall : _GEN_3092; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3094 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_isCall : _GEN_3093; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3095 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_isCall : _GEN_3094; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3096 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_isCall : _GEN_3095; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3097 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_isCall : _GEN_3096; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3098 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_isCall : _GEN_3097; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3099 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_isCall : _GEN_3098; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3100 = 4'ha == tailIndices_5 ? entries_10_pdInfo_isCall : _GEN_3099; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3101 = 4'hb == tailIndices_5 ? entries_11_pdInfo_isCall : _GEN_3100; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3102 = 4'hc == tailIndices_5 ? entries_12_pdInfo_isCall : _GEN_3101; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3103 = 4'hd == tailIndices_5 ? entries_13_pdInfo_isCall : _GEN_3102; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3104 = 4'he == tailIndices_5 ? entries_14_pdInfo_isCall : _GEN_3103; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3107 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_isRet : entries_0_pdInfo_isRet; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3108 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_isRet : _GEN_3107; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3109 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_isRet : _GEN_3108; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3110 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_isRet : _GEN_3109; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3111 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_isRet : _GEN_3110; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3112 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_isRet : _GEN_3111; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3113 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_isRet : _GEN_3112; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3114 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_isRet : _GEN_3113; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3115 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_isRet : _GEN_3114; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3116 = 4'ha == tailIndices_5 ? entries_10_pdInfo_isRet : _GEN_3115; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3117 = 4'hb == tailIndices_5 ? entries_11_pdInfo_isRet : _GEN_3116; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3118 = 4'hc == tailIndices_5 ? entries_12_pdInfo_isRet : _GEN_3117; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3119 = 4'hd == tailIndices_5 ? entries_13_pdInfo_isRet : _GEN_3118; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _GEN_3120 = 4'he == tailIndices_5 ? entries_14_pdInfo_isRet : _GEN_3119; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3123 = 4'h1 == tailIndices_5 ? entries_1_pdInfo_jumpTarget : entries_0_pdInfo_jumpTarget; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3124 = 4'h2 == tailIndices_5 ? entries_2_pdInfo_jumpTarget : _GEN_3123; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3125 = 4'h3 == tailIndices_5 ? entries_3_pdInfo_jumpTarget : _GEN_3124; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3126 = 4'h4 == tailIndices_5 ? entries_4_pdInfo_jumpTarget : _GEN_3125; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3127 = 4'h5 == tailIndices_5 ? entries_5_pdInfo_jumpTarget : _GEN_3126; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3128 = 4'h6 == tailIndices_5 ? entries_6_pdInfo_jumpTarget : _GEN_3127; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3129 = 4'h7 == tailIndices_5 ? entries_7_pdInfo_jumpTarget : _GEN_3128; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3130 = 4'h8 == tailIndices_5 ? entries_8_pdInfo_jumpTarget : _GEN_3129; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3131 = 4'h9 == tailIndices_5 ? entries_9_pdInfo_jumpTarget : _GEN_3130; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3132 = 4'ha == tailIndices_5 ? entries_10_pdInfo_jumpTarget : _GEN_3131; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3133 = 4'hb == tailIndices_5 ? entries_11_pdInfo_jumpTarget : _GEN_3132; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3134 = 4'hc == tailIndices_5 ? entries_12_pdInfo_jumpTarget : _GEN_3133; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3135 = 4'hd == tailIndices_5 ? entries_13_pdInfo_jumpTarget : _GEN_3134; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire [31:0] _GEN_3136 = 4'he == tailIndices_5 ? entries_14_pdInfo_jumpTarget : _GEN_3135; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  wire  _issuedCount_T = io_out_0_ready & io_out_0_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _issuedCount_T_1 = io_out_1_ready & io_out_1_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _issuedCount_T_2 = io_out_2_ready & io_out_2_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _issuedCount_T_3 = io_out_3_ready & io_out_3_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _issuedCount_T_4 = io_out_4_ready & io_out_4_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _issuedCount_T_5 = io_out_5_ready & io_out_5_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [1:0] _issuedCount_T_6 = _issuedCount_T_1 + _issuedCount_T_2; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [1:0] _GEN_3513 = {{1'd0}, _issuedCount_T}; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [2:0] _issuedCount_T_8 = _GEN_3513 + _issuedCount_T_6; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [1:0] _issuedCount_T_10 = _issuedCount_T_4 + _issuedCount_T_5; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [1:0] _GEN_3514 = {{1'd0}, _issuedCount_T_3}; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [2:0] _issuedCount_T_12 = _GEN_3514 + _issuedCount_T_10; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [2:0] issuedCount = _issuedCount_T_8[1:0] + _issuedCount_T_12[1:0]; // @[src/main/scala/frontend/IBF.scala 106:29]
  wire [3:0] _GEN_3515 = {{1'd0}, enqueueCount}; // @[src/main/scala/frontend/IBF.scala 121:23]
  wire [3:0] _nextHead_T_1 = head + _GEN_3515; // @[src/main/scala/frontend/IBF.scala 121:23]
  wire [4:0] _GEN_164 = {{1'd0}, _nextHead_T_1}; // @[src/main/scala/frontend/IBF.scala 121:39]
  wire [4:0] _GEN_165 = _GEN_164 % 5'h10; // @[src/main/scala/frontend/IBF.scala 121:39]
  wire [3:0] nextHead = _T ? _GEN_165[3:0] : head; // @[src/main/scala/frontend/IBF.scala 115:12 120:33 121:14]
  wire  _T_6 = issuedCount > 3'h0; // @[src/main/scala/frontend/IBF.scala 131:20]
  wire  _GEN_3200 = 4'h0 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3201 = 4'h1 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3202 = 4'h2 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3203 = 4'h3 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3204 = 4'h4 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3205 = 4'h5 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3206 = 4'h6 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3207 = 4'h7 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3208 = 4'h8 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3209 = 4'h9 == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3210 = 4'ha == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3211 = 4'hb == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3212 = 4'hc == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3213 = 4'hd == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3214 = 4'he == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3215 = 4'hf == tailIndices_0; // @[src/main/scala/frontend/IBF.scala 128:23 136:{29,29}]
  wire  _GEN_3216 = 3'h0 < issuedCount & _GEN_3200; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3217 = 3'h0 < issuedCount & _GEN_3201; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3218 = 3'h0 < issuedCount & _GEN_3202; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3219 = 3'h0 < issuedCount & _GEN_3203; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3220 = 3'h0 < issuedCount & _GEN_3204; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3221 = 3'h0 < issuedCount & _GEN_3205; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3222 = 3'h0 < issuedCount & _GEN_3206; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3223 = 3'h0 < issuedCount & _GEN_3207; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3224 = 3'h0 < issuedCount & _GEN_3208; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3225 = 3'h0 < issuedCount & _GEN_3209; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3226 = 3'h0 < issuedCount & _GEN_3210; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3227 = 3'h0 < issuedCount & _GEN_3211; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3228 = 3'h0 < issuedCount & _GEN_3212; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3229 = 3'h0 < issuedCount & _GEN_3213; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3230 = 3'h0 < issuedCount & _GEN_3214; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3231 = 3'h0 < issuedCount & _GEN_3215; // @[src/main/scala/frontend/IBF.scala 128:23 134:31]
  wire  _GEN_3232 = 4'h0 == tailIndices_1 | _GEN_3216; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3233 = 4'h1 == tailIndices_1 | _GEN_3217; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3234 = 4'h2 == tailIndices_1 | _GEN_3218; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3235 = 4'h3 == tailIndices_1 | _GEN_3219; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3236 = 4'h4 == tailIndices_1 | _GEN_3220; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3237 = 4'h5 == tailIndices_1 | _GEN_3221; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3238 = 4'h6 == tailIndices_1 | _GEN_3222; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3239 = 4'h7 == tailIndices_1 | _GEN_3223; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3240 = 4'h8 == tailIndices_1 | _GEN_3224; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3241 = 4'h9 == tailIndices_1 | _GEN_3225; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3242 = 4'ha == tailIndices_1 | _GEN_3226; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3243 = 4'hb == tailIndices_1 | _GEN_3227; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3244 = 4'hc == tailIndices_1 | _GEN_3228; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3245 = 4'hd == tailIndices_1 | _GEN_3229; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3246 = 4'he == tailIndices_1 | _GEN_3230; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3247 = 4'hf == tailIndices_1 | _GEN_3231; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3248 = 3'h1 < issuedCount ? _GEN_3232 : _GEN_3216; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3249 = 3'h1 < issuedCount ? _GEN_3233 : _GEN_3217; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3250 = 3'h1 < issuedCount ? _GEN_3234 : _GEN_3218; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3251 = 3'h1 < issuedCount ? _GEN_3235 : _GEN_3219; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3252 = 3'h1 < issuedCount ? _GEN_3236 : _GEN_3220; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3253 = 3'h1 < issuedCount ? _GEN_3237 : _GEN_3221; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3254 = 3'h1 < issuedCount ? _GEN_3238 : _GEN_3222; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3255 = 3'h1 < issuedCount ? _GEN_3239 : _GEN_3223; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3256 = 3'h1 < issuedCount ? _GEN_3240 : _GEN_3224; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3257 = 3'h1 < issuedCount ? _GEN_3241 : _GEN_3225; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3258 = 3'h1 < issuedCount ? _GEN_3242 : _GEN_3226; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3259 = 3'h1 < issuedCount ? _GEN_3243 : _GEN_3227; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3260 = 3'h1 < issuedCount ? _GEN_3244 : _GEN_3228; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3261 = 3'h1 < issuedCount ? _GEN_3245 : _GEN_3229; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3262 = 3'h1 < issuedCount ? _GEN_3246 : _GEN_3230; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3263 = 3'h1 < issuedCount ? _GEN_3247 : _GEN_3231; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3264 = 4'h0 == tailIndices_2 | _GEN_3248; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3265 = 4'h1 == tailIndices_2 | _GEN_3249; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3266 = 4'h2 == tailIndices_2 | _GEN_3250; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3267 = 4'h3 == tailIndices_2 | _GEN_3251; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3268 = 4'h4 == tailIndices_2 | _GEN_3252; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3269 = 4'h5 == tailIndices_2 | _GEN_3253; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3270 = 4'h6 == tailIndices_2 | _GEN_3254; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3271 = 4'h7 == tailIndices_2 | _GEN_3255; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3272 = 4'h8 == tailIndices_2 | _GEN_3256; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3273 = 4'h9 == tailIndices_2 | _GEN_3257; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3274 = 4'ha == tailIndices_2 | _GEN_3258; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3275 = 4'hb == tailIndices_2 | _GEN_3259; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3276 = 4'hc == tailIndices_2 | _GEN_3260; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3277 = 4'hd == tailIndices_2 | _GEN_3261; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3278 = 4'he == tailIndices_2 | _GEN_3262; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3279 = 4'hf == tailIndices_2 | _GEN_3263; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3280 = 3'h2 < issuedCount ? _GEN_3264 : _GEN_3248; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3281 = 3'h2 < issuedCount ? _GEN_3265 : _GEN_3249; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3282 = 3'h2 < issuedCount ? _GEN_3266 : _GEN_3250; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3283 = 3'h2 < issuedCount ? _GEN_3267 : _GEN_3251; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3284 = 3'h2 < issuedCount ? _GEN_3268 : _GEN_3252; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3285 = 3'h2 < issuedCount ? _GEN_3269 : _GEN_3253; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3286 = 3'h2 < issuedCount ? _GEN_3270 : _GEN_3254; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3287 = 3'h2 < issuedCount ? _GEN_3271 : _GEN_3255; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3288 = 3'h2 < issuedCount ? _GEN_3272 : _GEN_3256; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3289 = 3'h2 < issuedCount ? _GEN_3273 : _GEN_3257; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3290 = 3'h2 < issuedCount ? _GEN_3274 : _GEN_3258; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3291 = 3'h2 < issuedCount ? _GEN_3275 : _GEN_3259; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3292 = 3'h2 < issuedCount ? _GEN_3276 : _GEN_3260; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3293 = 3'h2 < issuedCount ? _GEN_3277 : _GEN_3261; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3294 = 3'h2 < issuedCount ? _GEN_3278 : _GEN_3262; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3295 = 3'h2 < issuedCount ? _GEN_3279 : _GEN_3263; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3296 = 4'h0 == tailIndices_3 | _GEN_3280; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3297 = 4'h1 == tailIndices_3 | _GEN_3281; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3298 = 4'h2 == tailIndices_3 | _GEN_3282; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3299 = 4'h3 == tailIndices_3 | _GEN_3283; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3300 = 4'h4 == tailIndices_3 | _GEN_3284; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3301 = 4'h5 == tailIndices_3 | _GEN_3285; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3302 = 4'h6 == tailIndices_3 | _GEN_3286; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3303 = 4'h7 == tailIndices_3 | _GEN_3287; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3304 = 4'h8 == tailIndices_3 | _GEN_3288; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3305 = 4'h9 == tailIndices_3 | _GEN_3289; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3306 = 4'ha == tailIndices_3 | _GEN_3290; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3307 = 4'hb == tailIndices_3 | _GEN_3291; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3308 = 4'hc == tailIndices_3 | _GEN_3292; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3309 = 4'hd == tailIndices_3 | _GEN_3293; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3310 = 4'he == tailIndices_3 | _GEN_3294; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3311 = 4'hf == tailIndices_3 | _GEN_3295; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3312 = 3'h3 < issuedCount ? _GEN_3296 : _GEN_3280; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3313 = 3'h3 < issuedCount ? _GEN_3297 : _GEN_3281; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3314 = 3'h3 < issuedCount ? _GEN_3298 : _GEN_3282; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3315 = 3'h3 < issuedCount ? _GEN_3299 : _GEN_3283; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3316 = 3'h3 < issuedCount ? _GEN_3300 : _GEN_3284; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3317 = 3'h3 < issuedCount ? _GEN_3301 : _GEN_3285; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3318 = 3'h3 < issuedCount ? _GEN_3302 : _GEN_3286; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3319 = 3'h3 < issuedCount ? _GEN_3303 : _GEN_3287; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3320 = 3'h3 < issuedCount ? _GEN_3304 : _GEN_3288; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3321 = 3'h3 < issuedCount ? _GEN_3305 : _GEN_3289; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3322 = 3'h3 < issuedCount ? _GEN_3306 : _GEN_3290; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3323 = 3'h3 < issuedCount ? _GEN_3307 : _GEN_3291; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3324 = 3'h3 < issuedCount ? _GEN_3308 : _GEN_3292; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3325 = 3'h3 < issuedCount ? _GEN_3309 : _GEN_3293; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3326 = 3'h3 < issuedCount ? _GEN_3310 : _GEN_3294; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3327 = 3'h3 < issuedCount ? _GEN_3311 : _GEN_3295; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3328 = 4'h0 == tailIndices_4 | _GEN_3312; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3329 = 4'h1 == tailIndices_4 | _GEN_3313; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3330 = 4'h2 == tailIndices_4 | _GEN_3314; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3331 = 4'h3 == tailIndices_4 | _GEN_3315; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3332 = 4'h4 == tailIndices_4 | _GEN_3316; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3333 = 4'h5 == tailIndices_4 | _GEN_3317; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3334 = 4'h6 == tailIndices_4 | _GEN_3318; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3335 = 4'h7 == tailIndices_4 | _GEN_3319; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3336 = 4'h8 == tailIndices_4 | _GEN_3320; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3337 = 4'h9 == tailIndices_4 | _GEN_3321; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3338 = 4'ha == tailIndices_4 | _GEN_3322; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3339 = 4'hb == tailIndices_4 | _GEN_3323; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3340 = 4'hc == tailIndices_4 | _GEN_3324; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3341 = 4'hd == tailIndices_4 | _GEN_3325; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3342 = 4'he == tailIndices_4 | _GEN_3326; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3343 = 4'hf == tailIndices_4 | _GEN_3327; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3344 = 3'h4 < issuedCount ? _GEN_3328 : _GEN_3312; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3345 = 3'h4 < issuedCount ? _GEN_3329 : _GEN_3313; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3346 = 3'h4 < issuedCount ? _GEN_3330 : _GEN_3314; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3347 = 3'h4 < issuedCount ? _GEN_3331 : _GEN_3315; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3348 = 3'h4 < issuedCount ? _GEN_3332 : _GEN_3316; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3349 = 3'h4 < issuedCount ? _GEN_3333 : _GEN_3317; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3350 = 3'h4 < issuedCount ? _GEN_3334 : _GEN_3318; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3351 = 3'h4 < issuedCount ? _GEN_3335 : _GEN_3319; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3352 = 3'h4 < issuedCount ? _GEN_3336 : _GEN_3320; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3353 = 3'h4 < issuedCount ? _GEN_3337 : _GEN_3321; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3354 = 3'h4 < issuedCount ? _GEN_3338 : _GEN_3322; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3355 = 3'h4 < issuedCount ? _GEN_3339 : _GEN_3323; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3356 = 3'h4 < issuedCount ? _GEN_3340 : _GEN_3324; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3357 = 3'h4 < issuedCount ? _GEN_3341 : _GEN_3325; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3358 = 3'h4 < issuedCount ? _GEN_3342 : _GEN_3326; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3359 = 3'h4 < issuedCount ? _GEN_3343 : _GEN_3327; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3360 = 4'h0 == tailIndices_5 | _GEN_3344; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3361 = 4'h1 == tailIndices_5 | _GEN_3345; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3362 = 4'h2 == tailIndices_5 | _GEN_3346; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3363 = 4'h3 == tailIndices_5 | _GEN_3347; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3364 = 4'h4 == tailIndices_5 | _GEN_3348; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3365 = 4'h5 == tailIndices_5 | _GEN_3349; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3366 = 4'h6 == tailIndices_5 | _GEN_3350; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3367 = 4'h7 == tailIndices_5 | _GEN_3351; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3368 = 4'h8 == tailIndices_5 | _GEN_3352; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3369 = 4'h9 == tailIndices_5 | _GEN_3353; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3370 = 4'ha == tailIndices_5 | _GEN_3354; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3371 = 4'hb == tailIndices_5 | _GEN_3355; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3372 = 4'hc == tailIndices_5 | _GEN_3356; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3373 = 4'hd == tailIndices_5 | _GEN_3357; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3374 = 4'he == tailIndices_5 | _GEN_3358; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3375 = 4'hf == tailIndices_5 | _GEN_3359; // @[src/main/scala/frontend/IBF.scala 136:{29,29}]
  wire  _GEN_3376 = 3'h5 < issuedCount ? _GEN_3360 : _GEN_3344; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3377 = 3'h5 < issuedCount ? _GEN_3361 : _GEN_3345; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3378 = 3'h5 < issuedCount ? _GEN_3362 : _GEN_3346; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3379 = 3'h5 < issuedCount ? _GEN_3363 : _GEN_3347; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3380 = 3'h5 < issuedCount ? _GEN_3364 : _GEN_3348; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3381 = 3'h5 < issuedCount ? _GEN_3365 : _GEN_3349; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3382 = 3'h5 < issuedCount ? _GEN_3366 : _GEN_3350; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3383 = 3'h5 < issuedCount ? _GEN_3367 : _GEN_3351; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3384 = 3'h5 < issuedCount ? _GEN_3368 : _GEN_3352; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3385 = 3'h5 < issuedCount ? _GEN_3369 : _GEN_3353; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3386 = 3'h5 < issuedCount ? _GEN_3370 : _GEN_3354; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3387 = 3'h5 < issuedCount ? _GEN_3371 : _GEN_3355; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3388 = 3'h5 < issuedCount ? _GEN_3372 : _GEN_3356; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3389 = 3'h5 < issuedCount ? _GEN_3373 : _GEN_3357; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3390 = 3'h5 < issuedCount ? _GEN_3374 : _GEN_3358; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire  _GEN_3391 = 3'h5 < issuedCount ? _GEN_3375 : _GEN_3359; // @[src/main/scala/frontend/IBF.scala 134:31]
  wire [3:0] _GEN_3596 = {{1'd0}, issuedCount}; // @[src/main/scala/frontend/IBF.scala 140:23]
  wire [3:0] _nextTail_T_1 = tail + _GEN_3596; // @[src/main/scala/frontend/IBF.scala 140:23]
  wire [4:0] _GEN_166 = {{1'd0}, _nextTail_T_1}; // @[src/main/scala/frontend/IBF.scala 140:38]
  wire [4:0] _GEN_167 = _GEN_166 % 5'h10; // @[src/main/scala/frontend/IBF.scala 140:38]
  wire  clearValidMask_0 = issuedCount > 3'h0 & _GEN_3376; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_1 = issuedCount > 3'h0 & _GEN_3377; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_2 = issuedCount > 3'h0 & _GEN_3378; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_3 = issuedCount > 3'h0 & _GEN_3379; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_4 = issuedCount > 3'h0 & _GEN_3380; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_5 = issuedCount > 3'h0 & _GEN_3381; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_6 = issuedCount > 3'h0 & _GEN_3382; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_7 = issuedCount > 3'h0 & _GEN_3383; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_8 = issuedCount > 3'h0 & _GEN_3384; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_9 = issuedCount > 3'h0 & _GEN_3385; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_10 = issuedCount > 3'h0 & _GEN_3386; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_11 = issuedCount > 3'h0 & _GEN_3387; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_12 = issuedCount > 3'h0 & _GEN_3388; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_13 = issuedCount > 3'h0 & _GEN_3389; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_14 = issuedCount > 3'h0 & _GEN_3390; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire  clearValidMask_15 = issuedCount > 3'h0 & _GEN_3391; // @[src/main/scala/frontend/IBF.scala 128:23 131:40]
  wire [3:0] nextTail = issuedCount > 3'h0 ? _GEN_167[3:0] : tail; // @[src/main/scala/frontend/IBF.scala 116:12 131:40 140:14]
  wire [2:0] _countChange_T_3 = _T ? enqueueCount : 3'h0; // @[src/main/scala/frontend/IBF.scala 151:24]
  wire [2:0] _countChange_T_7 = _T_6 ? issuedCount : 3'h0; // @[src/main/scala/frontend/IBF.scala 152:24]
  wire [2:0] countChange = _countChange_T_3 - _countChange_T_7; // @[src/main/scala/frontend/IBF.scala 151:69]
  wire [4:0] _GEN_3597 = {{2'd0}, countChange}; // @[src/main/scala/frontend/IBF.scala 153:22]
  wire [4:0] nextCount = count + _GEN_3597; // @[src/main/scala/frontend/IBF.scala 153:22]
  wire  _T_18 = ~reset; // @[src/main/scala/frontend/IBF.scala 175:11]
  wire  _T_24 = _T & _T_6; // @[src/main/scala/frontend/IBF.scala 182:19]
  assign io_in_ready = ~full; // @[src/main/scala/frontend/IBF.scala 33:20]
  assign io_out_0_valid = hasValidInst_0 & io_out_0_ready; // @[src/main/scala/frontend/IBF.scala 72:41]
  assign io_out_0_bits_instr = 4'hf == tailIndices_0 ? entries_15_instr : _GEN_1983; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_0_bits_pc = 4'hf == tailIndices_0 ? entries_15_pc : _GEN_1999; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_0_bits_pdInfo_valid = 4'hf == tailIndices_0 ? entries_15_pdInfo_valid : _GEN_2015; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_isBr = 4'hf == tailIndices_0 ? entries_15_pdInfo_isBr : _GEN_2031; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_isJal = 4'hf == tailIndices_0 ? entries_15_pdInfo_isJal : _GEN_2047; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_isJalr = 4'hf == tailIndices_0 ? entries_15_pdInfo_isJalr : _GEN_2063; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_isCall = 4'hf == tailIndices_0 ? entries_15_pdInfo_isCall : _GEN_2079; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_isRet = 4'hf == tailIndices_0 ? entries_15_pdInfo_isRet : _GEN_2095; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_0_bits_pdInfo_jumpTarget = 4'hf == tailIndices_0 ? entries_15_pdInfo_jumpTarget : _GEN_2111; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_valid = baseAllocCond_1 & previousCannotAlloc; // @[src/main/scala/frontend/IBF.scala 84:41]
  assign io_out_1_bits_instr = 4'hf == tailIndices_1 ? entries_15_instr : _GEN_2188; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_1_bits_pc = 4'hf == tailIndices_1 ? entries_15_pc : _GEN_2204; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_1_bits_pdInfo_valid = 4'hf == tailIndices_1 ? entries_15_pdInfo_valid : _GEN_2220; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_isBr = 4'hf == tailIndices_1 ? entries_15_pdInfo_isBr : _GEN_2236; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_isJal = 4'hf == tailIndices_1 ? entries_15_pdInfo_isJal : _GEN_2252; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_isJalr = 4'hf == tailIndices_1 ? entries_15_pdInfo_isJalr : _GEN_2268; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_isCall = 4'hf == tailIndices_1 ? entries_15_pdInfo_isCall : _GEN_2284; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_isRet = 4'hf == tailIndices_1 ? entries_15_pdInfo_isRet : _GEN_2300; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_1_bits_pdInfo_jumpTarget = 4'hf == tailIndices_1 ? entries_15_pdInfo_jumpTarget : _GEN_2316; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_valid = baseAllocCond_2 & previousCannotAlloc_1; // @[src/main/scala/frontend/IBF.scala 84:41]
  assign io_out_2_bits_instr = 4'hf == tailIndices_2 ? entries_15_instr : _GEN_2393; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_2_bits_pc = 4'hf == tailIndices_2 ? entries_15_pc : _GEN_2409; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_2_bits_pdInfo_valid = 4'hf == tailIndices_2 ? entries_15_pdInfo_valid : _GEN_2425; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_isBr = 4'hf == tailIndices_2 ? entries_15_pdInfo_isBr : _GEN_2441; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_isJal = 4'hf == tailIndices_2 ? entries_15_pdInfo_isJal : _GEN_2457; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_isJalr = 4'hf == tailIndices_2 ? entries_15_pdInfo_isJalr : _GEN_2473; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_isCall = 4'hf == tailIndices_2 ? entries_15_pdInfo_isCall : _GEN_2489; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_isRet = 4'hf == tailIndices_2 ? entries_15_pdInfo_isRet : _GEN_2505; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_2_bits_pdInfo_jumpTarget = 4'hf == tailIndices_2 ? entries_15_pdInfo_jumpTarget : _GEN_2521; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_valid = baseAllocCond_3 & previousCannotAlloc_2; // @[src/main/scala/frontend/IBF.scala 84:41]
  assign io_out_3_bits_instr = 4'hf == tailIndices_3 ? entries_15_instr : _GEN_2598; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_3_bits_pc = 4'hf == tailIndices_3 ? entries_15_pc : _GEN_2614; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_3_bits_pdInfo_valid = 4'hf == tailIndices_3 ? entries_15_pdInfo_valid : _GEN_2630; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_isBr = 4'hf == tailIndices_3 ? entries_15_pdInfo_isBr : _GEN_2646; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_isJal = 4'hf == tailIndices_3 ? entries_15_pdInfo_isJal : _GEN_2662; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_isJalr = 4'hf == tailIndices_3 ? entries_15_pdInfo_isJalr : _GEN_2678; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_isCall = 4'hf == tailIndices_3 ? entries_15_pdInfo_isCall : _GEN_2694; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_isRet = 4'hf == tailIndices_3 ? entries_15_pdInfo_isRet : _GEN_2710; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_3_bits_pdInfo_jumpTarget = 4'hf == tailIndices_3 ? entries_15_pdInfo_jumpTarget : _GEN_2726; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_valid = baseAllocCond_4 & previousCannotAlloc_3; // @[src/main/scala/frontend/IBF.scala 84:41]
  assign io_out_4_bits_instr = 4'hf == tailIndices_4 ? entries_15_instr : _GEN_2803; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_4_bits_pc = 4'hf == tailIndices_4 ? entries_15_pc : _GEN_2819; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_4_bits_pdInfo_valid = 4'hf == tailIndices_4 ? entries_15_pdInfo_valid : _GEN_2835; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_isBr = 4'hf == tailIndices_4 ? entries_15_pdInfo_isBr : _GEN_2851; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_isJal = 4'hf == tailIndices_4 ? entries_15_pdInfo_isJal : _GEN_2867; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_isJalr = 4'hf == tailIndices_4 ? entries_15_pdInfo_isJalr : _GEN_2883; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_isCall = 4'hf == tailIndices_4 ? entries_15_pdInfo_isCall : _GEN_2899; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_isRet = 4'hf == tailIndices_4 ? entries_15_pdInfo_isRet : _GEN_2915; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_4_bits_pdInfo_jumpTarget = 4'hf == tailIndices_4 ? entries_15_pdInfo_jumpTarget : _GEN_2931; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_valid = baseAllocCond_5 & previousCannotAlloc_4; // @[src/main/scala/frontend/IBF.scala 84:41]
  assign io_out_5_bits_instr = 4'hf == tailIndices_5 ? entries_15_instr : _GEN_3008; // @[src/main/scala/frontend/IBF.scala 96:{29,29}]
  assign io_out_5_bits_pc = 4'hf == tailIndices_5 ? entries_15_pc : _GEN_3024; // @[src/main/scala/frontend/IBF.scala 97:{29,29}]
  assign io_out_5_bits_pdInfo_valid = 4'hf == tailIndices_5 ? entries_15_pdInfo_valid : _GEN_3040; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_isBr = 4'hf == tailIndices_5 ? entries_15_pdInfo_isBr : _GEN_3056; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_isJal = 4'hf == tailIndices_5 ? entries_15_pdInfo_isJal : _GEN_3072; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_isJalr = 4'hf == tailIndices_5 ? entries_15_pdInfo_isJalr : _GEN_3088; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_isCall = 4'hf == tailIndices_5 ? entries_15_pdInfo_isCall : _GEN_3104; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_isRet = 4'hf == tailIndices_5 ? entries_15_pdInfo_isRet : _GEN_3120; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  assign io_out_5_bits_pdInfo_jumpTarget = 4'hf == tailIndices_5 ? entries_15_pdInfo_jumpTarget : _GEN_3136; // @[src/main/scala/frontend/IBF.scala 98:{29,29}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_0_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_0_instr <= _GEN_1040;
        end
      end else begin
        entries_0_instr <= _GEN_1040;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_0_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_0_pc <= _GEN_1056;
        end
      end else begin
        entries_0_pc <= _GEN_1056;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_valid <= _GEN_1072;
        end
      end else begin
        entries_0_pdInfo_valid <= _GEN_1072;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_isBr <= _GEN_1088;
        end
      end else begin
        entries_0_pdInfo_isBr <= _GEN_1088;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_isJal <= _GEN_1104;
        end
      end else begin
        entries_0_pdInfo_isJal <= _GEN_1104;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_isJalr <= _GEN_1120;
        end
      end else begin
        entries_0_pdInfo_isJalr <= _GEN_1120;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_isCall <= _GEN_1136;
        end
      end else begin
        entries_0_pdInfo_isCall <= _GEN_1136;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_isRet <= _GEN_1152;
        end
      end else begin
        entries_0_pdInfo_isRet <= _GEN_1152;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_0_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h0 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_0_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_0_pdInfo_jumpTarget <= _GEN_1168;
        end
      end else begin
        entries_0_pdInfo_jumpTarget <= _GEN_1168;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_1_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_1_instr <= _GEN_1041;
        end
      end else begin
        entries_1_instr <= _GEN_1041;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_1_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_1_pc <= _GEN_1057;
        end
      end else begin
        entries_1_pc <= _GEN_1057;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_valid <= _GEN_1073;
        end
      end else begin
        entries_1_pdInfo_valid <= _GEN_1073;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_isBr <= _GEN_1089;
        end
      end else begin
        entries_1_pdInfo_isBr <= _GEN_1089;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_isJal <= _GEN_1105;
        end
      end else begin
        entries_1_pdInfo_isJal <= _GEN_1105;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_isJalr <= _GEN_1121;
        end
      end else begin
        entries_1_pdInfo_isJalr <= _GEN_1121;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_isCall <= _GEN_1137;
        end
      end else begin
        entries_1_pdInfo_isCall <= _GEN_1137;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_isRet <= _GEN_1153;
        end
      end else begin
        entries_1_pdInfo_isRet <= _GEN_1153;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_1_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h1 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_1_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_1_pdInfo_jumpTarget <= _GEN_1169;
        end
      end else begin
        entries_1_pdInfo_jumpTarget <= _GEN_1169;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_2_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_2_instr <= _GEN_1042;
        end
      end else begin
        entries_2_instr <= _GEN_1042;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_2_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_2_pc <= _GEN_1058;
        end
      end else begin
        entries_2_pc <= _GEN_1058;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_valid <= _GEN_1074;
        end
      end else begin
        entries_2_pdInfo_valid <= _GEN_1074;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_isBr <= _GEN_1090;
        end
      end else begin
        entries_2_pdInfo_isBr <= _GEN_1090;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_isJal <= _GEN_1106;
        end
      end else begin
        entries_2_pdInfo_isJal <= _GEN_1106;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_isJalr <= _GEN_1122;
        end
      end else begin
        entries_2_pdInfo_isJalr <= _GEN_1122;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_isCall <= _GEN_1138;
        end
      end else begin
        entries_2_pdInfo_isCall <= _GEN_1138;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_isRet <= _GEN_1154;
        end
      end else begin
        entries_2_pdInfo_isRet <= _GEN_1154;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_2_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h2 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_2_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_2_pdInfo_jumpTarget <= _GEN_1170;
        end
      end else begin
        entries_2_pdInfo_jumpTarget <= _GEN_1170;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_3_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_3_instr <= _GEN_1043;
        end
      end else begin
        entries_3_instr <= _GEN_1043;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_3_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_3_pc <= _GEN_1059;
        end
      end else begin
        entries_3_pc <= _GEN_1059;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_valid <= _GEN_1075;
        end
      end else begin
        entries_3_pdInfo_valid <= _GEN_1075;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_isBr <= _GEN_1091;
        end
      end else begin
        entries_3_pdInfo_isBr <= _GEN_1091;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_isJal <= _GEN_1107;
        end
      end else begin
        entries_3_pdInfo_isJal <= _GEN_1107;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_isJalr <= _GEN_1123;
        end
      end else begin
        entries_3_pdInfo_isJalr <= _GEN_1123;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_isCall <= _GEN_1139;
        end
      end else begin
        entries_3_pdInfo_isCall <= _GEN_1139;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_isRet <= _GEN_1155;
        end
      end else begin
        entries_3_pdInfo_isRet <= _GEN_1155;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_3_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h3 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_3_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_3_pdInfo_jumpTarget <= _GEN_1171;
        end
      end else begin
        entries_3_pdInfo_jumpTarget <= _GEN_1171;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_4_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_4_instr <= _GEN_1044;
        end
      end else begin
        entries_4_instr <= _GEN_1044;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_4_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_4_pc <= _GEN_1060;
        end
      end else begin
        entries_4_pc <= _GEN_1060;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_valid <= _GEN_1076;
        end
      end else begin
        entries_4_pdInfo_valid <= _GEN_1076;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_isBr <= _GEN_1092;
        end
      end else begin
        entries_4_pdInfo_isBr <= _GEN_1092;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_isJal <= _GEN_1108;
        end
      end else begin
        entries_4_pdInfo_isJal <= _GEN_1108;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_isJalr <= _GEN_1124;
        end
      end else begin
        entries_4_pdInfo_isJalr <= _GEN_1124;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_isCall <= _GEN_1140;
        end
      end else begin
        entries_4_pdInfo_isCall <= _GEN_1140;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_isRet <= _GEN_1156;
        end
      end else begin
        entries_4_pdInfo_isRet <= _GEN_1156;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_4_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h4 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_4_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_4_pdInfo_jumpTarget <= _GEN_1172;
        end
      end else begin
        entries_4_pdInfo_jumpTarget <= _GEN_1172;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_5_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_5_instr <= _GEN_1045;
        end
      end else begin
        entries_5_instr <= _GEN_1045;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_5_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_5_pc <= _GEN_1061;
        end
      end else begin
        entries_5_pc <= _GEN_1061;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_valid <= _GEN_1077;
        end
      end else begin
        entries_5_pdInfo_valid <= _GEN_1077;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_isBr <= _GEN_1093;
        end
      end else begin
        entries_5_pdInfo_isBr <= _GEN_1093;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_isJal <= _GEN_1109;
        end
      end else begin
        entries_5_pdInfo_isJal <= _GEN_1109;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_isJalr <= _GEN_1125;
        end
      end else begin
        entries_5_pdInfo_isJalr <= _GEN_1125;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_isCall <= _GEN_1141;
        end
      end else begin
        entries_5_pdInfo_isCall <= _GEN_1141;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_isRet <= _GEN_1157;
        end
      end else begin
        entries_5_pdInfo_isRet <= _GEN_1157;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_5_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h5 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_5_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_5_pdInfo_jumpTarget <= _GEN_1173;
        end
      end else begin
        entries_5_pdInfo_jumpTarget <= _GEN_1173;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_6_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_6_instr <= _GEN_1046;
        end
      end else begin
        entries_6_instr <= _GEN_1046;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_6_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_6_pc <= _GEN_1062;
        end
      end else begin
        entries_6_pc <= _GEN_1062;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_valid <= _GEN_1078;
        end
      end else begin
        entries_6_pdInfo_valid <= _GEN_1078;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_isBr <= _GEN_1094;
        end
      end else begin
        entries_6_pdInfo_isBr <= _GEN_1094;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_isJal <= _GEN_1110;
        end
      end else begin
        entries_6_pdInfo_isJal <= _GEN_1110;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_isJalr <= _GEN_1126;
        end
      end else begin
        entries_6_pdInfo_isJalr <= _GEN_1126;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_isCall <= _GEN_1142;
        end
      end else begin
        entries_6_pdInfo_isCall <= _GEN_1142;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_isRet <= _GEN_1158;
        end
      end else begin
        entries_6_pdInfo_isRet <= _GEN_1158;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_6_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h6 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_6_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_6_pdInfo_jumpTarget <= _GEN_1174;
        end
      end else begin
        entries_6_pdInfo_jumpTarget <= _GEN_1174;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_7_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_7_instr <= _GEN_1047;
        end
      end else begin
        entries_7_instr <= _GEN_1047;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_7_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_7_pc <= _GEN_1063;
        end
      end else begin
        entries_7_pc <= _GEN_1063;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_valid <= _GEN_1079;
        end
      end else begin
        entries_7_pdInfo_valid <= _GEN_1079;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_isBr <= _GEN_1095;
        end
      end else begin
        entries_7_pdInfo_isBr <= _GEN_1095;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_isJal <= _GEN_1111;
        end
      end else begin
        entries_7_pdInfo_isJal <= _GEN_1111;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_isJalr <= _GEN_1127;
        end
      end else begin
        entries_7_pdInfo_isJalr <= _GEN_1127;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_isCall <= _GEN_1143;
        end
      end else begin
        entries_7_pdInfo_isCall <= _GEN_1143;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_isRet <= _GEN_1159;
        end
      end else begin
        entries_7_pdInfo_isRet <= _GEN_1159;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_7_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h7 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_7_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_7_pdInfo_jumpTarget <= _GEN_1175;
        end
      end else begin
        entries_7_pdInfo_jumpTarget <= _GEN_1175;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_8_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_8_instr <= _GEN_1048;
        end
      end else begin
        entries_8_instr <= _GEN_1048;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_8_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_8_pc <= _GEN_1064;
        end
      end else begin
        entries_8_pc <= _GEN_1064;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_valid <= _GEN_1080;
        end
      end else begin
        entries_8_pdInfo_valid <= _GEN_1080;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_isBr <= _GEN_1096;
        end
      end else begin
        entries_8_pdInfo_isBr <= _GEN_1096;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_isJal <= _GEN_1112;
        end
      end else begin
        entries_8_pdInfo_isJal <= _GEN_1112;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_isJalr <= _GEN_1128;
        end
      end else begin
        entries_8_pdInfo_isJalr <= _GEN_1128;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_isCall <= _GEN_1144;
        end
      end else begin
        entries_8_pdInfo_isCall <= _GEN_1144;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_isRet <= _GEN_1160;
        end
      end else begin
        entries_8_pdInfo_isRet <= _GEN_1160;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_8_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h8 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_8_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_8_pdInfo_jumpTarget <= _GEN_1176;
        end
      end else begin
        entries_8_pdInfo_jumpTarget <= _GEN_1176;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_9_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_9_instr <= _GEN_1049;
        end
      end else begin
        entries_9_instr <= _GEN_1049;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_9_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_9_pc <= _GEN_1065;
        end
      end else begin
        entries_9_pc <= _GEN_1065;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_valid <= _GEN_1081;
        end
      end else begin
        entries_9_pdInfo_valid <= _GEN_1081;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_isBr <= _GEN_1097;
        end
      end else begin
        entries_9_pdInfo_isBr <= _GEN_1097;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_isJal <= _GEN_1113;
        end
      end else begin
        entries_9_pdInfo_isJal <= _GEN_1113;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_isJalr <= _GEN_1129;
        end
      end else begin
        entries_9_pdInfo_isJalr <= _GEN_1129;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_isCall <= _GEN_1145;
        end
      end else begin
        entries_9_pdInfo_isCall <= _GEN_1145;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_isRet <= _GEN_1161;
        end
      end else begin
        entries_9_pdInfo_isRet <= _GEN_1161;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_9_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'h9 == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_9_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_9_pdInfo_jumpTarget <= _GEN_1177;
        end
      end else begin
        entries_9_pdInfo_jumpTarget <= _GEN_1177;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_10_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_10_instr <= _GEN_1050;
        end
      end else begin
        entries_10_instr <= _GEN_1050;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_10_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_10_pc <= _GEN_1066;
        end
      end else begin
        entries_10_pc <= _GEN_1066;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_valid <= _GEN_1082;
        end
      end else begin
        entries_10_pdInfo_valid <= _GEN_1082;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_isBr <= _GEN_1098;
        end
      end else begin
        entries_10_pdInfo_isBr <= _GEN_1098;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_isJal <= _GEN_1114;
        end
      end else begin
        entries_10_pdInfo_isJal <= _GEN_1114;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_isJalr <= _GEN_1130;
        end
      end else begin
        entries_10_pdInfo_isJalr <= _GEN_1130;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_isCall <= _GEN_1146;
        end
      end else begin
        entries_10_pdInfo_isCall <= _GEN_1146;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_isRet <= _GEN_1162;
        end
      end else begin
        entries_10_pdInfo_isRet <= _GEN_1162;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_10_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'ha == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_10_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_10_pdInfo_jumpTarget <= _GEN_1178;
        end
      end else begin
        entries_10_pdInfo_jumpTarget <= _GEN_1178;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_11_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_11_instr <= _GEN_1051;
        end
      end else begin
        entries_11_instr <= _GEN_1051;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_11_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_11_pc <= _GEN_1067;
        end
      end else begin
        entries_11_pc <= _GEN_1067;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_valid <= _GEN_1083;
        end
      end else begin
        entries_11_pdInfo_valid <= _GEN_1083;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_isBr <= _GEN_1099;
        end
      end else begin
        entries_11_pdInfo_isBr <= _GEN_1099;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_isJal <= _GEN_1115;
        end
      end else begin
        entries_11_pdInfo_isJal <= _GEN_1115;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_isJalr <= _GEN_1131;
        end
      end else begin
        entries_11_pdInfo_isJalr <= _GEN_1131;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_isCall <= _GEN_1147;
        end
      end else begin
        entries_11_pdInfo_isCall <= _GEN_1147;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_isRet <= _GEN_1163;
        end
      end else begin
        entries_11_pdInfo_isRet <= _GEN_1163;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_11_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hb == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_11_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_11_pdInfo_jumpTarget <= _GEN_1179;
        end
      end else begin
        entries_11_pdInfo_jumpTarget <= _GEN_1179;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_12_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_12_instr <= _GEN_1052;
        end
      end else begin
        entries_12_instr <= _GEN_1052;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_12_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_12_pc <= _GEN_1068;
        end
      end else begin
        entries_12_pc <= _GEN_1068;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_valid <= _GEN_1084;
        end
      end else begin
        entries_12_pdInfo_valid <= _GEN_1084;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_isBr <= _GEN_1100;
        end
      end else begin
        entries_12_pdInfo_isBr <= _GEN_1100;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_isJal <= _GEN_1116;
        end
      end else begin
        entries_12_pdInfo_isJal <= _GEN_1116;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_isJalr <= _GEN_1132;
        end
      end else begin
        entries_12_pdInfo_isJalr <= _GEN_1132;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_isCall <= _GEN_1148;
        end
      end else begin
        entries_12_pdInfo_isCall <= _GEN_1148;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_isRet <= _GEN_1164;
        end
      end else begin
        entries_12_pdInfo_isRet <= _GEN_1164;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_12_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hc == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_12_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_12_pdInfo_jumpTarget <= _GEN_1180;
        end
      end else begin
        entries_12_pdInfo_jumpTarget <= _GEN_1180;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_13_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_13_instr <= _GEN_1053;
        end
      end else begin
        entries_13_instr <= _GEN_1053;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_13_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_13_pc <= _GEN_1069;
        end
      end else begin
        entries_13_pc <= _GEN_1069;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_valid <= _GEN_1085;
        end
      end else begin
        entries_13_pdInfo_valid <= _GEN_1085;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_isBr <= _GEN_1101;
        end
      end else begin
        entries_13_pdInfo_isBr <= _GEN_1101;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_isJal <= _GEN_1117;
        end
      end else begin
        entries_13_pdInfo_isJal <= _GEN_1117;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_isJalr <= _GEN_1133;
        end
      end else begin
        entries_13_pdInfo_isJalr <= _GEN_1133;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_isCall <= _GEN_1149;
        end
      end else begin
        entries_13_pdInfo_isCall <= _GEN_1149;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_isRet <= _GEN_1165;
        end
      end else begin
        entries_13_pdInfo_isRet <= _GEN_1165;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_13_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hd == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_13_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_13_pdInfo_jumpTarget <= _GEN_1181;
        end
      end else begin
        entries_13_pdInfo_jumpTarget <= _GEN_1181;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_14_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_14_instr <= _GEN_1054;
        end
      end else begin
        entries_14_instr <= _GEN_1054;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_14_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_14_pc <= _GEN_1070;
        end
      end else begin
        entries_14_pc <= _GEN_1070;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_valid <= _GEN_1086;
        end
      end else begin
        entries_14_pdInfo_valid <= _GEN_1086;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_isBr <= _GEN_1102;
        end
      end else begin
        entries_14_pdInfo_isBr <= _GEN_1102;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_isJal <= _GEN_1118;
        end
      end else begin
        entries_14_pdInfo_isJal <= _GEN_1118;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_isJalr <= _GEN_1134;
        end
      end else begin
        entries_14_pdInfo_isJalr <= _GEN_1134;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_isCall <= _GEN_1150;
        end
      end else begin
        entries_14_pdInfo_isCall <= _GEN_1150;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_isRet <= _GEN_1166;
        end
      end else begin
        entries_14_pdInfo_isRet <= _GEN_1166;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_14_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'he == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_14_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_14_pdInfo_jumpTarget <= _GEN_1182;
        end
      end else begin
        entries_14_pdInfo_jumpTarget <= _GEN_1182;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_instr <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 45:33]
          entries_15_instr <= io_in_bits_instrs_3; // @[src/main/scala/frontend/IBF.scala 45:33]
        end else begin
          entries_15_instr <= _GEN_1055;
        end
      end else begin
        entries_15_instr <= _GEN_1055;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pc <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 46:33]
          entries_15_pc <= io_in_bits_pcs_3; // @[src/main/scala/frontend/IBF.scala 46:33]
        end else begin
          entries_15_pc <= _GEN_1071;
        end
      end else begin
        entries_15_pc <= _GEN_1071;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_valid <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_valid <= io_in_bits_pdInfo_3_valid; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_valid <= _GEN_1087;
        end
      end else begin
        entries_15_pdInfo_valid <= _GEN_1087;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_isBr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_isBr <= io_in_bits_pdInfo_3_isBr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_isBr <= _GEN_1103;
        end
      end else begin
        entries_15_pdInfo_isBr <= _GEN_1103;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_isJal <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_isJal <= io_in_bits_pdInfo_3_isJal; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_isJal <= _GEN_1119;
        end
      end else begin
        entries_15_pdInfo_isJal <= _GEN_1119;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_isJalr <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_isJalr <= io_in_bits_pdInfo_3_isJalr; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_isJalr <= _GEN_1135;
        end
      end else begin
        entries_15_pdInfo_isJalr <= _GEN_1135;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_isCall <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_isCall <= io_in_bits_pdInfo_3_isCall; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_isCall <= _GEN_1151;
        end
      end else begin
        entries_15_pdInfo_isCall <= _GEN_1151;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_isRet <= 1'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_isRet <= io_in_bits_pdInfo_3_isRet; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_isRet <= _GEN_1167;
        end
      end else begin
        entries_15_pdInfo_isRet <= _GEN_1167;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 22:26]
      entries_15_pdInfo_jumpTarget <= 32'h0; // @[src/main/scala/frontend/IBF.scala 22:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        if (4'hf == idx_3) begin // @[src/main/scala/frontend/IBF.scala 47:33]
          entries_15_pdInfo_jumpTarget <= io_in_bits_pdInfo_3_jumpTarget; // @[src/main/scala/frontend/IBF.scala 47:33]
        end else begin
          entries_15_pdInfo_jumpTarget <= _GEN_1183;
        end
      end else begin
        entries_15_pdInfo_jumpTarget <= _GEN_1183;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_0 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_0) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_0 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_0 <= _GEN_1440;
      end else begin
        valids_0 <= _GEN_1232;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_1 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_1) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_1 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_1 <= _GEN_1441;
      end else begin
        valids_1 <= _GEN_1233;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_2 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_2) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_2 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_2 <= _GEN_1442;
      end else begin
        valids_2 <= _GEN_1234;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_3 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_3) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_3 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_3 <= _GEN_1443;
      end else begin
        valids_3 <= _GEN_1235;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_4 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_4) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_4 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_4 <= _GEN_1444;
      end else begin
        valids_4 <= _GEN_1236;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_5 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_5) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_5 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_5 <= _GEN_1445;
      end else begin
        valids_5 <= _GEN_1237;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_6 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_6) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_6 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_6 <= _GEN_1446;
      end else begin
        valids_6 <= _GEN_1238;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_7 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_7) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_7 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_7 <= _GEN_1447;
      end else begin
        valids_7 <= _GEN_1239;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_8 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_8) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_8 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_8 <= _GEN_1448;
      end else begin
        valids_8 <= _GEN_1240;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_9 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_9) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_9 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_9 <= _GEN_1449;
      end else begin
        valids_9 <= _GEN_1241;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_10 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_10) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_10 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_10 <= _GEN_1450;
      end else begin
        valids_10 <= _GEN_1242;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_11 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_11) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_11 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_11 <= _GEN_1451;
      end else begin
        valids_11 <= _GEN_1243;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_12 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_12) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_12 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_12 <= _GEN_1452;
      end else begin
        valids_12 <= _GEN_1244;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_13 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_13) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_13 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_13 <= _GEN_1453;
      end else begin
        valids_13 <= _GEN_1245;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_14 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_14) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_14 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_14 <= _GEN_1454;
      end else begin
        valids_14 <= _GEN_1246;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 23:26]
      valids_15 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 23:26]
    end else if (clearValidMask_15) begin // @[src/main/scala/frontend/IBF.scala 145:29]
      valids_15 <= 1'h0; // @[src/main/scala/frontend/IBF.scala 146:17]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 39:33]
      if (io_in_bits_enqMask_3) begin // @[src/main/scala/frontend/IBF.scala 44:27]
        valids_15 <= _GEN_1455;
      end else begin
        valids_15 <= _GEN_1247;
      end
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 25:26]
      head <= 4'h0; // @[src/main/scala/frontend/IBF.scala 25:26]
    end else if (_T) begin // @[src/main/scala/frontend/IBF.scala 120:33]
      head <= _GEN_165[3:0]; // @[src/main/scala/frontend/IBF.scala 121:14]
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 26:26]
      tail <= 4'h0; // @[src/main/scala/frontend/IBF.scala 26:26]
    end else if (issuedCount > 3'h0) begin // @[src/main/scala/frontend/IBF.scala 131:40]
      tail <= _GEN_167[3:0]; // @[src/main/scala/frontend/IBF.scala 140:14]
    end
    if (reset) begin // @[src/main/scala/frontend/IBF.scala 27:26]
      count <= 5'h0; // @[src/main/scala/frontend/IBF.scala 27:26]
    end else begin
      count <= nextCount;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset) begin
          $fwrite(32'h80000002,"[IBF] Enqueue: %d instrs, new head=%d, new count=%d\n",enqueueCount,nextHead,nextCount); // @[src/main/scala/frontend/IBF.scala 175:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_18) begin
          $fwrite(32'h80000002,"[IBF] Dequeue: %d instrs, new tail=%d, new count=%d\n",issuedCount,nextTail,nextCount); // @[src/main/scala/frontend/IBF.scala 179:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24 & _T_18) begin
          $fwrite(32'h80000002,"[IBF] Simultaneous enqueue(%d) and dequeue(%d)\n",enqueueCount,issuedCount); // @[src/main/scala/frontend/IBF.scala 183:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18) begin
          $fwrite(32'h80000002,"[IBF Status] head=%d, tail=%d, count=%d, full=%d, empty=%d\n",head,tail,count,full,empty
            ); // @[src/main/scala/frontend/IBF.scala 187:9]
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
  entries_0_instr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_pdInfo_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_pdInfo_isBr = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_pdInfo_isJal = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_pdInfo_isJalr = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_pdInfo_isCall = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_pdInfo_isRet = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_pdInfo_jumpTarget = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entries_1_instr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entries_1_pc = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  entries_1_pdInfo_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  entries_1_pdInfo_isBr = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_pdInfo_isJal = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_pdInfo_isJalr = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_pdInfo_isCall = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_pdInfo_isRet = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_pdInfo_jumpTarget = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  entries_2_instr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  entries_2_pc = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  entries_2_pdInfo_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  entries_2_pdInfo_isBr = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  entries_2_pdInfo_isJal = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_2_pdInfo_isJalr = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entries_2_pdInfo_isCall = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entries_2_pdInfo_isRet = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_pdInfo_jumpTarget = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  entries_3_instr = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  entries_3_pc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  entries_3_pdInfo_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  entries_3_pdInfo_isBr = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entries_3_pdInfo_isJal = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entries_3_pdInfo_isJalr = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entries_3_pdInfo_isCall = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entries_3_pdInfo_isRet = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entries_3_pdInfo_jumpTarget = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  entries_4_instr = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entries_4_pc = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  entries_4_pdInfo_valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  entries_4_pdInfo_isBr = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entries_4_pdInfo_isJal = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  entries_4_pdInfo_isJalr = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  entries_4_pdInfo_isCall = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  entries_4_pdInfo_isRet = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entries_4_pdInfo_jumpTarget = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  entries_5_instr = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  entries_5_pc = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  entries_5_pdInfo_valid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entries_5_pdInfo_isBr = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entries_5_pdInfo_isJal = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_5_pdInfo_isJalr = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entries_5_pdInfo_isCall = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  entries_5_pdInfo_isRet = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_5_pdInfo_jumpTarget = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  entries_6_instr = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  entries_6_pc = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_6_pdInfo_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  entries_6_pdInfo_isBr = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  entries_6_pdInfo_isJal = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  entries_6_pdInfo_isJalr = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  entries_6_pdInfo_isCall = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  entries_6_pdInfo_isRet = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  entries_6_pdInfo_jumpTarget = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  entries_7_instr = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  entries_7_pc = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  entries_7_pdInfo_valid = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  entries_7_pdInfo_isBr = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entries_7_pdInfo_isJal = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  entries_7_pdInfo_isJalr = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  entries_7_pdInfo_isCall = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  entries_7_pdInfo_isRet = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entries_7_pdInfo_jumpTarget = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  entries_8_instr = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  entries_8_pc = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  entries_8_pdInfo_valid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entries_8_pdInfo_isBr = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  entries_8_pdInfo_isJal = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  entries_8_pdInfo_isJalr = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  entries_8_pdInfo_isCall = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  entries_8_pdInfo_isRet = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  entries_8_pdInfo_jumpTarget = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  entries_9_instr = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  entries_9_pc = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  entries_9_pdInfo_valid = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  entries_9_pdInfo_isBr = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  entries_9_pdInfo_isJal = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  entries_9_pdInfo_isJalr = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  entries_9_pdInfo_isCall = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  entries_9_pdInfo_isRet = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entries_9_pdInfo_jumpTarget = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  entries_10_instr = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  entries_10_pc = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  entries_10_pdInfo_valid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entries_10_pdInfo_isBr = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entries_10_pdInfo_isJal = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entries_10_pdInfo_isJalr = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  entries_10_pdInfo_isCall = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  entries_10_pdInfo_isRet = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  entries_10_pdInfo_jumpTarget = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  entries_11_instr = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  entries_11_pc = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  entries_11_pdInfo_valid = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  entries_11_pdInfo_isBr = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  entries_11_pdInfo_isJal = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entries_11_pdInfo_isJalr = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entries_11_pdInfo_isCall = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  entries_11_pdInfo_isRet = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  entries_11_pdInfo_jumpTarget = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  entries_12_instr = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entries_12_pc = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  entries_12_pdInfo_valid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entries_12_pdInfo_isBr = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  entries_12_pdInfo_isJal = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entries_12_pdInfo_isJalr = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entries_12_pdInfo_isCall = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entries_12_pdInfo_isRet = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entries_12_pdInfo_jumpTarget = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  entries_13_instr = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  entries_13_pc = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  entries_13_pdInfo_valid = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  entries_13_pdInfo_isBr = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  entries_13_pdInfo_isJal = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  entries_13_pdInfo_isJalr = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  entries_13_pdInfo_isCall = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  entries_13_pdInfo_isRet = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  entries_13_pdInfo_jumpTarget = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  entries_14_instr = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  entries_14_pc = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  entries_14_pdInfo_valid = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  entries_14_pdInfo_isBr = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entries_14_pdInfo_isJal = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entries_14_pdInfo_isJalr = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entries_14_pdInfo_isCall = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entries_14_pdInfo_isRet = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entries_14_pdInfo_jumpTarget = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  entries_15_instr = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  entries_15_pc = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  entries_15_pdInfo_valid = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  entries_15_pdInfo_isBr = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  entries_15_pdInfo_isJal = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  entries_15_pdInfo_isJalr = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  entries_15_pdInfo_isCall = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  entries_15_pdInfo_isRet = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  entries_15_pdInfo_jumpTarget = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  valids_0 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  valids_1 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  valids_2 = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  valids_3 = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  valids_4 = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  valids_5 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  valids_6 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  valids_7 = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  valids_8 = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  valids_9 = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  valids_10 = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  valids_11 = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  valids_12 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  valids_13 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  valids_14 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  valids_15 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  head = _RAND_160[3:0];
  _RAND_161 = {1{`RANDOM}};
  tail = _RAND_161[3:0];
  _RAND_162 = {1{`RANDOM}};
  count = _RAND_162[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
