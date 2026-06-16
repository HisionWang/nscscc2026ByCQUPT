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
  input  [6:0]  io_enq_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [5:0]  io_enq_bits_robIdx, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0]  io_enq_bits_robIdxFull, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [3:0]  io_enq_bits_sqIdx, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [2:0]  io_enq_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_enq_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
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
  output [6:0]  io_issue_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_oldPdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [5:0]  io_issue_bits_robIdx, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [6:0]  io_issue_bits_robIdxFull, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0]  io_issue_bits_sqIdx, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [2:0]  io_issue_bits_issueQueue, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output        io_issue_bits_isStd, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input         io_redirect_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [5:0]  io_redirect_robIdx, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg [31:0] uops_0_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_0_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_0_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_0_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_0_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_0_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_0_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_0_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_0_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_0_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_0_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_0_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_0_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_0_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_0_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_0_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_0_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_0_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_0_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_0_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_1_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_1_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_1_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_1_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_1_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_1_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_1_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_1_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_1_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_1_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_1_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_1_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_1_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_1_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_1_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_1_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_2_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_2_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_2_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_2_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_2_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_2_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_2_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_2_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_2_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_2_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_2_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_2_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_2_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_2_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_2_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_2_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_3_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_3_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_3_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_3_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_3_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_3_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_3_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_3_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_3_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_3_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_3_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_3_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_3_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_3_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_3_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_3_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_4_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_4_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_4_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_4_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_4_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_4_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_4_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_4_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_4_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_4_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_4_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_4_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_4_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_4_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_4_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_4_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_5_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_5_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_5_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_5_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_5_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_5_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_5_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_5_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_5_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_5_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_5_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_5_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_5_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_5_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_5_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_5_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_6_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_6_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_6_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_6_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_6_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_6_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_6_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_6_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_6_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_6_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_6_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_6_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_6_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_6_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_6_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_6_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_7_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_7_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_7_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_7_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_7_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_7_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_7_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [9:0] uops_7_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [13:0] uops_7_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [31:0] uops_7_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_7_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_7_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [4:0] uops_7_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [5:0] uops_7_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [3:0] uops_7_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [2:0] uops_7_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  p1Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p1Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
  reg  p2Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  p2Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
  reg  age_0_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  reg  age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
  wire  killed_0_aFlag = uops_0_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire  killed_0_bFlag = io_redirect_robIdx[5]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 87:18]
  wire [5:0] killed_0_aVal = uops_0_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire [4:0] killed_0_bVal = io_redirect_robIdx[4:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 89:18]
  wire [5:0] _GEN_672 = {{1'd0}, killed_0_bVal}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:31]
  wire  _killed_0_T_4 = killed_0_aFlag == killed_0_bFlag ? killed_0_aVal > _GEN_672 : killed_0_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_0 = valid_0 & io_redirect_valid & _killed_0_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_1_aFlag = uops_1_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_1_aVal = uops_1_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_1_T_4 = killed_1_aFlag == killed_0_bFlag ? killed_1_aVal > _GEN_672 : killed_1_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_1 = valid_1 & io_redirect_valid & _killed_1_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_2_aFlag = uops_2_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_2_aVal = uops_2_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_2_T_4 = killed_2_aFlag == killed_0_bFlag ? killed_2_aVal > _GEN_672 : killed_2_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_2 = valid_2 & io_redirect_valid & _killed_2_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_3_aFlag = uops_3_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_3_aVal = uops_3_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_3_T_4 = killed_3_aFlag == killed_0_bFlag ? killed_3_aVal > _GEN_672 : killed_3_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_3 = valid_3 & io_redirect_valid & _killed_3_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_4_aFlag = uops_4_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_4_aVal = uops_4_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_4_T_4 = killed_4_aFlag == killed_0_bFlag ? killed_4_aVal > _GEN_672 : killed_4_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_4 = valid_4 & io_redirect_valid & _killed_4_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_5_aFlag = uops_5_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_5_aVal = uops_5_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_5_T_4 = killed_5_aFlag == killed_0_bFlag ? killed_5_aVal > _GEN_672 : killed_5_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_5 = valid_5 & io_redirect_valid & _killed_5_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_6_aFlag = uops_6_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_6_aVal = uops_6_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_6_T_4 = killed_6_aFlag == killed_0_bFlag ? killed_6_aVal > _GEN_672 : killed_6_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_6 = valid_6 & io_redirect_valid & _killed_6_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  killed_7_aFlag = uops_7_robIdxFull[6]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 86:18]
  wire [5:0] killed_7_aVal = uops_7_robIdxFull[5:0]; // @[src/main/scala/backend/scheduler/IssueQueue.scala 88:18]
  wire  _killed_7_T_4 = killed_7_aFlag == killed_0_bFlag ? killed_7_aVal > _GEN_672 : killed_7_aFlag; // @[src/main/scala/backend/scheduler/IssueQueue.scala 90:8]
  wire  killed_7 = valid_7 & io_redirect_valid & _killed_7_T_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 95:48]
  wire  _request_0_T_2 = ~killed_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_0 = valid_0 & p1Ready_0 & p2Ready_0 & ~killed_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_1_T_2 = ~killed_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_1 = valid_1 & p1Ready_1 & p2Ready_1 & ~killed_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_2_T_2 = ~killed_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_2 = valid_2 & p1Ready_2 & p2Ready_2 & ~killed_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_3_T_2 = ~killed_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_3 = valid_3 & p1Ready_3 & p2Ready_3 & ~killed_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_4_T_2 = ~killed_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_4 = valid_4 & p1Ready_4 & p2Ready_4 & ~killed_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_5_T_2 = ~killed_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_5 = valid_5 & p1Ready_5 & p2Ready_5 & ~killed_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_6_T_2 = ~killed_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_6 = valid_6 & p1Ready_6 & p2Ready_6 & ~killed_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _request_7_T_2 = ~killed_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:55]
  wire  request_7 = valid_7 & p1Ready_7 & p2Ready_7 & ~killed_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:52]
  wire  _T_276 = request_1 & ~age_0_1 | request_2 & ~age_0_2 | request_3 & ~age_0_3 | request_4 & ~age_0_4 | request_5
     & ~age_0_5 | request_6 & ~age_0_6 | request_7 & ~age_0_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_0 = request_0 & ~_T_276; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_297 = request_0 & ~age_1_0 | request_2 & ~age_1_2 | request_3 & ~age_1_3 | request_4 & ~age_1_4 | request_5
     & ~age_1_5 | request_6 & ~age_1_6 | request_7 & ~age_1_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_1 = request_1 & ~_T_297; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_318 = request_0 & ~age_2_0 | request_1 & ~age_2_1 | request_3 & ~age_2_3 | request_4 & ~age_2_4 | request_5
     & ~age_2_5 | request_6 & ~age_2_6 | request_7 & ~age_2_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_2 = request_2 & ~_T_318; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_339 = request_0 & ~age_3_0 | request_1 & ~age_3_1 | request_2 & ~age_3_2 | request_4 & ~age_3_4 | request_5
     & ~age_3_5 | request_6 & ~age_3_6 | request_7 & ~age_3_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_3 = request_3 & ~_T_339; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_360 = request_0 & ~age_4_0 | request_1 & ~age_4_1 | request_2 & ~age_4_2 | request_3 & ~age_4_3 | request_5
     & ~age_4_5 | request_6 & ~age_4_6 | request_7 & ~age_4_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_4 = request_4 & ~_T_360; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_381 = request_0 & ~age_5_0 | request_1 & ~age_5_1 | request_2 & ~age_5_2 | request_3 & ~age_5_3 | request_4
     & ~age_5_4 | request_6 & ~age_5_6 | request_7 & ~age_5_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_5 = request_5 & ~_T_381; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_402 = request_0 & ~age_6_0 | request_1 & ~age_6_1 | request_2 & ~age_6_2 | request_3 & ~age_6_3 | request_4
     & ~age_6_4 | request_5 & ~age_6_5 | request_7 & ~age_6_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_6 = request_6 & ~_T_402; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire  _T_423 = request_0 & ~age_7_0 | request_1 & ~age_7_1 | request_2 & ~age_7_2 | request_3 & ~age_7_3 | request_4
     & ~age_7_4 | request_5 & ~age_7_5 | request_6 & ~age_7_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 120:27]
  wire  oldest_7 = request_7 & ~_T_423; // @[src/main/scala/backend/scheduler/IssueQueue.scala 122:29]
  wire [2:0] _io_issue_bits_T_60 = oldest_0 ? uops_0_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_61 = oldest_1 ? uops_1_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_62 = oldest_2 ? uops_2_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_63 = oldest_3 ? uops_3_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_64 = oldest_4 ? uops_4_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_65 = oldest_5 ? uops_5_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_66 = oldest_6 ? uops_6_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_67 = oldest_7 ? uops_7_issueQueue : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_68 = _io_issue_bits_T_60 | _io_issue_bits_T_61; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_69 = _io_issue_bits_T_68 | _io_issue_bits_T_62; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_70 = _io_issue_bits_T_69 | _io_issue_bits_T_63; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_71 = _io_issue_bits_T_70 | _io_issue_bits_T_64; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_72 = _io_issue_bits_T_71 | _io_issue_bits_T_65; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_73 = _io_issue_bits_T_72 | _io_issue_bits_T_66; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_75 = oldest_0 ? uops_0_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_76 = oldest_1 ? uops_1_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_77 = oldest_2 ? uops_2_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_78 = oldest_3 ? uops_3_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_79 = oldest_4 ? uops_4_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_80 = oldest_5 ? uops_5_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_81 = oldest_6 ? uops_6_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_82 = oldest_7 ? uops_7_sqIdx : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_83 = _io_issue_bits_T_75 | _io_issue_bits_T_76; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_84 = _io_issue_bits_T_83 | _io_issue_bits_T_77; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_85 = _io_issue_bits_T_84 | _io_issue_bits_T_78; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_86 = _io_issue_bits_T_85 | _io_issue_bits_T_79; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_87 = _io_issue_bits_T_86 | _io_issue_bits_T_80; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_88 = _io_issue_bits_T_87 | _io_issue_bits_T_81; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_105 = oldest_0 ? uops_0_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_106 = oldest_1 ? uops_1_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_107 = oldest_2 ? uops_2_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_108 = oldest_3 ? uops_3_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_109 = oldest_4 ? uops_4_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_110 = oldest_5 ? uops_5_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_111 = oldest_6 ? uops_6_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_112 = oldest_7 ? uops_7_robIdxFull : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_113 = _io_issue_bits_T_105 | _io_issue_bits_T_106; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_114 = _io_issue_bits_T_113 | _io_issue_bits_T_107; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_115 = _io_issue_bits_T_114 | _io_issue_bits_T_108; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_116 = _io_issue_bits_T_115 | _io_issue_bits_T_109; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_117 = _io_issue_bits_T_116 | _io_issue_bits_T_110; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_118 = _io_issue_bits_T_117 | _io_issue_bits_T_111; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_120 = oldest_0 ? uops_0_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_121 = oldest_1 ? uops_1_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_122 = oldest_2 ? uops_2_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_123 = oldest_3 ? uops_3_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_124 = oldest_4 ? uops_4_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_125 = oldest_5 ? uops_5_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_126 = oldest_6 ? uops_6_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_127 = oldest_7 ? uops_7_robIdx : 6'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_128 = _io_issue_bits_T_120 | _io_issue_bits_T_121; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_129 = _io_issue_bits_T_128 | _io_issue_bits_T_122; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_130 = _io_issue_bits_T_129 | _io_issue_bits_T_123; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_131 = _io_issue_bits_T_130 | _io_issue_bits_T_124; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_132 = _io_issue_bits_T_131 | _io_issue_bits_T_125; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [5:0] _io_issue_bits_T_133 = _io_issue_bits_T_132 | _io_issue_bits_T_126; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_180 = oldest_0 ? uops_0_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_181 = oldest_1 ? uops_1_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_182 = oldest_2 ? uops_2_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_183 = oldest_3 ? uops_3_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_184 = oldest_4 ? uops_4_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_185 = oldest_5 ? uops_5_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_186 = oldest_6 ? uops_6_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_187 = oldest_7 ? uops_7_oldPdst : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_188 = _io_issue_bits_T_180 | _io_issue_bits_T_181; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_189 = _io_issue_bits_T_188 | _io_issue_bits_T_182; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_190 = _io_issue_bits_T_189 | _io_issue_bits_T_183; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_191 = _io_issue_bits_T_190 | _io_issue_bits_T_184; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_192 = _io_issue_bits_T_191 | _io_issue_bits_T_185; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_193 = _io_issue_bits_T_192 | _io_issue_bits_T_186; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_195 = oldest_0 ? uops_0_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_196 = oldest_1 ? uops_1_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_197 = oldest_2 ? uops_2_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_198 = oldest_3 ? uops_3_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_199 = oldest_4 ? uops_4_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_200 = oldest_5 ? uops_5_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_201 = oldest_6 ? uops_6_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_202 = oldest_7 ? uops_7_prs2 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_203 = _io_issue_bits_T_195 | _io_issue_bits_T_196; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_204 = _io_issue_bits_T_203 | _io_issue_bits_T_197; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_205 = _io_issue_bits_T_204 | _io_issue_bits_T_198; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_206 = _io_issue_bits_T_205 | _io_issue_bits_T_199; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_207 = _io_issue_bits_T_206 | _io_issue_bits_T_200; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_208 = _io_issue_bits_T_207 | _io_issue_bits_T_201; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_210 = oldest_0 ? uops_0_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_211 = oldest_1 ? uops_1_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_212 = oldest_2 ? uops_2_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_213 = oldest_3 ? uops_3_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_214 = oldest_4 ? uops_4_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_215 = oldest_5 ? uops_5_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_216 = oldest_6 ? uops_6_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_217 = oldest_7 ? uops_7_prs1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_218 = _io_issue_bits_T_210 | _io_issue_bits_T_211; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_219 = _io_issue_bits_T_218 | _io_issue_bits_T_212; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_220 = _io_issue_bits_T_219 | _io_issue_bits_T_213; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_221 = _io_issue_bits_T_220 | _io_issue_bits_T_214; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_222 = _io_issue_bits_T_221 | _io_issue_bits_T_215; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [6:0] _io_issue_bits_T_223 = _io_issue_bits_T_222 | _io_issue_bits_T_216; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_240 = oldest_0 ? uops_0_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_241 = oldest_1 ? uops_1_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_242 = oldest_2 ? uops_2_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_243 = oldest_3 ? uops_3_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_244 = oldest_4 ? uops_4_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_245 = oldest_5 ? uops_5_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_246 = oldest_6 ? uops_6_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_247 = oldest_7 ? uops_7_lrs2 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_248 = _io_issue_bits_T_240 | _io_issue_bits_T_241; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_249 = _io_issue_bits_T_248 | _io_issue_bits_T_242; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_250 = _io_issue_bits_T_249 | _io_issue_bits_T_243; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_251 = _io_issue_bits_T_250 | _io_issue_bits_T_244; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_252 = _io_issue_bits_T_251 | _io_issue_bits_T_245; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_253 = _io_issue_bits_T_252 | _io_issue_bits_T_246; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_255 = oldest_0 ? uops_0_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_256 = oldest_1 ? uops_1_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_257 = oldest_2 ? uops_2_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_258 = oldest_3 ? uops_3_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_259 = oldest_4 ? uops_4_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_260 = oldest_5 ? uops_5_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_261 = oldest_6 ? uops_6_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_262 = oldest_7 ? uops_7_lrs1 : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_263 = _io_issue_bits_T_255 | _io_issue_bits_T_256; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_264 = _io_issue_bits_T_263 | _io_issue_bits_T_257; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_265 = _io_issue_bits_T_264 | _io_issue_bits_T_258; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_266 = _io_issue_bits_T_265 | _io_issue_bits_T_259; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_267 = _io_issue_bits_T_266 | _io_issue_bits_T_260; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_268 = _io_issue_bits_T_267 | _io_issue_bits_T_261; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_270 = oldest_0 ? uops_0_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_271 = oldest_1 ? uops_1_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_272 = oldest_2 ? uops_2_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_273 = oldest_3 ? uops_3_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_274 = oldest_4 ? uops_4_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_275 = oldest_5 ? uops_5_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_276 = oldest_6 ? uops_6_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_277 = oldest_7 ? uops_7_ldst : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_278 = _io_issue_bits_T_270 | _io_issue_bits_T_271; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_279 = _io_issue_bits_T_278 | _io_issue_bits_T_272; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_280 = _io_issue_bits_T_279 | _io_issue_bits_T_273; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_281 = _io_issue_bits_T_280 | _io_issue_bits_T_274; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_282 = _io_issue_bits_T_281 | _io_issue_bits_T_275; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_283 = _io_issue_bits_T_282 | _io_issue_bits_T_276; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_285 = oldest_0 ? uops_0_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_286 = oldest_1 ? uops_1_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_287 = oldest_2 ? uops_2_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_288 = oldest_3 ? uops_3_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_289 = oldest_4 ? uops_4_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_290 = oldest_5 ? uops_5_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_291 = oldest_6 ? uops_6_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_292 = oldest_7 ? uops_7_pdInfo_jumpTarget : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_293 = _io_issue_bits_T_285 | _io_issue_bits_T_286; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_294 = _io_issue_bits_T_293 | _io_issue_bits_T_287; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_295 = _io_issue_bits_T_294 | _io_issue_bits_T_288; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_296 = _io_issue_bits_T_295 | _io_issue_bits_T_289; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_297 = _io_issue_bits_T_296 | _io_issue_bits_T_290; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_298 = _io_issue_bits_T_297 | _io_issue_bits_T_291; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_390 = oldest_0 ? uops_0_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_391 = oldest_1 ? uops_1_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_392 = oldest_2 ? uops_2_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_393 = oldest_3 ? uops_3_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_394 = oldest_4 ? uops_4_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_395 = oldest_5 ? uops_5_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_396 = oldest_6 ? uops_6_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_397 = oldest_7 ? uops_7_csrAddress : 14'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_398 = _io_issue_bits_T_390 | _io_issue_bits_T_391; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_399 = _io_issue_bits_T_398 | _io_issue_bits_T_392; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_400 = _io_issue_bits_T_399 | _io_issue_bits_T_393; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_401 = _io_issue_bits_T_400 | _io_issue_bits_T_394; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_402 = _io_issue_bits_T_401 | _io_issue_bits_T_395; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [13:0] _io_issue_bits_T_403 = _io_issue_bits_T_402 | _io_issue_bits_T_396; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_420 = oldest_0 ? uops_0_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_421 = oldest_1 ? uops_1_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_422 = oldest_2 ? uops_2_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_423 = oldest_3 ? uops_3_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_424 = oldest_4 ? uops_4_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_425 = oldest_5 ? uops_5_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_426 = oldest_6 ? uops_6_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_427 = oldest_7 ? uops_7_excpVec : 10'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_428 = _io_issue_bits_T_420 | _io_issue_bits_T_421; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_429 = _io_issue_bits_T_428 | _io_issue_bits_T_422; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_430 = _io_issue_bits_T_429 | _io_issue_bits_T_423; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_431 = _io_issue_bits_T_430 | _io_issue_bits_T_424; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_432 = _io_issue_bits_T_431 | _io_issue_bits_T_425; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [9:0] _io_issue_bits_T_433 = _io_issue_bits_T_432 | _io_issue_bits_T_426; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_540 = oldest_0 ? uops_0_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_541 = oldest_1 ? uops_1_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_542 = oldest_2 ? uops_2_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_543 = oldest_3 ? uops_3_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_544 = oldest_4 ? uops_4_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_545 = oldest_5 ? uops_5_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_546 = oldest_6 ? uops_6_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_547 = oldest_7 ? uops_7_ctrl_immType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_548 = _io_issue_bits_T_540 | _io_issue_bits_T_541; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_549 = _io_issue_bits_T_548 | _io_issue_bits_T_542; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_550 = _io_issue_bits_T_549 | _io_issue_bits_T_543; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_551 = _io_issue_bits_T_550 | _io_issue_bits_T_544; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_552 = _io_issue_bits_T_551 | _io_issue_bits_T_545; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_553 = _io_issue_bits_T_552 | _io_issue_bits_T_546; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_555 = oldest_0 ? uops_0_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_556 = oldest_1 ? uops_1_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_557 = oldest_2 ? uops_2_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_558 = oldest_3 ? uops_3_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_559 = oldest_4 ? uops_4_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_560 = oldest_5 ? uops_5_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_561 = oldest_6 ? uops_6_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_562 = oldest_7 ? uops_7_ctrl_src2Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_563 = _io_issue_bits_T_555 | _io_issue_bits_T_556; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_564 = _io_issue_bits_T_563 | _io_issue_bits_T_557; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_565 = _io_issue_bits_T_564 | _io_issue_bits_T_558; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_566 = _io_issue_bits_T_565 | _io_issue_bits_T_559; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_567 = _io_issue_bits_T_566 | _io_issue_bits_T_560; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_568 = _io_issue_bits_T_567 | _io_issue_bits_T_561; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_570 = oldest_0 ? uops_0_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_571 = oldest_1 ? uops_1_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_572 = oldest_2 ? uops_2_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_573 = oldest_3 ? uops_3_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_574 = oldest_4 ? uops_4_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_575 = oldest_5 ? uops_5_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_576 = oldest_6 ? uops_6_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_577 = oldest_7 ? uops_7_ctrl_src1Type : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_578 = _io_issue_bits_T_570 | _io_issue_bits_T_571; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_579 = _io_issue_bits_T_578 | _io_issue_bits_T_572; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_580 = _io_issue_bits_T_579 | _io_issue_bits_T_573; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_581 = _io_issue_bits_T_580 | _io_issue_bits_T_574; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_582 = _io_issue_bits_T_581 | _io_issue_bits_T_575; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_583 = _io_issue_bits_T_582 | _io_issue_bits_T_576; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_585 = oldest_0 ? uops_0_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_586 = oldest_1 ? uops_1_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_587 = oldest_2 ? uops_2_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_588 = oldest_3 ? uops_3_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_589 = oldest_4 ? uops_4_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_590 = oldest_5 ? uops_5_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_591 = oldest_6 ? uops_6_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_592 = oldest_7 ? uops_7_ctrl_divOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_593 = _io_issue_bits_T_585 | _io_issue_bits_T_586; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_594 = _io_issue_bits_T_593 | _io_issue_bits_T_587; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_595 = _io_issue_bits_T_594 | _io_issue_bits_T_588; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_596 = _io_issue_bits_T_595 | _io_issue_bits_T_589; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_597 = _io_issue_bits_T_596 | _io_issue_bits_T_590; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_598 = _io_issue_bits_T_597 | _io_issue_bits_T_591; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_600 = oldest_0 ? uops_0_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_601 = oldest_1 ? uops_1_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_602 = oldest_2 ? uops_2_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_603 = oldest_3 ? uops_3_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_604 = oldest_4 ? uops_4_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_605 = oldest_5 ? uops_5_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_606 = oldest_6 ? uops_6_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_607 = oldest_7 ? uops_7_ctrl_mulOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_608 = _io_issue_bits_T_600 | _io_issue_bits_T_601; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_609 = _io_issue_bits_T_608 | _io_issue_bits_T_602; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_610 = _io_issue_bits_T_609 | _io_issue_bits_T_603; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_611 = _io_issue_bits_T_610 | _io_issue_bits_T_604; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_612 = _io_issue_bits_T_611 | _io_issue_bits_T_605; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_613 = _io_issue_bits_T_612 | _io_issue_bits_T_606; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_615 = oldest_0 ? uops_0_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_616 = oldest_1 ? uops_1_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_617 = oldest_2 ? uops_2_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_618 = oldest_3 ? uops_3_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_619 = oldest_4 ? uops_4_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_620 = oldest_5 ? uops_5_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_621 = oldest_6 ? uops_6_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_622 = oldest_7 ? uops_7_ctrl_csrOp : 3'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_623 = _io_issue_bits_T_615 | _io_issue_bits_T_616; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_624 = _io_issue_bits_T_623 | _io_issue_bits_T_617; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_625 = _io_issue_bits_T_624 | _io_issue_bits_T_618; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_626 = _io_issue_bits_T_625 | _io_issue_bits_T_619; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_627 = _io_issue_bits_T_626 | _io_issue_bits_T_620; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [2:0] _io_issue_bits_T_628 = _io_issue_bits_T_627 | _io_issue_bits_T_621; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_630 = oldest_0 ? uops_0_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_631 = oldest_1 ? uops_1_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_632 = oldest_2 ? uops_2_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_633 = oldest_3 ? uops_3_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_634 = oldest_4 ? uops_4_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_635 = oldest_5 ? uops_5_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_636 = oldest_6 ? uops_6_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_637 = oldest_7 ? uops_7_ctrl_lsuOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_638 = _io_issue_bits_T_630 | _io_issue_bits_T_631; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_639 = _io_issue_bits_T_638 | _io_issue_bits_T_632; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_640 = _io_issue_bits_T_639 | _io_issue_bits_T_633; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_641 = _io_issue_bits_T_640 | _io_issue_bits_T_634; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_642 = _io_issue_bits_T_641 | _io_issue_bits_T_635; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_643 = _io_issue_bits_T_642 | _io_issue_bits_T_636; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_645 = oldest_0 ? uops_0_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_646 = oldest_1 ? uops_1_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_647 = oldest_2 ? uops_2_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_648 = oldest_3 ? uops_3_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_649 = oldest_4 ? uops_4_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_650 = oldest_5 ? uops_5_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_651 = oldest_6 ? uops_6_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_652 = oldest_7 ? uops_7_ctrl_bruOp : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_653 = _io_issue_bits_T_645 | _io_issue_bits_T_646; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_654 = _io_issue_bits_T_653 | _io_issue_bits_T_647; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_655 = _io_issue_bits_T_654 | _io_issue_bits_T_648; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_656 = _io_issue_bits_T_655 | _io_issue_bits_T_649; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_657 = _io_issue_bits_T_656 | _io_issue_bits_T_650; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_658 = _io_issue_bits_T_657 | _io_issue_bits_T_651; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_660 = oldest_0 ? uops_0_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_661 = oldest_1 ? uops_1_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_662 = oldest_2 ? uops_2_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_663 = oldest_3 ? uops_3_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_664 = oldest_4 ? uops_4_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_665 = oldest_5 ? uops_5_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_666 = oldest_6 ? uops_6_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_667 = oldest_7 ? uops_7_ctrl_aluOp : 5'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_668 = _io_issue_bits_T_660 | _io_issue_bits_T_661; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_669 = _io_issue_bits_T_668 | _io_issue_bits_T_662; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_670 = _io_issue_bits_T_669 | _io_issue_bits_T_663; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_671 = _io_issue_bits_T_670 | _io_issue_bits_T_664; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_672 = _io_issue_bits_T_671 | _io_issue_bits_T_665; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [4:0] _io_issue_bits_T_673 = _io_issue_bits_T_672 | _io_issue_bits_T_666; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_675 = oldest_0 ? uops_0_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_676 = oldest_1 ? uops_1_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_677 = oldest_2 ? uops_2_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_678 = oldest_3 ? uops_3_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_679 = oldest_4 ? uops_4_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_680 = oldest_5 ? uops_5_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_681 = oldest_6 ? uops_6_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_682 = oldest_7 ? uops_7_ctrl_fuType : 4'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_683 = _io_issue_bits_T_675 | _io_issue_bits_T_676; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_684 = _io_issue_bits_T_683 | _io_issue_bits_T_677; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_685 = _io_issue_bits_T_684 | _io_issue_bits_T_678; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_686 = _io_issue_bits_T_685 | _io_issue_bits_T_679; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_687 = _io_issue_bits_T_686 | _io_issue_bits_T_680; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [3:0] _io_issue_bits_T_688 = _io_issue_bits_T_687 | _io_issue_bits_T_681; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_690 = oldest_0 ? uops_0_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_691 = oldest_1 ? uops_1_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_692 = oldest_2 ? uops_2_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_693 = oldest_3 ? uops_3_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_694 = oldest_4 ? uops_4_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_695 = oldest_5 ? uops_5_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_696 = oldest_6 ? uops_6_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_697 = oldest_7 ? uops_7_inst : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_698 = _io_issue_bits_T_690 | _io_issue_bits_T_691; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_699 = _io_issue_bits_T_698 | _io_issue_bits_T_692; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_700 = _io_issue_bits_T_699 | _io_issue_bits_T_693; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_701 = _io_issue_bits_T_700 | _io_issue_bits_T_694; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_702 = _io_issue_bits_T_701 | _io_issue_bits_T_695; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_703 = _io_issue_bits_T_702 | _io_issue_bits_T_696; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_705 = oldest_0 ? uops_0_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_706 = oldest_1 ? uops_1_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_707 = oldest_2 ? uops_2_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_708 = oldest_3 ? uops_3_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_709 = oldest_4 ? uops_4_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_710 = oldest_5 ? uops_5_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_711 = oldest_6 ? uops_6_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_712 = oldest_7 ? uops_7_pc : 32'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_713 = _io_issue_bits_T_705 | _io_issue_bits_T_706; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_714 = _io_issue_bits_T_713 | _io_issue_bits_T_707; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_715 = _io_issue_bits_T_714 | _io_issue_bits_T_708; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_716 = _io_issue_bits_T_715 | _io_issue_bits_T_709; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_717 = _io_issue_bits_T_716 | _io_issue_bits_T_710; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [31:0] _io_issue_bits_T_718 = _io_issue_bits_T_717 | _io_issue_bits_T_711; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire  issueFire = io_issue_valid & io_issue_ready; // @[src/main/scala/backend/scheduler/IssueQueue.scala 134:34]
  wire  freeMask_0 = ~valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_1 = ~valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_2 = ~valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_3 = ~valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_4 = ~valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_5 = ~valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_6 = ~valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire  freeMask_7 = ~valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 139:47]
  wire [2:0] _enqIdx_T = freeMask_6 ? 3'h6 : 3'h7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_1 = freeMask_5 ? 3'h5 : _enqIdx_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_2 = freeMask_4 ? 3'h4 : _enqIdx_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_3 = freeMask_3 ? 3'h3 : _enqIdx_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_4 = freeMask_2 ? 3'h2 : _enqIdx_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] _enqIdx_T_5 = freeMask_1 ? 3'h1 : _enqIdx_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [2:0] enqIdx = freeMask_0 ? 3'h0 : _enqIdx_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [7:0] _hasFree_T = {freeMask_7,freeMask_6,freeMask_5,freeMask_4,freeMask_3,freeMask_2,freeMask_1,freeMask_0}; // @[src/main/scala/backend/scheduler/IssueQueue.scala 141:27]
  wire  hasFree = |_hasFree_T; // @[src/main/scala/backend/scheduler/IssueQueue.scala 141:34]
  wire  enqFire = io_enq_valid & hasFree; // @[src/main/scala/backend/scheduler/IssueQueue.scala 142:31]
  wire  _validAfterKillGrant_0_T_2 = oldest_0 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_0 = valid_0 & _request_0_T_2 & ~(oldest_0 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_1_T_2 = oldest_1 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_1 = valid_1 & _request_1_T_2 & ~(oldest_1 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_2_T_2 = oldest_2 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_2 = valid_2 & _request_2_T_2 & ~(oldest_2 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_3_T_2 = oldest_3 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_3 = valid_3 & _request_3_T_2 & ~(oldest_3 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_4_T_2 = oldest_4 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_4 = valid_4 & _request_4_T_2 & ~(oldest_4 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_5_T_2 = oldest_5 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_5 = valid_5 & _request_5_T_2 & ~(oldest_5 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_6_T_2 = oldest_6 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_6 = valid_6 & _request_6_T_2 & ~(oldest_6 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_7_T_2 = oldest_7 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_7 = valid_7 & _request_7_T_2 & ~(oldest_7 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _T_426 = enqFire & enqIdx == 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:24]
  wire  _GEN_0 = enqFire & enqIdx == 3'h0 | valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_4 = _T_426 | p1Ready_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _T_440 = enqFire & enqIdx == 3'h1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_449 = enqFire & enqIdx == 3'h2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_458 = enqFire & enqIdx == 3'h3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_467 = enqFire & enqIdx == 3'h4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_476 = enqFire & enqIdx == 3'h5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_485 = enqFire & enqIdx == 3'h6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_494 = enqFire & enqIdx == 3'h7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _GEN_84 = _T_440 | valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_88 = _T_440 | p1Ready_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_168 = _T_449 | valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_172 = _T_449 | p1Ready_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_252 = _T_458 | valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_256 = _T_458 | p1Ready_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_336 = _T_467 | valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_340 = _T_467 | p1Ready_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_420 = _T_476 | valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_424 = _T_476 | p1Ready_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_504 = _T_485 | valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_508 = _T_485 | p1Ready_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire  _GEN_588 = _T_494 | valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_592 = _T_494 | p1Ready_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43 172:18 175:18]
  wire [1:0] _io_freeEntries_T = freeMask_0 + freeMask_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_2 = freeMask_2 + freeMask_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [2:0] _io_freeEntries_T_4 = _io_freeEntries_T + _io_freeEntries_T_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_6 = freeMask_4 + freeMask_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_8 = freeMask_6 + freeMask_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [2:0] _io_freeEntries_T_10 = _io_freeEntries_T_6 + _io_freeEntries_T_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  assign io_issue_valid = oldest_0 | oldest_1 | oldest_2 | oldest_3 | oldest_4 | oldest_5 | oldest_6 | oldest_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:36]
  assign io_issue_bits_pc = _io_issue_bits_T_718 | _io_issue_bits_T_712; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_inst = _io_issue_bits_T_703 | _io_issue_bits_T_697; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_fuType = _io_issue_bits_T_688 | _io_issue_bits_T_682; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_aluOp = _io_issue_bits_T_673 | _io_issue_bits_T_667; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_bruOp = _io_issue_bits_T_658 | _io_issue_bits_T_652; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_lsuOp = _io_issue_bits_T_643 | _io_issue_bits_T_637; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrOp = _io_issue_bits_T_628 | _io_issue_bits_T_622; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_mulOp = _io_issue_bits_T_613 | _io_issue_bits_T_607; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_divOp = _io_issue_bits_T_598 | _io_issue_bits_T_592; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src1Type = _io_issue_bits_T_583 | _io_issue_bits_T_577; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_src2Type = _io_issue_bits_T_568 | _io_issue_bits_T_562; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_immType = _io_issue_bits_T_553 | _io_issue_bits_T_547; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_rfWen = oldest_0 & uops_0_ctrl_rfWen | oldest_1 & uops_1_ctrl_rfWen | oldest_2 &
    uops_2_ctrl_rfWen | oldest_3 & uops_3_ctrl_rfWen | oldest_4 & uops_4_ctrl_rfWen | oldest_5 & uops_5_ctrl_rfWen |
    oldest_6 & uops_6_ctrl_rfWen | oldest_7 & uops_7_ctrl_rfWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memRead = oldest_0 & uops_0_ctrl_memRead | oldest_1 & uops_1_ctrl_memRead | oldest_2 &
    uops_2_ctrl_memRead | oldest_3 & uops_3_ctrl_memRead | oldest_4 & uops_4_ctrl_memRead | oldest_5 &
    uops_5_ctrl_memRead | oldest_6 & uops_6_ctrl_memRead | oldest_7 & uops_7_ctrl_memRead; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_memWrite = oldest_0 & uops_0_ctrl_memWrite | oldest_1 & uops_1_ctrl_memWrite | oldest_2 &
    uops_2_ctrl_memWrite | oldest_3 & uops_3_ctrl_memWrite | oldest_4 & uops_4_ctrl_memWrite | oldest_5 &
    uops_5_ctrl_memWrite | oldest_6 & uops_6_ctrl_memWrite | oldest_7 & uops_7_ctrl_memWrite; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_csrWen = oldest_0 & uops_0_ctrl_csrWen | oldest_1 & uops_1_ctrl_csrWen | oldest_2 &
    uops_2_ctrl_csrWen | oldest_3 & uops_3_ctrl_csrWen | oldest_4 & uops_4_ctrl_csrWen | oldest_5 & uops_5_ctrl_csrWen
     | oldest_6 & uops_6_ctrl_csrWen | oldest_7 & uops_7_ctrl_csrWen; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isBranch = oldest_0 & uops_0_ctrl_isBranch | oldest_1 & uops_1_ctrl_isBranch | oldest_2 &
    uops_2_ctrl_isBranch | oldest_3 & uops_3_ctrl_isBranch | oldest_4 & uops_4_ctrl_isBranch | oldest_5 &
    uops_5_ctrl_isBranch | oldest_6 & uops_6_ctrl_isBranch | oldest_7 & uops_7_ctrl_isBranch; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isJump = oldest_0 & uops_0_ctrl_isJump | oldest_1 & uops_1_ctrl_isJump | oldest_2 &
    uops_2_ctrl_isJump | oldest_3 & uops_3_ctrl_isJump | oldest_4 & uops_4_ctrl_isJump | oldest_5 & uops_5_ctrl_isJump
     | oldest_6 & uops_6_ctrl_isJump | oldest_7 & uops_7_ctrl_isJump; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ctrl_isPriv = oldest_0 & uops_0_ctrl_isPriv | oldest_1 & uops_1_ctrl_isPriv | oldest_2 &
    uops_2_ctrl_isPriv | oldest_3 & uops_3_ctrl_isPriv | oldest_4 & uops_4_ctrl_isPriv | oldest_5 & uops_5_ctrl_isPriv
     | oldest_6 & uops_6_ctrl_isPriv | oldest_7 & uops_7_ctrl_isPriv; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_excpVec = _io_issue_bits_T_433 | _io_issue_bits_T_427; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_csrAddress = _io_issue_bits_T_403 | _io_issue_bits_T_397; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_valid = oldest_0 & uops_0_pdInfo_valid | oldest_1 & uops_1_pdInfo_valid | oldest_2 &
    uops_2_pdInfo_valid | oldest_3 & uops_3_pdInfo_valid | oldest_4 & uops_4_pdInfo_valid | oldest_5 &
    uops_5_pdInfo_valid | oldest_6 & uops_6_pdInfo_valid | oldest_7 & uops_7_pdInfo_valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isBr = oldest_0 & uops_0_pdInfo_isBr | oldest_1 & uops_1_pdInfo_isBr | oldest_2 &
    uops_2_pdInfo_isBr | oldest_3 & uops_3_pdInfo_isBr | oldest_4 & uops_4_pdInfo_isBr | oldest_5 & uops_5_pdInfo_isBr
     | oldest_6 & uops_6_pdInfo_isBr | oldest_7 & uops_7_pdInfo_isBr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJal = oldest_0 & uops_0_pdInfo_isJal | oldest_1 & uops_1_pdInfo_isJal | oldest_2 &
    uops_2_pdInfo_isJal | oldest_3 & uops_3_pdInfo_isJal | oldest_4 & uops_4_pdInfo_isJal | oldest_5 &
    uops_5_pdInfo_isJal | oldest_6 & uops_6_pdInfo_isJal | oldest_7 & uops_7_pdInfo_isJal; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isJalr = oldest_0 & uops_0_pdInfo_isJalr | oldest_1 & uops_1_pdInfo_isJalr | oldest_2 &
    uops_2_pdInfo_isJalr | oldest_3 & uops_3_pdInfo_isJalr | oldest_4 & uops_4_pdInfo_isJalr | oldest_5 &
    uops_5_pdInfo_isJalr | oldest_6 & uops_6_pdInfo_isJalr | oldest_7 & uops_7_pdInfo_isJalr; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isCall = oldest_0 & uops_0_pdInfo_isCall | oldest_1 & uops_1_pdInfo_isCall | oldest_2 &
    uops_2_pdInfo_isCall | oldest_3 & uops_3_pdInfo_isCall | oldest_4 & uops_4_pdInfo_isCall | oldest_5 &
    uops_5_pdInfo_isCall | oldest_6 & uops_6_pdInfo_isCall | oldest_7 & uops_7_pdInfo_isCall; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_isRet = oldest_0 & uops_0_pdInfo_isRet | oldest_1 & uops_1_pdInfo_isRet | oldest_2 &
    uops_2_pdInfo_isRet | oldest_3 & uops_3_pdInfo_isRet | oldest_4 & uops_4_pdInfo_isRet | oldest_5 &
    uops_5_pdInfo_isRet | oldest_6 & uops_6_pdInfo_isRet | oldest_7 & uops_7_pdInfo_isRet; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_pdInfo_jumpTarget = _io_issue_bits_T_298 | _io_issue_bits_T_292; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_ldst = _io_issue_bits_T_283 | _io_issue_bits_T_277; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs1 = _io_issue_bits_T_268 | _io_issue_bits_T_262; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_lrs2 = _io_issue_bits_T_253 | _io_issue_bits_T_247; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs1 = _io_issue_bits_T_223 | _io_issue_bits_T_217; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2 = _io_issue_bits_T_208 | _io_issue_bits_T_202; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_oldPdst = _io_issue_bits_T_193 | _io_issue_bits_T_187; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_rs2Valid = oldest_0 & uops_0_rs2Valid | oldest_1 & uops_1_rs2Valid | oldest_2 & uops_2_rs2Valid
     | oldest_3 & uops_3_rs2Valid | oldest_4 & uops_4_rs2Valid | oldest_5 & uops_5_rs2Valid | oldest_6 & uops_6_rs2Valid
     | oldest_7 & uops_7_rs2Valid; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdx = _io_issue_bits_T_133 | _io_issue_bits_T_127; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_robIdxFull = _io_issue_bits_T_118 | _io_issue_bits_T_112; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_sqIdx = _io_issue_bits_T_88 | _io_issue_bits_T_82; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_issueQueue = _io_issue_bits_T_73 | _io_issue_bits_T_67; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_prs2Busy = oldest_0 & uops_0_prs2Busy | oldest_1 & uops_1_prs2Busy | oldest_2 & uops_2_prs2Busy
     | oldest_3 & uops_3_prs2Busy | oldest_4 & uops_4_prs2Busy | oldest_5 & uops_5_prs2Busy | oldest_6 & uops_6_prs2Busy
     | oldest_7 & uops_7_prs2Busy; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_issue_bits_isStd = oldest_0 & uops_0_isStd | oldest_1 & uops_1_isStd | oldest_2 & uops_2_isStd | oldest_3 &
    uops_3_isStd | oldest_4 & uops_4_isStd | oldest_5 & uops_5_isStd | oldest_6 & uops_6_isStd | oldest_7 & uops_7_isStd
    ; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  assign io_freeEntries = _io_freeEntries_T_4 + _io_freeEntries_T_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_0) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_1 <= _GEN_84;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_2 <= _GEN_168;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_3 <= _GEN_252;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_4 <= _GEN_336;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_5 <= _GEN_420;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_6 <= _GEN_504;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (killed_7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 159:27]
      valid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 160:16]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_7 <= _GEN_588;
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pc <= io_enq_bits_pc; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_inst <= io_enq_bits_inst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_fuType <= io_enq_bits_ctrl_fuType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_aluOp <= io_enq_bits_ctrl_aluOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_bruOp <= io_enq_bits_ctrl_bruOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_lsuOp <= io_enq_bits_ctrl_lsuOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_csrOp <= io_enq_bits_ctrl_csrOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_mulOp <= io_enq_bits_ctrl_mulOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_divOp <= io_enq_bits_ctrl_divOp; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_src1Type <= io_enq_bits_ctrl_src1Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_src2Type <= io_enq_bits_ctrl_src2Type; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_immType <= io_enq_bits_ctrl_immType; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_rfWen <= io_enq_bits_ctrl_rfWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_memRead <= io_enq_bits_ctrl_memRead; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_memWrite <= io_enq_bits_ctrl_memWrite; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_csrWen <= io_enq_bits_ctrl_csrWen; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_isBranch <= io_enq_bits_ctrl_isBranch; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_isJump <= io_enq_bits_ctrl_isJump; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ctrl_isPriv <= io_enq_bits_ctrl_isPriv; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_excpVec <= io_enq_bits_excpVec; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_csrAddress <= io_enq_bits_csrAddress; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_valid <= io_enq_bits_pdInfo_valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_isBr <= io_enq_bits_pdInfo_isBr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_isJal <= io_enq_bits_pdInfo_isJal; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_isJalr <= io_enq_bits_pdInfo_isJalr; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_isCall <= io_enq_bits_pdInfo_isCall; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_isRet <= io_enq_bits_pdInfo_isRet; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_pdInfo_jumpTarget <= io_enq_bits_pdInfo_jumpTarget; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_ldst <= io_enq_bits_ldst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_lrs1 <= io_enq_bits_lrs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_lrs2 <= io_enq_bits_lrs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_oldPdst <= io_enq_bits_oldPdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_robIdx <= io_enq_bits_robIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_robIdxFull <= io_enq_bits_robIdxFull; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_sqIdx <= io_enq_bits_sqIdx; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_issueQueue <= io_enq_bits_issueQueue; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_prs2Busy <= io_enq_bits_prs2Busy; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_isStd <= io_enq_bits_isStd; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_0 <= _GEN_4;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_1 <= _GEN_88;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_2 <= _GEN_172;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_3 <= _GEN_256;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_4 <= _GEN_340;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_5 <= _GEN_424;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_6 <= _GEN_508;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else begin
      p1Ready_7 <= _GEN_592;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_0 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_0 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_1 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_1 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_2 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_3 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_3 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_4 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_4 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_5 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_5 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_6 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_6 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (killed_7 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_7 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_1 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_1 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_2 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_2 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_3 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_3 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_4 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_4 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_5 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_5 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_6 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_6 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_0 | killed_7 | _validAfterKillGrant_0_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_7 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_0 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_0 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_2 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_2 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_3 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_3 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_4 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_4 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_5 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_5 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_6 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_6 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_1 | killed_7 | _validAfterKillGrant_1_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_7 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_0 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_0 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_1 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_1 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_3 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_3 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_4 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_4 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_5 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_5 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_6 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_6 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_2 | killed_7 | _validAfterKillGrant_2_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_7 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_0 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_0 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_1 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_1 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_2 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_2 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_4 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_4 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_5 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_5 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_6 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_6 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_3 | killed_7 | _validAfterKillGrant_3_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_7 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_0 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_0 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_1 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_1 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_2 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_2 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_3 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_3 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_5 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_5 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_6 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_6 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_4 | killed_7 | _validAfterKillGrant_4_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_7 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_0 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_0 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_1 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_1 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_2 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_2 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_3 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_3 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_4 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_4 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_6 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_6 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_5 | killed_7 | _validAfterKillGrant_5_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_7 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_0 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_0 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_1 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_1 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_2 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_2 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_3 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_3 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_4 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_4 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_5 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_5 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_6 | killed_7 | _validAfterKillGrant_6_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_7 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_0 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_0 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_1 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_1 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_2 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_2 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_3 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_3 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_4 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_4 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_5 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_5 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (killed_7 | killed_6 | _validAfterKillGrant_7_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_6 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
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
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  valid_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valid_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valid_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valid_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  valid_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  valid_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_pc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_ctrl_fuType = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_ctrl_aluOp = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  uops_0_ctrl_bruOp = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  uops_0_ctrl_lsuOp = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  uops_0_ctrl_csrOp = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  uops_0_ctrl_mulOp = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  uops_0_ctrl_divOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_ctrl_src1Type = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_ctrl_src2Type = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_ctrl_immType = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  uops_0_ctrl_rfWen = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uops_0_ctrl_memRead = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  uops_0_ctrl_memWrite = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uops_0_ctrl_csrWen = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_ctrl_isBranch = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_ctrl_isJump = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_ctrl_isPriv = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uops_0_excpVec = _RAND_27[9:0];
  _RAND_28 = {1{`RANDOM}};
  uops_0_csrAddress = _RAND_28[13:0];
  _RAND_29 = {1{`RANDOM}};
  uops_0_pdInfo_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  uops_0_pdInfo_isBr = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uops_0_pdInfo_isJal = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  uops_0_pdInfo_isJalr = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  uops_0_pdInfo_isCall = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  uops_0_pdInfo_isRet = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  uops_0_pdInfo_jumpTarget = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  uops_0_ldst = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_40[6:0];
  _RAND_41 = {1{`RANDOM}};
  uops_0_oldPdst = _RAND_41[6:0];
  _RAND_42 = {1{`RANDOM}};
  uops_0_rs2Valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uops_0_robIdx = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  uops_0_robIdxFull = _RAND_44[6:0];
  _RAND_45 = {1{`RANDOM}};
  uops_0_sqIdx = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  uops_0_issueQueue = _RAND_46[2:0];
  _RAND_47 = {1{`RANDOM}};
  uops_0_prs2Busy = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  uops_0_isStd = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  uops_1_pc = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  uops_1_inst = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  uops_1_ctrl_fuType = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  uops_1_ctrl_aluOp = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  uops_1_ctrl_bruOp = _RAND_53[3:0];
  _RAND_54 = {1{`RANDOM}};
  uops_1_ctrl_lsuOp = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  uops_1_ctrl_csrOp = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  uops_1_ctrl_mulOp = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  uops_1_ctrl_divOp = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  uops_1_ctrl_src1Type = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  uops_1_ctrl_src2Type = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  uops_1_ctrl_immType = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  uops_1_ctrl_rfWen = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  uops_1_ctrl_memRead = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  uops_1_ctrl_memWrite = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  uops_1_ctrl_csrWen = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  uops_1_ctrl_isBranch = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uops_1_ctrl_isJump = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  uops_1_ctrl_isPriv = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  uops_1_excpVec = _RAND_68[9:0];
  _RAND_69 = {1{`RANDOM}};
  uops_1_csrAddress = _RAND_69[13:0];
  _RAND_70 = {1{`RANDOM}};
  uops_1_pdInfo_valid = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  uops_1_pdInfo_isBr = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  uops_1_pdInfo_isJal = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  uops_1_pdInfo_isJalr = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  uops_1_pdInfo_isCall = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  uops_1_pdInfo_isRet = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  uops_1_pdInfo_jumpTarget = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  uops_1_ldst = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_78[4:0];
  _RAND_79 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_80[6:0];
  _RAND_81 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  uops_1_oldPdst = _RAND_82[6:0];
  _RAND_83 = {1{`RANDOM}};
  uops_1_rs2Valid = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  uops_1_robIdx = _RAND_84[5:0];
  _RAND_85 = {1{`RANDOM}};
  uops_1_robIdxFull = _RAND_85[6:0];
  _RAND_86 = {1{`RANDOM}};
  uops_1_sqIdx = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  uops_1_issueQueue = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  uops_1_prs2Busy = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  uops_1_isStd = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  uops_2_pc = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  uops_2_inst = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  uops_2_ctrl_fuType = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  uops_2_ctrl_aluOp = _RAND_93[4:0];
  _RAND_94 = {1{`RANDOM}};
  uops_2_ctrl_bruOp = _RAND_94[3:0];
  _RAND_95 = {1{`RANDOM}};
  uops_2_ctrl_lsuOp = _RAND_95[3:0];
  _RAND_96 = {1{`RANDOM}};
  uops_2_ctrl_csrOp = _RAND_96[2:0];
  _RAND_97 = {1{`RANDOM}};
  uops_2_ctrl_mulOp = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  uops_2_ctrl_divOp = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  uops_2_ctrl_src1Type = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  uops_2_ctrl_src2Type = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  uops_2_ctrl_immType = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  uops_2_ctrl_rfWen = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  uops_2_ctrl_memRead = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  uops_2_ctrl_memWrite = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  uops_2_ctrl_csrWen = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  uops_2_ctrl_isBranch = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  uops_2_ctrl_isJump = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  uops_2_ctrl_isPriv = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  uops_2_excpVec = _RAND_109[9:0];
  _RAND_110 = {1{`RANDOM}};
  uops_2_csrAddress = _RAND_110[13:0];
  _RAND_111 = {1{`RANDOM}};
  uops_2_pdInfo_valid = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  uops_2_pdInfo_isBr = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  uops_2_pdInfo_isJal = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  uops_2_pdInfo_isJalr = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  uops_2_pdInfo_isCall = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  uops_2_pdInfo_isRet = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  uops_2_pdInfo_jumpTarget = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  uops_2_ldst = _RAND_118[4:0];
  _RAND_119 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_120[4:0];
  _RAND_121 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_121[6:0];
  _RAND_122 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_122[6:0];
  _RAND_123 = {1{`RANDOM}};
  uops_2_oldPdst = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  uops_2_rs2Valid = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  uops_2_robIdx = _RAND_125[5:0];
  _RAND_126 = {1{`RANDOM}};
  uops_2_robIdxFull = _RAND_126[6:0];
  _RAND_127 = {1{`RANDOM}};
  uops_2_sqIdx = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  uops_2_issueQueue = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  uops_2_prs2Busy = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  uops_2_isStd = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  uops_3_pc = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  uops_3_inst = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  uops_3_ctrl_fuType = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  uops_3_ctrl_aluOp = _RAND_134[4:0];
  _RAND_135 = {1{`RANDOM}};
  uops_3_ctrl_bruOp = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  uops_3_ctrl_lsuOp = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  uops_3_ctrl_csrOp = _RAND_137[2:0];
  _RAND_138 = {1{`RANDOM}};
  uops_3_ctrl_mulOp = _RAND_138[2:0];
  _RAND_139 = {1{`RANDOM}};
  uops_3_ctrl_divOp = _RAND_139[2:0];
  _RAND_140 = {1{`RANDOM}};
  uops_3_ctrl_src1Type = _RAND_140[2:0];
  _RAND_141 = {1{`RANDOM}};
  uops_3_ctrl_src2Type = _RAND_141[2:0];
  _RAND_142 = {1{`RANDOM}};
  uops_3_ctrl_immType = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  uops_3_ctrl_rfWen = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  uops_3_ctrl_memRead = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  uops_3_ctrl_memWrite = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  uops_3_ctrl_csrWen = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  uops_3_ctrl_isBranch = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  uops_3_ctrl_isJump = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  uops_3_ctrl_isPriv = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  uops_3_excpVec = _RAND_150[9:0];
  _RAND_151 = {1{`RANDOM}};
  uops_3_csrAddress = _RAND_151[13:0];
  _RAND_152 = {1{`RANDOM}};
  uops_3_pdInfo_valid = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  uops_3_pdInfo_isBr = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  uops_3_pdInfo_isJal = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  uops_3_pdInfo_isJalr = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  uops_3_pdInfo_isCall = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  uops_3_pdInfo_isRet = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  uops_3_pdInfo_jumpTarget = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  uops_3_ldst = _RAND_159[4:0];
  _RAND_160 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_160[4:0];
  _RAND_161 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_161[4:0];
  _RAND_162 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_162[6:0];
  _RAND_163 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_163[6:0];
  _RAND_164 = {1{`RANDOM}};
  uops_3_oldPdst = _RAND_164[6:0];
  _RAND_165 = {1{`RANDOM}};
  uops_3_rs2Valid = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  uops_3_robIdx = _RAND_166[5:0];
  _RAND_167 = {1{`RANDOM}};
  uops_3_robIdxFull = _RAND_167[6:0];
  _RAND_168 = {1{`RANDOM}};
  uops_3_sqIdx = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  uops_3_issueQueue = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  uops_3_prs2Busy = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  uops_3_isStd = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  uops_4_pc = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  uops_4_inst = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  uops_4_ctrl_fuType = _RAND_174[3:0];
  _RAND_175 = {1{`RANDOM}};
  uops_4_ctrl_aluOp = _RAND_175[4:0];
  _RAND_176 = {1{`RANDOM}};
  uops_4_ctrl_bruOp = _RAND_176[3:0];
  _RAND_177 = {1{`RANDOM}};
  uops_4_ctrl_lsuOp = _RAND_177[3:0];
  _RAND_178 = {1{`RANDOM}};
  uops_4_ctrl_csrOp = _RAND_178[2:0];
  _RAND_179 = {1{`RANDOM}};
  uops_4_ctrl_mulOp = _RAND_179[2:0];
  _RAND_180 = {1{`RANDOM}};
  uops_4_ctrl_divOp = _RAND_180[2:0];
  _RAND_181 = {1{`RANDOM}};
  uops_4_ctrl_src1Type = _RAND_181[2:0];
  _RAND_182 = {1{`RANDOM}};
  uops_4_ctrl_src2Type = _RAND_182[2:0];
  _RAND_183 = {1{`RANDOM}};
  uops_4_ctrl_immType = _RAND_183[3:0];
  _RAND_184 = {1{`RANDOM}};
  uops_4_ctrl_rfWen = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  uops_4_ctrl_memRead = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  uops_4_ctrl_memWrite = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  uops_4_ctrl_csrWen = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  uops_4_ctrl_isBranch = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  uops_4_ctrl_isJump = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  uops_4_ctrl_isPriv = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  uops_4_excpVec = _RAND_191[9:0];
  _RAND_192 = {1{`RANDOM}};
  uops_4_csrAddress = _RAND_192[13:0];
  _RAND_193 = {1{`RANDOM}};
  uops_4_pdInfo_valid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  uops_4_pdInfo_isBr = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uops_4_pdInfo_isJal = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  uops_4_pdInfo_isJalr = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uops_4_pdInfo_isCall = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  uops_4_pdInfo_isRet = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  uops_4_pdInfo_jumpTarget = _RAND_199[31:0];
  _RAND_200 = {1{`RANDOM}};
  uops_4_ldst = _RAND_200[4:0];
  _RAND_201 = {1{`RANDOM}};
  uops_4_lrs1 = _RAND_201[4:0];
  _RAND_202 = {1{`RANDOM}};
  uops_4_lrs2 = _RAND_202[4:0];
  _RAND_203 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_203[6:0];
  _RAND_204 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_204[6:0];
  _RAND_205 = {1{`RANDOM}};
  uops_4_oldPdst = _RAND_205[6:0];
  _RAND_206 = {1{`RANDOM}};
  uops_4_rs2Valid = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  uops_4_robIdx = _RAND_207[5:0];
  _RAND_208 = {1{`RANDOM}};
  uops_4_robIdxFull = _RAND_208[6:0];
  _RAND_209 = {1{`RANDOM}};
  uops_4_sqIdx = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  uops_4_issueQueue = _RAND_210[2:0];
  _RAND_211 = {1{`RANDOM}};
  uops_4_prs2Busy = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  uops_4_isStd = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  uops_5_pc = _RAND_213[31:0];
  _RAND_214 = {1{`RANDOM}};
  uops_5_inst = _RAND_214[31:0];
  _RAND_215 = {1{`RANDOM}};
  uops_5_ctrl_fuType = _RAND_215[3:0];
  _RAND_216 = {1{`RANDOM}};
  uops_5_ctrl_aluOp = _RAND_216[4:0];
  _RAND_217 = {1{`RANDOM}};
  uops_5_ctrl_bruOp = _RAND_217[3:0];
  _RAND_218 = {1{`RANDOM}};
  uops_5_ctrl_lsuOp = _RAND_218[3:0];
  _RAND_219 = {1{`RANDOM}};
  uops_5_ctrl_csrOp = _RAND_219[2:0];
  _RAND_220 = {1{`RANDOM}};
  uops_5_ctrl_mulOp = _RAND_220[2:0];
  _RAND_221 = {1{`RANDOM}};
  uops_5_ctrl_divOp = _RAND_221[2:0];
  _RAND_222 = {1{`RANDOM}};
  uops_5_ctrl_src1Type = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  uops_5_ctrl_src2Type = _RAND_223[2:0];
  _RAND_224 = {1{`RANDOM}};
  uops_5_ctrl_immType = _RAND_224[3:0];
  _RAND_225 = {1{`RANDOM}};
  uops_5_ctrl_rfWen = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  uops_5_ctrl_memRead = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  uops_5_ctrl_memWrite = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  uops_5_ctrl_csrWen = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  uops_5_ctrl_isBranch = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  uops_5_ctrl_isJump = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  uops_5_ctrl_isPriv = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  uops_5_excpVec = _RAND_232[9:0];
  _RAND_233 = {1{`RANDOM}};
  uops_5_csrAddress = _RAND_233[13:0];
  _RAND_234 = {1{`RANDOM}};
  uops_5_pdInfo_valid = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  uops_5_pdInfo_isBr = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  uops_5_pdInfo_isJal = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  uops_5_pdInfo_isJalr = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  uops_5_pdInfo_isCall = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uops_5_pdInfo_isRet = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  uops_5_pdInfo_jumpTarget = _RAND_240[31:0];
  _RAND_241 = {1{`RANDOM}};
  uops_5_ldst = _RAND_241[4:0];
  _RAND_242 = {1{`RANDOM}};
  uops_5_lrs1 = _RAND_242[4:0];
  _RAND_243 = {1{`RANDOM}};
  uops_5_lrs2 = _RAND_243[4:0];
  _RAND_244 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_244[6:0];
  _RAND_245 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_245[6:0];
  _RAND_246 = {1{`RANDOM}};
  uops_5_oldPdst = _RAND_246[6:0];
  _RAND_247 = {1{`RANDOM}};
  uops_5_rs2Valid = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uops_5_robIdx = _RAND_248[5:0];
  _RAND_249 = {1{`RANDOM}};
  uops_5_robIdxFull = _RAND_249[6:0];
  _RAND_250 = {1{`RANDOM}};
  uops_5_sqIdx = _RAND_250[3:0];
  _RAND_251 = {1{`RANDOM}};
  uops_5_issueQueue = _RAND_251[2:0];
  _RAND_252 = {1{`RANDOM}};
  uops_5_prs2Busy = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  uops_5_isStd = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  uops_6_pc = _RAND_254[31:0];
  _RAND_255 = {1{`RANDOM}};
  uops_6_inst = _RAND_255[31:0];
  _RAND_256 = {1{`RANDOM}};
  uops_6_ctrl_fuType = _RAND_256[3:0];
  _RAND_257 = {1{`RANDOM}};
  uops_6_ctrl_aluOp = _RAND_257[4:0];
  _RAND_258 = {1{`RANDOM}};
  uops_6_ctrl_bruOp = _RAND_258[3:0];
  _RAND_259 = {1{`RANDOM}};
  uops_6_ctrl_lsuOp = _RAND_259[3:0];
  _RAND_260 = {1{`RANDOM}};
  uops_6_ctrl_csrOp = _RAND_260[2:0];
  _RAND_261 = {1{`RANDOM}};
  uops_6_ctrl_mulOp = _RAND_261[2:0];
  _RAND_262 = {1{`RANDOM}};
  uops_6_ctrl_divOp = _RAND_262[2:0];
  _RAND_263 = {1{`RANDOM}};
  uops_6_ctrl_src1Type = _RAND_263[2:0];
  _RAND_264 = {1{`RANDOM}};
  uops_6_ctrl_src2Type = _RAND_264[2:0];
  _RAND_265 = {1{`RANDOM}};
  uops_6_ctrl_immType = _RAND_265[3:0];
  _RAND_266 = {1{`RANDOM}};
  uops_6_ctrl_rfWen = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  uops_6_ctrl_memRead = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  uops_6_ctrl_memWrite = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  uops_6_ctrl_csrWen = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  uops_6_ctrl_isBranch = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  uops_6_ctrl_isJump = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  uops_6_ctrl_isPriv = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  uops_6_excpVec = _RAND_273[9:0];
  _RAND_274 = {1{`RANDOM}};
  uops_6_csrAddress = _RAND_274[13:0];
  _RAND_275 = {1{`RANDOM}};
  uops_6_pdInfo_valid = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  uops_6_pdInfo_isBr = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  uops_6_pdInfo_isJal = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  uops_6_pdInfo_isJalr = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  uops_6_pdInfo_isCall = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  uops_6_pdInfo_isRet = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  uops_6_pdInfo_jumpTarget = _RAND_281[31:0];
  _RAND_282 = {1{`RANDOM}};
  uops_6_ldst = _RAND_282[4:0];
  _RAND_283 = {1{`RANDOM}};
  uops_6_lrs1 = _RAND_283[4:0];
  _RAND_284 = {1{`RANDOM}};
  uops_6_lrs2 = _RAND_284[4:0];
  _RAND_285 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_285[6:0];
  _RAND_286 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_286[6:0];
  _RAND_287 = {1{`RANDOM}};
  uops_6_oldPdst = _RAND_287[6:0];
  _RAND_288 = {1{`RANDOM}};
  uops_6_rs2Valid = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  uops_6_robIdx = _RAND_289[5:0];
  _RAND_290 = {1{`RANDOM}};
  uops_6_robIdxFull = _RAND_290[6:0];
  _RAND_291 = {1{`RANDOM}};
  uops_6_sqIdx = _RAND_291[3:0];
  _RAND_292 = {1{`RANDOM}};
  uops_6_issueQueue = _RAND_292[2:0];
  _RAND_293 = {1{`RANDOM}};
  uops_6_prs2Busy = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  uops_6_isStd = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uops_7_pc = _RAND_295[31:0];
  _RAND_296 = {1{`RANDOM}};
  uops_7_inst = _RAND_296[31:0];
  _RAND_297 = {1{`RANDOM}};
  uops_7_ctrl_fuType = _RAND_297[3:0];
  _RAND_298 = {1{`RANDOM}};
  uops_7_ctrl_aluOp = _RAND_298[4:0];
  _RAND_299 = {1{`RANDOM}};
  uops_7_ctrl_bruOp = _RAND_299[3:0];
  _RAND_300 = {1{`RANDOM}};
  uops_7_ctrl_lsuOp = _RAND_300[3:0];
  _RAND_301 = {1{`RANDOM}};
  uops_7_ctrl_csrOp = _RAND_301[2:0];
  _RAND_302 = {1{`RANDOM}};
  uops_7_ctrl_mulOp = _RAND_302[2:0];
  _RAND_303 = {1{`RANDOM}};
  uops_7_ctrl_divOp = _RAND_303[2:0];
  _RAND_304 = {1{`RANDOM}};
  uops_7_ctrl_src1Type = _RAND_304[2:0];
  _RAND_305 = {1{`RANDOM}};
  uops_7_ctrl_src2Type = _RAND_305[2:0];
  _RAND_306 = {1{`RANDOM}};
  uops_7_ctrl_immType = _RAND_306[3:0];
  _RAND_307 = {1{`RANDOM}};
  uops_7_ctrl_rfWen = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  uops_7_ctrl_memRead = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  uops_7_ctrl_memWrite = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  uops_7_ctrl_csrWen = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  uops_7_ctrl_isBranch = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  uops_7_ctrl_isJump = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  uops_7_ctrl_isPriv = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  uops_7_excpVec = _RAND_314[9:0];
  _RAND_315 = {1{`RANDOM}};
  uops_7_csrAddress = _RAND_315[13:0];
  _RAND_316 = {1{`RANDOM}};
  uops_7_pdInfo_valid = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  uops_7_pdInfo_isBr = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uops_7_pdInfo_isJal = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  uops_7_pdInfo_isJalr = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  uops_7_pdInfo_isCall = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  uops_7_pdInfo_isRet = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  uops_7_pdInfo_jumpTarget = _RAND_322[31:0];
  _RAND_323 = {1{`RANDOM}};
  uops_7_ldst = _RAND_323[4:0];
  _RAND_324 = {1{`RANDOM}};
  uops_7_lrs1 = _RAND_324[4:0];
  _RAND_325 = {1{`RANDOM}};
  uops_7_lrs2 = _RAND_325[4:0];
  _RAND_326 = {1{`RANDOM}};
  uops_7_prs1 = _RAND_326[6:0];
  _RAND_327 = {1{`RANDOM}};
  uops_7_prs2 = _RAND_327[6:0];
  _RAND_328 = {1{`RANDOM}};
  uops_7_oldPdst = _RAND_328[6:0];
  _RAND_329 = {1{`RANDOM}};
  uops_7_rs2Valid = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  uops_7_robIdx = _RAND_330[5:0];
  _RAND_331 = {1{`RANDOM}};
  uops_7_robIdxFull = _RAND_331[6:0];
  _RAND_332 = {1{`RANDOM}};
  uops_7_sqIdx = _RAND_332[3:0];
  _RAND_333 = {1{`RANDOM}};
  uops_7_issueQueue = _RAND_333[2:0];
  _RAND_334 = {1{`RANDOM}};
  uops_7_prs2Busy = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  uops_7_isStd = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  p1Ready_0 = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  p1Ready_1 = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  p1Ready_2 = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  p1Ready_3 = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  p1Ready_4 = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  p1Ready_5 = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  p1Ready_6 = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  p1Ready_7 = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  p2Ready_0 = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  p2Ready_1 = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  p2Ready_2 = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  p2Ready_3 = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  p2Ready_4 = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  p2Ready_5 = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  p2Ready_6 = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  p2Ready_7 = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  age_0_1 = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  age_0_2 = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  age_0_3 = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  age_0_4 = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  age_0_5 = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  age_0_6 = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  age_0_7 = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  age_1_0 = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  age_1_2 = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  age_1_3 = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  age_1_4 = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  age_1_5 = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  age_1_6 = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  age_1_7 = _RAND_365[0:0];
  _RAND_366 = {1{`RANDOM}};
  age_2_0 = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  age_2_1 = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  age_2_3 = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  age_2_4 = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  age_2_5 = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  age_2_6 = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  age_2_7 = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  age_3_0 = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  age_3_1 = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  age_3_2 = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  age_3_4 = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  age_3_5 = _RAND_377[0:0];
  _RAND_378 = {1{`RANDOM}};
  age_3_6 = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  age_3_7 = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  age_4_0 = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  age_4_1 = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  age_4_2 = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  age_4_3 = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  age_4_5 = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  age_4_6 = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  age_4_7 = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  age_5_0 = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  age_5_1 = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  age_5_2 = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  age_5_3 = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  age_5_4 = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  age_5_6 = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  age_5_7 = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  age_6_0 = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  age_6_1 = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  age_6_2 = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  age_6_3 = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  age_6_4 = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  age_6_5 = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  age_6_7 = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  age_7_0 = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  age_7_1 = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  age_7_2 = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  age_7_3 = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  age_7_4 = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  age_7_5 = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  age_7_6 = _RAND_407[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
