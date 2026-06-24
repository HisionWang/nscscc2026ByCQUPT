module IssueQueue_4(
  input         clock,
  input         reset,
  input         io_enq_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [31:0] io_enq_bits_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [31:0] io_enq_bits_inst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_ctrl_fuType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [4:0]  io_enq_bits_ctrl_aluOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_ctrl_bruOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_ctrl_lsuOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_ctrl_csrOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_ctrl_mulOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_ctrl_divOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_ctrl_src1Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_ctrl_src2Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_ctrl_immType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_rfWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_memRead, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_memWrite, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_csrWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_isBranch, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_isJump, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_ctrl_isPriv, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [9:0]  io_enq_bits_excpVec, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [31:0] io_enq_bits_imm, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [13:0] io_enq_bits_csrAddress, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_isBr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_isJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_isJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_isCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_pdInfo_isRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [31:0] io_enq_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [4:0]  io_enq_bits_ldst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [4:0]  io_enq_bits_lrs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [4:0]  io_enq_bits_lrs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_rs1Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_rdValid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [5:0]  io_enq_bits_robIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_robIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [5:0]  io_enq_bits_robIdxFull_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_robIdxFull_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_lqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_lqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_sqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_sqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_isSta, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_isStd, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_issue_ready, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [31:0] io_issue_bits_pc, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [31:0] io_issue_bits_inst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_ctrl_fuType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [4:0]  io_issue_bits_ctrl_aluOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_ctrl_bruOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_ctrl_lsuOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_ctrl_csrOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_ctrl_mulOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_ctrl_divOp, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_ctrl_src1Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_ctrl_src2Type, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_ctrl_immType, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_rfWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_memRead, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_memWrite, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_csrWen, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_isBranch, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_isJump, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_ctrl_isPriv, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [9:0]  io_issue_bits_excpVec, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [31:0] io_issue_bits_imm, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [13:0] io_issue_bits_csrAddress, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_isBr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_isJal, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_isJalr, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_isCall, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_pdInfo_isRet, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [31:0] io_issue_bits_pdInfo_jumpTarget, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [4:0]  io_issue_bits_ldst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [4:0]  io_issue_bits_lrs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [4:0]  io_issue_bits_lrs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_rs1Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_rdValid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [5:0]  io_issue_bits_robIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_robIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [5:0]  io_issue_bits_robIdxFull_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_robIdxFull_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_lqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_lqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_sqIdx_value, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_sqIdx_flag, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_isSta, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_isStd, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_wakeupPorts_0_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_wakeupPorts_1_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_wakeupPorts_2_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_wakeupPorts_3_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_wakeupPorts_3_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_wakeupPorts_4_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_wakeupPorts_4_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_freeEntries // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
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
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [31:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [31:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [31:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
`endif // RANDOMIZE_REG_INIT
  reg  entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg  entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
  reg [31:0] entryUops_0_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_0_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_0_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_0_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_0_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_0_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_0_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_0_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_0_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_0_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_0_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_0_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_0_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_0_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_0_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_0_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_0_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_0_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_0_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_1_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_1_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_1_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_1_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_1_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_1_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_1_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_1_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_1_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_1_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_1_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_1_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_1_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_1_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_1_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_1_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_1_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_1_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_1_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_2_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_2_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_2_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_2_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_2_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_2_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_2_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_2_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_2_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_2_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_2_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_2_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_2_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_2_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_2_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_2_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_2_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_2_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_2_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_3_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_3_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_3_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_3_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_3_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_3_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_3_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_3_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_3_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_3_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_3_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_3_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_3_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_3_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_3_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_3_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_3_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_3_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_3_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_4_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_4_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_4_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_4_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_4_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_4_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_4_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_4_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_4_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_4_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_4_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_4_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_4_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_4_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_4_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_4_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_4_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_4_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_4_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_5_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_5_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_5_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_5_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_5_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_5_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_5_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_5_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_5_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_5_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_5_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_5_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_5_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_5_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_5_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_5_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_5_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_5_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_5_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_6_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_6_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_6_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_6_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_6_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_6_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_6_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_6_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_6_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_6_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_6_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_6_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_6_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_6_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_6_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_6_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_6_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_6_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_6_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_7_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_7_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_7_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [9:0] entryUops_7_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_7_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [13:0] entryUops_7_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [31:0] entryUops_7_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_7_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_7_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [4:0] entryUops_7_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_7_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_7_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_7_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [6:0] entryUops_7_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_7_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [5:0] entryUops_7_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [3:0] entryUops_7_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg [2:0] entryUops_7_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryUops_7_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:25]
  reg  entryP1Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP1Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
  reg  entryP2Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  entryP2Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
  reg  age_0_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  reg  age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
  wire  wValid = io_wakeupPorts_0_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_1 = io_wakeupPorts_1_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_2 = io_wakeupPorts_2_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_3 = io_wakeupPorts_3_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_4 = io_wakeupPorts_4_valid & entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_0 = wValid & entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_0_bits_pdst | wValid_1 &
    entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_1_bits_pdst | wValid_2 & entryUops_0_rs1Valid &
    entryUops_0_prs1 == io_wakeupPorts_2_bits_pdst | wValid_3 & entryUops_0_rs1Valid & entryUops_0_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_4 & entryUops_0_rs1Valid & entryUops_0_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_0 = wValid & entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_0_bits_pdst | wValid_1 &
    entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_1_bits_pdst | wValid_2 & entryUops_0_rs2Valid &
    entryUops_0_prs2 == io_wakeupPorts_2_bits_pdst | wValid_3 & entryUops_0_rs2Valid & entryUops_0_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_4 & entryUops_0_rs2Valid & entryUops_0_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_5 = io_wakeupPorts_0_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_6 = io_wakeupPorts_1_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_7 = io_wakeupPorts_2_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_8 = io_wakeupPorts_3_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_9 = io_wakeupPorts_4_valid & entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_1 = wValid_5 & entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_0_bits_pdst | wValid_6 &
    entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_1_bits_pdst | wValid_7 & entryUops_1_rs1Valid &
    entryUops_1_prs1 == io_wakeupPorts_2_bits_pdst | wValid_8 & entryUops_1_rs1Valid & entryUops_1_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_9 & entryUops_1_rs1Valid & entryUops_1_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_1 = wValid_5 & entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_0_bits_pdst | wValid_6 &
    entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_1_bits_pdst | wValid_7 & entryUops_1_rs2Valid &
    entryUops_1_prs2 == io_wakeupPorts_2_bits_pdst | wValid_8 & entryUops_1_rs2Valid & entryUops_1_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_9 & entryUops_1_rs2Valid & entryUops_1_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_10 = io_wakeupPorts_0_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_11 = io_wakeupPorts_1_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_12 = io_wakeupPorts_2_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_13 = io_wakeupPorts_3_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_14 = io_wakeupPorts_4_valid & entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_2 = wValid_10 & entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_0_bits_pdst | wValid_11 &
    entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_1_bits_pdst | wValid_12 & entryUops_2_rs1Valid &
    entryUops_2_prs1 == io_wakeupPorts_2_bits_pdst | wValid_13 & entryUops_2_rs1Valid & entryUops_2_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_14 & entryUops_2_rs1Valid & entryUops_2_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_2 = wValid_10 & entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_0_bits_pdst | wValid_11 &
    entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_1_bits_pdst | wValid_12 & entryUops_2_rs2Valid &
    entryUops_2_prs2 == io_wakeupPorts_2_bits_pdst | wValid_13 & entryUops_2_rs2Valid & entryUops_2_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_14 & entryUops_2_rs2Valid & entryUops_2_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_15 = io_wakeupPorts_0_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_16 = io_wakeupPorts_1_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_17 = io_wakeupPorts_2_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_18 = io_wakeupPorts_3_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_19 = io_wakeupPorts_4_valid & entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_3 = wValid_15 & entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_0_bits_pdst | wValid_16 &
    entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_1_bits_pdst | wValid_17 & entryUops_3_rs1Valid &
    entryUops_3_prs1 == io_wakeupPorts_2_bits_pdst | wValid_18 & entryUops_3_rs1Valid & entryUops_3_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_19 & entryUops_3_rs1Valid & entryUops_3_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_3 = wValid_15 & entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_0_bits_pdst | wValid_16 &
    entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_1_bits_pdst | wValid_17 & entryUops_3_rs2Valid &
    entryUops_3_prs2 == io_wakeupPorts_2_bits_pdst | wValid_18 & entryUops_3_rs2Valid & entryUops_3_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_19 & entryUops_3_rs2Valid & entryUops_3_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_20 = io_wakeupPorts_0_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_21 = io_wakeupPorts_1_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_22 = io_wakeupPorts_2_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_23 = io_wakeupPorts_3_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_24 = io_wakeupPorts_4_valid & entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_4 = wValid_20 & entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_1_bits_pdst | wValid_22 & entryUops_4_rs1Valid &
    entryUops_4_prs1 == io_wakeupPorts_2_bits_pdst | wValid_23 & entryUops_4_rs1Valid & entryUops_4_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_24 & entryUops_4_rs1Valid & entryUops_4_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_4 = wValid_20 & entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_1_bits_pdst | wValid_22 & entryUops_4_rs2Valid &
    entryUops_4_prs2 == io_wakeupPorts_2_bits_pdst | wValid_23 & entryUops_4_rs2Valid & entryUops_4_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_24 & entryUops_4_rs2Valid & entryUops_4_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_25 = io_wakeupPorts_0_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_26 = io_wakeupPorts_1_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_27 = io_wakeupPorts_2_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_28 = io_wakeupPorts_3_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_29 = io_wakeupPorts_4_valid & entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_5 = wValid_25 & entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_0_bits_pdst | wValid_26 &
    entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_1_bits_pdst | wValid_27 & entryUops_5_rs1Valid &
    entryUops_5_prs1 == io_wakeupPorts_2_bits_pdst | wValid_28 & entryUops_5_rs1Valid & entryUops_5_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_29 & entryUops_5_rs1Valid & entryUops_5_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_5 = wValid_25 & entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_0_bits_pdst | wValid_26 &
    entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_1_bits_pdst | wValid_27 & entryUops_5_rs2Valid &
    entryUops_5_prs2 == io_wakeupPorts_2_bits_pdst | wValid_28 & entryUops_5_rs2Valid & entryUops_5_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_29 & entryUops_5_rs2Valid & entryUops_5_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_30 = io_wakeupPorts_0_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_31 = io_wakeupPorts_1_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_32 = io_wakeupPorts_2_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_33 = io_wakeupPorts_3_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_34 = io_wakeupPorts_4_valid & entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_6 = wValid_30 & entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_0_bits_pdst | wValid_31 &
    entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_1_bits_pdst | wValid_32 & entryUops_6_rs1Valid &
    entryUops_6_prs1 == io_wakeupPorts_2_bits_pdst | wValid_33 & entryUops_6_rs1Valid & entryUops_6_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_34 & entryUops_6_rs1Valid & entryUops_6_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_6 = wValid_30 & entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_0_bits_pdst | wValid_31 &
    entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_1_bits_pdst | wValid_32 & entryUops_6_rs2Valid &
    entryUops_6_prs2 == io_wakeupPorts_2_bits_pdst | wValid_33 & entryUops_6_rs2Valid & entryUops_6_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_34 & entryUops_6_rs2Valid & entryUops_6_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  wValid_35 = io_wakeupPorts_0_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_36 = io_wakeupPorts_1_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_37 = io_wakeupPorts_2_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_38 = io_wakeupPorts_3_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  wValid_39 = io_wakeupPorts_4_valid & entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:44]
  wire  p1Wakeup_7 = wValid_35 & entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_0_bits_pdst | wValid_36 &
    entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_1_bits_pdst | wValid_37 & entryUops_7_rs1Valid &
    entryUops_7_prs1 == io_wakeupPorts_2_bits_pdst | wValid_38 & entryUops_7_rs1Valid & entryUops_7_prs1 ==
    io_wakeupPorts_3_bits_pdst | wValid_39 & entryUops_7_rs1Valid & entryUops_7_prs1 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p2Wakeup_7 = wValid_35 & entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_0_bits_pdst | wValid_36 &
    entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_1_bits_pdst | wValid_37 & entryUops_7_rs2Valid &
    entryUops_7_prs2 == io_wakeupPorts_2_bits_pdst | wValid_38 & entryUops_7_rs2Valid & entryUops_7_prs2 ==
    io_wakeupPorts_3_bits_pdst | wValid_39 & entryUops_7_rs2Valid & entryUops_7_prs2 == io_wakeupPorts_4_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 67:25]
  wire  p1Eff_0 = entryP1Ready_0 | p1Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_0 = entryP2Ready_0 | p2Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_1 = entryP1Ready_1 | p1Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_1 = entryP2Ready_1 | p2Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_2 = entryP1Ready_2 | p1Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_2 = entryP2Ready_2 | p2Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_3 = entryP1Ready_3 | p1Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_3 = entryP2Ready_3 | p2Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_4 = entryP1Ready_4 | p1Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_4 = entryP2Ready_4 | p2Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_5 = entryP1Ready_5 | p1Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_5 = entryP2Ready_5 | p2Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_6 = entryP1Ready_6 | p1Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_6 = entryP2Ready_6 | p2Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  p1Eff_7 = entryP1Ready_7 | p1Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:33]
  wire  p2Eff_7 = entryP2Ready_7 | p2Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 78:33]
  wire  request_0 = entryValid_0 & p1Eff_0 & p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_1 = entryValid_1 & p1Eff_1 & p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_2 = entryValid_2 & p1Eff_2 & p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_3 = entryValid_3 & p1Eff_3 & p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_4 = entryValid_4 & p1Eff_4 & p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_5 = entryValid_5 & p1Eff_5 & p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_6 = entryValid_6 & p1Eff_6 & p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  request_7 = entryValid_7 & p1Eff_7 & p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 105:45]
  wire  _T_340 = request_1 & ~age_0_1 | request_2 & ~age_0_2 | request_3 & ~age_0_3 | request_4 & ~age_0_4 | request_5
     & ~age_0_5 | request_6 & ~age_0_6 | request_7 & ~age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_0 = request_0 & ~_T_340; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_361 = request_0 & ~age_1_0 | request_2 & ~age_1_2 | request_3 & ~age_1_3 | request_4 & ~age_1_4 | request_5
     & ~age_1_5 | request_6 & ~age_1_6 | request_7 & ~age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_1 = request_1 & ~_T_361; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_382 = request_0 & ~age_2_0 | request_1 & ~age_2_1 | request_3 & ~age_2_3 | request_4 & ~age_2_4 | request_5
     & ~age_2_5 | request_6 & ~age_2_6 | request_7 & ~age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_2 = request_2 & ~_T_382; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_403 = request_0 & ~age_3_0 | request_1 & ~age_3_1 | request_2 & ~age_3_2 | request_4 & ~age_3_4 | request_5
     & ~age_3_5 | request_6 & ~age_3_6 | request_7 & ~age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_3 = request_3 & ~_T_403; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_424 = request_0 & ~age_4_0 | request_1 & ~age_4_1 | request_2 & ~age_4_2 | request_3 & ~age_4_3 | request_5
     & ~age_4_5 | request_6 & ~age_4_6 | request_7 & ~age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_4 = request_4 & ~_T_424; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_445 = request_0 & ~age_5_0 | request_1 & ~age_5_1 | request_2 & ~age_5_2 | request_3 & ~age_5_3 | request_4
     & ~age_5_4 | request_6 & ~age_5_6 | request_7 & ~age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_5 = request_5 & ~_T_445; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_466 = request_0 & ~age_6_0 | request_1 & ~age_6_1 | request_2 & ~age_6_2 | request_3 & ~age_6_3 | request_4
     & ~age_6_4 | request_5 & ~age_6_5 | request_7 & ~age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_6 = request_6 & ~_T_466; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire  _T_487 = request_0 & ~age_7_0 | request_1 & ~age_7_1 | request_2 & ~age_7_2 | request_3 & ~age_7_3 | request_4
     & ~age_7_4 | request_5 & ~age_7_5 | request_6 & ~age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 121:27]
  wire  oldest_7 = request_7 & ~_T_487; // @[src/main/scala/backend/scheduler/IssueQueue.scala 123:29]
  wire [2:0] _io_issue_bits_T_60 = oldest_0 ? entryUops_0_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_61 = oldest_1 ? entryUops_1_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_62 = oldest_2 ? entryUops_2_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_63 = oldest_3 ? entryUops_3_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_64 = oldest_4 ? entryUops_4_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_65 = oldest_5 ? entryUops_5_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_66 = oldest_6 ? entryUops_6_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_67 = oldest_7 ? entryUops_7_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_68 = _io_issue_bits_T_60 | _io_issue_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_69 = _io_issue_bits_T_68 | _io_issue_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_70 = _io_issue_bits_T_69 | _io_issue_bits_T_63; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_71 = _io_issue_bits_T_70 | _io_issue_bits_T_64; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_72 = _io_issue_bits_T_71 | _io_issue_bits_T_65; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_73 = _io_issue_bits_T_72 | _io_issue_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_90 = oldest_0 ? entryUops_0_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_91 = oldest_1 ? entryUops_1_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_92 = oldest_2 ? entryUops_2_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_93 = oldest_3 ? entryUops_3_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_94 = oldest_4 ? entryUops_4_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_95 = oldest_5 ? entryUops_5_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_96 = oldest_6 ? entryUops_6_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_97 = oldest_7 ? entryUops_7_sqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_98 = _io_issue_bits_T_90 | _io_issue_bits_T_91; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_99 = _io_issue_bits_T_98 | _io_issue_bits_T_92; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_100 = _io_issue_bits_T_99 | _io_issue_bits_T_93; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_101 = _io_issue_bits_T_100 | _io_issue_bits_T_94; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_102 = _io_issue_bits_T_101 | _io_issue_bits_T_95; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_103 = _io_issue_bits_T_102 | _io_issue_bits_T_96; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_120 = oldest_0 ? entryUops_0_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_121 = oldest_1 ? entryUops_1_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_122 = oldest_2 ? entryUops_2_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_123 = oldest_3 ? entryUops_3_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_124 = oldest_4 ? entryUops_4_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_125 = oldest_5 ? entryUops_5_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_126 = oldest_6 ? entryUops_6_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_127 = oldest_7 ? entryUops_7_lqIdx_value : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_128 = _io_issue_bits_T_120 | _io_issue_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_129 = _io_issue_bits_T_128 | _io_issue_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_130 = _io_issue_bits_T_129 | _io_issue_bits_T_123; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_131 = _io_issue_bits_T_130 | _io_issue_bits_T_124; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_132 = _io_issue_bits_T_131 | _io_issue_bits_T_125; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_133 = _io_issue_bits_T_132 | _io_issue_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_150 = oldest_0 ? entryUops_0_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_151 = oldest_1 ? entryUops_1_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_152 = oldest_2 ? entryUops_2_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_153 = oldest_3 ? entryUops_3_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_154 = oldest_4 ? entryUops_4_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_155 = oldest_5 ? entryUops_5_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_156 = oldest_6 ? entryUops_6_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_157 = oldest_7 ? entryUops_7_robIdxFull_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_158 = _io_issue_bits_T_150 | _io_issue_bits_T_151; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_159 = _io_issue_bits_T_158 | _io_issue_bits_T_152; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_160 = _io_issue_bits_T_159 | _io_issue_bits_T_153; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_161 = _io_issue_bits_T_160 | _io_issue_bits_T_154; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_162 = _io_issue_bits_T_161 | _io_issue_bits_T_155; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_163 = _io_issue_bits_T_162 | _io_issue_bits_T_156; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_180 = oldest_0 ? entryUops_0_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_181 = oldest_1 ? entryUops_1_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_182 = oldest_2 ? entryUops_2_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_183 = oldest_3 ? entryUops_3_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_184 = oldest_4 ? entryUops_4_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_185 = oldest_5 ? entryUops_5_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_186 = oldest_6 ? entryUops_6_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_187 = oldest_7 ? entryUops_7_robIdx_value : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_188 = _io_issue_bits_T_180 | _io_issue_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_189 = _io_issue_bits_T_188 | _io_issue_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_190 = _io_issue_bits_T_189 | _io_issue_bits_T_183; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_191 = _io_issue_bits_T_190 | _io_issue_bits_T_184; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_192 = _io_issue_bits_T_191 | _io_issue_bits_T_185; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_193 = _io_issue_bits_T_192 | _io_issue_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_240 = oldest_0 ? entryUops_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_241 = oldest_1 ? entryUops_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_242 = oldest_2 ? entryUops_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_243 = oldest_3 ? entryUops_3_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_244 = oldest_4 ? entryUops_4_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_245 = oldest_5 ? entryUops_5_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_246 = oldest_6 ? entryUops_6_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_247 = oldest_7 ? entryUops_7_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_248 = _io_issue_bits_T_240 | _io_issue_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_249 = _io_issue_bits_T_248 | _io_issue_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_250 = _io_issue_bits_T_249 | _io_issue_bits_T_243; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_251 = _io_issue_bits_T_250 | _io_issue_bits_T_244; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_252 = _io_issue_bits_T_251 | _io_issue_bits_T_245; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_253 = _io_issue_bits_T_252 | _io_issue_bits_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_255 = oldest_0 ? entryUops_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_256 = oldest_1 ? entryUops_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_257 = oldest_2 ? entryUops_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_258 = oldest_3 ? entryUops_3_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_259 = oldest_4 ? entryUops_4_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_260 = oldest_5 ? entryUops_5_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_261 = oldest_6 ? entryUops_6_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_262 = oldest_7 ? entryUops_7_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_263 = _io_issue_bits_T_255 | _io_issue_bits_T_256; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_264 = _io_issue_bits_T_263 | _io_issue_bits_T_257; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_265 = _io_issue_bits_T_264 | _io_issue_bits_T_258; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_266 = _io_issue_bits_T_265 | _io_issue_bits_T_259; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_267 = _io_issue_bits_T_266 | _io_issue_bits_T_260; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_268 = _io_issue_bits_T_267 | _io_issue_bits_T_261; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_270 = oldest_0 ? entryUops_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_271 = oldest_1 ? entryUops_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_272 = oldest_2 ? entryUops_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_273 = oldest_3 ? entryUops_3_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_274 = oldest_4 ? entryUops_4_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_275 = oldest_5 ? entryUops_5_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_276 = oldest_6 ? entryUops_6_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_277 = oldest_7 ? entryUops_7_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_278 = _io_issue_bits_T_270 | _io_issue_bits_T_271; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_279 = _io_issue_bits_T_278 | _io_issue_bits_T_272; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_280 = _io_issue_bits_T_279 | _io_issue_bits_T_273; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_281 = _io_issue_bits_T_280 | _io_issue_bits_T_274; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_282 = _io_issue_bits_T_281 | _io_issue_bits_T_275; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_283 = _io_issue_bits_T_282 | _io_issue_bits_T_276; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_285 = oldest_0 ? entryUops_0_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_286 = oldest_1 ? entryUops_1_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_287 = oldest_2 ? entryUops_2_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_288 = oldest_3 ? entryUops_3_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_289 = oldest_4 ? entryUops_4_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_290 = oldest_5 ? entryUops_5_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_291 = oldest_6 ? entryUops_6_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_292 = oldest_7 ? entryUops_7_pdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_293 = _io_issue_bits_T_285 | _io_issue_bits_T_286; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_294 = _io_issue_bits_T_293 | _io_issue_bits_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_295 = _io_issue_bits_T_294 | _io_issue_bits_T_288; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_296 = _io_issue_bits_T_295 | _io_issue_bits_T_289; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_297 = _io_issue_bits_T_296 | _io_issue_bits_T_290; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_298 = _io_issue_bits_T_297 | _io_issue_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_300 = oldest_0 ? entryUops_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_301 = oldest_1 ? entryUops_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_302 = oldest_2 ? entryUops_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_303 = oldest_3 ? entryUops_3_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_304 = oldest_4 ? entryUops_4_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_305 = oldest_5 ? entryUops_5_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_306 = oldest_6 ? entryUops_6_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_307 = oldest_7 ? entryUops_7_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_308 = _io_issue_bits_T_300 | _io_issue_bits_T_301; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_309 = _io_issue_bits_T_308 | _io_issue_bits_T_302; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_310 = _io_issue_bits_T_309 | _io_issue_bits_T_303; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_311 = _io_issue_bits_T_310 | _io_issue_bits_T_304; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_312 = _io_issue_bits_T_311 | _io_issue_bits_T_305; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_313 = _io_issue_bits_T_312 | _io_issue_bits_T_306; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_315 = oldest_0 ? entryUops_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_316 = oldest_1 ? entryUops_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_317 = oldest_2 ? entryUops_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_318 = oldest_3 ? entryUops_3_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_319 = oldest_4 ? entryUops_4_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_320 = oldest_5 ? entryUops_5_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_321 = oldest_6 ? entryUops_6_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_322 = oldest_7 ? entryUops_7_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_323 = _io_issue_bits_T_315 | _io_issue_bits_T_316; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_324 = _io_issue_bits_T_323 | _io_issue_bits_T_317; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_325 = _io_issue_bits_T_324 | _io_issue_bits_T_318; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_326 = _io_issue_bits_T_325 | _io_issue_bits_T_319; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_327 = _io_issue_bits_T_326 | _io_issue_bits_T_320; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_328 = _io_issue_bits_T_327 | _io_issue_bits_T_321; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_330 = oldest_0 ? entryUops_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_331 = oldest_1 ? entryUops_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_332 = oldest_2 ? entryUops_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_333 = oldest_3 ? entryUops_3_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_334 = oldest_4 ? entryUops_4_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_335 = oldest_5 ? entryUops_5_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_336 = oldest_6 ? entryUops_6_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_337 = oldest_7 ? entryUops_7_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_338 = _io_issue_bits_T_330 | _io_issue_bits_T_331; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_339 = _io_issue_bits_T_338 | _io_issue_bits_T_332; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_340 = _io_issue_bits_T_339 | _io_issue_bits_T_333; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_341 = _io_issue_bits_T_340 | _io_issue_bits_T_334; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_342 = _io_issue_bits_T_341 | _io_issue_bits_T_335; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_343 = _io_issue_bits_T_342 | _io_issue_bits_T_336; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_345 = oldest_0 ? entryUops_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_346 = oldest_1 ? entryUops_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_347 = oldest_2 ? entryUops_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_348 = oldest_3 ? entryUops_3_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_349 = oldest_4 ? entryUops_4_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_350 = oldest_5 ? entryUops_5_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_351 = oldest_6 ? entryUops_6_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_352 = oldest_7 ? entryUops_7_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_353 = _io_issue_bits_T_345 | _io_issue_bits_T_346; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_354 = _io_issue_bits_T_353 | _io_issue_bits_T_347; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_355 = _io_issue_bits_T_354 | _io_issue_bits_T_348; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_356 = _io_issue_bits_T_355 | _io_issue_bits_T_349; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_357 = _io_issue_bits_T_356 | _io_issue_bits_T_350; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_358 = _io_issue_bits_T_357 | _io_issue_bits_T_351; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_450 = oldest_0 ? entryUops_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_451 = oldest_1 ? entryUops_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_452 = oldest_2 ? entryUops_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_453 = oldest_3 ? entryUops_3_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_454 = oldest_4 ? entryUops_4_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_455 = oldest_5 ? entryUops_5_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_456 = oldest_6 ? entryUops_6_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_457 = oldest_7 ? entryUops_7_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_458 = _io_issue_bits_T_450 | _io_issue_bits_T_451; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_459 = _io_issue_bits_T_458 | _io_issue_bits_T_452; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_460 = _io_issue_bits_T_459 | _io_issue_bits_T_453; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_461 = _io_issue_bits_T_460 | _io_issue_bits_T_454; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_462 = _io_issue_bits_T_461 | _io_issue_bits_T_455; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_463 = _io_issue_bits_T_462 | _io_issue_bits_T_456; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_465 = oldest_0 ? entryUops_0_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_466 = oldest_1 ? entryUops_1_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_467 = oldest_2 ? entryUops_2_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_468 = oldest_3 ? entryUops_3_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_469 = oldest_4 ? entryUops_4_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_470 = oldest_5 ? entryUops_5_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_471 = oldest_6 ? entryUops_6_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_472 = oldest_7 ? entryUops_7_imm : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_473 = _io_issue_bits_T_465 | _io_issue_bits_T_466; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_474 = _io_issue_bits_T_473 | _io_issue_bits_T_467; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_475 = _io_issue_bits_T_474 | _io_issue_bits_T_468; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_476 = _io_issue_bits_T_475 | _io_issue_bits_T_469; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_477 = _io_issue_bits_T_476 | _io_issue_bits_T_470; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_478 = _io_issue_bits_T_477 | _io_issue_bits_T_471; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_480 = oldest_0 ? entryUops_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_481 = oldest_1 ? entryUops_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_482 = oldest_2 ? entryUops_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_483 = oldest_3 ? entryUops_3_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_484 = oldest_4 ? entryUops_4_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_485 = oldest_5 ? entryUops_5_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_486 = oldest_6 ? entryUops_6_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_487 = oldest_7 ? entryUops_7_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_488 = _io_issue_bits_T_480 | _io_issue_bits_T_481; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_489 = _io_issue_bits_T_488 | _io_issue_bits_T_482; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_490 = _io_issue_bits_T_489 | _io_issue_bits_T_483; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_491 = _io_issue_bits_T_490 | _io_issue_bits_T_484; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_492 = _io_issue_bits_T_491 | _io_issue_bits_T_485; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_493 = _io_issue_bits_T_492 | _io_issue_bits_T_486; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_600 = oldest_0 ? entryUops_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_601 = oldest_1 ? entryUops_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_602 = oldest_2 ? entryUops_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_603 = oldest_3 ? entryUops_3_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_604 = oldest_4 ? entryUops_4_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_605 = oldest_5 ? entryUops_5_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_606 = oldest_6 ? entryUops_6_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_607 = oldest_7 ? entryUops_7_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_608 = _io_issue_bits_T_600 | _io_issue_bits_T_601; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_609 = _io_issue_bits_T_608 | _io_issue_bits_T_602; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_610 = _io_issue_bits_T_609 | _io_issue_bits_T_603; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_611 = _io_issue_bits_T_610 | _io_issue_bits_T_604; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_612 = _io_issue_bits_T_611 | _io_issue_bits_T_605; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_613 = _io_issue_bits_T_612 | _io_issue_bits_T_606; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_615 = oldest_0 ? entryUops_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_616 = oldest_1 ? entryUops_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_617 = oldest_2 ? entryUops_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_618 = oldest_3 ? entryUops_3_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_619 = oldest_4 ? entryUops_4_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_620 = oldest_5 ? entryUops_5_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_621 = oldest_6 ? entryUops_6_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_622 = oldest_7 ? entryUops_7_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_623 = _io_issue_bits_T_615 | _io_issue_bits_T_616; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_624 = _io_issue_bits_T_623 | _io_issue_bits_T_617; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_625 = _io_issue_bits_T_624 | _io_issue_bits_T_618; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_626 = _io_issue_bits_T_625 | _io_issue_bits_T_619; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_627 = _io_issue_bits_T_626 | _io_issue_bits_T_620; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_628 = _io_issue_bits_T_627 | _io_issue_bits_T_621; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_630 = oldest_0 ? entryUops_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_631 = oldest_1 ? entryUops_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_632 = oldest_2 ? entryUops_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_633 = oldest_3 ? entryUops_3_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_634 = oldest_4 ? entryUops_4_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_635 = oldest_5 ? entryUops_5_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_636 = oldest_6 ? entryUops_6_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_637 = oldest_7 ? entryUops_7_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_638 = _io_issue_bits_T_630 | _io_issue_bits_T_631; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_639 = _io_issue_bits_T_638 | _io_issue_bits_T_632; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_640 = _io_issue_bits_T_639 | _io_issue_bits_T_633; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_641 = _io_issue_bits_T_640 | _io_issue_bits_T_634; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_642 = _io_issue_bits_T_641 | _io_issue_bits_T_635; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_643 = _io_issue_bits_T_642 | _io_issue_bits_T_636; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_645 = oldest_0 ? entryUops_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_646 = oldest_1 ? entryUops_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_647 = oldest_2 ? entryUops_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_648 = oldest_3 ? entryUops_3_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_649 = oldest_4 ? entryUops_4_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_650 = oldest_5 ? entryUops_5_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_651 = oldest_6 ? entryUops_6_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_652 = oldest_7 ? entryUops_7_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_653 = _io_issue_bits_T_645 | _io_issue_bits_T_646; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_654 = _io_issue_bits_T_653 | _io_issue_bits_T_647; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_655 = _io_issue_bits_T_654 | _io_issue_bits_T_648; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_656 = _io_issue_bits_T_655 | _io_issue_bits_T_649; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_657 = _io_issue_bits_T_656 | _io_issue_bits_T_650; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_658 = _io_issue_bits_T_657 | _io_issue_bits_T_651; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_660 = oldest_0 ? entryUops_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_661 = oldest_1 ? entryUops_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_662 = oldest_2 ? entryUops_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_663 = oldest_3 ? entryUops_3_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_664 = oldest_4 ? entryUops_4_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_665 = oldest_5 ? entryUops_5_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_666 = oldest_6 ? entryUops_6_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_667 = oldest_7 ? entryUops_7_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_668 = _io_issue_bits_T_660 | _io_issue_bits_T_661; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_669 = _io_issue_bits_T_668 | _io_issue_bits_T_662; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_670 = _io_issue_bits_T_669 | _io_issue_bits_T_663; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_671 = _io_issue_bits_T_670 | _io_issue_bits_T_664; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_672 = _io_issue_bits_T_671 | _io_issue_bits_T_665; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_673 = _io_issue_bits_T_672 | _io_issue_bits_T_666; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_675 = oldest_0 ? entryUops_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_676 = oldest_1 ? entryUops_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_677 = oldest_2 ? entryUops_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_678 = oldest_3 ? entryUops_3_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_679 = oldest_4 ? entryUops_4_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_680 = oldest_5 ? entryUops_5_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_681 = oldest_6 ? entryUops_6_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_682 = oldest_7 ? entryUops_7_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_683 = _io_issue_bits_T_675 | _io_issue_bits_T_676; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_684 = _io_issue_bits_T_683 | _io_issue_bits_T_677; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_685 = _io_issue_bits_T_684 | _io_issue_bits_T_678; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_686 = _io_issue_bits_T_685 | _io_issue_bits_T_679; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_687 = _io_issue_bits_T_686 | _io_issue_bits_T_680; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_688 = _io_issue_bits_T_687 | _io_issue_bits_T_681; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_690 = oldest_0 ? entryUops_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_691 = oldest_1 ? entryUops_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_692 = oldest_2 ? entryUops_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_693 = oldest_3 ? entryUops_3_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_694 = oldest_4 ? entryUops_4_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_695 = oldest_5 ? entryUops_5_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_696 = oldest_6 ? entryUops_6_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_697 = oldest_7 ? entryUops_7_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_698 = _io_issue_bits_T_690 | _io_issue_bits_T_691; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_699 = _io_issue_bits_T_698 | _io_issue_bits_T_692; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_700 = _io_issue_bits_T_699 | _io_issue_bits_T_693; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_701 = _io_issue_bits_T_700 | _io_issue_bits_T_694; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_702 = _io_issue_bits_T_701 | _io_issue_bits_T_695; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_703 = _io_issue_bits_T_702 | _io_issue_bits_T_696; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_705 = oldest_0 ? entryUops_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_706 = oldest_1 ? entryUops_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_707 = oldest_2 ? entryUops_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_708 = oldest_3 ? entryUops_3_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_709 = oldest_4 ? entryUops_4_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_710 = oldest_5 ? entryUops_5_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_711 = oldest_6 ? entryUops_6_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_712 = oldest_7 ? entryUops_7_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_713 = _io_issue_bits_T_705 | _io_issue_bits_T_706; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_714 = _io_issue_bits_T_713 | _io_issue_bits_T_707; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_715 = _io_issue_bits_T_714 | _io_issue_bits_T_708; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_716 = _io_issue_bits_T_715 | _io_issue_bits_T_709; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_717 = _io_issue_bits_T_716 | _io_issue_bits_T_710; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_718 = _io_issue_bits_T_717 | _io_issue_bits_T_711; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_720 = oldest_0 ? entryUops_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_721 = oldest_1 ? entryUops_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_722 = oldest_2 ? entryUops_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_723 = oldest_3 ? entryUops_3_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_724 = oldest_4 ? entryUops_4_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_725 = oldest_5 ? entryUops_5_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_726 = oldest_6 ? entryUops_6_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_727 = oldest_7 ? entryUops_7_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_728 = _io_issue_bits_T_720 | _io_issue_bits_T_721; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_729 = _io_issue_bits_T_728 | _io_issue_bits_T_722; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_730 = _io_issue_bits_T_729 | _io_issue_bits_T_723; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_731 = _io_issue_bits_T_730 | _io_issue_bits_T_724; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_732 = _io_issue_bits_T_731 | _io_issue_bits_T_725; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_733 = _io_issue_bits_T_732 | _io_issue_bits_T_726; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_735 = oldest_0 ? entryUops_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_736 = oldest_1 ? entryUops_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_737 = oldest_2 ? entryUops_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_738 = oldest_3 ? entryUops_3_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_739 = oldest_4 ? entryUops_4_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_740 = oldest_5 ? entryUops_5_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_741 = oldest_6 ? entryUops_6_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_742 = oldest_7 ? entryUops_7_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_743 = _io_issue_bits_T_735 | _io_issue_bits_T_736; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_744 = _io_issue_bits_T_743 | _io_issue_bits_T_737; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_745 = _io_issue_bits_T_744 | _io_issue_bits_T_738; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_746 = _io_issue_bits_T_745 | _io_issue_bits_T_739; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_747 = _io_issue_bits_T_746 | _io_issue_bits_T_740; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_748 = _io_issue_bits_T_747 | _io_issue_bits_T_741; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_750 = oldest_0 ? entryUops_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_751 = oldest_1 ? entryUops_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_752 = oldest_2 ? entryUops_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_753 = oldest_3 ? entryUops_3_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_754 = oldest_4 ? entryUops_4_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_755 = oldest_5 ? entryUops_5_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_756 = oldest_6 ? entryUops_6_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_757 = oldest_7 ? entryUops_7_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_758 = _io_issue_bits_T_750 | _io_issue_bits_T_751; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_759 = _io_issue_bits_T_758 | _io_issue_bits_T_752; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_760 = _io_issue_bits_T_759 | _io_issue_bits_T_753; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_761 = _io_issue_bits_T_760 | _io_issue_bits_T_754; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_762 = _io_issue_bits_T_761 | _io_issue_bits_T_755; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_763 = _io_issue_bits_T_762 | _io_issue_bits_T_756; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_765 = oldest_0 ? entryUops_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_766 = oldest_1 ? entryUops_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_767 = oldest_2 ? entryUops_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_768 = oldest_3 ? entryUops_3_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_769 = oldest_4 ? entryUops_4_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_770 = oldest_5 ? entryUops_5_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_771 = oldest_6 ? entryUops_6_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_772 = oldest_7 ? entryUops_7_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_773 = _io_issue_bits_T_765 | _io_issue_bits_T_766; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_774 = _io_issue_bits_T_773 | _io_issue_bits_T_767; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_775 = _io_issue_bits_T_774 | _io_issue_bits_T_768; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_776 = _io_issue_bits_T_775 | _io_issue_bits_T_769; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_777 = _io_issue_bits_T_776 | _io_issue_bits_T_770; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_778 = _io_issue_bits_T_777 | _io_issue_bits_T_771; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  issueFire = io_issue_valid & io_issue_ready; // @[src/main/scala/backend/scheduler/IssueQueue.scala 135:34]
  wire  freeMask_0 = ~entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_1 = ~entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_2 = ~entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_3 = ~entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_4 = ~entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_5 = ~entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_6 = ~entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire  freeMask_7 = ~entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 140:47]
  wire [2:0] _enqIdx_T = freeMask_6 ? 3'h6 : 3'h7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_1 = freeMask_5 ? 3'h5 : _enqIdx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_2 = freeMask_4 ? 3'h4 : _enqIdx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_3 = freeMask_3 ? 3'h3 : _enqIdx_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_4 = freeMask_2 ? 3'h2 : _enqIdx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_5 = freeMask_1 ? 3'h1 : _enqIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] enqIdx = freeMask_0 ? 3'h0 : _enqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [7:0] _hasFree_T = {freeMask_7,freeMask_6,freeMask_5,freeMask_4,freeMask_3,freeMask_2,freeMask_1,freeMask_0}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 142:27]
  wire  hasFree = |_hasFree_T; // @[src/main/scala/backend/scheduler/IssueQueue.scala 142:34]
  wire  enqFire = io_enq_valid & hasFree; // @[src/main/scala/backend/scheduler/IssueQueue.scala 143:31]
  wire  _validAfterKillGrant_0_T_2 = oldest_0 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_0 = entryValid_0 & ~(oldest_0 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_1_T_2 = oldest_1 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_1 = entryValid_1 & ~(oldest_1 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_2_T_2 = oldest_2 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_2 = entryValid_2 & ~(oldest_2 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_3_T_2 = oldest_3 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_3 = entryValid_3 & ~(oldest_3 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_4_T_2 = oldest_4 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_4 = entryValid_4 & ~(oldest_4 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_5_T_2 = oldest_5 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_5 = entryValid_5 & ~(oldest_5 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_6_T_2 = oldest_6 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_6 = entryValid_6 & ~(oldest_6 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _validAfterKillGrant_7_T_2 = oldest_7 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:73]
  wire  validAfterKillGrant_7 = entryValid_7 & ~(oldest_7 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 148:59]
  wire  _T_490 = enqFire & enqIdx == 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:24]
  wire  _GEN_0 = enqFire & enqIdx == 3'h0 | entryValid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _T_504 = enqFire & enqIdx == 3'h1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_513 = enqFire & enqIdx == 3'h2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_522 = enqFire & enqIdx == 3'h3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_531 = enqFire & enqIdx == 3'h4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_540 = enqFire & enqIdx == 3'h5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_549 = enqFire & enqIdx == 3'h6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _T_558 = enqFire & enqIdx == 3'h7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:26]
  wire  _GEN_88 = _T_504 | entryValid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_176 = _T_513 | entryValid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_264 = _T_522 | entryValid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_352 = _T_531 | entryValid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_440 = _T_540 | entryValid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_528 = _T_549 | entryValid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire  _GEN_616 = _T_558 | entryValid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 164:43 165:21 43:29]
  wire [1:0] _io_freeEntries_T = freeMask_0 + freeMask_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  wire [1:0] _io_freeEntries_T_2 = freeMask_2 + freeMask_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  wire [2:0] _io_freeEntries_T_4 = _io_freeEntries_T + _io_freeEntries_T_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  wire [1:0] _io_freeEntries_T_6 = freeMask_4 + freeMask_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  wire [1:0] _io_freeEntries_T_8 = freeMask_6 + freeMask_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  wire [2:0] _io_freeEntries_T_10 = _io_freeEntries_T_6 + _io_freeEntries_T_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  assign io_issue_valid = oldest_0 | oldest_1 | oldest_2 | oldest_3 | oldest_4 | oldest_5 | oldest_6 | oldest_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 132:36]
  assign io_issue_bits_pc = _io_issue_bits_T_778 | _io_issue_bits_T_772; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_inst = _io_issue_bits_T_763 | _io_issue_bits_T_757; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_fuType = _io_issue_bits_T_748 | _io_issue_bits_T_742; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_aluOp = _io_issue_bits_T_733 | _io_issue_bits_T_727; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_bruOp = _io_issue_bits_T_718 | _io_issue_bits_T_712; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_lsuOp = _io_issue_bits_T_703 | _io_issue_bits_T_697; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrOp = _io_issue_bits_T_688 | _io_issue_bits_T_682; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_mulOp = _io_issue_bits_T_673 | _io_issue_bits_T_667; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_divOp = _io_issue_bits_T_658 | _io_issue_bits_T_652; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src1Type = _io_issue_bits_T_643 | _io_issue_bits_T_637; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src2Type = _io_issue_bits_T_628 | _io_issue_bits_T_622; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_immType = _io_issue_bits_T_613 | _io_issue_bits_T_607; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_rfWen = oldest_0 & entryUops_0_ctrl_rfWen | oldest_1 & entryUops_1_ctrl_rfWen | oldest_2 &
    entryUops_2_ctrl_rfWen | oldest_3 & entryUops_3_ctrl_rfWen | oldest_4 & entryUops_4_ctrl_rfWen | oldest_5 &
    entryUops_5_ctrl_rfWen | oldest_6 & entryUops_6_ctrl_rfWen | oldest_7 & entryUops_7_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memRead = oldest_0 & entryUops_0_ctrl_memRead | oldest_1 & entryUops_1_ctrl_memRead |
    oldest_2 & entryUops_2_ctrl_memRead | oldest_3 & entryUops_3_ctrl_memRead | oldest_4 & entryUops_4_ctrl_memRead |
    oldest_5 & entryUops_5_ctrl_memRead | oldest_6 & entryUops_6_ctrl_memRead | oldest_7 & entryUops_7_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memWrite = oldest_0 & entryUops_0_ctrl_memWrite | oldest_1 & entryUops_1_ctrl_memWrite |
    oldest_2 & entryUops_2_ctrl_memWrite | oldest_3 & entryUops_3_ctrl_memWrite | oldest_4 & entryUops_4_ctrl_memWrite
     | oldest_5 & entryUops_5_ctrl_memWrite | oldest_6 & entryUops_6_ctrl_memWrite | oldest_7 &
    entryUops_7_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrWen = oldest_0 & entryUops_0_ctrl_csrWen | oldest_1 & entryUops_1_ctrl_csrWen | oldest_2
     & entryUops_2_ctrl_csrWen | oldest_3 & entryUops_3_ctrl_csrWen | oldest_4 & entryUops_4_ctrl_csrWen | oldest_5 &
    entryUops_5_ctrl_csrWen | oldest_6 & entryUops_6_ctrl_csrWen | oldest_7 & entryUops_7_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isBranch = oldest_0 & entryUops_0_ctrl_isBranch | oldest_1 & entryUops_1_ctrl_isBranch |
    oldest_2 & entryUops_2_ctrl_isBranch | oldest_3 & entryUops_3_ctrl_isBranch | oldest_4 & entryUops_4_ctrl_isBranch
     | oldest_5 & entryUops_5_ctrl_isBranch | oldest_6 & entryUops_6_ctrl_isBranch | oldest_7 &
    entryUops_7_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isJump = oldest_0 & entryUops_0_ctrl_isJump | oldest_1 & entryUops_1_ctrl_isJump | oldest_2
     & entryUops_2_ctrl_isJump | oldest_3 & entryUops_3_ctrl_isJump | oldest_4 & entryUops_4_ctrl_isJump | oldest_5 &
    entryUops_5_ctrl_isJump | oldest_6 & entryUops_6_ctrl_isJump | oldest_7 & entryUops_7_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isPriv = oldest_0 & entryUops_0_ctrl_isPriv | oldest_1 & entryUops_1_ctrl_isPriv | oldest_2
     & entryUops_2_ctrl_isPriv | oldest_3 & entryUops_3_ctrl_isPriv | oldest_4 & entryUops_4_ctrl_isPriv | oldest_5 &
    entryUops_5_ctrl_isPriv | oldest_6 & entryUops_6_ctrl_isPriv | oldest_7 & entryUops_7_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_excpVec = _io_issue_bits_T_493 | _io_issue_bits_T_487; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_imm = _io_issue_bits_T_478 | _io_issue_bits_T_472; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_csrAddress = _io_issue_bits_T_463 | _io_issue_bits_T_457; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_valid = oldest_0 & entryUops_0_pdInfo_valid | oldest_1 & entryUops_1_pdInfo_valid |
    oldest_2 & entryUops_2_pdInfo_valid | oldest_3 & entryUops_3_pdInfo_valid | oldest_4 & entryUops_4_pdInfo_valid |
    oldest_5 & entryUops_5_pdInfo_valid | oldest_6 & entryUops_6_pdInfo_valid | oldest_7 & entryUops_7_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isBr = oldest_0 & entryUops_0_pdInfo_isBr | oldest_1 & entryUops_1_pdInfo_isBr | oldest_2
     & entryUops_2_pdInfo_isBr | oldest_3 & entryUops_3_pdInfo_isBr | oldest_4 & entryUops_4_pdInfo_isBr | oldest_5 &
    entryUops_5_pdInfo_isBr | oldest_6 & entryUops_6_pdInfo_isBr | oldest_7 & entryUops_7_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJal = oldest_0 & entryUops_0_pdInfo_isJal | oldest_1 & entryUops_1_pdInfo_isJal |
    oldest_2 & entryUops_2_pdInfo_isJal | oldest_3 & entryUops_3_pdInfo_isJal | oldest_4 & entryUops_4_pdInfo_isJal |
    oldest_5 & entryUops_5_pdInfo_isJal | oldest_6 & entryUops_6_pdInfo_isJal | oldest_7 & entryUops_7_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJalr = oldest_0 & entryUops_0_pdInfo_isJalr | oldest_1 & entryUops_1_pdInfo_isJalr |
    oldest_2 & entryUops_2_pdInfo_isJalr | oldest_3 & entryUops_3_pdInfo_isJalr | oldest_4 & entryUops_4_pdInfo_isJalr
     | oldest_5 & entryUops_5_pdInfo_isJalr | oldest_6 & entryUops_6_pdInfo_isJalr | oldest_7 &
    entryUops_7_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isCall = oldest_0 & entryUops_0_pdInfo_isCall | oldest_1 & entryUops_1_pdInfo_isCall |
    oldest_2 & entryUops_2_pdInfo_isCall | oldest_3 & entryUops_3_pdInfo_isCall | oldest_4 & entryUops_4_pdInfo_isCall
     | oldest_5 & entryUops_5_pdInfo_isCall | oldest_6 & entryUops_6_pdInfo_isCall | oldest_7 &
    entryUops_7_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isRet = oldest_0 & entryUops_0_pdInfo_isRet | oldest_1 & entryUops_1_pdInfo_isRet |
    oldest_2 & entryUops_2_pdInfo_isRet | oldest_3 & entryUops_3_pdInfo_isRet | oldest_4 & entryUops_4_pdInfo_isRet |
    oldest_5 & entryUops_5_pdInfo_isRet | oldest_6 & entryUops_6_pdInfo_isRet | oldest_7 & entryUops_7_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_jumpTarget = _io_issue_bits_T_358 | _io_issue_bits_T_352; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ldst = _io_issue_bits_T_343 | _io_issue_bits_T_337; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs1 = _io_issue_bits_T_328 | _io_issue_bits_T_322; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs2 = _io_issue_bits_T_313 | _io_issue_bits_T_307; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdst = _io_issue_bits_T_298 | _io_issue_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1 = _io_issue_bits_T_283 | _io_issue_bits_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2 = _io_issue_bits_T_268 | _io_issue_bits_T_262; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_oldPdst = _io_issue_bits_T_253 | _io_issue_bits_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs1Valid = oldest_0 & entryUops_0_rs1Valid | oldest_1 & entryUops_1_rs1Valid | oldest_2 &
    entryUops_2_rs1Valid | oldest_3 & entryUops_3_rs1Valid | oldest_4 & entryUops_4_rs1Valid | oldest_5 &
    entryUops_5_rs1Valid | oldest_6 & entryUops_6_rs1Valid | oldest_7 & entryUops_7_rs1Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs2Valid = oldest_0 & entryUops_0_rs2Valid | oldest_1 & entryUops_1_rs2Valid | oldest_2 &
    entryUops_2_rs2Valid | oldest_3 & entryUops_3_rs2Valid | oldest_4 & entryUops_4_rs2Valid | oldest_5 &
    entryUops_5_rs2Valid | oldest_6 & entryUops_6_rs2Valid | oldest_7 & entryUops_7_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rdValid = oldest_0 & entryUops_0_rdValid | oldest_1 & entryUops_1_rdValid | oldest_2 &
    entryUops_2_rdValid | oldest_3 & entryUops_3_rdValid | oldest_4 & entryUops_4_rdValid | oldest_5 &
    entryUops_5_rdValid | oldest_6 & entryUops_6_rdValid | oldest_7 & entryUops_7_rdValid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_value = _io_issue_bits_T_193 | _io_issue_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx_flag = oldest_0 & entryUops_0_robIdx_flag | oldest_1 & entryUops_1_robIdx_flag | oldest_2
     & entryUops_2_robIdx_flag | oldest_3 & entryUops_3_robIdx_flag | oldest_4 & entryUops_4_robIdx_flag | oldest_5 &
    entryUops_5_robIdx_flag | oldest_6 & entryUops_6_robIdx_flag | oldest_7 & entryUops_7_robIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_value = _io_issue_bits_T_163 | _io_issue_bits_T_157; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull_flag = oldest_0 & entryUops_0_robIdxFull_flag | oldest_1 & entryUops_1_robIdxFull_flag
     | oldest_2 & entryUops_2_robIdxFull_flag | oldest_3 & entryUops_3_robIdxFull_flag | oldest_4 &
    entryUops_4_robIdxFull_flag | oldest_5 & entryUops_5_robIdxFull_flag | oldest_6 & entryUops_6_robIdxFull_flag |
    oldest_7 & entryUops_7_robIdxFull_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lqIdx_value = _io_issue_bits_T_133 | _io_issue_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lqIdx_flag = oldest_0 & entryUops_0_lqIdx_flag | oldest_1 & entryUops_1_lqIdx_flag | oldest_2 &
    entryUops_2_lqIdx_flag | oldest_3 & entryUops_3_lqIdx_flag | oldest_4 & entryUops_4_lqIdx_flag | oldest_5 &
    entryUops_5_lqIdx_flag | oldest_6 & entryUops_6_lqIdx_flag | oldest_7 & entryUops_7_lqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_sqIdx_value = _io_issue_bits_T_103 | _io_issue_bits_T_97; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_sqIdx_flag = oldest_0 & entryUops_0_sqIdx_flag | oldest_1 & entryUops_1_sqIdx_flag | oldest_2 &
    entryUops_2_sqIdx_flag | oldest_3 & entryUops_3_sqIdx_flag | oldest_4 & entryUops_4_sqIdx_flag | oldest_5 &
    entryUops_5_sqIdx_flag | oldest_6 & entryUops_6_sqIdx_flag | oldest_7 & entryUops_7_sqIdx_flag; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_issueQueue = _io_issue_bits_T_73 | _io_issue_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1Busy = oldest_0 & entryUops_0_prs1Busy | oldest_1 & entryUops_1_prs1Busy | oldest_2 &
    entryUops_2_prs1Busy | oldest_3 & entryUops_3_prs1Busy | oldest_4 & entryUops_4_prs1Busy | oldest_5 &
    entryUops_5_prs1Busy | oldest_6 & entryUops_6_prs1Busy | oldest_7 & entryUops_7_prs1Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2Busy = oldest_0 & entryUops_0_prs2Busy | oldest_1 & entryUops_1_prs2Busy | oldest_2 &
    entryUops_2_prs2Busy | oldest_3 & entryUops_3_prs2Busy | oldest_4 & entryUops_4_prs2Busy | oldest_5 &
    entryUops_5_prs2Busy | oldest_6 & entryUops_6_prs2Busy | oldest_7 & entryUops_7_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_isSta = oldest_0 & entryUops_0_isSta | oldest_1 & entryUops_1_isSta | oldest_2 &
    entryUops_2_isSta | oldest_3 & entryUops_3_isSta | oldest_4 & entryUops_4_isSta | oldest_5 & entryUops_5_isSta |
    oldest_6 & entryUops_6_isSta | oldest_7 & entryUops_7_isSta; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_isStd = oldest_0 & entryUops_0_isStd | oldest_1 & entryUops_1_isStd | oldest_2 &
    entryUops_2_isStd | oldest_3 & entryUops_3_isStd | oldest_4 & entryUops_4_isStd | oldest_5 & entryUops_5_isStd |
    oldest_6 & entryUops_6_isStd | oldest_7 & entryUops_7_isStd; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_freeEntries = _io_freeEntries_T_4 + _io_freeEntries_T_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 206:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_1 <= _GEN_88;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_2 <= _GEN_176;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_3 <= _GEN_264;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_4 <= _GEN_352;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_5 <= _GEN_440;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_6 <= _GEN_528;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:29]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:39]
      entryValid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:21]
    end else begin
      entryValid_7 <= _GEN_616;
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_0_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_1_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_2_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_3_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_4_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_5_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_6_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_imm <= io_enq_bits_imm; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_pdst <= io_enq_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_rdValid <= io_enq_bits_rdValid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_robIdx_value <= io_enq_bits_robIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_robIdx_flag <= io_enq_bits_robIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_robIdxFull_value <= io_enq_bits_robIdxFull_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_robIdxFull_flag <= io_enq_bits_robIdxFull_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_lqIdx_value <= io_enq_bits_lqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_lqIdx_flag <= io_enq_bits_lqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_sqIdx_value <= io_enq_bits_sqIdx_value; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_sqIdx_flag <= io_enq_bits_sqIdx_flag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_prs1Busy <= io_enq_bits_prs1Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_isSta <= io_enq_bits_isSta; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:37]
      entryUops_7_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 182:20]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_0 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_0 <= p1Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_1 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_1 <= p1Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_2 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_2 <= p1Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_3 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_3 <= p1Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_4 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_4 <= p1Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_5 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_5 <= p1Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_6 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_6 <= p1Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:29]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:23]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP1Ready_7 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:23]
    end else begin
      entryP1Ready_7 <= p1Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_0 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_0 <= p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_1 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_1 <= p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_2 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_2 <= p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_3 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_3 <= p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_4 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_4 <= p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_5 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_5 <= p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_6 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_6 <= p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 47:29]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:68]
      entryP2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:23]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:43]
      entryP2Ready_7 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 174:23]
    end else begin
      entryP2Ready_7 <= p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 177:23]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_1 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_2 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_3 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_4 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_5 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_6 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_0_7 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_0 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_2 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_3 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_4 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_5 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_6 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_1_7 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_504) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_0 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_1 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_3 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_4 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_5 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_6 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_2_7 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_513) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_0 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_1 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_2 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_4 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_5 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_6 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_3_7 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_522) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_0 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_1 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_2 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_3 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_5 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_6 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_4_7 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_531) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_0 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_1 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_2 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_3 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_4 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_6 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_5_7 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_540) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_0 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_1 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_2 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_3 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_4 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_5 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_6_7 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_549) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (_T_490) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_0 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_1 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_2 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_3 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_4 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_5 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 52:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:96]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 192:45]
      age_7_6 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:19]
    end else if (_T_558) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 195:45]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 197:19]
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
  entryValid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entryValid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entryValid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entryValid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entryValid_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entryValid_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entryValid_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entryValid_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entryUops_0_pc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entryUops_0_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entryUops_0_ctrl_fuType = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  entryUops_0_ctrl_aluOp = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  entryUops_0_ctrl_bruOp = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  entryUops_0_ctrl_lsuOp = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  entryUops_0_ctrl_csrOp = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  entryUops_0_ctrl_mulOp = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  entryUops_0_ctrl_divOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  entryUops_0_ctrl_src1Type = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  entryUops_0_ctrl_src2Type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  entryUops_0_ctrl_immType = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  entryUops_0_ctrl_rfWen = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  entryUops_0_ctrl_memRead = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  entryUops_0_ctrl_memWrite = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entryUops_0_ctrl_csrWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entryUops_0_ctrl_isBranch = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entryUops_0_ctrl_isJump = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entryUops_0_ctrl_isPriv = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entryUops_0_excpVec = _RAND_27[9:0];
  _RAND_28 = {1{`RANDOM}};
  entryUops_0_imm = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  entryUops_0_csrAddress = _RAND_29[13:0];
  _RAND_30 = {1{`RANDOM}};
  entryUops_0_pdInfo_valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entryUops_0_pdInfo_isBr = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJal = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entryUops_0_pdInfo_isJalr = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entryUops_0_pdInfo_isCall = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entryUops_0_pdInfo_isRet = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  entryUops_0_pdInfo_jumpTarget = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entryUops_0_ldst = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  entryUops_0_lrs1 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  entryUops_0_lrs2 = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  entryUops_0_pdst = _RAND_40[6:0];
  _RAND_41 = {1{`RANDOM}};
  entryUops_0_prs1 = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  entryUops_0_prs2 = _RAND_42[6:0];
  _RAND_43 = {1{`RANDOM}};
  entryUops_0_oldPdst = _RAND_43[6:0];
  _RAND_44 = {1{`RANDOM}};
  entryUops_0_rs1Valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entryUops_0_rs2Valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entryUops_0_rdValid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  entryUops_0_robIdx_value = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  entryUops_0_robIdx_flag = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entryUops_0_robIdxFull_value = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  entryUops_0_robIdxFull_flag = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entryUops_0_lqIdx_value = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  entryUops_0_lqIdx_flag = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entryUops_0_sqIdx_value = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  entryUops_0_sqIdx_flag = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  entryUops_0_issueQueue = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  entryUops_0_prs1Busy = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  entryUops_0_prs2Busy = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  entryUops_0_isSta = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  entryUops_0_isStd = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  entryUops_1_pc = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  entryUops_1_inst = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  entryUops_1_ctrl_fuType = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  entryUops_1_ctrl_aluOp = _RAND_63[4:0];
  _RAND_64 = {1{`RANDOM}};
  entryUops_1_ctrl_bruOp = _RAND_64[3:0];
  _RAND_65 = {1{`RANDOM}};
  entryUops_1_ctrl_lsuOp = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  entryUops_1_ctrl_csrOp = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  entryUops_1_ctrl_mulOp = _RAND_67[2:0];
  _RAND_68 = {1{`RANDOM}};
  entryUops_1_ctrl_divOp = _RAND_68[2:0];
  _RAND_69 = {1{`RANDOM}};
  entryUops_1_ctrl_src1Type = _RAND_69[2:0];
  _RAND_70 = {1{`RANDOM}};
  entryUops_1_ctrl_src2Type = _RAND_70[2:0];
  _RAND_71 = {1{`RANDOM}};
  entryUops_1_ctrl_immType = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  entryUops_1_ctrl_rfWen = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entryUops_1_ctrl_memRead = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  entryUops_1_ctrl_memWrite = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entryUops_1_ctrl_csrWen = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  entryUops_1_ctrl_isBranch = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  entryUops_1_ctrl_isJump = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  entryUops_1_ctrl_isPriv = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  entryUops_1_excpVec = _RAND_79[9:0];
  _RAND_80 = {1{`RANDOM}};
  entryUops_1_imm = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  entryUops_1_csrAddress = _RAND_81[13:0];
  _RAND_82 = {1{`RANDOM}};
  entryUops_1_pdInfo_valid = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  entryUops_1_pdInfo_isBr = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJal = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  entryUops_1_pdInfo_isJalr = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  entryUops_1_pdInfo_isCall = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  entryUops_1_pdInfo_isRet = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  entryUops_1_pdInfo_jumpTarget = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  entryUops_1_ldst = _RAND_89[4:0];
  _RAND_90 = {1{`RANDOM}};
  entryUops_1_lrs1 = _RAND_90[4:0];
  _RAND_91 = {1{`RANDOM}};
  entryUops_1_lrs2 = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  entryUops_1_pdst = _RAND_92[6:0];
  _RAND_93 = {1{`RANDOM}};
  entryUops_1_prs1 = _RAND_93[6:0];
  _RAND_94 = {1{`RANDOM}};
  entryUops_1_prs2 = _RAND_94[6:0];
  _RAND_95 = {1{`RANDOM}};
  entryUops_1_oldPdst = _RAND_95[6:0];
  _RAND_96 = {1{`RANDOM}};
  entryUops_1_rs1Valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  entryUops_1_rs2Valid = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  entryUops_1_rdValid = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  entryUops_1_robIdx_value = _RAND_99[5:0];
  _RAND_100 = {1{`RANDOM}};
  entryUops_1_robIdx_flag = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  entryUops_1_robIdxFull_value = _RAND_101[5:0];
  _RAND_102 = {1{`RANDOM}};
  entryUops_1_robIdxFull_flag = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  entryUops_1_lqIdx_value = _RAND_103[3:0];
  _RAND_104 = {1{`RANDOM}};
  entryUops_1_lqIdx_flag = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entryUops_1_sqIdx_value = _RAND_105[3:0];
  _RAND_106 = {1{`RANDOM}};
  entryUops_1_sqIdx_flag = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  entryUops_1_issueQueue = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  entryUops_1_prs1Busy = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  entryUops_1_prs2Busy = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entryUops_1_isSta = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entryUops_1_isStd = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  entryUops_2_pc = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  entryUops_2_inst = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  entryUops_2_ctrl_fuType = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  entryUops_2_ctrl_aluOp = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  entryUops_2_ctrl_bruOp = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  entryUops_2_ctrl_lsuOp = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  entryUops_2_ctrl_csrOp = _RAND_118[2:0];
  _RAND_119 = {1{`RANDOM}};
  entryUops_2_ctrl_mulOp = _RAND_119[2:0];
  _RAND_120 = {1{`RANDOM}};
  entryUops_2_ctrl_divOp = _RAND_120[2:0];
  _RAND_121 = {1{`RANDOM}};
  entryUops_2_ctrl_src1Type = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  entryUops_2_ctrl_src2Type = _RAND_122[2:0];
  _RAND_123 = {1{`RANDOM}};
  entryUops_2_ctrl_immType = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  entryUops_2_ctrl_rfWen = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  entryUops_2_ctrl_memRead = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  entryUops_2_ctrl_memWrite = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  entryUops_2_ctrl_csrWen = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  entryUops_2_ctrl_isBranch = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  entryUops_2_ctrl_isJump = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entryUops_2_ctrl_isPriv = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entryUops_2_excpVec = _RAND_131[9:0];
  _RAND_132 = {1{`RANDOM}};
  entryUops_2_imm = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  entryUops_2_csrAddress = _RAND_133[13:0];
  _RAND_134 = {1{`RANDOM}};
  entryUops_2_pdInfo_valid = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entryUops_2_pdInfo_isBr = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJal = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entryUops_2_pdInfo_isJalr = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  entryUops_2_pdInfo_isCall = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  entryUops_2_pdInfo_isRet = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  entryUops_2_pdInfo_jumpTarget = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  entryUops_2_ldst = _RAND_141[4:0];
  _RAND_142 = {1{`RANDOM}};
  entryUops_2_lrs1 = _RAND_142[4:0];
  _RAND_143 = {1{`RANDOM}};
  entryUops_2_lrs2 = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  entryUops_2_pdst = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  entryUops_2_prs1 = _RAND_145[6:0];
  _RAND_146 = {1{`RANDOM}};
  entryUops_2_prs2 = _RAND_146[6:0];
  _RAND_147 = {1{`RANDOM}};
  entryUops_2_oldPdst = _RAND_147[6:0];
  _RAND_148 = {1{`RANDOM}};
  entryUops_2_rs1Valid = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  entryUops_2_rs2Valid = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  entryUops_2_rdValid = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  entryUops_2_robIdx_value = _RAND_151[5:0];
  _RAND_152 = {1{`RANDOM}};
  entryUops_2_robIdx_flag = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  entryUops_2_robIdxFull_value = _RAND_153[5:0];
  _RAND_154 = {1{`RANDOM}};
  entryUops_2_robIdxFull_flag = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  entryUops_2_lqIdx_value = _RAND_155[3:0];
  _RAND_156 = {1{`RANDOM}};
  entryUops_2_lqIdx_flag = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  entryUops_2_sqIdx_value = _RAND_157[3:0];
  _RAND_158 = {1{`RANDOM}};
  entryUops_2_sqIdx_flag = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  entryUops_2_issueQueue = _RAND_159[2:0];
  _RAND_160 = {1{`RANDOM}};
  entryUops_2_prs1Busy = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  entryUops_2_prs2Busy = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  entryUops_2_isSta = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  entryUops_2_isStd = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  entryUops_3_pc = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  entryUops_3_inst = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  entryUops_3_ctrl_fuType = _RAND_166[3:0];
  _RAND_167 = {1{`RANDOM}};
  entryUops_3_ctrl_aluOp = _RAND_167[4:0];
  _RAND_168 = {1{`RANDOM}};
  entryUops_3_ctrl_bruOp = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  entryUops_3_ctrl_lsuOp = _RAND_169[3:0];
  _RAND_170 = {1{`RANDOM}};
  entryUops_3_ctrl_csrOp = _RAND_170[2:0];
  _RAND_171 = {1{`RANDOM}};
  entryUops_3_ctrl_mulOp = _RAND_171[2:0];
  _RAND_172 = {1{`RANDOM}};
  entryUops_3_ctrl_divOp = _RAND_172[2:0];
  _RAND_173 = {1{`RANDOM}};
  entryUops_3_ctrl_src1Type = _RAND_173[2:0];
  _RAND_174 = {1{`RANDOM}};
  entryUops_3_ctrl_src2Type = _RAND_174[2:0];
  _RAND_175 = {1{`RANDOM}};
  entryUops_3_ctrl_immType = _RAND_175[3:0];
  _RAND_176 = {1{`RANDOM}};
  entryUops_3_ctrl_rfWen = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  entryUops_3_ctrl_memRead = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  entryUops_3_ctrl_memWrite = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  entryUops_3_ctrl_csrWen = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  entryUops_3_ctrl_isBranch = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  entryUops_3_ctrl_isJump = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  entryUops_3_ctrl_isPriv = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  entryUops_3_excpVec = _RAND_183[9:0];
  _RAND_184 = {1{`RANDOM}};
  entryUops_3_imm = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  entryUops_3_csrAddress = _RAND_185[13:0];
  _RAND_186 = {1{`RANDOM}};
  entryUops_3_pdInfo_valid = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  entryUops_3_pdInfo_isBr = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJal = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  entryUops_3_pdInfo_isJalr = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  entryUops_3_pdInfo_isCall = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  entryUops_3_pdInfo_isRet = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  entryUops_3_pdInfo_jumpTarget = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  entryUops_3_ldst = _RAND_193[4:0];
  _RAND_194 = {1{`RANDOM}};
  entryUops_3_lrs1 = _RAND_194[4:0];
  _RAND_195 = {1{`RANDOM}};
  entryUops_3_lrs2 = _RAND_195[4:0];
  _RAND_196 = {1{`RANDOM}};
  entryUops_3_pdst = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  entryUops_3_prs1 = _RAND_197[6:0];
  _RAND_198 = {1{`RANDOM}};
  entryUops_3_prs2 = _RAND_198[6:0];
  _RAND_199 = {1{`RANDOM}};
  entryUops_3_oldPdst = _RAND_199[6:0];
  _RAND_200 = {1{`RANDOM}};
  entryUops_3_rs1Valid = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  entryUops_3_rs2Valid = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  entryUops_3_rdValid = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  entryUops_3_robIdx_value = _RAND_203[5:0];
  _RAND_204 = {1{`RANDOM}};
  entryUops_3_robIdx_flag = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  entryUops_3_robIdxFull_value = _RAND_205[5:0];
  _RAND_206 = {1{`RANDOM}};
  entryUops_3_robIdxFull_flag = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  entryUops_3_lqIdx_value = _RAND_207[3:0];
  _RAND_208 = {1{`RANDOM}};
  entryUops_3_lqIdx_flag = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  entryUops_3_sqIdx_value = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  entryUops_3_sqIdx_flag = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  entryUops_3_issueQueue = _RAND_211[2:0];
  _RAND_212 = {1{`RANDOM}};
  entryUops_3_prs1Busy = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  entryUops_3_prs2Busy = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  entryUops_3_isSta = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  entryUops_3_isStd = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  entryUops_4_pc = _RAND_216[31:0];
  _RAND_217 = {1{`RANDOM}};
  entryUops_4_inst = _RAND_217[31:0];
  _RAND_218 = {1{`RANDOM}};
  entryUops_4_ctrl_fuType = _RAND_218[3:0];
  _RAND_219 = {1{`RANDOM}};
  entryUops_4_ctrl_aluOp = _RAND_219[4:0];
  _RAND_220 = {1{`RANDOM}};
  entryUops_4_ctrl_bruOp = _RAND_220[3:0];
  _RAND_221 = {1{`RANDOM}};
  entryUops_4_ctrl_lsuOp = _RAND_221[3:0];
  _RAND_222 = {1{`RANDOM}};
  entryUops_4_ctrl_csrOp = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  entryUops_4_ctrl_mulOp = _RAND_223[2:0];
  _RAND_224 = {1{`RANDOM}};
  entryUops_4_ctrl_divOp = _RAND_224[2:0];
  _RAND_225 = {1{`RANDOM}};
  entryUops_4_ctrl_src1Type = _RAND_225[2:0];
  _RAND_226 = {1{`RANDOM}};
  entryUops_4_ctrl_src2Type = _RAND_226[2:0];
  _RAND_227 = {1{`RANDOM}};
  entryUops_4_ctrl_immType = _RAND_227[3:0];
  _RAND_228 = {1{`RANDOM}};
  entryUops_4_ctrl_rfWen = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  entryUops_4_ctrl_memRead = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  entryUops_4_ctrl_memWrite = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  entryUops_4_ctrl_csrWen = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  entryUops_4_ctrl_isBranch = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  entryUops_4_ctrl_isJump = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  entryUops_4_ctrl_isPriv = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  entryUops_4_excpVec = _RAND_235[9:0];
  _RAND_236 = {1{`RANDOM}};
  entryUops_4_imm = _RAND_236[31:0];
  _RAND_237 = {1{`RANDOM}};
  entryUops_4_csrAddress = _RAND_237[13:0];
  _RAND_238 = {1{`RANDOM}};
  entryUops_4_pdInfo_valid = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  entryUops_4_pdInfo_isBr = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJal = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  entryUops_4_pdInfo_isJalr = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  entryUops_4_pdInfo_isCall = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  entryUops_4_pdInfo_isRet = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  entryUops_4_pdInfo_jumpTarget = _RAND_244[31:0];
  _RAND_245 = {1{`RANDOM}};
  entryUops_4_ldst = _RAND_245[4:0];
  _RAND_246 = {1{`RANDOM}};
  entryUops_4_lrs1 = _RAND_246[4:0];
  _RAND_247 = {1{`RANDOM}};
  entryUops_4_lrs2 = _RAND_247[4:0];
  _RAND_248 = {1{`RANDOM}};
  entryUops_4_pdst = _RAND_248[6:0];
  _RAND_249 = {1{`RANDOM}};
  entryUops_4_prs1 = _RAND_249[6:0];
  _RAND_250 = {1{`RANDOM}};
  entryUops_4_prs2 = _RAND_250[6:0];
  _RAND_251 = {1{`RANDOM}};
  entryUops_4_oldPdst = _RAND_251[6:0];
  _RAND_252 = {1{`RANDOM}};
  entryUops_4_rs1Valid = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  entryUops_4_rs2Valid = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  entryUops_4_rdValid = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  entryUops_4_robIdx_value = _RAND_255[5:0];
  _RAND_256 = {1{`RANDOM}};
  entryUops_4_robIdx_flag = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  entryUops_4_robIdxFull_value = _RAND_257[5:0];
  _RAND_258 = {1{`RANDOM}};
  entryUops_4_robIdxFull_flag = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  entryUops_4_lqIdx_value = _RAND_259[3:0];
  _RAND_260 = {1{`RANDOM}};
  entryUops_4_lqIdx_flag = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  entryUops_4_sqIdx_value = _RAND_261[3:0];
  _RAND_262 = {1{`RANDOM}};
  entryUops_4_sqIdx_flag = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  entryUops_4_issueQueue = _RAND_263[2:0];
  _RAND_264 = {1{`RANDOM}};
  entryUops_4_prs1Busy = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  entryUops_4_prs2Busy = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  entryUops_4_isSta = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  entryUops_4_isStd = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  entryUops_5_pc = _RAND_268[31:0];
  _RAND_269 = {1{`RANDOM}};
  entryUops_5_inst = _RAND_269[31:0];
  _RAND_270 = {1{`RANDOM}};
  entryUops_5_ctrl_fuType = _RAND_270[3:0];
  _RAND_271 = {1{`RANDOM}};
  entryUops_5_ctrl_aluOp = _RAND_271[4:0];
  _RAND_272 = {1{`RANDOM}};
  entryUops_5_ctrl_bruOp = _RAND_272[3:0];
  _RAND_273 = {1{`RANDOM}};
  entryUops_5_ctrl_lsuOp = _RAND_273[3:0];
  _RAND_274 = {1{`RANDOM}};
  entryUops_5_ctrl_csrOp = _RAND_274[2:0];
  _RAND_275 = {1{`RANDOM}};
  entryUops_5_ctrl_mulOp = _RAND_275[2:0];
  _RAND_276 = {1{`RANDOM}};
  entryUops_5_ctrl_divOp = _RAND_276[2:0];
  _RAND_277 = {1{`RANDOM}};
  entryUops_5_ctrl_src1Type = _RAND_277[2:0];
  _RAND_278 = {1{`RANDOM}};
  entryUops_5_ctrl_src2Type = _RAND_278[2:0];
  _RAND_279 = {1{`RANDOM}};
  entryUops_5_ctrl_immType = _RAND_279[3:0];
  _RAND_280 = {1{`RANDOM}};
  entryUops_5_ctrl_rfWen = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  entryUops_5_ctrl_memRead = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  entryUops_5_ctrl_memWrite = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  entryUops_5_ctrl_csrWen = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  entryUops_5_ctrl_isBranch = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  entryUops_5_ctrl_isJump = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  entryUops_5_ctrl_isPriv = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  entryUops_5_excpVec = _RAND_287[9:0];
  _RAND_288 = {1{`RANDOM}};
  entryUops_5_imm = _RAND_288[31:0];
  _RAND_289 = {1{`RANDOM}};
  entryUops_5_csrAddress = _RAND_289[13:0];
  _RAND_290 = {1{`RANDOM}};
  entryUops_5_pdInfo_valid = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  entryUops_5_pdInfo_isBr = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJal = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  entryUops_5_pdInfo_isJalr = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  entryUops_5_pdInfo_isCall = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  entryUops_5_pdInfo_isRet = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  entryUops_5_pdInfo_jumpTarget = _RAND_296[31:0];
  _RAND_297 = {1{`RANDOM}};
  entryUops_5_ldst = _RAND_297[4:0];
  _RAND_298 = {1{`RANDOM}};
  entryUops_5_lrs1 = _RAND_298[4:0];
  _RAND_299 = {1{`RANDOM}};
  entryUops_5_lrs2 = _RAND_299[4:0];
  _RAND_300 = {1{`RANDOM}};
  entryUops_5_pdst = _RAND_300[6:0];
  _RAND_301 = {1{`RANDOM}};
  entryUops_5_prs1 = _RAND_301[6:0];
  _RAND_302 = {1{`RANDOM}};
  entryUops_5_prs2 = _RAND_302[6:0];
  _RAND_303 = {1{`RANDOM}};
  entryUops_5_oldPdst = _RAND_303[6:0];
  _RAND_304 = {1{`RANDOM}};
  entryUops_5_rs1Valid = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  entryUops_5_rs2Valid = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  entryUops_5_rdValid = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  entryUops_5_robIdx_value = _RAND_307[5:0];
  _RAND_308 = {1{`RANDOM}};
  entryUops_5_robIdx_flag = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  entryUops_5_robIdxFull_value = _RAND_309[5:0];
  _RAND_310 = {1{`RANDOM}};
  entryUops_5_robIdxFull_flag = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  entryUops_5_lqIdx_value = _RAND_311[3:0];
  _RAND_312 = {1{`RANDOM}};
  entryUops_5_lqIdx_flag = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  entryUops_5_sqIdx_value = _RAND_313[3:0];
  _RAND_314 = {1{`RANDOM}};
  entryUops_5_sqIdx_flag = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  entryUops_5_issueQueue = _RAND_315[2:0];
  _RAND_316 = {1{`RANDOM}};
  entryUops_5_prs1Busy = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  entryUops_5_prs2Busy = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  entryUops_5_isSta = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  entryUops_5_isStd = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  entryUops_6_pc = _RAND_320[31:0];
  _RAND_321 = {1{`RANDOM}};
  entryUops_6_inst = _RAND_321[31:0];
  _RAND_322 = {1{`RANDOM}};
  entryUops_6_ctrl_fuType = _RAND_322[3:0];
  _RAND_323 = {1{`RANDOM}};
  entryUops_6_ctrl_aluOp = _RAND_323[4:0];
  _RAND_324 = {1{`RANDOM}};
  entryUops_6_ctrl_bruOp = _RAND_324[3:0];
  _RAND_325 = {1{`RANDOM}};
  entryUops_6_ctrl_lsuOp = _RAND_325[3:0];
  _RAND_326 = {1{`RANDOM}};
  entryUops_6_ctrl_csrOp = _RAND_326[2:0];
  _RAND_327 = {1{`RANDOM}};
  entryUops_6_ctrl_mulOp = _RAND_327[2:0];
  _RAND_328 = {1{`RANDOM}};
  entryUops_6_ctrl_divOp = _RAND_328[2:0];
  _RAND_329 = {1{`RANDOM}};
  entryUops_6_ctrl_src1Type = _RAND_329[2:0];
  _RAND_330 = {1{`RANDOM}};
  entryUops_6_ctrl_src2Type = _RAND_330[2:0];
  _RAND_331 = {1{`RANDOM}};
  entryUops_6_ctrl_immType = _RAND_331[3:0];
  _RAND_332 = {1{`RANDOM}};
  entryUops_6_ctrl_rfWen = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  entryUops_6_ctrl_memRead = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  entryUops_6_ctrl_memWrite = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  entryUops_6_ctrl_csrWen = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  entryUops_6_ctrl_isBranch = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  entryUops_6_ctrl_isJump = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  entryUops_6_ctrl_isPriv = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  entryUops_6_excpVec = _RAND_339[9:0];
  _RAND_340 = {1{`RANDOM}};
  entryUops_6_imm = _RAND_340[31:0];
  _RAND_341 = {1{`RANDOM}};
  entryUops_6_csrAddress = _RAND_341[13:0];
  _RAND_342 = {1{`RANDOM}};
  entryUops_6_pdInfo_valid = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  entryUops_6_pdInfo_isBr = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJal = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  entryUops_6_pdInfo_isJalr = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  entryUops_6_pdInfo_isCall = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  entryUops_6_pdInfo_isRet = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  entryUops_6_pdInfo_jumpTarget = _RAND_348[31:0];
  _RAND_349 = {1{`RANDOM}};
  entryUops_6_ldst = _RAND_349[4:0];
  _RAND_350 = {1{`RANDOM}};
  entryUops_6_lrs1 = _RAND_350[4:0];
  _RAND_351 = {1{`RANDOM}};
  entryUops_6_lrs2 = _RAND_351[4:0];
  _RAND_352 = {1{`RANDOM}};
  entryUops_6_pdst = _RAND_352[6:0];
  _RAND_353 = {1{`RANDOM}};
  entryUops_6_prs1 = _RAND_353[6:0];
  _RAND_354 = {1{`RANDOM}};
  entryUops_6_prs2 = _RAND_354[6:0];
  _RAND_355 = {1{`RANDOM}};
  entryUops_6_oldPdst = _RAND_355[6:0];
  _RAND_356 = {1{`RANDOM}};
  entryUops_6_rs1Valid = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  entryUops_6_rs2Valid = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  entryUops_6_rdValid = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  entryUops_6_robIdx_value = _RAND_359[5:0];
  _RAND_360 = {1{`RANDOM}};
  entryUops_6_robIdx_flag = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  entryUops_6_robIdxFull_value = _RAND_361[5:0];
  _RAND_362 = {1{`RANDOM}};
  entryUops_6_robIdxFull_flag = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  entryUops_6_lqIdx_value = _RAND_363[3:0];
  _RAND_364 = {1{`RANDOM}};
  entryUops_6_lqIdx_flag = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  entryUops_6_sqIdx_value = _RAND_365[3:0];
  _RAND_366 = {1{`RANDOM}};
  entryUops_6_sqIdx_flag = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  entryUops_6_issueQueue = _RAND_367[2:0];
  _RAND_368 = {1{`RANDOM}};
  entryUops_6_prs1Busy = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  entryUops_6_prs2Busy = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  entryUops_6_isSta = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  entryUops_6_isStd = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  entryUops_7_pc = _RAND_372[31:0];
  _RAND_373 = {1{`RANDOM}};
  entryUops_7_inst = _RAND_373[31:0];
  _RAND_374 = {1{`RANDOM}};
  entryUops_7_ctrl_fuType = _RAND_374[3:0];
  _RAND_375 = {1{`RANDOM}};
  entryUops_7_ctrl_aluOp = _RAND_375[4:0];
  _RAND_376 = {1{`RANDOM}};
  entryUops_7_ctrl_bruOp = _RAND_376[3:0];
  _RAND_377 = {1{`RANDOM}};
  entryUops_7_ctrl_lsuOp = _RAND_377[3:0];
  _RAND_378 = {1{`RANDOM}};
  entryUops_7_ctrl_csrOp = _RAND_378[2:0];
  _RAND_379 = {1{`RANDOM}};
  entryUops_7_ctrl_mulOp = _RAND_379[2:0];
  _RAND_380 = {1{`RANDOM}};
  entryUops_7_ctrl_divOp = _RAND_380[2:0];
  _RAND_381 = {1{`RANDOM}};
  entryUops_7_ctrl_src1Type = _RAND_381[2:0];
  _RAND_382 = {1{`RANDOM}};
  entryUops_7_ctrl_src2Type = _RAND_382[2:0];
  _RAND_383 = {1{`RANDOM}};
  entryUops_7_ctrl_immType = _RAND_383[3:0];
  _RAND_384 = {1{`RANDOM}};
  entryUops_7_ctrl_rfWen = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  entryUops_7_ctrl_memRead = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  entryUops_7_ctrl_memWrite = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  entryUops_7_ctrl_csrWen = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  entryUops_7_ctrl_isBranch = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  entryUops_7_ctrl_isJump = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  entryUops_7_ctrl_isPriv = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  entryUops_7_excpVec = _RAND_391[9:0];
  _RAND_392 = {1{`RANDOM}};
  entryUops_7_imm = _RAND_392[31:0];
  _RAND_393 = {1{`RANDOM}};
  entryUops_7_csrAddress = _RAND_393[13:0];
  _RAND_394 = {1{`RANDOM}};
  entryUops_7_pdInfo_valid = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  entryUops_7_pdInfo_isBr = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJal = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  entryUops_7_pdInfo_isJalr = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  entryUops_7_pdInfo_isCall = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  entryUops_7_pdInfo_isRet = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  entryUops_7_pdInfo_jumpTarget = _RAND_400[31:0];
  _RAND_401 = {1{`RANDOM}};
  entryUops_7_ldst = _RAND_401[4:0];
  _RAND_402 = {1{`RANDOM}};
  entryUops_7_lrs1 = _RAND_402[4:0];
  _RAND_403 = {1{`RANDOM}};
  entryUops_7_lrs2 = _RAND_403[4:0];
  _RAND_404 = {1{`RANDOM}};
  entryUops_7_pdst = _RAND_404[6:0];
  _RAND_405 = {1{`RANDOM}};
  entryUops_7_prs1 = _RAND_405[6:0];
  _RAND_406 = {1{`RANDOM}};
  entryUops_7_prs2 = _RAND_406[6:0];
  _RAND_407 = {1{`RANDOM}};
  entryUops_7_oldPdst = _RAND_407[6:0];
  _RAND_408 = {1{`RANDOM}};
  entryUops_7_rs1Valid = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  entryUops_7_rs2Valid = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  entryUops_7_rdValid = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  entryUops_7_robIdx_value = _RAND_411[5:0];
  _RAND_412 = {1{`RANDOM}};
  entryUops_7_robIdx_flag = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  entryUops_7_robIdxFull_value = _RAND_413[5:0];
  _RAND_414 = {1{`RANDOM}};
  entryUops_7_robIdxFull_flag = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  entryUops_7_lqIdx_value = _RAND_415[3:0];
  _RAND_416 = {1{`RANDOM}};
  entryUops_7_lqIdx_flag = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  entryUops_7_sqIdx_value = _RAND_417[3:0];
  _RAND_418 = {1{`RANDOM}};
  entryUops_7_sqIdx_flag = _RAND_418[0:0];
  _RAND_419 = {1{`RANDOM}};
  entryUops_7_issueQueue = _RAND_419[2:0];
  _RAND_420 = {1{`RANDOM}};
  entryUops_7_prs1Busy = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  entryUops_7_prs2Busy = _RAND_421[0:0];
  _RAND_422 = {1{`RANDOM}};
  entryUops_7_isSta = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  entryUops_7_isStd = _RAND_423[0:0];
  _RAND_424 = {1{`RANDOM}};
  entryP1Ready_0 = _RAND_424[0:0];
  _RAND_425 = {1{`RANDOM}};
  entryP1Ready_1 = _RAND_425[0:0];
  _RAND_426 = {1{`RANDOM}};
  entryP1Ready_2 = _RAND_426[0:0];
  _RAND_427 = {1{`RANDOM}};
  entryP1Ready_3 = _RAND_427[0:0];
  _RAND_428 = {1{`RANDOM}};
  entryP1Ready_4 = _RAND_428[0:0];
  _RAND_429 = {1{`RANDOM}};
  entryP1Ready_5 = _RAND_429[0:0];
  _RAND_430 = {1{`RANDOM}};
  entryP1Ready_6 = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  entryP1Ready_7 = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  entryP2Ready_0 = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  entryP2Ready_1 = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  entryP2Ready_2 = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  entryP2Ready_3 = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  entryP2Ready_4 = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  entryP2Ready_5 = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  entryP2Ready_6 = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  entryP2Ready_7 = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  age_0_1 = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  age_0_2 = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  age_0_3 = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  age_0_4 = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  age_0_5 = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  age_0_6 = _RAND_445[0:0];
  _RAND_446 = {1{`RANDOM}};
  age_0_7 = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  age_1_0 = _RAND_447[0:0];
  _RAND_448 = {1{`RANDOM}};
  age_1_2 = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  age_1_3 = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  age_1_4 = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  age_1_5 = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  age_1_6 = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  age_1_7 = _RAND_453[0:0];
  _RAND_454 = {1{`RANDOM}};
  age_2_0 = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  age_2_1 = _RAND_455[0:0];
  _RAND_456 = {1{`RANDOM}};
  age_2_3 = _RAND_456[0:0];
  _RAND_457 = {1{`RANDOM}};
  age_2_4 = _RAND_457[0:0];
  _RAND_458 = {1{`RANDOM}};
  age_2_5 = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  age_2_6 = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  age_2_7 = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  age_3_0 = _RAND_461[0:0];
  _RAND_462 = {1{`RANDOM}};
  age_3_1 = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  age_3_2 = _RAND_463[0:0];
  _RAND_464 = {1{`RANDOM}};
  age_3_4 = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  age_3_5 = _RAND_465[0:0];
  _RAND_466 = {1{`RANDOM}};
  age_3_6 = _RAND_466[0:0];
  _RAND_467 = {1{`RANDOM}};
  age_3_7 = _RAND_467[0:0];
  _RAND_468 = {1{`RANDOM}};
  age_4_0 = _RAND_468[0:0];
  _RAND_469 = {1{`RANDOM}};
  age_4_1 = _RAND_469[0:0];
  _RAND_470 = {1{`RANDOM}};
  age_4_2 = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  age_4_3 = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  age_4_5 = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  age_4_6 = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  age_4_7 = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  age_5_0 = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  age_5_1 = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  age_5_2 = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  age_5_3 = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  age_5_4 = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  age_5_6 = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  age_5_7 = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  age_6_0 = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  age_6_1 = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  age_6_2 = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  age_6_3 = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  age_6_4 = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  age_6_5 = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  age_6_7 = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  age_7_0 = _RAND_489[0:0];
  _RAND_490 = {1{`RANDOM}};
  age_7_1 = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  age_7_2 = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  age_7_3 = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  age_7_4 = _RAND_493[0:0];
  _RAND_494 = {1{`RANDOM}};
  age_7_5 = _RAND_494[0:0];
  _RAND_495 = {1{`RANDOM}};
  age_7_6 = _RAND_495[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
