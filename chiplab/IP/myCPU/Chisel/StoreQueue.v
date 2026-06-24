module StoreQueue(
  input         clock,
  input         reset,
  input         io_enq_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [5:0]  io_enq_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_enq_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_enq_lqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [31:0] io_enq_pc, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [6:0]  io_enq_pdst, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_enq_rfWen, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_enq_lsuOp, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_enq_fuType, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_addrWrite_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_addrWrite_idx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [31:0] io_addrWrite_vaddr, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_dataWrite_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_dataWrite_idx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [31:0] io_dataWrite_data, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_mmuReq_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [31:0] io_mmuReq_bits_vaddr, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_mmuReq_bits_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_mmuResp_ready, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_mmuResp_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [31:0] io_mmuResp_bits_paddr, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_mmuResp_bits_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_robCommit_0_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_robCommit_0_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_robCommit_1_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_robCommit_1_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_robCommit_2_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input  [3:0]  io_robCommit_2_sqIdx, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_dcacheReq_ready, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_dcacheReq_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [31:0] io_dcacheReq_bits_paddr, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [31:0] io_dcacheReq_bits_data, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_dcacheReq_bits_mask, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  input         io_outResult_ready, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [31:0] io_outResult_bits_uop_pc, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_outResult_bits_uop_ctrl_fuType, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_outResult_bits_uop_ctrl_lsuOp, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [9:0]  io_outResult_bits_uop_excpVec, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [6:0]  io_outResult_bits_uop_pdst, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [5:0]  io_outResult_bits_uop_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_bits_uop_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [5:0]  io_outResult_bits_uop_robIdxFull_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_bits_uop_robIdxFull_flag, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_outResult_bits_uop_lqIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [3:0]  io_outResult_bits_uop_sqIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_bits_redirect_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_bits_redirect_bits_valid, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [5:0]  io_outResult_bits_redirect_bits_robIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_outResult_bits_redirect_bits_robIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output [5:0]  io_oldestRobIdx_value, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_oldestRobIdx_flag, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_sqEmpty, // @[src/main/scala/memory/StoreQueue.scala 42:14]
  output        io_full // @[src/main/scala/memory/StoreQueue.scala 42:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [5:0] entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_0_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_0_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_0_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_0_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_0_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_1_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_1_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_1_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_1_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_1_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_1_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_1_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_1_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_2_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_2_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_2_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_2_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_2_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_2_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_2_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_2_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_3_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_3_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_3_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_3_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_3_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_3_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_3_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_3_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_4_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_4_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_4_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_4_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_4_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_4_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_4_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_4_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_5_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_5_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_5_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_5_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_5_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_5_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_5_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_5_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_6_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_6_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_6_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_6_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_6_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_6_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_6_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_6_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_7_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_7_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_7_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_7_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_7_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_7_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_7_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_7_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_8_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_8_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_8_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_8_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_8_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_8_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_8_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_8_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_9_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_9_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_9_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_9_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_9_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_9_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_9_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_9_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_10_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_10_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_10_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_10_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_10_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_10_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_10_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_10_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_11_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_11_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_11_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_11_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_11_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_11_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_11_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_11_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_12_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_12_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_12_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_12_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_12_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_12_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_12_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_12_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_13_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_13_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_13_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_13_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_13_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_13_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_13_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_13_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_14_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_14_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_14_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_14_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_14_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_14_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_14_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_14_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [5:0] entries_15_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_15_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [9:0] entries_15_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_15_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [31:0] entries_15_pc; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [6:0] entries_15_pdst; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg  entries_15_rfWen; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] entries_15_fuType; // @[src/main/scala/memory/StoreQueue.scala 101:20]
  reg [3:0] enqPtr_value; // @[src/main/scala/memory/StoreQueue.scala 104:23]
  reg  enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 104:23]
  reg [3:0] deqPtr_value; // @[src/main/scala/memory/StoreQueue.scala 107:23]
  reg  deqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 107:23]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 103:39]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 112:47]
  wire  _GEN_1 = 4'h1 == deqPtr_value ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_2 = 4'h2 == deqPtr_value ? entries_2_valid : _GEN_1; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_3 = 4'h3 == deqPtr_value ? entries_3_valid : _GEN_2; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_4 = 4'h4 == deqPtr_value ? entries_4_valid : _GEN_3; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_5 = 4'h5 == deqPtr_value ? entries_5_valid : _GEN_4; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_6 = 4'h6 == deqPtr_value ? entries_6_valid : _GEN_5; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_7 = 4'h7 == deqPtr_value ? entries_7_valid : _GEN_6; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_8 = 4'h8 == deqPtr_value ? entries_8_valid : _GEN_7; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_9 = 4'h9 == deqPtr_value ? entries_9_valid : _GEN_8; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_10 = 4'ha == deqPtr_value ? entries_10_valid : _GEN_9; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_11 = 4'hb == deqPtr_value ? entries_11_valid : _GEN_10; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_12 = 4'hc == deqPtr_value ? entries_12_valid : _GEN_11; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_13 = 4'hd == deqPtr_value ? entries_13_valid : _GEN_12; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_14 = 4'he == deqPtr_value ? entries_14_valid : _GEN_13; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_15 = 4'hf == deqPtr_value ? entries_15_valid : _GEN_14; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_18 = 4'h1 == deqPtr_value ? entries_1_robIdxFull_value : entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_19 = 4'h1 == deqPtr_value ? entries_1_robIdxFull_flag : entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_20 = 4'h2 == deqPtr_value ? entries_2_robIdxFull_value : _GEN_18; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_21 = 4'h2 == deqPtr_value ? entries_2_robIdxFull_flag : _GEN_19; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_22 = 4'h3 == deqPtr_value ? entries_3_robIdxFull_value : _GEN_20; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_23 = 4'h3 == deqPtr_value ? entries_3_robIdxFull_flag : _GEN_21; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_24 = 4'h4 == deqPtr_value ? entries_4_robIdxFull_value : _GEN_22; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_25 = 4'h4 == deqPtr_value ? entries_4_robIdxFull_flag : _GEN_23; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_26 = 4'h5 == deqPtr_value ? entries_5_robIdxFull_value : _GEN_24; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_27 = 4'h5 == deqPtr_value ? entries_5_robIdxFull_flag : _GEN_25; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_28 = 4'h6 == deqPtr_value ? entries_6_robIdxFull_value : _GEN_26; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_29 = 4'h6 == deqPtr_value ? entries_6_robIdxFull_flag : _GEN_27; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_30 = 4'h7 == deqPtr_value ? entries_7_robIdxFull_value : _GEN_28; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_31 = 4'h7 == deqPtr_value ? entries_7_robIdxFull_flag : _GEN_29; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_32 = 4'h8 == deqPtr_value ? entries_8_robIdxFull_value : _GEN_30; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_33 = 4'h8 == deqPtr_value ? entries_8_robIdxFull_flag : _GEN_31; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_34 = 4'h9 == deqPtr_value ? entries_9_robIdxFull_value : _GEN_32; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_35 = 4'h9 == deqPtr_value ? entries_9_robIdxFull_flag : _GEN_33; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_36 = 4'ha == deqPtr_value ? entries_10_robIdxFull_value : _GEN_34; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_37 = 4'ha == deqPtr_value ? entries_10_robIdxFull_flag : _GEN_35; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_38 = 4'hb == deqPtr_value ? entries_11_robIdxFull_value : _GEN_36; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_39 = 4'hb == deqPtr_value ? entries_11_robIdxFull_flag : _GEN_37; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_40 = 4'hc == deqPtr_value ? entries_12_robIdxFull_value : _GEN_38; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_41 = 4'hc == deqPtr_value ? entries_12_robIdxFull_flag : _GEN_39; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_42 = 4'hd == deqPtr_value ? entries_13_robIdxFull_value : _GEN_40; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_43 = 4'hd == deqPtr_value ? entries_13_robIdxFull_flag : _GEN_41; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_44 = 4'he == deqPtr_value ? entries_14_robIdxFull_value : _GEN_42; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_45 = 4'he == deqPtr_value ? entries_14_robIdxFull_flag : _GEN_43; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire [5:0] _GEN_46 = 4'hf == deqPtr_value ? entries_15_robIdxFull_value : _GEN_44; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  _GEN_47 = 4'hf == deqPtr_value ? entries_15_robIdxFull_flag : _GEN_45; // @[src/main/scala/memory/StoreQueue.scala 122:{25,25}]
  wire  enqFire = io_enq_valid & ~full; // @[src/main/scala/memory/StoreQueue.scala 129:30]
  wire  _GEN_96 = 4'h0 == enqPtr_value | entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_97 = 4'h1 == enqPtr_value | entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_98 = 4'h2 == enqPtr_value | entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_99 = 4'h3 == enqPtr_value | entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_100 = 4'h4 == enqPtr_value | entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_101 = 4'h5 == enqPtr_value | entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_102 = 4'h6 == enqPtr_value | entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_103 = 4'h7 == enqPtr_value | entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_104 = 4'h8 == enqPtr_value | entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_105 = 4'h9 == enqPtr_value | entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_106 = 4'ha == enqPtr_value | entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_107 = 4'hb == enqPtr_value | entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_108 = 4'hc == enqPtr_value | entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_109 = 4'hd == enqPtr_value | entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_110 = 4'he == enqPtr_value | entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_111 = 4'hf == enqPtr_value | entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 101:20 135:{31,31}]
  wire  _GEN_112 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_113 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_114 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_115 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_116 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_117 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_118 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_119 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_120 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_121 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_122 = 4'ha == enqPtr_value ? 1'h0 : entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_123 = 4'hb == enqPtr_value ? 1'h0 : entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_124 = 4'hc == enqPtr_value ? 1'h0 : entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_125 = 4'hd == enqPtr_value ? 1'h0 : entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_126 = 4'he == enqPtr_value ? 1'h0 : entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_127 = 4'hf == enqPtr_value ? 1'h0 : entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 136:{31,31}]
  wire  _GEN_128 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_129 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_130 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_131 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_132 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_133 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_134 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_135 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_136 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_137 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_138 = 4'ha == enqPtr_value ? 1'h0 : entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_139 = 4'hb == enqPtr_value ? 1'h0 : entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_140 = 4'hc == enqPtr_value ? 1'h0 : entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_141 = 4'hd == enqPtr_value ? 1'h0 : entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_142 = 4'he == enqPtr_value ? 1'h0 : entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_143 = 4'hf == enqPtr_value ? 1'h0 : entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 137:{31,31}]
  wire  _GEN_144 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_145 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_146 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_147 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_148 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_149 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_150 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_151 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_152 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_153 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_154 = 4'ha == enqPtr_value ? 1'h0 : entries_10_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_155 = 4'hb == enqPtr_value ? 1'h0 : entries_11_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_156 = 4'hc == enqPtr_value ? 1'h0 : entries_12_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_157 = 4'hd == enqPtr_value ? 1'h0 : entries_13_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_158 = 4'he == enqPtr_value ? 1'h0 : entries_14_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_159 = 4'hf == enqPtr_value ? 1'h0 : entries_15_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 101:20 138:{31,31}]
  wire  _GEN_160 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_161 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_162 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_163 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_164 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_165 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_166 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_167 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_168 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_169 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_170 = 4'ha == enqPtr_value ? 1'h0 : entries_10_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_171 = 4'hb == enqPtr_value ? 1'h0 : entries_11_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_172 = 4'hc == enqPtr_value ? 1'h0 : entries_12_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_173 = 4'hd == enqPtr_value ? 1'h0 : entries_13_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_174 = 4'he == enqPtr_value ? 1'h0 : entries_14_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_175 = 4'hf == enqPtr_value ? 1'h0 : entries_15_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 139:{31,31}]
  wire  _GEN_176 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_177 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_178 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_179 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_180 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_181 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_182 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_183 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_184 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_185 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_186 = 4'ha == enqPtr_value ? 1'h0 : entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_187 = 4'hb == enqPtr_value ? 1'h0 : entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_188 = 4'hc == enqPtr_value ? 1'h0 : entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_189 = 4'hd == enqPtr_value ? 1'h0 : entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_190 = 4'he == enqPtr_value ? 1'h0 : entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_191 = 4'hf == enqPtr_value ? 1'h0 : entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 101:20 140:{31,31}]
  wire  _GEN_192 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_193 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_194 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_195 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_196 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_197 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_198 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_199 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_200 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_201 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_202 = 4'ha == enqPtr_value ? 1'h0 : entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_203 = 4'hb == enqPtr_value ? 1'h0 : entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_204 = 4'hc == enqPtr_value ? 1'h0 : entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_205 = 4'hd == enqPtr_value ? 1'h0 : entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_206 = 4'he == enqPtr_value ? 1'h0 : entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_207 = 4'hf == enqPtr_value ? 1'h0 : entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 101:20 141:{31,31}]
  wire  _GEN_208 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_209 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_210 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_211 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_212 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_213 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_214 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_215 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_216 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_217 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_218 = 4'ha == enqPtr_value ? 1'h0 : entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_219 = 4'hb == enqPtr_value ? 1'h0 : entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_220 = 4'hc == enqPtr_value ? 1'h0 : entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_221 = 4'hd == enqPtr_value ? 1'h0 : entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_222 = 4'he == enqPtr_value ? 1'h0 : entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire  _GEN_223 = 4'hf == enqPtr_value ? 1'h0 : entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 101:20 142:{31,31}]
  wire [31:0] _GEN_224 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_225 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_226 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_227 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_228 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_229 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_230 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_231 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_232 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_233 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_234 = 4'ha == enqPtr_value ? 32'h0 : entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_235 = 4'hb == enqPtr_value ? 32'h0 : entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_236 = 4'hc == enqPtr_value ? 32'h0 : entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_237 = 4'hd == enqPtr_value ? 32'h0 : entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_238 = 4'he == enqPtr_value ? 32'h0 : entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_239 = 4'hf == enqPtr_value ? 32'h0 : entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 143:{31,31}]
  wire [31:0] _GEN_240 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_241 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_242 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_243 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_244 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_245 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_246 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_247 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_248 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_249 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_250 = 4'ha == enqPtr_value ? 32'h0 : entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_251 = 4'hb == enqPtr_value ? 32'h0 : entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_252 = 4'hc == enqPtr_value ? 32'h0 : entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_253 = 4'hd == enqPtr_value ? 32'h0 : entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_254 = 4'he == enqPtr_value ? 32'h0 : entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_255 = 4'hf == enqPtr_value ? 32'h0 : entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 101:20 144:{31,31}]
  wire [31:0] _GEN_256 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_257 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_258 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_259 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_260 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_261 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_262 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_263 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_264 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_265 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_266 = 4'ha == enqPtr_value ? 32'h0 : entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_267 = 4'hb == enqPtr_value ? 32'h0 : entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_268 = 4'hc == enqPtr_value ? 32'h0 : entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_269 = 4'hd == enqPtr_value ? 32'h0 : entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_270 = 4'he == enqPtr_value ? 32'h0 : entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [31:0] _GEN_271 = 4'hf == enqPtr_value ? 32'h0 : entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 101:20 145:{31,31}]
  wire [9:0] _GEN_272 = 4'h0 == enqPtr_value ? 10'h0 : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_273 = 4'h1 == enqPtr_value ? 10'h0 : entries_1_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_274 = 4'h2 == enqPtr_value ? 10'h0 : entries_2_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_275 = 4'h3 == enqPtr_value ? 10'h0 : entries_3_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_276 = 4'h4 == enqPtr_value ? 10'h0 : entries_4_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_277 = 4'h5 == enqPtr_value ? 10'h0 : entries_5_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_278 = 4'h6 == enqPtr_value ? 10'h0 : entries_6_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_279 = 4'h7 == enqPtr_value ? 10'h0 : entries_7_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_280 = 4'h8 == enqPtr_value ? 10'h0 : entries_8_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_281 = 4'h9 == enqPtr_value ? 10'h0 : entries_9_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_282 = 4'ha == enqPtr_value ? 10'h0 : entries_10_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_283 = 4'hb == enqPtr_value ? 10'h0 : entries_11_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_284 = 4'hc == enqPtr_value ? 10'h0 : entries_12_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_285 = 4'hd == enqPtr_value ? 10'h0 : entries_13_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_286 = 4'he == enqPtr_value ? 10'h0 : entries_14_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire [9:0] _GEN_287 = 4'hf == enqPtr_value ? 10'h0 : entries_15_excpVec; // @[src/main/scala/memory/StoreQueue.scala 101:20 146:{31,31}]
  wire  _GEN_288 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_289 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_290 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_291 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_292 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_293 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_294 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_295 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_296 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_297 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_298 = 4'ha == enqPtr_value ? 1'h0 : entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_299 = 4'hb == enqPtr_value ? 1'h0 : entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_300 = 4'hc == enqPtr_value ? 1'h0 : entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_301 = 4'hd == enqPtr_value ? 1'h0 : entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_302 = 4'he == enqPtr_value ? 1'h0 : entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire  _GEN_303 = 4'hf == enqPtr_value ? 1'h0 : entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 101:20 147:{31,31}]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  _GEN_432 = enqFire ? _GEN_96 : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_433 = enqFire ? _GEN_97 : entries_1_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_434 = enqFire ? _GEN_98 : entries_2_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_435 = enqFire ? _GEN_99 : entries_3_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_436 = enqFire ? _GEN_100 : entries_4_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_437 = enqFire ? _GEN_101 : entries_5_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_438 = enqFire ? _GEN_102 : entries_6_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_439 = enqFire ? _GEN_103 : entries_7_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_440 = enqFire ? _GEN_104 : entries_8_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_441 = enqFire ? _GEN_105 : entries_9_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_442 = enqFire ? _GEN_106 : entries_10_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_443 = enqFire ? _GEN_107 : entries_11_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_444 = enqFire ? _GEN_108 : entries_12_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_445 = enqFire ? _GEN_109 : entries_13_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_446 = enqFire ? _GEN_110 : entries_14_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_447 = enqFire ? _GEN_111 : entries_15_valid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_448 = enqFire ? _GEN_112 : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_449 = enqFire ? _GEN_113 : entries_1_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_450 = enqFire ? _GEN_114 : entries_2_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_451 = enqFire ? _GEN_115 : entries_3_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_452 = enqFire ? _GEN_116 : entries_4_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_453 = enqFire ? _GEN_117 : entries_5_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_454 = enqFire ? _GEN_118 : entries_6_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_455 = enqFire ? _GEN_119 : entries_7_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_456 = enqFire ? _GEN_120 : entries_8_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_457 = enqFire ? _GEN_121 : entries_9_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_458 = enqFire ? _GEN_122 : entries_10_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_459 = enqFire ? _GEN_123 : entries_11_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_460 = enqFire ? _GEN_124 : entries_12_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_461 = enqFire ? _GEN_125 : entries_13_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_462 = enqFire ? _GEN_126 : entries_14_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_463 = enqFire ? _GEN_127 : entries_15_addrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_464 = enqFire ? _GEN_128 : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_465 = enqFire ? _GEN_129 : entries_1_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_466 = enqFire ? _GEN_130 : entries_2_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_467 = enqFire ? _GEN_131 : entries_3_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_468 = enqFire ? _GEN_132 : entries_4_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_469 = enqFire ? _GEN_133 : entries_5_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_470 = enqFire ? _GEN_134 : entries_6_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_471 = enqFire ? _GEN_135 : entries_7_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_472 = enqFire ? _GEN_136 : entries_8_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_473 = enqFire ? _GEN_137 : entries_9_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_474 = enqFire ? _GEN_138 : entries_10_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_475 = enqFire ? _GEN_139 : entries_11_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_476 = enqFire ? _GEN_140 : entries_12_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_477 = enqFire ? _GEN_141 : entries_13_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_478 = enqFire ? _GEN_142 : entries_14_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_479 = enqFire ? _GEN_143 : entries_15_dataValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_480 = enqFire ? _GEN_144 : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_481 = enqFire ? _GEN_145 : entries_1_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_482 = enqFire ? _GEN_146 : entries_2_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_483 = enqFire ? _GEN_147 : entries_3_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_484 = enqFire ? _GEN_148 : entries_4_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_485 = enqFire ? _GEN_149 : entries_5_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_486 = enqFire ? _GEN_150 : entries_6_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_487 = enqFire ? _GEN_151 : entries_7_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_488 = enqFire ? _GEN_152 : entries_8_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_489 = enqFire ? _GEN_153 : entries_9_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_490 = enqFire ? _GEN_154 : entries_10_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_491 = enqFire ? _GEN_155 : entries_11_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_492 = enqFire ? _GEN_156 : entries_12_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_493 = enqFire ? _GEN_157 : entries_13_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_494 = enqFire ? _GEN_158 : entries_14_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_495 = enqFire ? _GEN_159 : entries_15_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_496 = enqFire ? _GEN_160 : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_497 = enqFire ? _GEN_161 : entries_1_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_498 = enqFire ? _GEN_162 : entries_2_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_499 = enqFire ? _GEN_163 : entries_3_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_500 = enqFire ? _GEN_164 : entries_4_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_501 = enqFire ? _GEN_165 : entries_5_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_502 = enqFire ? _GEN_166 : entries_6_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_503 = enqFire ? _GEN_167 : entries_7_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_504 = enqFire ? _GEN_168 : entries_8_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_505 = enqFire ? _GEN_169 : entries_9_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_506 = enqFire ? _GEN_170 : entries_10_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_507 = enqFire ? _GEN_171 : entries_11_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_508 = enqFire ? _GEN_172 : entries_12_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_509 = enqFire ? _GEN_173 : entries_13_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_510 = enqFire ? _GEN_174 : entries_14_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_511 = enqFire ? _GEN_175 : entries_15_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_512 = enqFire ? _GEN_176 : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_513 = enqFire ? _GEN_177 : entries_1_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_514 = enqFire ? _GEN_178 : entries_2_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_515 = enqFire ? _GEN_179 : entries_3_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_516 = enqFire ? _GEN_180 : entries_4_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_517 = enqFire ? _GEN_181 : entries_5_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_518 = enqFire ? _GEN_182 : entries_6_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_519 = enqFire ? _GEN_183 : entries_7_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_520 = enqFire ? _GEN_184 : entries_8_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_521 = enqFire ? _GEN_185 : entries_9_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_522 = enqFire ? _GEN_186 : entries_10_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_523 = enqFire ? _GEN_187 : entries_11_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_524 = enqFire ? _GEN_188 : entries_12_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_525 = enqFire ? _GEN_189 : entries_13_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_526 = enqFire ? _GEN_190 : entries_14_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_527 = enqFire ? _GEN_191 : entries_15_committed; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_528 = enqFire ? _GEN_192 : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_529 = enqFire ? _GEN_193 : entries_1_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_530 = enqFire ? _GEN_194 : entries_2_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_531 = enqFire ? _GEN_195 : entries_3_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_532 = enqFire ? _GEN_196 : entries_4_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_533 = enqFire ? _GEN_197 : entries_5_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_534 = enqFire ? _GEN_198 : entries_6_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_535 = enqFire ? _GEN_199 : entries_7_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_536 = enqFire ? _GEN_200 : entries_8_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_537 = enqFire ? _GEN_201 : entries_9_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_538 = enqFire ? _GEN_202 : entries_10_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_539 = enqFire ? _GEN_203 : entries_11_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_540 = enqFire ? _GEN_204 : entries_12_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_541 = enqFire ? _GEN_205 : entries_13_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_542 = enqFire ? _GEN_206 : entries_14_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_543 = enqFire ? _GEN_207 : entries_15_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_544 = enqFire ? _GEN_208 : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_545 = enqFire ? _GEN_209 : entries_1_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_546 = enqFire ? _GEN_210 : entries_2_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_547 = enqFire ? _GEN_211 : entries_3_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_548 = enqFire ? _GEN_212 : entries_4_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_549 = enqFire ? _GEN_213 : entries_5_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_550 = enqFire ? _GEN_214 : entries_6_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_551 = enqFire ? _GEN_215 : entries_7_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_552 = enqFire ? _GEN_216 : entries_8_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_553 = enqFire ? _GEN_217 : entries_9_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_554 = enqFire ? _GEN_218 : entries_10_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_555 = enqFire ? _GEN_219 : entries_11_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_556 = enqFire ? _GEN_220 : entries_12_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_557 = enqFire ? _GEN_221 : entries_13_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_558 = enqFire ? _GEN_222 : entries_14_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_559 = enqFire ? _GEN_223 : entries_15_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_560 = enqFire ? _GEN_224 : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_561 = enqFire ? _GEN_225 : entries_1_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_562 = enqFire ? _GEN_226 : entries_2_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_563 = enqFire ? _GEN_227 : entries_3_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_564 = enqFire ? _GEN_228 : entries_4_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_565 = enqFire ? _GEN_229 : entries_5_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_566 = enqFire ? _GEN_230 : entries_6_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_567 = enqFire ? _GEN_231 : entries_7_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_568 = enqFire ? _GEN_232 : entries_8_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_569 = enqFire ? _GEN_233 : entries_9_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_570 = enqFire ? _GEN_234 : entries_10_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_571 = enqFire ? _GEN_235 : entries_11_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_572 = enqFire ? _GEN_236 : entries_12_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_573 = enqFire ? _GEN_237 : entries_13_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_574 = enqFire ? _GEN_238 : entries_14_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_575 = enqFire ? _GEN_239 : entries_15_vaddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_576 = enqFire ? _GEN_240 : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_577 = enqFire ? _GEN_241 : entries_1_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_578 = enqFire ? _GEN_242 : entries_2_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_579 = enqFire ? _GEN_243 : entries_3_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_580 = enqFire ? _GEN_244 : entries_4_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_581 = enqFire ? _GEN_245 : entries_5_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_582 = enqFire ? _GEN_246 : entries_6_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_583 = enqFire ? _GEN_247 : entries_7_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_584 = enqFire ? _GEN_248 : entries_8_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_585 = enqFire ? _GEN_249 : entries_9_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_586 = enqFire ? _GEN_250 : entries_10_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_587 = enqFire ? _GEN_251 : entries_11_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_588 = enqFire ? _GEN_252 : entries_12_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_589 = enqFire ? _GEN_253 : entries_13_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_590 = enqFire ? _GEN_254 : entries_14_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_591 = enqFire ? _GEN_255 : entries_15_paddr; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_592 = enqFire ? _GEN_256 : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_593 = enqFire ? _GEN_257 : entries_1_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_594 = enqFire ? _GEN_258 : entries_2_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_595 = enqFire ? _GEN_259 : entries_3_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_596 = enqFire ? _GEN_260 : entries_4_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_597 = enqFire ? _GEN_261 : entries_5_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_598 = enqFire ? _GEN_262 : entries_6_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_599 = enqFire ? _GEN_263 : entries_7_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_600 = enqFire ? _GEN_264 : entries_8_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_601 = enqFire ? _GEN_265 : entries_9_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_602 = enqFire ? _GEN_266 : entries_10_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_603 = enqFire ? _GEN_267 : entries_11_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_604 = enqFire ? _GEN_268 : entries_12_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_605 = enqFire ? _GEN_269 : entries_13_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_606 = enqFire ? _GEN_270 : entries_14_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [31:0] _GEN_607 = enqFire ? _GEN_271 : entries_15_data; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_608 = enqFire ? _GEN_272 : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_609 = enqFire ? _GEN_273 : entries_1_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_610 = enqFire ? _GEN_274 : entries_2_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_611 = enqFire ? _GEN_275 : entries_3_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_612 = enqFire ? _GEN_276 : entries_4_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_613 = enqFire ? _GEN_277 : entries_5_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_614 = enqFire ? _GEN_278 : entries_6_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_615 = enqFire ? _GEN_279 : entries_7_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_616 = enqFire ? _GEN_280 : entries_8_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_617 = enqFire ? _GEN_281 : entries_9_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_618 = enqFire ? _GEN_282 : entries_10_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_619 = enqFire ? _GEN_283 : entries_11_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_620 = enqFire ? _GEN_284 : entries_12_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_621 = enqFire ? _GEN_285 : entries_13_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_622 = enqFire ? _GEN_286 : entries_14_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire [9:0] _GEN_623 = enqFire ? _GEN_287 : entries_15_excpVec; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_624 = enqFire ? _GEN_288 : entries_0_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_625 = enqFire ? _GEN_289 : entries_1_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_626 = enqFire ? _GEN_290 : entries_2_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_627 = enqFire ? _GEN_291 : entries_3_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_628 = enqFire ? _GEN_292 : entries_4_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_629 = enqFire ? _GEN_293 : entries_5_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_630 = enqFire ? _GEN_294 : entries_6_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_631 = enqFire ? _GEN_295 : entries_7_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_632 = enqFire ? _GEN_296 : entries_8_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_633 = enqFire ? _GEN_297 : entries_9_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_634 = enqFire ? _GEN_298 : entries_10_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_635 = enqFire ? _GEN_299 : entries_11_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_636 = enqFire ? _GEN_300 : entries_12_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_637 = enqFire ? _GEN_301 : entries_13_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_638 = enqFire ? _GEN_302 : entries_14_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_639 = enqFire ? _GEN_303 : entries_15_cacheable; // @[src/main/scala/memory/StoreQueue.scala 131:17 101:20]
  wire  _GEN_722 = 4'h0 == io_addrWrite_idx | _GEN_448; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_723 = 4'h1 == io_addrWrite_idx | _GEN_449; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_724 = 4'h2 == io_addrWrite_idx | _GEN_450; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_725 = 4'h3 == io_addrWrite_idx | _GEN_451; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_726 = 4'h4 == io_addrWrite_idx | _GEN_452; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_727 = 4'h5 == io_addrWrite_idx | _GEN_453; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_728 = 4'h6 == io_addrWrite_idx | _GEN_454; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_729 = 4'h7 == io_addrWrite_idx | _GEN_455; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_730 = 4'h8 == io_addrWrite_idx | _GEN_456; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_731 = 4'h9 == io_addrWrite_idx | _GEN_457; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_732 = 4'ha == io_addrWrite_idx | _GEN_458; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_733 = 4'hb == io_addrWrite_idx | _GEN_459; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_734 = 4'hc == io_addrWrite_idx | _GEN_460; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_735 = 4'hd == io_addrWrite_idx | _GEN_461; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_736 = 4'he == io_addrWrite_idx | _GEN_462; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_737 = 4'hf == io_addrWrite_idx | _GEN_463; // @[src/main/scala/memory/StoreQueue.scala 161:{28,28}]
  wire  _GEN_786 = 4'h0 == io_dataWrite_idx | _GEN_464; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_787 = 4'h1 == io_dataWrite_idx | _GEN_465; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_788 = 4'h2 == io_dataWrite_idx | _GEN_466; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_789 = 4'h3 == io_dataWrite_idx | _GEN_467; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_790 = 4'h4 == io_dataWrite_idx | _GEN_468; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_791 = 4'h5 == io_dataWrite_idx | _GEN_469; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_792 = 4'h6 == io_dataWrite_idx | _GEN_470; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_793 = 4'h7 == io_dataWrite_idx | _GEN_471; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_794 = 4'h8 == io_dataWrite_idx | _GEN_472; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_795 = 4'h9 == io_dataWrite_idx | _GEN_473; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_796 = 4'ha == io_dataWrite_idx | _GEN_474; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_797 = 4'hb == io_dataWrite_idx | _GEN_475; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_798 = 4'hc == io_dataWrite_idx | _GEN_476; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_799 = 4'hd == io_dataWrite_idx | _GEN_477; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_800 = 4'he == io_dataWrite_idx | _GEN_478; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire  _GEN_801 = 4'hf == io_dataWrite_idx | _GEN_479; // @[src/main/scala/memory/StoreQueue.scala 170:{28,28}]
  wire [4:0] _idx_T = {{1'd0}, deqPtr_value}; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire [3:0] idx = _idx_T[3:0]; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_851 = 4'h1 == idx ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_852 = 4'h2 == idx ? entries_2_valid : _GEN_851; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_853 = 4'h3 == idx ? entries_3_valid : _GEN_852; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_854 = 4'h4 == idx ? entries_4_valid : _GEN_853; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_855 = 4'h5 == idx ? entries_5_valid : _GEN_854; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_856 = 4'h6 == idx ? entries_6_valid : _GEN_855; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_857 = 4'h7 == idx ? entries_7_valid : _GEN_856; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_858 = 4'h8 == idx ? entries_8_valid : _GEN_857; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_859 = 4'h9 == idx ? entries_9_valid : _GEN_858; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_860 = 4'ha == idx ? entries_10_valid : _GEN_859; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_861 = 4'hb == idx ? entries_11_valid : _GEN_860; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_862 = 4'hc == idx ? entries_12_valid : _GEN_861; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_863 = 4'hd == idx ? entries_13_valid : _GEN_862; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_864 = 4'he == idx ? entries_14_valid : _GEN_863; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_865 = 4'hf == idx ? entries_15_valid : _GEN_864; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_867 = 4'h1 == idx ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_868 = 4'h2 == idx ? entries_2_addrValid : _GEN_867; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_869 = 4'h3 == idx ? entries_3_addrValid : _GEN_868; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_870 = 4'h4 == idx ? entries_4_addrValid : _GEN_869; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_871 = 4'h5 == idx ? entries_5_addrValid : _GEN_870; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_872 = 4'h6 == idx ? entries_6_addrValid : _GEN_871; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_873 = 4'h7 == idx ? entries_7_addrValid : _GEN_872; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_874 = 4'h8 == idx ? entries_8_addrValid : _GEN_873; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_875 = 4'h9 == idx ? entries_9_addrValid : _GEN_874; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_876 = 4'ha == idx ? entries_10_addrValid : _GEN_875; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_877 = 4'hb == idx ? entries_11_addrValid : _GEN_876; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_878 = 4'hc == idx ? entries_12_addrValid : _GEN_877; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_879 = 4'hd == idx ? entries_13_addrValid : _GEN_878; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_880 = 4'he == idx ? entries_14_addrValid : _GEN_879; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_881 = 4'hf == idx ? entries_15_addrValid : _GEN_880; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_0_T = _GEN_865 & _GEN_881; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_883 = 4'h1 == idx ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_884 = 4'h2 == idx ? entries_2_mmuIssued : _GEN_883; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_885 = 4'h3 == idx ? entries_3_mmuIssued : _GEN_884; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_886 = 4'h4 == idx ? entries_4_mmuIssued : _GEN_885; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_887 = 4'h5 == idx ? entries_5_mmuIssued : _GEN_886; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_888 = 4'h6 == idx ? entries_6_mmuIssued : _GEN_887; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_889 = 4'h7 == idx ? entries_7_mmuIssued : _GEN_888; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_890 = 4'h8 == idx ? entries_8_mmuIssued : _GEN_889; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_891 = 4'h9 == idx ? entries_9_mmuIssued : _GEN_890; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_892 = 4'ha == idx ? entries_10_mmuIssued : _GEN_891; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_893 = 4'hb == idx ? entries_11_mmuIssued : _GEN_892; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_894 = 4'hc == idx ? entries_12_mmuIssued : _GEN_893; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_895 = 4'hd == idx ? entries_13_mmuIssued : _GEN_894; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_896 = 4'he == idx ? entries_14_mmuIssued : _GEN_895; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_897 = 4'hf == idx ? entries_15_mmuIssued : _GEN_896; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_0 = _GEN_865 & _GEN_881 & ~_GEN_897; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [4:0] _idx_T_2 = deqPtr_value + 4'h1; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire [3:0] idx_1 = deqPtr_value + 4'h1; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_899 = 4'h1 == idx_1 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_900 = 4'h2 == idx_1 ? entries_2_valid : _GEN_899; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_901 = 4'h3 == idx_1 ? entries_3_valid : _GEN_900; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_902 = 4'h4 == idx_1 ? entries_4_valid : _GEN_901; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_903 = 4'h5 == idx_1 ? entries_5_valid : _GEN_902; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_904 = 4'h6 == idx_1 ? entries_6_valid : _GEN_903; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_905 = 4'h7 == idx_1 ? entries_7_valid : _GEN_904; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_906 = 4'h8 == idx_1 ? entries_8_valid : _GEN_905; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_907 = 4'h9 == idx_1 ? entries_9_valid : _GEN_906; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_908 = 4'ha == idx_1 ? entries_10_valid : _GEN_907; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_909 = 4'hb == idx_1 ? entries_11_valid : _GEN_908; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_910 = 4'hc == idx_1 ? entries_12_valid : _GEN_909; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_911 = 4'hd == idx_1 ? entries_13_valid : _GEN_910; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_912 = 4'he == idx_1 ? entries_14_valid : _GEN_911; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_913 = 4'hf == idx_1 ? entries_15_valid : _GEN_912; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_915 = 4'h1 == idx_1 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_916 = 4'h2 == idx_1 ? entries_2_addrValid : _GEN_915; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_917 = 4'h3 == idx_1 ? entries_3_addrValid : _GEN_916; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_918 = 4'h4 == idx_1 ? entries_4_addrValid : _GEN_917; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_919 = 4'h5 == idx_1 ? entries_5_addrValid : _GEN_918; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_920 = 4'h6 == idx_1 ? entries_6_addrValid : _GEN_919; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_921 = 4'h7 == idx_1 ? entries_7_addrValid : _GEN_920; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_922 = 4'h8 == idx_1 ? entries_8_addrValid : _GEN_921; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_923 = 4'h9 == idx_1 ? entries_9_addrValid : _GEN_922; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_924 = 4'ha == idx_1 ? entries_10_addrValid : _GEN_923; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_925 = 4'hb == idx_1 ? entries_11_addrValid : _GEN_924; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_926 = 4'hc == idx_1 ? entries_12_addrValid : _GEN_925; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_927 = 4'hd == idx_1 ? entries_13_addrValid : _GEN_926; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_928 = 4'he == idx_1 ? entries_14_addrValid : _GEN_927; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_929 = 4'hf == idx_1 ? entries_15_addrValid : _GEN_928; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_1_T = _GEN_913 & _GEN_929; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_931 = 4'h1 == idx_1 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_932 = 4'h2 == idx_1 ? entries_2_mmuIssued : _GEN_931; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_933 = 4'h3 == idx_1 ? entries_3_mmuIssued : _GEN_932; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_934 = 4'h4 == idx_1 ? entries_4_mmuIssued : _GEN_933; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_935 = 4'h5 == idx_1 ? entries_5_mmuIssued : _GEN_934; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_936 = 4'h6 == idx_1 ? entries_6_mmuIssued : _GEN_935; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_937 = 4'h7 == idx_1 ? entries_7_mmuIssued : _GEN_936; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_938 = 4'h8 == idx_1 ? entries_8_mmuIssued : _GEN_937; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_939 = 4'h9 == idx_1 ? entries_9_mmuIssued : _GEN_938; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_940 = 4'ha == idx_1 ? entries_10_mmuIssued : _GEN_939; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_941 = 4'hb == idx_1 ? entries_11_mmuIssued : _GEN_940; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_942 = 4'hc == idx_1 ? entries_12_mmuIssued : _GEN_941; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_943 = 4'hd == idx_1 ? entries_13_mmuIssued : _GEN_942; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_944 = 4'he == idx_1 ? entries_14_mmuIssued : _GEN_943; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_945 = 4'hf == idx_1 ? entries_15_mmuIssued : _GEN_944; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_1 = _GEN_913 & _GEN_929 & ~_GEN_945; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_2 = deqPtr_value + 4'h2; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_947 = 4'h1 == idx_2 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_948 = 4'h2 == idx_2 ? entries_2_valid : _GEN_947; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_949 = 4'h3 == idx_2 ? entries_3_valid : _GEN_948; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_950 = 4'h4 == idx_2 ? entries_4_valid : _GEN_949; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_951 = 4'h5 == idx_2 ? entries_5_valid : _GEN_950; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_952 = 4'h6 == idx_2 ? entries_6_valid : _GEN_951; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_953 = 4'h7 == idx_2 ? entries_7_valid : _GEN_952; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_954 = 4'h8 == idx_2 ? entries_8_valid : _GEN_953; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_955 = 4'h9 == idx_2 ? entries_9_valid : _GEN_954; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_956 = 4'ha == idx_2 ? entries_10_valid : _GEN_955; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_957 = 4'hb == idx_2 ? entries_11_valid : _GEN_956; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_958 = 4'hc == idx_2 ? entries_12_valid : _GEN_957; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_959 = 4'hd == idx_2 ? entries_13_valid : _GEN_958; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_960 = 4'he == idx_2 ? entries_14_valid : _GEN_959; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_961 = 4'hf == idx_2 ? entries_15_valid : _GEN_960; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_963 = 4'h1 == idx_2 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_964 = 4'h2 == idx_2 ? entries_2_addrValid : _GEN_963; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_965 = 4'h3 == idx_2 ? entries_3_addrValid : _GEN_964; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_966 = 4'h4 == idx_2 ? entries_4_addrValid : _GEN_965; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_967 = 4'h5 == idx_2 ? entries_5_addrValid : _GEN_966; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_968 = 4'h6 == idx_2 ? entries_6_addrValid : _GEN_967; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_969 = 4'h7 == idx_2 ? entries_7_addrValid : _GEN_968; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_970 = 4'h8 == idx_2 ? entries_8_addrValid : _GEN_969; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_971 = 4'h9 == idx_2 ? entries_9_addrValid : _GEN_970; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_972 = 4'ha == idx_2 ? entries_10_addrValid : _GEN_971; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_973 = 4'hb == idx_2 ? entries_11_addrValid : _GEN_972; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_974 = 4'hc == idx_2 ? entries_12_addrValid : _GEN_973; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_975 = 4'hd == idx_2 ? entries_13_addrValid : _GEN_974; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_976 = 4'he == idx_2 ? entries_14_addrValid : _GEN_975; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_977 = 4'hf == idx_2 ? entries_15_addrValid : _GEN_976; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_2_T = _GEN_961 & _GEN_977; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_979 = 4'h1 == idx_2 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_980 = 4'h2 == idx_2 ? entries_2_mmuIssued : _GEN_979; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_981 = 4'h3 == idx_2 ? entries_3_mmuIssued : _GEN_980; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_982 = 4'h4 == idx_2 ? entries_4_mmuIssued : _GEN_981; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_983 = 4'h5 == idx_2 ? entries_5_mmuIssued : _GEN_982; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_984 = 4'h6 == idx_2 ? entries_6_mmuIssued : _GEN_983; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_985 = 4'h7 == idx_2 ? entries_7_mmuIssued : _GEN_984; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_986 = 4'h8 == idx_2 ? entries_8_mmuIssued : _GEN_985; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_987 = 4'h9 == idx_2 ? entries_9_mmuIssued : _GEN_986; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_988 = 4'ha == idx_2 ? entries_10_mmuIssued : _GEN_987; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_989 = 4'hb == idx_2 ? entries_11_mmuIssued : _GEN_988; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_990 = 4'hc == idx_2 ? entries_12_mmuIssued : _GEN_989; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_991 = 4'hd == idx_2 ? entries_13_mmuIssued : _GEN_990; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_992 = 4'he == idx_2 ? entries_14_mmuIssued : _GEN_991; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_993 = 4'hf == idx_2 ? entries_15_mmuIssued : _GEN_992; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_2 = _GEN_961 & _GEN_977 & ~_GEN_993; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_3 = deqPtr_value + 4'h3; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_995 = 4'h1 == idx_3 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_996 = 4'h2 == idx_3 ? entries_2_valid : _GEN_995; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_997 = 4'h3 == idx_3 ? entries_3_valid : _GEN_996; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_998 = 4'h4 == idx_3 ? entries_4_valid : _GEN_997; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_999 = 4'h5 == idx_3 ? entries_5_valid : _GEN_998; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1000 = 4'h6 == idx_3 ? entries_6_valid : _GEN_999; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1001 = 4'h7 == idx_3 ? entries_7_valid : _GEN_1000; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1002 = 4'h8 == idx_3 ? entries_8_valid : _GEN_1001; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1003 = 4'h9 == idx_3 ? entries_9_valid : _GEN_1002; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1004 = 4'ha == idx_3 ? entries_10_valid : _GEN_1003; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1005 = 4'hb == idx_3 ? entries_11_valid : _GEN_1004; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1006 = 4'hc == idx_3 ? entries_12_valid : _GEN_1005; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1007 = 4'hd == idx_3 ? entries_13_valid : _GEN_1006; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1008 = 4'he == idx_3 ? entries_14_valid : _GEN_1007; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1009 = 4'hf == idx_3 ? entries_15_valid : _GEN_1008; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1011 = 4'h1 == idx_3 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1012 = 4'h2 == idx_3 ? entries_2_addrValid : _GEN_1011; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1013 = 4'h3 == idx_3 ? entries_3_addrValid : _GEN_1012; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1014 = 4'h4 == idx_3 ? entries_4_addrValid : _GEN_1013; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1015 = 4'h5 == idx_3 ? entries_5_addrValid : _GEN_1014; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1016 = 4'h6 == idx_3 ? entries_6_addrValid : _GEN_1015; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1017 = 4'h7 == idx_3 ? entries_7_addrValid : _GEN_1016; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1018 = 4'h8 == idx_3 ? entries_8_addrValid : _GEN_1017; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1019 = 4'h9 == idx_3 ? entries_9_addrValid : _GEN_1018; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1020 = 4'ha == idx_3 ? entries_10_addrValid : _GEN_1019; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1021 = 4'hb == idx_3 ? entries_11_addrValid : _GEN_1020; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1022 = 4'hc == idx_3 ? entries_12_addrValid : _GEN_1021; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1023 = 4'hd == idx_3 ? entries_13_addrValid : _GEN_1022; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1024 = 4'he == idx_3 ? entries_14_addrValid : _GEN_1023; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1025 = 4'hf == idx_3 ? entries_15_addrValid : _GEN_1024; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_3_T = _GEN_1009 & _GEN_1025; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1027 = 4'h1 == idx_3 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1028 = 4'h2 == idx_3 ? entries_2_mmuIssued : _GEN_1027; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1029 = 4'h3 == idx_3 ? entries_3_mmuIssued : _GEN_1028; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1030 = 4'h4 == idx_3 ? entries_4_mmuIssued : _GEN_1029; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1031 = 4'h5 == idx_3 ? entries_5_mmuIssued : _GEN_1030; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1032 = 4'h6 == idx_3 ? entries_6_mmuIssued : _GEN_1031; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1033 = 4'h7 == idx_3 ? entries_7_mmuIssued : _GEN_1032; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1034 = 4'h8 == idx_3 ? entries_8_mmuIssued : _GEN_1033; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1035 = 4'h9 == idx_3 ? entries_9_mmuIssued : _GEN_1034; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1036 = 4'ha == idx_3 ? entries_10_mmuIssued : _GEN_1035; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1037 = 4'hb == idx_3 ? entries_11_mmuIssued : _GEN_1036; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1038 = 4'hc == idx_3 ? entries_12_mmuIssued : _GEN_1037; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1039 = 4'hd == idx_3 ? entries_13_mmuIssued : _GEN_1038; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1040 = 4'he == idx_3 ? entries_14_mmuIssued : _GEN_1039; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1041 = 4'hf == idx_3 ? entries_15_mmuIssued : _GEN_1040; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_3 = _GEN_1009 & _GEN_1025 & ~_GEN_1041; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_4 = deqPtr_value + 4'h4; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1043 = 4'h1 == idx_4 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1044 = 4'h2 == idx_4 ? entries_2_valid : _GEN_1043; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1045 = 4'h3 == idx_4 ? entries_3_valid : _GEN_1044; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1046 = 4'h4 == idx_4 ? entries_4_valid : _GEN_1045; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1047 = 4'h5 == idx_4 ? entries_5_valid : _GEN_1046; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1048 = 4'h6 == idx_4 ? entries_6_valid : _GEN_1047; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1049 = 4'h7 == idx_4 ? entries_7_valid : _GEN_1048; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1050 = 4'h8 == idx_4 ? entries_8_valid : _GEN_1049; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1051 = 4'h9 == idx_4 ? entries_9_valid : _GEN_1050; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1052 = 4'ha == idx_4 ? entries_10_valid : _GEN_1051; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1053 = 4'hb == idx_4 ? entries_11_valid : _GEN_1052; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1054 = 4'hc == idx_4 ? entries_12_valid : _GEN_1053; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1055 = 4'hd == idx_4 ? entries_13_valid : _GEN_1054; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1056 = 4'he == idx_4 ? entries_14_valid : _GEN_1055; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1057 = 4'hf == idx_4 ? entries_15_valid : _GEN_1056; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1059 = 4'h1 == idx_4 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1060 = 4'h2 == idx_4 ? entries_2_addrValid : _GEN_1059; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1061 = 4'h3 == idx_4 ? entries_3_addrValid : _GEN_1060; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1062 = 4'h4 == idx_4 ? entries_4_addrValid : _GEN_1061; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1063 = 4'h5 == idx_4 ? entries_5_addrValid : _GEN_1062; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1064 = 4'h6 == idx_4 ? entries_6_addrValid : _GEN_1063; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1065 = 4'h7 == idx_4 ? entries_7_addrValid : _GEN_1064; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1066 = 4'h8 == idx_4 ? entries_8_addrValid : _GEN_1065; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1067 = 4'h9 == idx_4 ? entries_9_addrValid : _GEN_1066; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1068 = 4'ha == idx_4 ? entries_10_addrValid : _GEN_1067; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1069 = 4'hb == idx_4 ? entries_11_addrValid : _GEN_1068; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1070 = 4'hc == idx_4 ? entries_12_addrValid : _GEN_1069; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1071 = 4'hd == idx_4 ? entries_13_addrValid : _GEN_1070; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1072 = 4'he == idx_4 ? entries_14_addrValid : _GEN_1071; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1073 = 4'hf == idx_4 ? entries_15_addrValid : _GEN_1072; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_4_T = _GEN_1057 & _GEN_1073; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1075 = 4'h1 == idx_4 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1076 = 4'h2 == idx_4 ? entries_2_mmuIssued : _GEN_1075; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1077 = 4'h3 == idx_4 ? entries_3_mmuIssued : _GEN_1076; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1078 = 4'h4 == idx_4 ? entries_4_mmuIssued : _GEN_1077; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1079 = 4'h5 == idx_4 ? entries_5_mmuIssued : _GEN_1078; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1080 = 4'h6 == idx_4 ? entries_6_mmuIssued : _GEN_1079; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1081 = 4'h7 == idx_4 ? entries_7_mmuIssued : _GEN_1080; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1082 = 4'h8 == idx_4 ? entries_8_mmuIssued : _GEN_1081; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1083 = 4'h9 == idx_4 ? entries_9_mmuIssued : _GEN_1082; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1084 = 4'ha == idx_4 ? entries_10_mmuIssued : _GEN_1083; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1085 = 4'hb == idx_4 ? entries_11_mmuIssued : _GEN_1084; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1086 = 4'hc == idx_4 ? entries_12_mmuIssued : _GEN_1085; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1087 = 4'hd == idx_4 ? entries_13_mmuIssued : _GEN_1086; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1088 = 4'he == idx_4 ? entries_14_mmuIssued : _GEN_1087; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1089 = 4'hf == idx_4 ? entries_15_mmuIssued : _GEN_1088; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_4 = _GEN_1057 & _GEN_1073 & ~_GEN_1089; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_5 = deqPtr_value + 4'h5; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1091 = 4'h1 == idx_5 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1092 = 4'h2 == idx_5 ? entries_2_valid : _GEN_1091; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1093 = 4'h3 == idx_5 ? entries_3_valid : _GEN_1092; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1094 = 4'h4 == idx_5 ? entries_4_valid : _GEN_1093; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1095 = 4'h5 == idx_5 ? entries_5_valid : _GEN_1094; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1096 = 4'h6 == idx_5 ? entries_6_valid : _GEN_1095; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1097 = 4'h7 == idx_5 ? entries_7_valid : _GEN_1096; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1098 = 4'h8 == idx_5 ? entries_8_valid : _GEN_1097; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1099 = 4'h9 == idx_5 ? entries_9_valid : _GEN_1098; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1100 = 4'ha == idx_5 ? entries_10_valid : _GEN_1099; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1101 = 4'hb == idx_5 ? entries_11_valid : _GEN_1100; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1102 = 4'hc == idx_5 ? entries_12_valid : _GEN_1101; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1103 = 4'hd == idx_5 ? entries_13_valid : _GEN_1102; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1104 = 4'he == idx_5 ? entries_14_valid : _GEN_1103; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1105 = 4'hf == idx_5 ? entries_15_valid : _GEN_1104; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1107 = 4'h1 == idx_5 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1108 = 4'h2 == idx_5 ? entries_2_addrValid : _GEN_1107; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1109 = 4'h3 == idx_5 ? entries_3_addrValid : _GEN_1108; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1110 = 4'h4 == idx_5 ? entries_4_addrValid : _GEN_1109; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1111 = 4'h5 == idx_5 ? entries_5_addrValid : _GEN_1110; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1112 = 4'h6 == idx_5 ? entries_6_addrValid : _GEN_1111; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1113 = 4'h7 == idx_5 ? entries_7_addrValid : _GEN_1112; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1114 = 4'h8 == idx_5 ? entries_8_addrValid : _GEN_1113; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1115 = 4'h9 == idx_5 ? entries_9_addrValid : _GEN_1114; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1116 = 4'ha == idx_5 ? entries_10_addrValid : _GEN_1115; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1117 = 4'hb == idx_5 ? entries_11_addrValid : _GEN_1116; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1118 = 4'hc == idx_5 ? entries_12_addrValid : _GEN_1117; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1119 = 4'hd == idx_5 ? entries_13_addrValid : _GEN_1118; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1120 = 4'he == idx_5 ? entries_14_addrValid : _GEN_1119; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1121 = 4'hf == idx_5 ? entries_15_addrValid : _GEN_1120; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_5_T = _GEN_1105 & _GEN_1121; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1123 = 4'h1 == idx_5 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1124 = 4'h2 == idx_5 ? entries_2_mmuIssued : _GEN_1123; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1125 = 4'h3 == idx_5 ? entries_3_mmuIssued : _GEN_1124; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1126 = 4'h4 == idx_5 ? entries_4_mmuIssued : _GEN_1125; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1127 = 4'h5 == idx_5 ? entries_5_mmuIssued : _GEN_1126; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1128 = 4'h6 == idx_5 ? entries_6_mmuIssued : _GEN_1127; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1129 = 4'h7 == idx_5 ? entries_7_mmuIssued : _GEN_1128; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1130 = 4'h8 == idx_5 ? entries_8_mmuIssued : _GEN_1129; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1131 = 4'h9 == idx_5 ? entries_9_mmuIssued : _GEN_1130; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1132 = 4'ha == idx_5 ? entries_10_mmuIssued : _GEN_1131; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1133 = 4'hb == idx_5 ? entries_11_mmuIssued : _GEN_1132; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1134 = 4'hc == idx_5 ? entries_12_mmuIssued : _GEN_1133; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1135 = 4'hd == idx_5 ? entries_13_mmuIssued : _GEN_1134; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1136 = 4'he == idx_5 ? entries_14_mmuIssued : _GEN_1135; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1137 = 4'hf == idx_5 ? entries_15_mmuIssued : _GEN_1136; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_5 = _GEN_1105 & _GEN_1121 & ~_GEN_1137; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_6 = deqPtr_value + 4'h6; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1139 = 4'h1 == idx_6 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1140 = 4'h2 == idx_6 ? entries_2_valid : _GEN_1139; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1141 = 4'h3 == idx_6 ? entries_3_valid : _GEN_1140; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1142 = 4'h4 == idx_6 ? entries_4_valid : _GEN_1141; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1143 = 4'h5 == idx_6 ? entries_5_valid : _GEN_1142; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1144 = 4'h6 == idx_6 ? entries_6_valid : _GEN_1143; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1145 = 4'h7 == idx_6 ? entries_7_valid : _GEN_1144; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1146 = 4'h8 == idx_6 ? entries_8_valid : _GEN_1145; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1147 = 4'h9 == idx_6 ? entries_9_valid : _GEN_1146; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1148 = 4'ha == idx_6 ? entries_10_valid : _GEN_1147; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1149 = 4'hb == idx_6 ? entries_11_valid : _GEN_1148; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1150 = 4'hc == idx_6 ? entries_12_valid : _GEN_1149; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1151 = 4'hd == idx_6 ? entries_13_valid : _GEN_1150; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1152 = 4'he == idx_6 ? entries_14_valid : _GEN_1151; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1153 = 4'hf == idx_6 ? entries_15_valid : _GEN_1152; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1155 = 4'h1 == idx_6 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1156 = 4'h2 == idx_6 ? entries_2_addrValid : _GEN_1155; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1157 = 4'h3 == idx_6 ? entries_3_addrValid : _GEN_1156; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1158 = 4'h4 == idx_6 ? entries_4_addrValid : _GEN_1157; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1159 = 4'h5 == idx_6 ? entries_5_addrValid : _GEN_1158; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1160 = 4'h6 == idx_6 ? entries_6_addrValid : _GEN_1159; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1161 = 4'h7 == idx_6 ? entries_7_addrValid : _GEN_1160; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1162 = 4'h8 == idx_6 ? entries_8_addrValid : _GEN_1161; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1163 = 4'h9 == idx_6 ? entries_9_addrValid : _GEN_1162; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1164 = 4'ha == idx_6 ? entries_10_addrValid : _GEN_1163; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1165 = 4'hb == idx_6 ? entries_11_addrValid : _GEN_1164; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1166 = 4'hc == idx_6 ? entries_12_addrValid : _GEN_1165; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1167 = 4'hd == idx_6 ? entries_13_addrValid : _GEN_1166; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1168 = 4'he == idx_6 ? entries_14_addrValid : _GEN_1167; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1169 = 4'hf == idx_6 ? entries_15_addrValid : _GEN_1168; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_6_T = _GEN_1153 & _GEN_1169; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1171 = 4'h1 == idx_6 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1172 = 4'h2 == idx_6 ? entries_2_mmuIssued : _GEN_1171; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1173 = 4'h3 == idx_6 ? entries_3_mmuIssued : _GEN_1172; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1174 = 4'h4 == idx_6 ? entries_4_mmuIssued : _GEN_1173; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1175 = 4'h5 == idx_6 ? entries_5_mmuIssued : _GEN_1174; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1176 = 4'h6 == idx_6 ? entries_6_mmuIssued : _GEN_1175; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1177 = 4'h7 == idx_6 ? entries_7_mmuIssued : _GEN_1176; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1178 = 4'h8 == idx_6 ? entries_8_mmuIssued : _GEN_1177; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1179 = 4'h9 == idx_6 ? entries_9_mmuIssued : _GEN_1178; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1180 = 4'ha == idx_6 ? entries_10_mmuIssued : _GEN_1179; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1181 = 4'hb == idx_6 ? entries_11_mmuIssued : _GEN_1180; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1182 = 4'hc == idx_6 ? entries_12_mmuIssued : _GEN_1181; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1183 = 4'hd == idx_6 ? entries_13_mmuIssued : _GEN_1182; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1184 = 4'he == idx_6 ? entries_14_mmuIssued : _GEN_1183; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1185 = 4'hf == idx_6 ? entries_15_mmuIssued : _GEN_1184; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_6 = _GEN_1153 & _GEN_1169 & ~_GEN_1185; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_7 = deqPtr_value + 4'h7; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1187 = 4'h1 == idx_7 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1188 = 4'h2 == idx_7 ? entries_2_valid : _GEN_1187; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1189 = 4'h3 == idx_7 ? entries_3_valid : _GEN_1188; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1190 = 4'h4 == idx_7 ? entries_4_valid : _GEN_1189; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1191 = 4'h5 == idx_7 ? entries_5_valid : _GEN_1190; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1192 = 4'h6 == idx_7 ? entries_6_valid : _GEN_1191; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1193 = 4'h7 == idx_7 ? entries_7_valid : _GEN_1192; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1194 = 4'h8 == idx_7 ? entries_8_valid : _GEN_1193; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1195 = 4'h9 == idx_7 ? entries_9_valid : _GEN_1194; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1196 = 4'ha == idx_7 ? entries_10_valid : _GEN_1195; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1197 = 4'hb == idx_7 ? entries_11_valid : _GEN_1196; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1198 = 4'hc == idx_7 ? entries_12_valid : _GEN_1197; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1199 = 4'hd == idx_7 ? entries_13_valid : _GEN_1198; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1200 = 4'he == idx_7 ? entries_14_valid : _GEN_1199; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1201 = 4'hf == idx_7 ? entries_15_valid : _GEN_1200; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1203 = 4'h1 == idx_7 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1204 = 4'h2 == idx_7 ? entries_2_addrValid : _GEN_1203; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1205 = 4'h3 == idx_7 ? entries_3_addrValid : _GEN_1204; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1206 = 4'h4 == idx_7 ? entries_4_addrValid : _GEN_1205; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1207 = 4'h5 == idx_7 ? entries_5_addrValid : _GEN_1206; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1208 = 4'h6 == idx_7 ? entries_6_addrValid : _GEN_1207; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1209 = 4'h7 == idx_7 ? entries_7_addrValid : _GEN_1208; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1210 = 4'h8 == idx_7 ? entries_8_addrValid : _GEN_1209; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1211 = 4'h9 == idx_7 ? entries_9_addrValid : _GEN_1210; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1212 = 4'ha == idx_7 ? entries_10_addrValid : _GEN_1211; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1213 = 4'hb == idx_7 ? entries_11_addrValid : _GEN_1212; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1214 = 4'hc == idx_7 ? entries_12_addrValid : _GEN_1213; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1215 = 4'hd == idx_7 ? entries_13_addrValid : _GEN_1214; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1216 = 4'he == idx_7 ? entries_14_addrValid : _GEN_1215; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1217 = 4'hf == idx_7 ? entries_15_addrValid : _GEN_1216; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_7_T = _GEN_1201 & _GEN_1217; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1219 = 4'h1 == idx_7 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1220 = 4'h2 == idx_7 ? entries_2_mmuIssued : _GEN_1219; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1221 = 4'h3 == idx_7 ? entries_3_mmuIssued : _GEN_1220; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1222 = 4'h4 == idx_7 ? entries_4_mmuIssued : _GEN_1221; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1223 = 4'h5 == idx_7 ? entries_5_mmuIssued : _GEN_1222; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1224 = 4'h6 == idx_7 ? entries_6_mmuIssued : _GEN_1223; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1225 = 4'h7 == idx_7 ? entries_7_mmuIssued : _GEN_1224; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1226 = 4'h8 == idx_7 ? entries_8_mmuIssued : _GEN_1225; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1227 = 4'h9 == idx_7 ? entries_9_mmuIssued : _GEN_1226; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1228 = 4'ha == idx_7 ? entries_10_mmuIssued : _GEN_1227; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1229 = 4'hb == idx_7 ? entries_11_mmuIssued : _GEN_1228; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1230 = 4'hc == idx_7 ? entries_12_mmuIssued : _GEN_1229; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1231 = 4'hd == idx_7 ? entries_13_mmuIssued : _GEN_1230; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1232 = 4'he == idx_7 ? entries_14_mmuIssued : _GEN_1231; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1233 = 4'hf == idx_7 ? entries_15_mmuIssued : _GEN_1232; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_7 = _GEN_1201 & _GEN_1217 & ~_GEN_1233; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_8 = deqPtr_value + 4'h8; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1235 = 4'h1 == idx_8 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1236 = 4'h2 == idx_8 ? entries_2_valid : _GEN_1235; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1237 = 4'h3 == idx_8 ? entries_3_valid : _GEN_1236; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1238 = 4'h4 == idx_8 ? entries_4_valid : _GEN_1237; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1239 = 4'h5 == idx_8 ? entries_5_valid : _GEN_1238; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1240 = 4'h6 == idx_8 ? entries_6_valid : _GEN_1239; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1241 = 4'h7 == idx_8 ? entries_7_valid : _GEN_1240; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1242 = 4'h8 == idx_8 ? entries_8_valid : _GEN_1241; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1243 = 4'h9 == idx_8 ? entries_9_valid : _GEN_1242; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1244 = 4'ha == idx_8 ? entries_10_valid : _GEN_1243; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1245 = 4'hb == idx_8 ? entries_11_valid : _GEN_1244; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1246 = 4'hc == idx_8 ? entries_12_valid : _GEN_1245; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1247 = 4'hd == idx_8 ? entries_13_valid : _GEN_1246; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1248 = 4'he == idx_8 ? entries_14_valid : _GEN_1247; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1249 = 4'hf == idx_8 ? entries_15_valid : _GEN_1248; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1251 = 4'h1 == idx_8 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1252 = 4'h2 == idx_8 ? entries_2_addrValid : _GEN_1251; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1253 = 4'h3 == idx_8 ? entries_3_addrValid : _GEN_1252; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1254 = 4'h4 == idx_8 ? entries_4_addrValid : _GEN_1253; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1255 = 4'h5 == idx_8 ? entries_5_addrValid : _GEN_1254; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1256 = 4'h6 == idx_8 ? entries_6_addrValid : _GEN_1255; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1257 = 4'h7 == idx_8 ? entries_7_addrValid : _GEN_1256; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1258 = 4'h8 == idx_8 ? entries_8_addrValid : _GEN_1257; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1259 = 4'h9 == idx_8 ? entries_9_addrValid : _GEN_1258; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1260 = 4'ha == idx_8 ? entries_10_addrValid : _GEN_1259; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1261 = 4'hb == idx_8 ? entries_11_addrValid : _GEN_1260; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1262 = 4'hc == idx_8 ? entries_12_addrValid : _GEN_1261; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1263 = 4'hd == idx_8 ? entries_13_addrValid : _GEN_1262; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1264 = 4'he == idx_8 ? entries_14_addrValid : _GEN_1263; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1265 = 4'hf == idx_8 ? entries_15_addrValid : _GEN_1264; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_8_T = _GEN_1249 & _GEN_1265; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1267 = 4'h1 == idx_8 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1268 = 4'h2 == idx_8 ? entries_2_mmuIssued : _GEN_1267; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1269 = 4'h3 == idx_8 ? entries_3_mmuIssued : _GEN_1268; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1270 = 4'h4 == idx_8 ? entries_4_mmuIssued : _GEN_1269; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1271 = 4'h5 == idx_8 ? entries_5_mmuIssued : _GEN_1270; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1272 = 4'h6 == idx_8 ? entries_6_mmuIssued : _GEN_1271; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1273 = 4'h7 == idx_8 ? entries_7_mmuIssued : _GEN_1272; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1274 = 4'h8 == idx_8 ? entries_8_mmuIssued : _GEN_1273; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1275 = 4'h9 == idx_8 ? entries_9_mmuIssued : _GEN_1274; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1276 = 4'ha == idx_8 ? entries_10_mmuIssued : _GEN_1275; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1277 = 4'hb == idx_8 ? entries_11_mmuIssued : _GEN_1276; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1278 = 4'hc == idx_8 ? entries_12_mmuIssued : _GEN_1277; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1279 = 4'hd == idx_8 ? entries_13_mmuIssued : _GEN_1278; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1280 = 4'he == idx_8 ? entries_14_mmuIssued : _GEN_1279; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1281 = 4'hf == idx_8 ? entries_15_mmuIssued : _GEN_1280; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_8 = _GEN_1249 & _GEN_1265 & ~_GEN_1281; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_9 = deqPtr_value + 4'h9; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1283 = 4'h1 == idx_9 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1284 = 4'h2 == idx_9 ? entries_2_valid : _GEN_1283; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1285 = 4'h3 == idx_9 ? entries_3_valid : _GEN_1284; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1286 = 4'h4 == idx_9 ? entries_4_valid : _GEN_1285; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1287 = 4'h5 == idx_9 ? entries_5_valid : _GEN_1286; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1288 = 4'h6 == idx_9 ? entries_6_valid : _GEN_1287; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1289 = 4'h7 == idx_9 ? entries_7_valid : _GEN_1288; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1290 = 4'h8 == idx_9 ? entries_8_valid : _GEN_1289; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1291 = 4'h9 == idx_9 ? entries_9_valid : _GEN_1290; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1292 = 4'ha == idx_9 ? entries_10_valid : _GEN_1291; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1293 = 4'hb == idx_9 ? entries_11_valid : _GEN_1292; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1294 = 4'hc == idx_9 ? entries_12_valid : _GEN_1293; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1295 = 4'hd == idx_9 ? entries_13_valid : _GEN_1294; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1296 = 4'he == idx_9 ? entries_14_valid : _GEN_1295; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1297 = 4'hf == idx_9 ? entries_15_valid : _GEN_1296; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1299 = 4'h1 == idx_9 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1300 = 4'h2 == idx_9 ? entries_2_addrValid : _GEN_1299; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1301 = 4'h3 == idx_9 ? entries_3_addrValid : _GEN_1300; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1302 = 4'h4 == idx_9 ? entries_4_addrValid : _GEN_1301; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1303 = 4'h5 == idx_9 ? entries_5_addrValid : _GEN_1302; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1304 = 4'h6 == idx_9 ? entries_6_addrValid : _GEN_1303; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1305 = 4'h7 == idx_9 ? entries_7_addrValid : _GEN_1304; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1306 = 4'h8 == idx_9 ? entries_8_addrValid : _GEN_1305; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1307 = 4'h9 == idx_9 ? entries_9_addrValid : _GEN_1306; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1308 = 4'ha == idx_9 ? entries_10_addrValid : _GEN_1307; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1309 = 4'hb == idx_9 ? entries_11_addrValid : _GEN_1308; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1310 = 4'hc == idx_9 ? entries_12_addrValid : _GEN_1309; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1311 = 4'hd == idx_9 ? entries_13_addrValid : _GEN_1310; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1312 = 4'he == idx_9 ? entries_14_addrValid : _GEN_1311; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1313 = 4'hf == idx_9 ? entries_15_addrValid : _GEN_1312; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_9_T = _GEN_1297 & _GEN_1313; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1315 = 4'h1 == idx_9 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1316 = 4'h2 == idx_9 ? entries_2_mmuIssued : _GEN_1315; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1317 = 4'h3 == idx_9 ? entries_3_mmuIssued : _GEN_1316; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1318 = 4'h4 == idx_9 ? entries_4_mmuIssued : _GEN_1317; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1319 = 4'h5 == idx_9 ? entries_5_mmuIssued : _GEN_1318; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1320 = 4'h6 == idx_9 ? entries_6_mmuIssued : _GEN_1319; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1321 = 4'h7 == idx_9 ? entries_7_mmuIssued : _GEN_1320; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1322 = 4'h8 == idx_9 ? entries_8_mmuIssued : _GEN_1321; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1323 = 4'h9 == idx_9 ? entries_9_mmuIssued : _GEN_1322; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1324 = 4'ha == idx_9 ? entries_10_mmuIssued : _GEN_1323; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1325 = 4'hb == idx_9 ? entries_11_mmuIssued : _GEN_1324; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1326 = 4'hc == idx_9 ? entries_12_mmuIssued : _GEN_1325; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1327 = 4'hd == idx_9 ? entries_13_mmuIssued : _GEN_1326; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1328 = 4'he == idx_9 ? entries_14_mmuIssued : _GEN_1327; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1329 = 4'hf == idx_9 ? entries_15_mmuIssued : _GEN_1328; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_9 = _GEN_1297 & _GEN_1313 & ~_GEN_1329; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_10 = deqPtr_value + 4'ha; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1331 = 4'h1 == idx_10 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1332 = 4'h2 == idx_10 ? entries_2_valid : _GEN_1331; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1333 = 4'h3 == idx_10 ? entries_3_valid : _GEN_1332; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1334 = 4'h4 == idx_10 ? entries_4_valid : _GEN_1333; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1335 = 4'h5 == idx_10 ? entries_5_valid : _GEN_1334; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1336 = 4'h6 == idx_10 ? entries_6_valid : _GEN_1335; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1337 = 4'h7 == idx_10 ? entries_7_valid : _GEN_1336; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1338 = 4'h8 == idx_10 ? entries_8_valid : _GEN_1337; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1339 = 4'h9 == idx_10 ? entries_9_valid : _GEN_1338; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1340 = 4'ha == idx_10 ? entries_10_valid : _GEN_1339; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1341 = 4'hb == idx_10 ? entries_11_valid : _GEN_1340; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1342 = 4'hc == idx_10 ? entries_12_valid : _GEN_1341; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1343 = 4'hd == idx_10 ? entries_13_valid : _GEN_1342; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1344 = 4'he == idx_10 ? entries_14_valid : _GEN_1343; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1345 = 4'hf == idx_10 ? entries_15_valid : _GEN_1344; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1347 = 4'h1 == idx_10 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1348 = 4'h2 == idx_10 ? entries_2_addrValid : _GEN_1347; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1349 = 4'h3 == idx_10 ? entries_3_addrValid : _GEN_1348; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1350 = 4'h4 == idx_10 ? entries_4_addrValid : _GEN_1349; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1351 = 4'h5 == idx_10 ? entries_5_addrValid : _GEN_1350; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1352 = 4'h6 == idx_10 ? entries_6_addrValid : _GEN_1351; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1353 = 4'h7 == idx_10 ? entries_7_addrValid : _GEN_1352; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1354 = 4'h8 == idx_10 ? entries_8_addrValid : _GEN_1353; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1355 = 4'h9 == idx_10 ? entries_9_addrValid : _GEN_1354; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1356 = 4'ha == idx_10 ? entries_10_addrValid : _GEN_1355; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1357 = 4'hb == idx_10 ? entries_11_addrValid : _GEN_1356; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1358 = 4'hc == idx_10 ? entries_12_addrValid : _GEN_1357; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1359 = 4'hd == idx_10 ? entries_13_addrValid : _GEN_1358; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1360 = 4'he == idx_10 ? entries_14_addrValid : _GEN_1359; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1361 = 4'hf == idx_10 ? entries_15_addrValid : _GEN_1360; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_10_T = _GEN_1345 & _GEN_1361; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1363 = 4'h1 == idx_10 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1364 = 4'h2 == idx_10 ? entries_2_mmuIssued : _GEN_1363; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1365 = 4'h3 == idx_10 ? entries_3_mmuIssued : _GEN_1364; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1366 = 4'h4 == idx_10 ? entries_4_mmuIssued : _GEN_1365; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1367 = 4'h5 == idx_10 ? entries_5_mmuIssued : _GEN_1366; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1368 = 4'h6 == idx_10 ? entries_6_mmuIssued : _GEN_1367; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1369 = 4'h7 == idx_10 ? entries_7_mmuIssued : _GEN_1368; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1370 = 4'h8 == idx_10 ? entries_8_mmuIssued : _GEN_1369; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1371 = 4'h9 == idx_10 ? entries_9_mmuIssued : _GEN_1370; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1372 = 4'ha == idx_10 ? entries_10_mmuIssued : _GEN_1371; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1373 = 4'hb == idx_10 ? entries_11_mmuIssued : _GEN_1372; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1374 = 4'hc == idx_10 ? entries_12_mmuIssued : _GEN_1373; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1375 = 4'hd == idx_10 ? entries_13_mmuIssued : _GEN_1374; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1376 = 4'he == idx_10 ? entries_14_mmuIssued : _GEN_1375; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1377 = 4'hf == idx_10 ? entries_15_mmuIssued : _GEN_1376; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_10 = _GEN_1345 & _GEN_1361 & ~_GEN_1377; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_11 = deqPtr_value + 4'hb; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1379 = 4'h1 == idx_11 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1380 = 4'h2 == idx_11 ? entries_2_valid : _GEN_1379; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1381 = 4'h3 == idx_11 ? entries_3_valid : _GEN_1380; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1382 = 4'h4 == idx_11 ? entries_4_valid : _GEN_1381; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1383 = 4'h5 == idx_11 ? entries_5_valid : _GEN_1382; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1384 = 4'h6 == idx_11 ? entries_6_valid : _GEN_1383; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1385 = 4'h7 == idx_11 ? entries_7_valid : _GEN_1384; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1386 = 4'h8 == idx_11 ? entries_8_valid : _GEN_1385; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1387 = 4'h9 == idx_11 ? entries_9_valid : _GEN_1386; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1388 = 4'ha == idx_11 ? entries_10_valid : _GEN_1387; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1389 = 4'hb == idx_11 ? entries_11_valid : _GEN_1388; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1390 = 4'hc == idx_11 ? entries_12_valid : _GEN_1389; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1391 = 4'hd == idx_11 ? entries_13_valid : _GEN_1390; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1392 = 4'he == idx_11 ? entries_14_valid : _GEN_1391; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1393 = 4'hf == idx_11 ? entries_15_valid : _GEN_1392; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1395 = 4'h1 == idx_11 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1396 = 4'h2 == idx_11 ? entries_2_addrValid : _GEN_1395; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1397 = 4'h3 == idx_11 ? entries_3_addrValid : _GEN_1396; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1398 = 4'h4 == idx_11 ? entries_4_addrValid : _GEN_1397; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1399 = 4'h5 == idx_11 ? entries_5_addrValid : _GEN_1398; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1400 = 4'h6 == idx_11 ? entries_6_addrValid : _GEN_1399; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1401 = 4'h7 == idx_11 ? entries_7_addrValid : _GEN_1400; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1402 = 4'h8 == idx_11 ? entries_8_addrValid : _GEN_1401; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1403 = 4'h9 == idx_11 ? entries_9_addrValid : _GEN_1402; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1404 = 4'ha == idx_11 ? entries_10_addrValid : _GEN_1403; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1405 = 4'hb == idx_11 ? entries_11_addrValid : _GEN_1404; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1406 = 4'hc == idx_11 ? entries_12_addrValid : _GEN_1405; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1407 = 4'hd == idx_11 ? entries_13_addrValid : _GEN_1406; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1408 = 4'he == idx_11 ? entries_14_addrValid : _GEN_1407; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1409 = 4'hf == idx_11 ? entries_15_addrValid : _GEN_1408; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_11_T = _GEN_1393 & _GEN_1409; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1411 = 4'h1 == idx_11 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1412 = 4'h2 == idx_11 ? entries_2_mmuIssued : _GEN_1411; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1413 = 4'h3 == idx_11 ? entries_3_mmuIssued : _GEN_1412; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1414 = 4'h4 == idx_11 ? entries_4_mmuIssued : _GEN_1413; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1415 = 4'h5 == idx_11 ? entries_5_mmuIssued : _GEN_1414; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1416 = 4'h6 == idx_11 ? entries_6_mmuIssued : _GEN_1415; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1417 = 4'h7 == idx_11 ? entries_7_mmuIssued : _GEN_1416; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1418 = 4'h8 == idx_11 ? entries_8_mmuIssued : _GEN_1417; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1419 = 4'h9 == idx_11 ? entries_9_mmuIssued : _GEN_1418; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1420 = 4'ha == idx_11 ? entries_10_mmuIssued : _GEN_1419; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1421 = 4'hb == idx_11 ? entries_11_mmuIssued : _GEN_1420; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1422 = 4'hc == idx_11 ? entries_12_mmuIssued : _GEN_1421; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1423 = 4'hd == idx_11 ? entries_13_mmuIssued : _GEN_1422; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1424 = 4'he == idx_11 ? entries_14_mmuIssued : _GEN_1423; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1425 = 4'hf == idx_11 ? entries_15_mmuIssued : _GEN_1424; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_11 = _GEN_1393 & _GEN_1409 & ~_GEN_1425; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_12 = deqPtr_value + 4'hc; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1427 = 4'h1 == idx_12 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1428 = 4'h2 == idx_12 ? entries_2_valid : _GEN_1427; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1429 = 4'h3 == idx_12 ? entries_3_valid : _GEN_1428; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1430 = 4'h4 == idx_12 ? entries_4_valid : _GEN_1429; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1431 = 4'h5 == idx_12 ? entries_5_valid : _GEN_1430; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1432 = 4'h6 == idx_12 ? entries_6_valid : _GEN_1431; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1433 = 4'h7 == idx_12 ? entries_7_valid : _GEN_1432; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1434 = 4'h8 == idx_12 ? entries_8_valid : _GEN_1433; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1435 = 4'h9 == idx_12 ? entries_9_valid : _GEN_1434; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1436 = 4'ha == idx_12 ? entries_10_valid : _GEN_1435; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1437 = 4'hb == idx_12 ? entries_11_valid : _GEN_1436; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1438 = 4'hc == idx_12 ? entries_12_valid : _GEN_1437; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1439 = 4'hd == idx_12 ? entries_13_valid : _GEN_1438; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1440 = 4'he == idx_12 ? entries_14_valid : _GEN_1439; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1441 = 4'hf == idx_12 ? entries_15_valid : _GEN_1440; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1443 = 4'h1 == idx_12 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1444 = 4'h2 == idx_12 ? entries_2_addrValid : _GEN_1443; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1445 = 4'h3 == idx_12 ? entries_3_addrValid : _GEN_1444; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1446 = 4'h4 == idx_12 ? entries_4_addrValid : _GEN_1445; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1447 = 4'h5 == idx_12 ? entries_5_addrValid : _GEN_1446; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1448 = 4'h6 == idx_12 ? entries_6_addrValid : _GEN_1447; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1449 = 4'h7 == idx_12 ? entries_7_addrValid : _GEN_1448; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1450 = 4'h8 == idx_12 ? entries_8_addrValid : _GEN_1449; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1451 = 4'h9 == idx_12 ? entries_9_addrValid : _GEN_1450; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1452 = 4'ha == idx_12 ? entries_10_addrValid : _GEN_1451; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1453 = 4'hb == idx_12 ? entries_11_addrValid : _GEN_1452; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1454 = 4'hc == idx_12 ? entries_12_addrValid : _GEN_1453; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1455 = 4'hd == idx_12 ? entries_13_addrValid : _GEN_1454; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1456 = 4'he == idx_12 ? entries_14_addrValid : _GEN_1455; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1457 = 4'hf == idx_12 ? entries_15_addrValid : _GEN_1456; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_12_T = _GEN_1441 & _GEN_1457; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1459 = 4'h1 == idx_12 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1460 = 4'h2 == idx_12 ? entries_2_mmuIssued : _GEN_1459; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1461 = 4'h3 == idx_12 ? entries_3_mmuIssued : _GEN_1460; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1462 = 4'h4 == idx_12 ? entries_4_mmuIssued : _GEN_1461; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1463 = 4'h5 == idx_12 ? entries_5_mmuIssued : _GEN_1462; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1464 = 4'h6 == idx_12 ? entries_6_mmuIssued : _GEN_1463; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1465 = 4'h7 == idx_12 ? entries_7_mmuIssued : _GEN_1464; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1466 = 4'h8 == idx_12 ? entries_8_mmuIssued : _GEN_1465; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1467 = 4'h9 == idx_12 ? entries_9_mmuIssued : _GEN_1466; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1468 = 4'ha == idx_12 ? entries_10_mmuIssued : _GEN_1467; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1469 = 4'hb == idx_12 ? entries_11_mmuIssued : _GEN_1468; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1470 = 4'hc == idx_12 ? entries_12_mmuIssued : _GEN_1469; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1471 = 4'hd == idx_12 ? entries_13_mmuIssued : _GEN_1470; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1472 = 4'he == idx_12 ? entries_14_mmuIssued : _GEN_1471; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1473 = 4'hf == idx_12 ? entries_15_mmuIssued : _GEN_1472; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_12 = _GEN_1441 & _GEN_1457 & ~_GEN_1473; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_13 = deqPtr_value + 4'hd; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1475 = 4'h1 == idx_13 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1476 = 4'h2 == idx_13 ? entries_2_valid : _GEN_1475; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1477 = 4'h3 == idx_13 ? entries_3_valid : _GEN_1476; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1478 = 4'h4 == idx_13 ? entries_4_valid : _GEN_1477; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1479 = 4'h5 == idx_13 ? entries_5_valid : _GEN_1478; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1480 = 4'h6 == idx_13 ? entries_6_valid : _GEN_1479; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1481 = 4'h7 == idx_13 ? entries_7_valid : _GEN_1480; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1482 = 4'h8 == idx_13 ? entries_8_valid : _GEN_1481; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1483 = 4'h9 == idx_13 ? entries_9_valid : _GEN_1482; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1484 = 4'ha == idx_13 ? entries_10_valid : _GEN_1483; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1485 = 4'hb == idx_13 ? entries_11_valid : _GEN_1484; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1486 = 4'hc == idx_13 ? entries_12_valid : _GEN_1485; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1487 = 4'hd == idx_13 ? entries_13_valid : _GEN_1486; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1488 = 4'he == idx_13 ? entries_14_valid : _GEN_1487; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1489 = 4'hf == idx_13 ? entries_15_valid : _GEN_1488; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1491 = 4'h1 == idx_13 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1492 = 4'h2 == idx_13 ? entries_2_addrValid : _GEN_1491; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1493 = 4'h3 == idx_13 ? entries_3_addrValid : _GEN_1492; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1494 = 4'h4 == idx_13 ? entries_4_addrValid : _GEN_1493; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1495 = 4'h5 == idx_13 ? entries_5_addrValid : _GEN_1494; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1496 = 4'h6 == idx_13 ? entries_6_addrValid : _GEN_1495; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1497 = 4'h7 == idx_13 ? entries_7_addrValid : _GEN_1496; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1498 = 4'h8 == idx_13 ? entries_8_addrValid : _GEN_1497; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1499 = 4'h9 == idx_13 ? entries_9_addrValid : _GEN_1498; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1500 = 4'ha == idx_13 ? entries_10_addrValid : _GEN_1499; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1501 = 4'hb == idx_13 ? entries_11_addrValid : _GEN_1500; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1502 = 4'hc == idx_13 ? entries_12_addrValid : _GEN_1501; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1503 = 4'hd == idx_13 ? entries_13_addrValid : _GEN_1502; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1504 = 4'he == idx_13 ? entries_14_addrValid : _GEN_1503; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1505 = 4'hf == idx_13 ? entries_15_addrValid : _GEN_1504; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_13_T = _GEN_1489 & _GEN_1505; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1507 = 4'h1 == idx_13 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1508 = 4'h2 == idx_13 ? entries_2_mmuIssued : _GEN_1507; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1509 = 4'h3 == idx_13 ? entries_3_mmuIssued : _GEN_1508; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1510 = 4'h4 == idx_13 ? entries_4_mmuIssued : _GEN_1509; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1511 = 4'h5 == idx_13 ? entries_5_mmuIssued : _GEN_1510; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1512 = 4'h6 == idx_13 ? entries_6_mmuIssued : _GEN_1511; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1513 = 4'h7 == idx_13 ? entries_7_mmuIssued : _GEN_1512; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1514 = 4'h8 == idx_13 ? entries_8_mmuIssued : _GEN_1513; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1515 = 4'h9 == idx_13 ? entries_9_mmuIssued : _GEN_1514; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1516 = 4'ha == idx_13 ? entries_10_mmuIssued : _GEN_1515; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1517 = 4'hb == idx_13 ? entries_11_mmuIssued : _GEN_1516; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1518 = 4'hc == idx_13 ? entries_12_mmuIssued : _GEN_1517; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1519 = 4'hd == idx_13 ? entries_13_mmuIssued : _GEN_1518; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1520 = 4'he == idx_13 ? entries_14_mmuIssued : _GEN_1519; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1521 = 4'hf == idx_13 ? entries_15_mmuIssued : _GEN_1520; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_13 = _GEN_1489 & _GEN_1505 & ~_GEN_1521; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_14 = deqPtr_value + 4'he; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1523 = 4'h1 == idx_14 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1524 = 4'h2 == idx_14 ? entries_2_valid : _GEN_1523; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1525 = 4'h3 == idx_14 ? entries_3_valid : _GEN_1524; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1526 = 4'h4 == idx_14 ? entries_4_valid : _GEN_1525; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1527 = 4'h5 == idx_14 ? entries_5_valid : _GEN_1526; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1528 = 4'h6 == idx_14 ? entries_6_valid : _GEN_1527; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1529 = 4'h7 == idx_14 ? entries_7_valid : _GEN_1528; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1530 = 4'h8 == idx_14 ? entries_8_valid : _GEN_1529; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1531 = 4'h9 == idx_14 ? entries_9_valid : _GEN_1530; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1532 = 4'ha == idx_14 ? entries_10_valid : _GEN_1531; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1533 = 4'hb == idx_14 ? entries_11_valid : _GEN_1532; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1534 = 4'hc == idx_14 ? entries_12_valid : _GEN_1533; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1535 = 4'hd == idx_14 ? entries_13_valid : _GEN_1534; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1536 = 4'he == idx_14 ? entries_14_valid : _GEN_1535; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1537 = 4'hf == idx_14 ? entries_15_valid : _GEN_1536; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1539 = 4'h1 == idx_14 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1540 = 4'h2 == idx_14 ? entries_2_addrValid : _GEN_1539; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1541 = 4'h3 == idx_14 ? entries_3_addrValid : _GEN_1540; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1542 = 4'h4 == idx_14 ? entries_4_addrValid : _GEN_1541; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1543 = 4'h5 == idx_14 ? entries_5_addrValid : _GEN_1542; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1544 = 4'h6 == idx_14 ? entries_6_addrValid : _GEN_1543; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1545 = 4'h7 == idx_14 ? entries_7_addrValid : _GEN_1544; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1546 = 4'h8 == idx_14 ? entries_8_addrValid : _GEN_1545; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1547 = 4'h9 == idx_14 ? entries_9_addrValid : _GEN_1546; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1548 = 4'ha == idx_14 ? entries_10_addrValid : _GEN_1547; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1549 = 4'hb == idx_14 ? entries_11_addrValid : _GEN_1548; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1550 = 4'hc == idx_14 ? entries_12_addrValid : _GEN_1549; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1551 = 4'hd == idx_14 ? entries_13_addrValid : _GEN_1550; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1552 = 4'he == idx_14 ? entries_14_addrValid : _GEN_1551; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1553 = 4'hf == idx_14 ? entries_15_addrValid : _GEN_1552; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_14_T = _GEN_1537 & _GEN_1553; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1555 = 4'h1 == idx_14 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1556 = 4'h2 == idx_14 ? entries_2_mmuIssued : _GEN_1555; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1557 = 4'h3 == idx_14 ? entries_3_mmuIssued : _GEN_1556; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1558 = 4'h4 == idx_14 ? entries_4_mmuIssued : _GEN_1557; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1559 = 4'h5 == idx_14 ? entries_5_mmuIssued : _GEN_1558; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1560 = 4'h6 == idx_14 ? entries_6_mmuIssued : _GEN_1559; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1561 = 4'h7 == idx_14 ? entries_7_mmuIssued : _GEN_1560; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1562 = 4'h8 == idx_14 ? entries_8_mmuIssued : _GEN_1561; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1563 = 4'h9 == idx_14 ? entries_9_mmuIssued : _GEN_1562; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1564 = 4'ha == idx_14 ? entries_10_mmuIssued : _GEN_1563; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1565 = 4'hb == idx_14 ? entries_11_mmuIssued : _GEN_1564; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1566 = 4'hc == idx_14 ? entries_12_mmuIssued : _GEN_1565; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1567 = 4'hd == idx_14 ? entries_13_mmuIssued : _GEN_1566; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1568 = 4'he == idx_14 ? entries_14_mmuIssued : _GEN_1567; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1569 = 4'hf == idx_14 ? entries_15_mmuIssued : _GEN_1568; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_14 = _GEN_1537 & _GEN_1553 & ~_GEN_1569; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] idx_15 = deqPtr_value + 4'hf; // @[src/main/scala/memory/StoreQueue.scala 181:29]
  wire  _GEN_1571 = 4'h1 == idx_15 ? entries_1_valid : entries_0_valid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1572 = 4'h2 == idx_15 ? entries_2_valid : _GEN_1571; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1573 = 4'h3 == idx_15 ? entries_3_valid : _GEN_1572; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1574 = 4'h4 == idx_15 ? entries_4_valid : _GEN_1573; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1575 = 4'h5 == idx_15 ? entries_5_valid : _GEN_1574; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1576 = 4'h6 == idx_15 ? entries_6_valid : _GEN_1575; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1577 = 4'h7 == idx_15 ? entries_7_valid : _GEN_1576; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1578 = 4'h8 == idx_15 ? entries_8_valid : _GEN_1577; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1579 = 4'h9 == idx_15 ? entries_9_valid : _GEN_1578; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1580 = 4'ha == idx_15 ? entries_10_valid : _GEN_1579; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1581 = 4'hb == idx_15 ? entries_11_valid : _GEN_1580; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1582 = 4'hc == idx_15 ? entries_12_valid : _GEN_1581; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1583 = 4'hd == idx_15 ? entries_13_valid : _GEN_1582; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1584 = 4'he == idx_15 ? entries_14_valid : _GEN_1583; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1585 = 4'hf == idx_15 ? entries_15_valid : _GEN_1584; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1587 = 4'h1 == idx_15 ? entries_1_addrValid : entries_0_addrValid; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1588 = 4'h2 == idx_15 ? entries_2_addrValid : _GEN_1587; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1589 = 4'h3 == idx_15 ? entries_3_addrValid : _GEN_1588; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1590 = 4'h4 == idx_15 ? entries_4_addrValid : _GEN_1589; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1591 = 4'h5 == idx_15 ? entries_5_addrValid : _GEN_1590; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1592 = 4'h6 == idx_15 ? entries_6_addrValid : _GEN_1591; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1593 = 4'h7 == idx_15 ? entries_7_addrValid : _GEN_1592; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1594 = 4'h8 == idx_15 ? entries_8_addrValid : _GEN_1593; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1595 = 4'h9 == idx_15 ? entries_9_addrValid : _GEN_1594; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1596 = 4'ha == idx_15 ? entries_10_addrValid : _GEN_1595; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1597 = 4'hb == idx_15 ? entries_11_addrValid : _GEN_1596; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1598 = 4'hc == idx_15 ? entries_12_addrValid : _GEN_1597; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1599 = 4'hd == idx_15 ? entries_13_addrValid : _GEN_1598; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1600 = 4'he == idx_15 ? entries_14_addrValid : _GEN_1599; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _GEN_1601 = 4'hf == idx_15 ? entries_15_addrValid : _GEN_1600; // @[src/main/scala/memory/StoreQueue.scala 183:{33,33}]
  wire  _mmuCandidates_15_T = _GEN_1585 & _GEN_1601; // @[src/main/scala/memory/StoreQueue.scala 183:33]
  wire  _GEN_1603 = 4'h1 == idx_15 ? entries_1_mmuIssued : entries_0_mmuIssued; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1604 = 4'h2 == idx_15 ? entries_2_mmuIssued : _GEN_1603; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1605 = 4'h3 == idx_15 ? entries_3_mmuIssued : _GEN_1604; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1606 = 4'h4 == idx_15 ? entries_4_mmuIssued : _GEN_1605; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1607 = 4'h5 == idx_15 ? entries_5_mmuIssued : _GEN_1606; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1608 = 4'h6 == idx_15 ? entries_6_mmuIssued : _GEN_1607; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1609 = 4'h7 == idx_15 ? entries_7_mmuIssued : _GEN_1608; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1610 = 4'h8 == idx_15 ? entries_8_mmuIssued : _GEN_1609; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1611 = 4'h9 == idx_15 ? entries_9_mmuIssued : _GEN_1610; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1612 = 4'ha == idx_15 ? entries_10_mmuIssued : _GEN_1611; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1613 = 4'hb == idx_15 ? entries_11_mmuIssued : _GEN_1612; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1614 = 4'hc == idx_15 ? entries_12_mmuIssued : _GEN_1613; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1615 = 4'hd == idx_15 ? entries_13_mmuIssued : _GEN_1614; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1616 = 4'he == idx_15 ? entries_14_mmuIssued : _GEN_1615; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  _GEN_1617 = 4'hf == idx_15 ? entries_15_mmuIssued : _GEN_1616; // @[src/main/scala/memory/StoreQueue.scala 183:{51,51}]
  wire  mmuCandidates_15 = _GEN_1585 & _GEN_1601 & ~_GEN_1617; // @[src/main/scala/memory/StoreQueue.scala 183:48]
  wire [3:0] _mmuOffset_T = mmuCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_1 = mmuCandidates_13 ? 4'hd : _mmuOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_2 = mmuCandidates_12 ? 4'hc : _mmuOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_3 = mmuCandidates_11 ? 4'hb : _mmuOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_4 = mmuCandidates_10 ? 4'ha : _mmuOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_5 = mmuCandidates_9 ? 4'h9 : _mmuOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_6 = mmuCandidates_8 ? 4'h8 : _mmuOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_7 = mmuCandidates_7 ? 4'h7 : _mmuOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_8 = mmuCandidates_6 ? 4'h6 : _mmuOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_9 = mmuCandidates_5 ? 4'h5 : _mmuOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_10 = mmuCandidates_4 ? 4'h4 : _mmuOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_11 = mmuCandidates_3 ? 4'h3 : _mmuOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_12 = mmuCandidates_2 ? 4'h2 : _mmuOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _mmuOffset_T_13 = mmuCandidates_1 ? 4'h1 : _mmuOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] mmuOffset = mmuCandidates_0 ? 4'h0 : _mmuOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] mmuIdx = deqPtr_value + mmuOffset; // @[src/main/scala/memory/StoreQueue.scala 188:39]
  wire [31:0] _GEN_1619 = 4'h1 == mmuIdx ? entries_1_vaddr : entries_0_vaddr; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1620 = 4'h2 == mmuIdx ? entries_2_vaddr : _GEN_1619; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1621 = 4'h3 == mmuIdx ? entries_3_vaddr : _GEN_1620; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1622 = 4'h4 == mmuIdx ? entries_4_vaddr : _GEN_1621; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1623 = 4'h5 == mmuIdx ? entries_5_vaddr : _GEN_1622; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1624 = 4'h6 == mmuIdx ? entries_6_vaddr : _GEN_1623; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1625 = 4'h7 == mmuIdx ? entries_7_vaddr : _GEN_1624; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1626 = 4'h8 == mmuIdx ? entries_8_vaddr : _GEN_1625; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1627 = 4'h9 == mmuIdx ? entries_9_vaddr : _GEN_1626; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1628 = 4'ha == mmuIdx ? entries_10_vaddr : _GEN_1627; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1629 = 4'hb == mmuIdx ? entries_11_vaddr : _GEN_1628; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1630 = 4'hc == mmuIdx ? entries_12_vaddr : _GEN_1629; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1631 = 4'hd == mmuIdx ? entries_13_vaddr : _GEN_1630; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire [31:0] _GEN_1632 = 4'he == mmuIdx ? entries_14_vaddr : _GEN_1631; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  wire  _GEN_1634 = 4'h0 == mmuIdx | _GEN_496; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1635 = 4'h1 == mmuIdx | _GEN_497; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1636 = 4'h2 == mmuIdx | _GEN_498; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1637 = 4'h3 == mmuIdx | _GEN_499; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1638 = 4'h4 == mmuIdx | _GEN_500; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1639 = 4'h5 == mmuIdx | _GEN_501; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1640 = 4'h6 == mmuIdx | _GEN_502; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1641 = 4'h7 == mmuIdx | _GEN_503; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1642 = 4'h8 == mmuIdx | _GEN_504; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1643 = 4'h9 == mmuIdx | _GEN_505; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1644 = 4'ha == mmuIdx | _GEN_506; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1645 = 4'hb == mmuIdx | _GEN_507; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1646 = 4'hc == mmuIdx | _GEN_508; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1647 = 4'hd == mmuIdx | _GEN_509; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1648 = 4'he == mmuIdx | _GEN_510; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _GEN_1649 = 4'hf == mmuIdx | _GEN_511; // @[src/main/scala/memory/StoreQueue.scala 197:{31,31}]
  wire  _T_1 = io_mmuResp_ready & io_mmuResp_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_4584 = 4'h0 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1670 = 4'h0 == io_mmuResp_bits_sqIdx | _GEN_480; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4585 = 4'h1 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1671 = 4'h1 == io_mmuResp_bits_sqIdx | _GEN_481; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4586 = 4'h2 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1672 = 4'h2 == io_mmuResp_bits_sqIdx | _GEN_482; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4587 = 4'h3 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1673 = 4'h3 == io_mmuResp_bits_sqIdx | _GEN_483; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4588 = 4'h4 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1674 = 4'h4 == io_mmuResp_bits_sqIdx | _GEN_484; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4589 = 4'h5 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1675 = 4'h5 == io_mmuResp_bits_sqIdx | _GEN_485; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4590 = 4'h6 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1676 = 4'h6 == io_mmuResp_bits_sqIdx | _GEN_486; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4591 = 4'h7 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1677 = 4'h7 == io_mmuResp_bits_sqIdx | _GEN_487; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4592 = 4'h8 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1678 = 4'h8 == io_mmuResp_bits_sqIdx | _GEN_488; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4593 = 4'h9 == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1679 = 4'h9 == io_mmuResp_bits_sqIdx | _GEN_489; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4594 = 4'ha == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1680 = 4'ha == io_mmuResp_bits_sqIdx | _GEN_490; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4595 = 4'hb == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1681 = 4'hb == io_mmuResp_bits_sqIdx | _GEN_491; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4596 = 4'hc == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1682 = 4'hc == io_mmuResp_bits_sqIdx | _GEN_492; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4597 = 4'hd == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1683 = 4'hd == io_mmuResp_bits_sqIdx | _GEN_493; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4598 = 4'he == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1684 = 4'he == io_mmuResp_bits_sqIdx | _GEN_494; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_4599 = 4'hf == io_mmuResp_bits_sqIdx; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1685 = 4'hf == io_mmuResp_bits_sqIdx | _GEN_495; // @[src/main/scala/memory/StoreQueue.scala 223:{29,29}]
  wire  _GEN_1702 = _GEN_4584 | _GEN_624; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1703 = _GEN_4585 | _GEN_625; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1704 = _GEN_4586 | _GEN_626; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1705 = _GEN_4587 | _GEN_627; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1706 = _GEN_4588 | _GEN_628; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1707 = _GEN_4589 | _GEN_629; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1708 = _GEN_4590 | _GEN_630; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1709 = _GEN_4591 | _GEN_631; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1710 = _GEN_4592 | _GEN_632; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1711 = _GEN_4593 | _GEN_633; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1712 = _GEN_4594 | _GEN_634; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1713 = _GEN_4595 | _GEN_635; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1714 = _GEN_4596 | _GEN_636; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1715 = _GEN_4597 | _GEN_637; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1716 = _GEN_4598 | _GEN_638; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1717 = _GEN_4599 | _GEN_639; // @[src/main/scala/memory/StoreQueue.scala 225:{29,29}]
  wire  _GEN_1831 = 4'h1 == idx ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1832 = 4'h2 == idx ? entries_2_dataValid : _GEN_1831; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1833 = 4'h3 == idx ? entries_3_dataValid : _GEN_1832; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1834 = 4'h4 == idx ? entries_4_dataValid : _GEN_1833; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1835 = 4'h5 == idx ? entries_5_dataValid : _GEN_1834; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1836 = 4'h6 == idx ? entries_6_dataValid : _GEN_1835; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1837 = 4'h7 == idx ? entries_7_dataValid : _GEN_1836; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1838 = 4'h8 == idx ? entries_8_dataValid : _GEN_1837; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1839 = 4'h9 == idx ? entries_9_dataValid : _GEN_1838; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1840 = 4'ha == idx ? entries_10_dataValid : _GEN_1839; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1841 = 4'hb == idx ? entries_11_dataValid : _GEN_1840; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1842 = 4'hc == idx ? entries_12_dataValid : _GEN_1841; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1843 = 4'hd == idx ? entries_13_dataValid : _GEN_1842; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1844 = 4'he == idx ? entries_14_dataValid : _GEN_1843; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1845 = 4'hf == idx ? entries_15_dataValid : _GEN_1844; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1847 = 4'h1 == idx ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1848 = 4'h2 == idx ? entries_2_paddrValid : _GEN_1847; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1849 = 4'h3 == idx ? entries_3_paddrValid : _GEN_1848; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1850 = 4'h4 == idx ? entries_4_paddrValid : _GEN_1849; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1851 = 4'h5 == idx ? entries_5_paddrValid : _GEN_1850; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1852 = 4'h6 == idx ? entries_6_paddrValid : _GEN_1851; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1853 = 4'h7 == idx ? entries_7_paddrValid : _GEN_1852; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1854 = 4'h8 == idx ? entries_8_paddrValid : _GEN_1853; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1855 = 4'h9 == idx ? entries_9_paddrValid : _GEN_1854; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1856 = 4'ha == idx ? entries_10_paddrValid : _GEN_1855; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1857 = 4'hb == idx ? entries_11_paddrValid : _GEN_1856; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1858 = 4'hc == idx ? entries_12_paddrValid : _GEN_1857; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1859 = 4'hd == idx ? entries_13_paddrValid : _GEN_1858; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1860 = 4'he == idx ? entries_14_paddrValid : _GEN_1859; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1861 = 4'hf == idx ? entries_15_paddrValid : _GEN_1860; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_0_T_2 = _mmuCandidates_0_T & _GEN_1845 & _GEN_1861; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_1863 = 4'h1 == idx ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1864 = 4'h2 == idx ? entries_2_writtenBack : _GEN_1863; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1865 = 4'h3 == idx ? entries_3_writtenBack : _GEN_1864; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1866 = 4'h4 == idx ? entries_4_writtenBack : _GEN_1865; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1867 = 4'h5 == idx ? entries_5_writtenBack : _GEN_1866; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1868 = 4'h6 == idx ? entries_6_writtenBack : _GEN_1867; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1869 = 4'h7 == idx ? entries_7_writtenBack : _GEN_1868; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1870 = 4'h8 == idx ? entries_8_writtenBack : _GEN_1869; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1871 = 4'h9 == idx ? entries_9_writtenBack : _GEN_1870; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1872 = 4'ha == idx ? entries_10_writtenBack : _GEN_1871; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1873 = 4'hb == idx ? entries_11_writtenBack : _GEN_1872; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1874 = 4'hc == idx ? entries_12_writtenBack : _GEN_1873; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1875 = 4'hd == idx ? entries_13_writtenBack : _GEN_1874; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1876 = 4'he == idx ? entries_14_writtenBack : _GEN_1875; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1877 = 4'hf == idx ? entries_15_writtenBack : _GEN_1876; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_0 = _wbCandidates_0_T_2 & ~_GEN_1877; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_1911 = 4'h1 == idx_1 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1912 = 4'h2 == idx_1 ? entries_2_dataValid : _GEN_1911; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1913 = 4'h3 == idx_1 ? entries_3_dataValid : _GEN_1912; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1914 = 4'h4 == idx_1 ? entries_4_dataValid : _GEN_1913; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1915 = 4'h5 == idx_1 ? entries_5_dataValid : _GEN_1914; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1916 = 4'h6 == idx_1 ? entries_6_dataValid : _GEN_1915; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1917 = 4'h7 == idx_1 ? entries_7_dataValid : _GEN_1916; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1918 = 4'h8 == idx_1 ? entries_8_dataValid : _GEN_1917; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1919 = 4'h9 == idx_1 ? entries_9_dataValid : _GEN_1918; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1920 = 4'ha == idx_1 ? entries_10_dataValid : _GEN_1919; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1921 = 4'hb == idx_1 ? entries_11_dataValid : _GEN_1920; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1922 = 4'hc == idx_1 ? entries_12_dataValid : _GEN_1921; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1923 = 4'hd == idx_1 ? entries_13_dataValid : _GEN_1922; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1924 = 4'he == idx_1 ? entries_14_dataValid : _GEN_1923; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1925 = 4'hf == idx_1 ? entries_15_dataValid : _GEN_1924; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1927 = 4'h1 == idx_1 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1928 = 4'h2 == idx_1 ? entries_2_paddrValid : _GEN_1927; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1929 = 4'h3 == idx_1 ? entries_3_paddrValid : _GEN_1928; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1930 = 4'h4 == idx_1 ? entries_4_paddrValid : _GEN_1929; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1931 = 4'h5 == idx_1 ? entries_5_paddrValid : _GEN_1930; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1932 = 4'h6 == idx_1 ? entries_6_paddrValid : _GEN_1931; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1933 = 4'h7 == idx_1 ? entries_7_paddrValid : _GEN_1932; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1934 = 4'h8 == idx_1 ? entries_8_paddrValid : _GEN_1933; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1935 = 4'h9 == idx_1 ? entries_9_paddrValid : _GEN_1934; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1936 = 4'ha == idx_1 ? entries_10_paddrValid : _GEN_1935; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1937 = 4'hb == idx_1 ? entries_11_paddrValid : _GEN_1936; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1938 = 4'hc == idx_1 ? entries_12_paddrValid : _GEN_1937; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1939 = 4'hd == idx_1 ? entries_13_paddrValid : _GEN_1938; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1940 = 4'he == idx_1 ? entries_14_paddrValid : _GEN_1939; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_1941 = 4'hf == idx_1 ? entries_15_paddrValid : _GEN_1940; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_1_T_2 = _mmuCandidates_1_T & _GEN_1925 & _GEN_1941; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_1943 = 4'h1 == idx_1 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1944 = 4'h2 == idx_1 ? entries_2_writtenBack : _GEN_1943; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1945 = 4'h3 == idx_1 ? entries_3_writtenBack : _GEN_1944; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1946 = 4'h4 == idx_1 ? entries_4_writtenBack : _GEN_1945; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1947 = 4'h5 == idx_1 ? entries_5_writtenBack : _GEN_1946; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1948 = 4'h6 == idx_1 ? entries_6_writtenBack : _GEN_1947; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1949 = 4'h7 == idx_1 ? entries_7_writtenBack : _GEN_1948; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1950 = 4'h8 == idx_1 ? entries_8_writtenBack : _GEN_1949; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1951 = 4'h9 == idx_1 ? entries_9_writtenBack : _GEN_1950; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1952 = 4'ha == idx_1 ? entries_10_writtenBack : _GEN_1951; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1953 = 4'hb == idx_1 ? entries_11_writtenBack : _GEN_1952; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1954 = 4'hc == idx_1 ? entries_12_writtenBack : _GEN_1953; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1955 = 4'hd == idx_1 ? entries_13_writtenBack : _GEN_1954; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1956 = 4'he == idx_1 ? entries_14_writtenBack : _GEN_1955; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_1957 = 4'hf == idx_1 ? entries_15_writtenBack : _GEN_1956; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_1 = _wbCandidates_1_T_2 & ~_GEN_1957; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_1991 = 4'h1 == idx_2 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1992 = 4'h2 == idx_2 ? entries_2_dataValid : _GEN_1991; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1993 = 4'h3 == idx_2 ? entries_3_dataValid : _GEN_1992; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1994 = 4'h4 == idx_2 ? entries_4_dataValid : _GEN_1993; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1995 = 4'h5 == idx_2 ? entries_5_dataValid : _GEN_1994; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1996 = 4'h6 == idx_2 ? entries_6_dataValid : _GEN_1995; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1997 = 4'h7 == idx_2 ? entries_7_dataValid : _GEN_1996; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1998 = 4'h8 == idx_2 ? entries_8_dataValid : _GEN_1997; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_1999 = 4'h9 == idx_2 ? entries_9_dataValid : _GEN_1998; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2000 = 4'ha == idx_2 ? entries_10_dataValid : _GEN_1999; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2001 = 4'hb == idx_2 ? entries_11_dataValid : _GEN_2000; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2002 = 4'hc == idx_2 ? entries_12_dataValid : _GEN_2001; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2003 = 4'hd == idx_2 ? entries_13_dataValid : _GEN_2002; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2004 = 4'he == idx_2 ? entries_14_dataValid : _GEN_2003; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2005 = 4'hf == idx_2 ? entries_15_dataValid : _GEN_2004; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2007 = 4'h1 == idx_2 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2008 = 4'h2 == idx_2 ? entries_2_paddrValid : _GEN_2007; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2009 = 4'h3 == idx_2 ? entries_3_paddrValid : _GEN_2008; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2010 = 4'h4 == idx_2 ? entries_4_paddrValid : _GEN_2009; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2011 = 4'h5 == idx_2 ? entries_5_paddrValid : _GEN_2010; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2012 = 4'h6 == idx_2 ? entries_6_paddrValid : _GEN_2011; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2013 = 4'h7 == idx_2 ? entries_7_paddrValid : _GEN_2012; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2014 = 4'h8 == idx_2 ? entries_8_paddrValid : _GEN_2013; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2015 = 4'h9 == idx_2 ? entries_9_paddrValid : _GEN_2014; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2016 = 4'ha == idx_2 ? entries_10_paddrValid : _GEN_2015; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2017 = 4'hb == idx_2 ? entries_11_paddrValid : _GEN_2016; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2018 = 4'hc == idx_2 ? entries_12_paddrValid : _GEN_2017; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2019 = 4'hd == idx_2 ? entries_13_paddrValid : _GEN_2018; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2020 = 4'he == idx_2 ? entries_14_paddrValid : _GEN_2019; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2021 = 4'hf == idx_2 ? entries_15_paddrValid : _GEN_2020; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_2_T_2 = _mmuCandidates_2_T & _GEN_2005 & _GEN_2021; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2023 = 4'h1 == idx_2 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2024 = 4'h2 == idx_2 ? entries_2_writtenBack : _GEN_2023; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2025 = 4'h3 == idx_2 ? entries_3_writtenBack : _GEN_2024; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2026 = 4'h4 == idx_2 ? entries_4_writtenBack : _GEN_2025; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2027 = 4'h5 == idx_2 ? entries_5_writtenBack : _GEN_2026; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2028 = 4'h6 == idx_2 ? entries_6_writtenBack : _GEN_2027; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2029 = 4'h7 == idx_2 ? entries_7_writtenBack : _GEN_2028; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2030 = 4'h8 == idx_2 ? entries_8_writtenBack : _GEN_2029; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2031 = 4'h9 == idx_2 ? entries_9_writtenBack : _GEN_2030; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2032 = 4'ha == idx_2 ? entries_10_writtenBack : _GEN_2031; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2033 = 4'hb == idx_2 ? entries_11_writtenBack : _GEN_2032; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2034 = 4'hc == idx_2 ? entries_12_writtenBack : _GEN_2033; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2035 = 4'hd == idx_2 ? entries_13_writtenBack : _GEN_2034; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2036 = 4'he == idx_2 ? entries_14_writtenBack : _GEN_2035; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2037 = 4'hf == idx_2 ? entries_15_writtenBack : _GEN_2036; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_2 = _wbCandidates_2_T_2 & ~_GEN_2037; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2071 = 4'h1 == idx_3 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2072 = 4'h2 == idx_3 ? entries_2_dataValid : _GEN_2071; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2073 = 4'h3 == idx_3 ? entries_3_dataValid : _GEN_2072; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2074 = 4'h4 == idx_3 ? entries_4_dataValid : _GEN_2073; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2075 = 4'h5 == idx_3 ? entries_5_dataValid : _GEN_2074; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2076 = 4'h6 == idx_3 ? entries_6_dataValid : _GEN_2075; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2077 = 4'h7 == idx_3 ? entries_7_dataValid : _GEN_2076; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2078 = 4'h8 == idx_3 ? entries_8_dataValid : _GEN_2077; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2079 = 4'h9 == idx_3 ? entries_9_dataValid : _GEN_2078; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2080 = 4'ha == idx_3 ? entries_10_dataValid : _GEN_2079; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2081 = 4'hb == idx_3 ? entries_11_dataValid : _GEN_2080; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2082 = 4'hc == idx_3 ? entries_12_dataValid : _GEN_2081; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2083 = 4'hd == idx_3 ? entries_13_dataValid : _GEN_2082; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2084 = 4'he == idx_3 ? entries_14_dataValid : _GEN_2083; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2085 = 4'hf == idx_3 ? entries_15_dataValid : _GEN_2084; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2087 = 4'h1 == idx_3 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2088 = 4'h2 == idx_3 ? entries_2_paddrValid : _GEN_2087; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2089 = 4'h3 == idx_3 ? entries_3_paddrValid : _GEN_2088; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2090 = 4'h4 == idx_3 ? entries_4_paddrValid : _GEN_2089; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2091 = 4'h5 == idx_3 ? entries_5_paddrValid : _GEN_2090; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2092 = 4'h6 == idx_3 ? entries_6_paddrValid : _GEN_2091; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2093 = 4'h7 == idx_3 ? entries_7_paddrValid : _GEN_2092; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2094 = 4'h8 == idx_3 ? entries_8_paddrValid : _GEN_2093; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2095 = 4'h9 == idx_3 ? entries_9_paddrValid : _GEN_2094; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2096 = 4'ha == idx_3 ? entries_10_paddrValid : _GEN_2095; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2097 = 4'hb == idx_3 ? entries_11_paddrValid : _GEN_2096; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2098 = 4'hc == idx_3 ? entries_12_paddrValid : _GEN_2097; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2099 = 4'hd == idx_3 ? entries_13_paddrValid : _GEN_2098; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2100 = 4'he == idx_3 ? entries_14_paddrValid : _GEN_2099; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2101 = 4'hf == idx_3 ? entries_15_paddrValid : _GEN_2100; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_3_T_2 = _mmuCandidates_3_T & _GEN_2085 & _GEN_2101; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2103 = 4'h1 == idx_3 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2104 = 4'h2 == idx_3 ? entries_2_writtenBack : _GEN_2103; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2105 = 4'h3 == idx_3 ? entries_3_writtenBack : _GEN_2104; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2106 = 4'h4 == idx_3 ? entries_4_writtenBack : _GEN_2105; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2107 = 4'h5 == idx_3 ? entries_5_writtenBack : _GEN_2106; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2108 = 4'h6 == idx_3 ? entries_6_writtenBack : _GEN_2107; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2109 = 4'h7 == idx_3 ? entries_7_writtenBack : _GEN_2108; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2110 = 4'h8 == idx_3 ? entries_8_writtenBack : _GEN_2109; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2111 = 4'h9 == idx_3 ? entries_9_writtenBack : _GEN_2110; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2112 = 4'ha == idx_3 ? entries_10_writtenBack : _GEN_2111; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2113 = 4'hb == idx_3 ? entries_11_writtenBack : _GEN_2112; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2114 = 4'hc == idx_3 ? entries_12_writtenBack : _GEN_2113; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2115 = 4'hd == idx_3 ? entries_13_writtenBack : _GEN_2114; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2116 = 4'he == idx_3 ? entries_14_writtenBack : _GEN_2115; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2117 = 4'hf == idx_3 ? entries_15_writtenBack : _GEN_2116; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_3 = _wbCandidates_3_T_2 & ~_GEN_2117; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2151 = 4'h1 == idx_4 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2152 = 4'h2 == idx_4 ? entries_2_dataValid : _GEN_2151; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2153 = 4'h3 == idx_4 ? entries_3_dataValid : _GEN_2152; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2154 = 4'h4 == idx_4 ? entries_4_dataValid : _GEN_2153; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2155 = 4'h5 == idx_4 ? entries_5_dataValid : _GEN_2154; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2156 = 4'h6 == idx_4 ? entries_6_dataValid : _GEN_2155; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2157 = 4'h7 == idx_4 ? entries_7_dataValid : _GEN_2156; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2158 = 4'h8 == idx_4 ? entries_8_dataValid : _GEN_2157; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2159 = 4'h9 == idx_4 ? entries_9_dataValid : _GEN_2158; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2160 = 4'ha == idx_4 ? entries_10_dataValid : _GEN_2159; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2161 = 4'hb == idx_4 ? entries_11_dataValid : _GEN_2160; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2162 = 4'hc == idx_4 ? entries_12_dataValid : _GEN_2161; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2163 = 4'hd == idx_4 ? entries_13_dataValid : _GEN_2162; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2164 = 4'he == idx_4 ? entries_14_dataValid : _GEN_2163; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2165 = 4'hf == idx_4 ? entries_15_dataValid : _GEN_2164; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2167 = 4'h1 == idx_4 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2168 = 4'h2 == idx_4 ? entries_2_paddrValid : _GEN_2167; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2169 = 4'h3 == idx_4 ? entries_3_paddrValid : _GEN_2168; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2170 = 4'h4 == idx_4 ? entries_4_paddrValid : _GEN_2169; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2171 = 4'h5 == idx_4 ? entries_5_paddrValid : _GEN_2170; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2172 = 4'h6 == idx_4 ? entries_6_paddrValid : _GEN_2171; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2173 = 4'h7 == idx_4 ? entries_7_paddrValid : _GEN_2172; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2174 = 4'h8 == idx_4 ? entries_8_paddrValid : _GEN_2173; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2175 = 4'h9 == idx_4 ? entries_9_paddrValid : _GEN_2174; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2176 = 4'ha == idx_4 ? entries_10_paddrValid : _GEN_2175; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2177 = 4'hb == idx_4 ? entries_11_paddrValid : _GEN_2176; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2178 = 4'hc == idx_4 ? entries_12_paddrValid : _GEN_2177; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2179 = 4'hd == idx_4 ? entries_13_paddrValid : _GEN_2178; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2180 = 4'he == idx_4 ? entries_14_paddrValid : _GEN_2179; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2181 = 4'hf == idx_4 ? entries_15_paddrValid : _GEN_2180; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_4_T_2 = _mmuCandidates_4_T & _GEN_2165 & _GEN_2181; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2183 = 4'h1 == idx_4 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2184 = 4'h2 == idx_4 ? entries_2_writtenBack : _GEN_2183; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2185 = 4'h3 == idx_4 ? entries_3_writtenBack : _GEN_2184; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2186 = 4'h4 == idx_4 ? entries_4_writtenBack : _GEN_2185; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2187 = 4'h5 == idx_4 ? entries_5_writtenBack : _GEN_2186; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2188 = 4'h6 == idx_4 ? entries_6_writtenBack : _GEN_2187; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2189 = 4'h7 == idx_4 ? entries_7_writtenBack : _GEN_2188; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2190 = 4'h8 == idx_4 ? entries_8_writtenBack : _GEN_2189; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2191 = 4'h9 == idx_4 ? entries_9_writtenBack : _GEN_2190; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2192 = 4'ha == idx_4 ? entries_10_writtenBack : _GEN_2191; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2193 = 4'hb == idx_4 ? entries_11_writtenBack : _GEN_2192; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2194 = 4'hc == idx_4 ? entries_12_writtenBack : _GEN_2193; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2195 = 4'hd == idx_4 ? entries_13_writtenBack : _GEN_2194; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2196 = 4'he == idx_4 ? entries_14_writtenBack : _GEN_2195; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2197 = 4'hf == idx_4 ? entries_15_writtenBack : _GEN_2196; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_4 = _wbCandidates_4_T_2 & ~_GEN_2197; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2231 = 4'h1 == idx_5 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2232 = 4'h2 == idx_5 ? entries_2_dataValid : _GEN_2231; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2233 = 4'h3 == idx_5 ? entries_3_dataValid : _GEN_2232; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2234 = 4'h4 == idx_5 ? entries_4_dataValid : _GEN_2233; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2235 = 4'h5 == idx_5 ? entries_5_dataValid : _GEN_2234; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2236 = 4'h6 == idx_5 ? entries_6_dataValid : _GEN_2235; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2237 = 4'h7 == idx_5 ? entries_7_dataValid : _GEN_2236; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2238 = 4'h8 == idx_5 ? entries_8_dataValid : _GEN_2237; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2239 = 4'h9 == idx_5 ? entries_9_dataValid : _GEN_2238; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2240 = 4'ha == idx_5 ? entries_10_dataValid : _GEN_2239; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2241 = 4'hb == idx_5 ? entries_11_dataValid : _GEN_2240; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2242 = 4'hc == idx_5 ? entries_12_dataValid : _GEN_2241; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2243 = 4'hd == idx_5 ? entries_13_dataValid : _GEN_2242; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2244 = 4'he == idx_5 ? entries_14_dataValid : _GEN_2243; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2245 = 4'hf == idx_5 ? entries_15_dataValid : _GEN_2244; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2247 = 4'h1 == idx_5 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2248 = 4'h2 == idx_5 ? entries_2_paddrValid : _GEN_2247; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2249 = 4'h3 == idx_5 ? entries_3_paddrValid : _GEN_2248; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2250 = 4'h4 == idx_5 ? entries_4_paddrValid : _GEN_2249; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2251 = 4'h5 == idx_5 ? entries_5_paddrValid : _GEN_2250; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2252 = 4'h6 == idx_5 ? entries_6_paddrValid : _GEN_2251; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2253 = 4'h7 == idx_5 ? entries_7_paddrValid : _GEN_2252; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2254 = 4'h8 == idx_5 ? entries_8_paddrValid : _GEN_2253; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2255 = 4'h9 == idx_5 ? entries_9_paddrValid : _GEN_2254; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2256 = 4'ha == idx_5 ? entries_10_paddrValid : _GEN_2255; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2257 = 4'hb == idx_5 ? entries_11_paddrValid : _GEN_2256; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2258 = 4'hc == idx_5 ? entries_12_paddrValid : _GEN_2257; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2259 = 4'hd == idx_5 ? entries_13_paddrValid : _GEN_2258; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2260 = 4'he == idx_5 ? entries_14_paddrValid : _GEN_2259; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2261 = 4'hf == idx_5 ? entries_15_paddrValid : _GEN_2260; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_5_T_2 = _mmuCandidates_5_T & _GEN_2245 & _GEN_2261; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2263 = 4'h1 == idx_5 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2264 = 4'h2 == idx_5 ? entries_2_writtenBack : _GEN_2263; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2265 = 4'h3 == idx_5 ? entries_3_writtenBack : _GEN_2264; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2266 = 4'h4 == idx_5 ? entries_4_writtenBack : _GEN_2265; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2267 = 4'h5 == idx_5 ? entries_5_writtenBack : _GEN_2266; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2268 = 4'h6 == idx_5 ? entries_6_writtenBack : _GEN_2267; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2269 = 4'h7 == idx_5 ? entries_7_writtenBack : _GEN_2268; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2270 = 4'h8 == idx_5 ? entries_8_writtenBack : _GEN_2269; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2271 = 4'h9 == idx_5 ? entries_9_writtenBack : _GEN_2270; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2272 = 4'ha == idx_5 ? entries_10_writtenBack : _GEN_2271; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2273 = 4'hb == idx_5 ? entries_11_writtenBack : _GEN_2272; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2274 = 4'hc == idx_5 ? entries_12_writtenBack : _GEN_2273; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2275 = 4'hd == idx_5 ? entries_13_writtenBack : _GEN_2274; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2276 = 4'he == idx_5 ? entries_14_writtenBack : _GEN_2275; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2277 = 4'hf == idx_5 ? entries_15_writtenBack : _GEN_2276; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_5 = _wbCandidates_5_T_2 & ~_GEN_2277; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2311 = 4'h1 == idx_6 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2312 = 4'h2 == idx_6 ? entries_2_dataValid : _GEN_2311; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2313 = 4'h3 == idx_6 ? entries_3_dataValid : _GEN_2312; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2314 = 4'h4 == idx_6 ? entries_4_dataValid : _GEN_2313; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2315 = 4'h5 == idx_6 ? entries_5_dataValid : _GEN_2314; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2316 = 4'h6 == idx_6 ? entries_6_dataValid : _GEN_2315; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2317 = 4'h7 == idx_6 ? entries_7_dataValid : _GEN_2316; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2318 = 4'h8 == idx_6 ? entries_8_dataValid : _GEN_2317; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2319 = 4'h9 == idx_6 ? entries_9_dataValid : _GEN_2318; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2320 = 4'ha == idx_6 ? entries_10_dataValid : _GEN_2319; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2321 = 4'hb == idx_6 ? entries_11_dataValid : _GEN_2320; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2322 = 4'hc == idx_6 ? entries_12_dataValid : _GEN_2321; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2323 = 4'hd == idx_6 ? entries_13_dataValid : _GEN_2322; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2324 = 4'he == idx_6 ? entries_14_dataValid : _GEN_2323; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2325 = 4'hf == idx_6 ? entries_15_dataValid : _GEN_2324; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2327 = 4'h1 == idx_6 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2328 = 4'h2 == idx_6 ? entries_2_paddrValid : _GEN_2327; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2329 = 4'h3 == idx_6 ? entries_3_paddrValid : _GEN_2328; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2330 = 4'h4 == idx_6 ? entries_4_paddrValid : _GEN_2329; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2331 = 4'h5 == idx_6 ? entries_5_paddrValid : _GEN_2330; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2332 = 4'h6 == idx_6 ? entries_6_paddrValid : _GEN_2331; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2333 = 4'h7 == idx_6 ? entries_7_paddrValid : _GEN_2332; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2334 = 4'h8 == idx_6 ? entries_8_paddrValid : _GEN_2333; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2335 = 4'h9 == idx_6 ? entries_9_paddrValid : _GEN_2334; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2336 = 4'ha == idx_6 ? entries_10_paddrValid : _GEN_2335; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2337 = 4'hb == idx_6 ? entries_11_paddrValid : _GEN_2336; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2338 = 4'hc == idx_6 ? entries_12_paddrValid : _GEN_2337; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2339 = 4'hd == idx_6 ? entries_13_paddrValid : _GEN_2338; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2340 = 4'he == idx_6 ? entries_14_paddrValid : _GEN_2339; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2341 = 4'hf == idx_6 ? entries_15_paddrValid : _GEN_2340; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_6_T_2 = _mmuCandidates_6_T & _GEN_2325 & _GEN_2341; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2343 = 4'h1 == idx_6 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2344 = 4'h2 == idx_6 ? entries_2_writtenBack : _GEN_2343; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2345 = 4'h3 == idx_6 ? entries_3_writtenBack : _GEN_2344; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2346 = 4'h4 == idx_6 ? entries_4_writtenBack : _GEN_2345; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2347 = 4'h5 == idx_6 ? entries_5_writtenBack : _GEN_2346; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2348 = 4'h6 == idx_6 ? entries_6_writtenBack : _GEN_2347; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2349 = 4'h7 == idx_6 ? entries_7_writtenBack : _GEN_2348; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2350 = 4'h8 == idx_6 ? entries_8_writtenBack : _GEN_2349; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2351 = 4'h9 == idx_6 ? entries_9_writtenBack : _GEN_2350; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2352 = 4'ha == idx_6 ? entries_10_writtenBack : _GEN_2351; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2353 = 4'hb == idx_6 ? entries_11_writtenBack : _GEN_2352; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2354 = 4'hc == idx_6 ? entries_12_writtenBack : _GEN_2353; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2355 = 4'hd == idx_6 ? entries_13_writtenBack : _GEN_2354; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2356 = 4'he == idx_6 ? entries_14_writtenBack : _GEN_2355; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2357 = 4'hf == idx_6 ? entries_15_writtenBack : _GEN_2356; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_6 = _wbCandidates_6_T_2 & ~_GEN_2357; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2391 = 4'h1 == idx_7 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2392 = 4'h2 == idx_7 ? entries_2_dataValid : _GEN_2391; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2393 = 4'h3 == idx_7 ? entries_3_dataValid : _GEN_2392; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2394 = 4'h4 == idx_7 ? entries_4_dataValid : _GEN_2393; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2395 = 4'h5 == idx_7 ? entries_5_dataValid : _GEN_2394; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2396 = 4'h6 == idx_7 ? entries_6_dataValid : _GEN_2395; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2397 = 4'h7 == idx_7 ? entries_7_dataValid : _GEN_2396; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2398 = 4'h8 == idx_7 ? entries_8_dataValid : _GEN_2397; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2399 = 4'h9 == idx_7 ? entries_9_dataValid : _GEN_2398; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2400 = 4'ha == idx_7 ? entries_10_dataValid : _GEN_2399; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2401 = 4'hb == idx_7 ? entries_11_dataValid : _GEN_2400; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2402 = 4'hc == idx_7 ? entries_12_dataValid : _GEN_2401; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2403 = 4'hd == idx_7 ? entries_13_dataValid : _GEN_2402; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2404 = 4'he == idx_7 ? entries_14_dataValid : _GEN_2403; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2405 = 4'hf == idx_7 ? entries_15_dataValid : _GEN_2404; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2407 = 4'h1 == idx_7 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2408 = 4'h2 == idx_7 ? entries_2_paddrValid : _GEN_2407; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2409 = 4'h3 == idx_7 ? entries_3_paddrValid : _GEN_2408; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2410 = 4'h4 == idx_7 ? entries_4_paddrValid : _GEN_2409; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2411 = 4'h5 == idx_7 ? entries_5_paddrValid : _GEN_2410; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2412 = 4'h6 == idx_7 ? entries_6_paddrValid : _GEN_2411; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2413 = 4'h7 == idx_7 ? entries_7_paddrValid : _GEN_2412; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2414 = 4'h8 == idx_7 ? entries_8_paddrValid : _GEN_2413; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2415 = 4'h9 == idx_7 ? entries_9_paddrValid : _GEN_2414; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2416 = 4'ha == idx_7 ? entries_10_paddrValid : _GEN_2415; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2417 = 4'hb == idx_7 ? entries_11_paddrValid : _GEN_2416; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2418 = 4'hc == idx_7 ? entries_12_paddrValid : _GEN_2417; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2419 = 4'hd == idx_7 ? entries_13_paddrValid : _GEN_2418; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2420 = 4'he == idx_7 ? entries_14_paddrValid : _GEN_2419; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2421 = 4'hf == idx_7 ? entries_15_paddrValid : _GEN_2420; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_7_T_2 = _mmuCandidates_7_T & _GEN_2405 & _GEN_2421; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2423 = 4'h1 == idx_7 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2424 = 4'h2 == idx_7 ? entries_2_writtenBack : _GEN_2423; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2425 = 4'h3 == idx_7 ? entries_3_writtenBack : _GEN_2424; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2426 = 4'h4 == idx_7 ? entries_4_writtenBack : _GEN_2425; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2427 = 4'h5 == idx_7 ? entries_5_writtenBack : _GEN_2426; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2428 = 4'h6 == idx_7 ? entries_6_writtenBack : _GEN_2427; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2429 = 4'h7 == idx_7 ? entries_7_writtenBack : _GEN_2428; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2430 = 4'h8 == idx_7 ? entries_8_writtenBack : _GEN_2429; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2431 = 4'h9 == idx_7 ? entries_9_writtenBack : _GEN_2430; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2432 = 4'ha == idx_7 ? entries_10_writtenBack : _GEN_2431; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2433 = 4'hb == idx_7 ? entries_11_writtenBack : _GEN_2432; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2434 = 4'hc == idx_7 ? entries_12_writtenBack : _GEN_2433; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2435 = 4'hd == idx_7 ? entries_13_writtenBack : _GEN_2434; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2436 = 4'he == idx_7 ? entries_14_writtenBack : _GEN_2435; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2437 = 4'hf == idx_7 ? entries_15_writtenBack : _GEN_2436; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_7 = _wbCandidates_7_T_2 & ~_GEN_2437; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2471 = 4'h1 == idx_8 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2472 = 4'h2 == idx_8 ? entries_2_dataValid : _GEN_2471; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2473 = 4'h3 == idx_8 ? entries_3_dataValid : _GEN_2472; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2474 = 4'h4 == idx_8 ? entries_4_dataValid : _GEN_2473; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2475 = 4'h5 == idx_8 ? entries_5_dataValid : _GEN_2474; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2476 = 4'h6 == idx_8 ? entries_6_dataValid : _GEN_2475; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2477 = 4'h7 == idx_8 ? entries_7_dataValid : _GEN_2476; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2478 = 4'h8 == idx_8 ? entries_8_dataValid : _GEN_2477; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2479 = 4'h9 == idx_8 ? entries_9_dataValid : _GEN_2478; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2480 = 4'ha == idx_8 ? entries_10_dataValid : _GEN_2479; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2481 = 4'hb == idx_8 ? entries_11_dataValid : _GEN_2480; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2482 = 4'hc == idx_8 ? entries_12_dataValid : _GEN_2481; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2483 = 4'hd == idx_8 ? entries_13_dataValid : _GEN_2482; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2484 = 4'he == idx_8 ? entries_14_dataValid : _GEN_2483; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2485 = 4'hf == idx_8 ? entries_15_dataValid : _GEN_2484; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2487 = 4'h1 == idx_8 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2488 = 4'h2 == idx_8 ? entries_2_paddrValid : _GEN_2487; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2489 = 4'h3 == idx_8 ? entries_3_paddrValid : _GEN_2488; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2490 = 4'h4 == idx_8 ? entries_4_paddrValid : _GEN_2489; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2491 = 4'h5 == idx_8 ? entries_5_paddrValid : _GEN_2490; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2492 = 4'h6 == idx_8 ? entries_6_paddrValid : _GEN_2491; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2493 = 4'h7 == idx_8 ? entries_7_paddrValid : _GEN_2492; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2494 = 4'h8 == idx_8 ? entries_8_paddrValid : _GEN_2493; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2495 = 4'h9 == idx_8 ? entries_9_paddrValid : _GEN_2494; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2496 = 4'ha == idx_8 ? entries_10_paddrValid : _GEN_2495; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2497 = 4'hb == idx_8 ? entries_11_paddrValid : _GEN_2496; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2498 = 4'hc == idx_8 ? entries_12_paddrValid : _GEN_2497; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2499 = 4'hd == idx_8 ? entries_13_paddrValid : _GEN_2498; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2500 = 4'he == idx_8 ? entries_14_paddrValid : _GEN_2499; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2501 = 4'hf == idx_8 ? entries_15_paddrValid : _GEN_2500; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_8_T_2 = _mmuCandidates_8_T & _GEN_2485 & _GEN_2501; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2503 = 4'h1 == idx_8 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2504 = 4'h2 == idx_8 ? entries_2_writtenBack : _GEN_2503; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2505 = 4'h3 == idx_8 ? entries_3_writtenBack : _GEN_2504; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2506 = 4'h4 == idx_8 ? entries_4_writtenBack : _GEN_2505; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2507 = 4'h5 == idx_8 ? entries_5_writtenBack : _GEN_2506; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2508 = 4'h6 == idx_8 ? entries_6_writtenBack : _GEN_2507; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2509 = 4'h7 == idx_8 ? entries_7_writtenBack : _GEN_2508; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2510 = 4'h8 == idx_8 ? entries_8_writtenBack : _GEN_2509; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2511 = 4'h9 == idx_8 ? entries_9_writtenBack : _GEN_2510; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2512 = 4'ha == idx_8 ? entries_10_writtenBack : _GEN_2511; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2513 = 4'hb == idx_8 ? entries_11_writtenBack : _GEN_2512; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2514 = 4'hc == idx_8 ? entries_12_writtenBack : _GEN_2513; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2515 = 4'hd == idx_8 ? entries_13_writtenBack : _GEN_2514; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2516 = 4'he == idx_8 ? entries_14_writtenBack : _GEN_2515; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2517 = 4'hf == idx_8 ? entries_15_writtenBack : _GEN_2516; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_8 = _wbCandidates_8_T_2 & ~_GEN_2517; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2551 = 4'h1 == idx_9 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2552 = 4'h2 == idx_9 ? entries_2_dataValid : _GEN_2551; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2553 = 4'h3 == idx_9 ? entries_3_dataValid : _GEN_2552; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2554 = 4'h4 == idx_9 ? entries_4_dataValid : _GEN_2553; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2555 = 4'h5 == idx_9 ? entries_5_dataValid : _GEN_2554; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2556 = 4'h6 == idx_9 ? entries_6_dataValid : _GEN_2555; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2557 = 4'h7 == idx_9 ? entries_7_dataValid : _GEN_2556; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2558 = 4'h8 == idx_9 ? entries_8_dataValid : _GEN_2557; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2559 = 4'h9 == idx_9 ? entries_9_dataValid : _GEN_2558; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2560 = 4'ha == idx_9 ? entries_10_dataValid : _GEN_2559; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2561 = 4'hb == idx_9 ? entries_11_dataValid : _GEN_2560; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2562 = 4'hc == idx_9 ? entries_12_dataValid : _GEN_2561; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2563 = 4'hd == idx_9 ? entries_13_dataValid : _GEN_2562; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2564 = 4'he == idx_9 ? entries_14_dataValid : _GEN_2563; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2565 = 4'hf == idx_9 ? entries_15_dataValid : _GEN_2564; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2567 = 4'h1 == idx_9 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2568 = 4'h2 == idx_9 ? entries_2_paddrValid : _GEN_2567; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2569 = 4'h3 == idx_9 ? entries_3_paddrValid : _GEN_2568; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2570 = 4'h4 == idx_9 ? entries_4_paddrValid : _GEN_2569; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2571 = 4'h5 == idx_9 ? entries_5_paddrValid : _GEN_2570; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2572 = 4'h6 == idx_9 ? entries_6_paddrValid : _GEN_2571; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2573 = 4'h7 == idx_9 ? entries_7_paddrValid : _GEN_2572; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2574 = 4'h8 == idx_9 ? entries_8_paddrValid : _GEN_2573; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2575 = 4'h9 == idx_9 ? entries_9_paddrValid : _GEN_2574; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2576 = 4'ha == idx_9 ? entries_10_paddrValid : _GEN_2575; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2577 = 4'hb == idx_9 ? entries_11_paddrValid : _GEN_2576; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2578 = 4'hc == idx_9 ? entries_12_paddrValid : _GEN_2577; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2579 = 4'hd == idx_9 ? entries_13_paddrValid : _GEN_2578; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2580 = 4'he == idx_9 ? entries_14_paddrValid : _GEN_2579; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2581 = 4'hf == idx_9 ? entries_15_paddrValid : _GEN_2580; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_9_T_2 = _mmuCandidates_9_T & _GEN_2565 & _GEN_2581; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2583 = 4'h1 == idx_9 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2584 = 4'h2 == idx_9 ? entries_2_writtenBack : _GEN_2583; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2585 = 4'h3 == idx_9 ? entries_3_writtenBack : _GEN_2584; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2586 = 4'h4 == idx_9 ? entries_4_writtenBack : _GEN_2585; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2587 = 4'h5 == idx_9 ? entries_5_writtenBack : _GEN_2586; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2588 = 4'h6 == idx_9 ? entries_6_writtenBack : _GEN_2587; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2589 = 4'h7 == idx_9 ? entries_7_writtenBack : _GEN_2588; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2590 = 4'h8 == idx_9 ? entries_8_writtenBack : _GEN_2589; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2591 = 4'h9 == idx_9 ? entries_9_writtenBack : _GEN_2590; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2592 = 4'ha == idx_9 ? entries_10_writtenBack : _GEN_2591; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2593 = 4'hb == idx_9 ? entries_11_writtenBack : _GEN_2592; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2594 = 4'hc == idx_9 ? entries_12_writtenBack : _GEN_2593; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2595 = 4'hd == idx_9 ? entries_13_writtenBack : _GEN_2594; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2596 = 4'he == idx_9 ? entries_14_writtenBack : _GEN_2595; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2597 = 4'hf == idx_9 ? entries_15_writtenBack : _GEN_2596; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_9 = _wbCandidates_9_T_2 & ~_GEN_2597; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2631 = 4'h1 == idx_10 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2632 = 4'h2 == idx_10 ? entries_2_dataValid : _GEN_2631; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2633 = 4'h3 == idx_10 ? entries_3_dataValid : _GEN_2632; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2634 = 4'h4 == idx_10 ? entries_4_dataValid : _GEN_2633; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2635 = 4'h5 == idx_10 ? entries_5_dataValid : _GEN_2634; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2636 = 4'h6 == idx_10 ? entries_6_dataValid : _GEN_2635; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2637 = 4'h7 == idx_10 ? entries_7_dataValid : _GEN_2636; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2638 = 4'h8 == idx_10 ? entries_8_dataValid : _GEN_2637; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2639 = 4'h9 == idx_10 ? entries_9_dataValid : _GEN_2638; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2640 = 4'ha == idx_10 ? entries_10_dataValid : _GEN_2639; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2641 = 4'hb == idx_10 ? entries_11_dataValid : _GEN_2640; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2642 = 4'hc == idx_10 ? entries_12_dataValid : _GEN_2641; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2643 = 4'hd == idx_10 ? entries_13_dataValid : _GEN_2642; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2644 = 4'he == idx_10 ? entries_14_dataValid : _GEN_2643; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2645 = 4'hf == idx_10 ? entries_15_dataValid : _GEN_2644; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2647 = 4'h1 == idx_10 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2648 = 4'h2 == idx_10 ? entries_2_paddrValid : _GEN_2647; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2649 = 4'h3 == idx_10 ? entries_3_paddrValid : _GEN_2648; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2650 = 4'h4 == idx_10 ? entries_4_paddrValid : _GEN_2649; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2651 = 4'h5 == idx_10 ? entries_5_paddrValid : _GEN_2650; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2652 = 4'h6 == idx_10 ? entries_6_paddrValid : _GEN_2651; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2653 = 4'h7 == idx_10 ? entries_7_paddrValid : _GEN_2652; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2654 = 4'h8 == idx_10 ? entries_8_paddrValid : _GEN_2653; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2655 = 4'h9 == idx_10 ? entries_9_paddrValid : _GEN_2654; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2656 = 4'ha == idx_10 ? entries_10_paddrValid : _GEN_2655; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2657 = 4'hb == idx_10 ? entries_11_paddrValid : _GEN_2656; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2658 = 4'hc == idx_10 ? entries_12_paddrValid : _GEN_2657; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2659 = 4'hd == idx_10 ? entries_13_paddrValid : _GEN_2658; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2660 = 4'he == idx_10 ? entries_14_paddrValid : _GEN_2659; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2661 = 4'hf == idx_10 ? entries_15_paddrValid : _GEN_2660; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_10_T_2 = _mmuCandidates_10_T & _GEN_2645 & _GEN_2661; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2663 = 4'h1 == idx_10 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2664 = 4'h2 == idx_10 ? entries_2_writtenBack : _GEN_2663; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2665 = 4'h3 == idx_10 ? entries_3_writtenBack : _GEN_2664; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2666 = 4'h4 == idx_10 ? entries_4_writtenBack : _GEN_2665; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2667 = 4'h5 == idx_10 ? entries_5_writtenBack : _GEN_2666; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2668 = 4'h6 == idx_10 ? entries_6_writtenBack : _GEN_2667; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2669 = 4'h7 == idx_10 ? entries_7_writtenBack : _GEN_2668; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2670 = 4'h8 == idx_10 ? entries_8_writtenBack : _GEN_2669; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2671 = 4'h9 == idx_10 ? entries_9_writtenBack : _GEN_2670; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2672 = 4'ha == idx_10 ? entries_10_writtenBack : _GEN_2671; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2673 = 4'hb == idx_10 ? entries_11_writtenBack : _GEN_2672; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2674 = 4'hc == idx_10 ? entries_12_writtenBack : _GEN_2673; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2675 = 4'hd == idx_10 ? entries_13_writtenBack : _GEN_2674; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2676 = 4'he == idx_10 ? entries_14_writtenBack : _GEN_2675; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2677 = 4'hf == idx_10 ? entries_15_writtenBack : _GEN_2676; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_10 = _wbCandidates_10_T_2 & ~_GEN_2677; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2711 = 4'h1 == idx_11 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2712 = 4'h2 == idx_11 ? entries_2_dataValid : _GEN_2711; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2713 = 4'h3 == idx_11 ? entries_3_dataValid : _GEN_2712; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2714 = 4'h4 == idx_11 ? entries_4_dataValid : _GEN_2713; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2715 = 4'h5 == idx_11 ? entries_5_dataValid : _GEN_2714; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2716 = 4'h6 == idx_11 ? entries_6_dataValid : _GEN_2715; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2717 = 4'h7 == idx_11 ? entries_7_dataValid : _GEN_2716; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2718 = 4'h8 == idx_11 ? entries_8_dataValid : _GEN_2717; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2719 = 4'h9 == idx_11 ? entries_9_dataValid : _GEN_2718; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2720 = 4'ha == idx_11 ? entries_10_dataValid : _GEN_2719; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2721 = 4'hb == idx_11 ? entries_11_dataValid : _GEN_2720; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2722 = 4'hc == idx_11 ? entries_12_dataValid : _GEN_2721; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2723 = 4'hd == idx_11 ? entries_13_dataValid : _GEN_2722; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2724 = 4'he == idx_11 ? entries_14_dataValid : _GEN_2723; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2725 = 4'hf == idx_11 ? entries_15_dataValid : _GEN_2724; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2727 = 4'h1 == idx_11 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2728 = 4'h2 == idx_11 ? entries_2_paddrValid : _GEN_2727; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2729 = 4'h3 == idx_11 ? entries_3_paddrValid : _GEN_2728; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2730 = 4'h4 == idx_11 ? entries_4_paddrValid : _GEN_2729; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2731 = 4'h5 == idx_11 ? entries_5_paddrValid : _GEN_2730; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2732 = 4'h6 == idx_11 ? entries_6_paddrValid : _GEN_2731; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2733 = 4'h7 == idx_11 ? entries_7_paddrValid : _GEN_2732; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2734 = 4'h8 == idx_11 ? entries_8_paddrValid : _GEN_2733; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2735 = 4'h9 == idx_11 ? entries_9_paddrValid : _GEN_2734; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2736 = 4'ha == idx_11 ? entries_10_paddrValid : _GEN_2735; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2737 = 4'hb == idx_11 ? entries_11_paddrValid : _GEN_2736; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2738 = 4'hc == idx_11 ? entries_12_paddrValid : _GEN_2737; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2739 = 4'hd == idx_11 ? entries_13_paddrValid : _GEN_2738; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2740 = 4'he == idx_11 ? entries_14_paddrValid : _GEN_2739; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2741 = 4'hf == idx_11 ? entries_15_paddrValid : _GEN_2740; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_11_T_2 = _mmuCandidates_11_T & _GEN_2725 & _GEN_2741; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2743 = 4'h1 == idx_11 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2744 = 4'h2 == idx_11 ? entries_2_writtenBack : _GEN_2743; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2745 = 4'h3 == idx_11 ? entries_3_writtenBack : _GEN_2744; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2746 = 4'h4 == idx_11 ? entries_4_writtenBack : _GEN_2745; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2747 = 4'h5 == idx_11 ? entries_5_writtenBack : _GEN_2746; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2748 = 4'h6 == idx_11 ? entries_6_writtenBack : _GEN_2747; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2749 = 4'h7 == idx_11 ? entries_7_writtenBack : _GEN_2748; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2750 = 4'h8 == idx_11 ? entries_8_writtenBack : _GEN_2749; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2751 = 4'h9 == idx_11 ? entries_9_writtenBack : _GEN_2750; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2752 = 4'ha == idx_11 ? entries_10_writtenBack : _GEN_2751; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2753 = 4'hb == idx_11 ? entries_11_writtenBack : _GEN_2752; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2754 = 4'hc == idx_11 ? entries_12_writtenBack : _GEN_2753; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2755 = 4'hd == idx_11 ? entries_13_writtenBack : _GEN_2754; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2756 = 4'he == idx_11 ? entries_14_writtenBack : _GEN_2755; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2757 = 4'hf == idx_11 ? entries_15_writtenBack : _GEN_2756; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_11 = _wbCandidates_11_T_2 & ~_GEN_2757; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2791 = 4'h1 == idx_12 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2792 = 4'h2 == idx_12 ? entries_2_dataValid : _GEN_2791; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2793 = 4'h3 == idx_12 ? entries_3_dataValid : _GEN_2792; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2794 = 4'h4 == idx_12 ? entries_4_dataValid : _GEN_2793; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2795 = 4'h5 == idx_12 ? entries_5_dataValid : _GEN_2794; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2796 = 4'h6 == idx_12 ? entries_6_dataValid : _GEN_2795; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2797 = 4'h7 == idx_12 ? entries_7_dataValid : _GEN_2796; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2798 = 4'h8 == idx_12 ? entries_8_dataValid : _GEN_2797; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2799 = 4'h9 == idx_12 ? entries_9_dataValid : _GEN_2798; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2800 = 4'ha == idx_12 ? entries_10_dataValid : _GEN_2799; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2801 = 4'hb == idx_12 ? entries_11_dataValid : _GEN_2800; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2802 = 4'hc == idx_12 ? entries_12_dataValid : _GEN_2801; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2803 = 4'hd == idx_12 ? entries_13_dataValid : _GEN_2802; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2804 = 4'he == idx_12 ? entries_14_dataValid : _GEN_2803; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2805 = 4'hf == idx_12 ? entries_15_dataValid : _GEN_2804; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2807 = 4'h1 == idx_12 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2808 = 4'h2 == idx_12 ? entries_2_paddrValid : _GEN_2807; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2809 = 4'h3 == idx_12 ? entries_3_paddrValid : _GEN_2808; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2810 = 4'h4 == idx_12 ? entries_4_paddrValid : _GEN_2809; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2811 = 4'h5 == idx_12 ? entries_5_paddrValid : _GEN_2810; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2812 = 4'h6 == idx_12 ? entries_6_paddrValid : _GEN_2811; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2813 = 4'h7 == idx_12 ? entries_7_paddrValid : _GEN_2812; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2814 = 4'h8 == idx_12 ? entries_8_paddrValid : _GEN_2813; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2815 = 4'h9 == idx_12 ? entries_9_paddrValid : _GEN_2814; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2816 = 4'ha == idx_12 ? entries_10_paddrValid : _GEN_2815; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2817 = 4'hb == idx_12 ? entries_11_paddrValid : _GEN_2816; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2818 = 4'hc == idx_12 ? entries_12_paddrValid : _GEN_2817; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2819 = 4'hd == idx_12 ? entries_13_paddrValid : _GEN_2818; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2820 = 4'he == idx_12 ? entries_14_paddrValid : _GEN_2819; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2821 = 4'hf == idx_12 ? entries_15_paddrValid : _GEN_2820; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_12_T_2 = _mmuCandidates_12_T & _GEN_2805 & _GEN_2821; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2823 = 4'h1 == idx_12 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2824 = 4'h2 == idx_12 ? entries_2_writtenBack : _GEN_2823; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2825 = 4'h3 == idx_12 ? entries_3_writtenBack : _GEN_2824; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2826 = 4'h4 == idx_12 ? entries_4_writtenBack : _GEN_2825; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2827 = 4'h5 == idx_12 ? entries_5_writtenBack : _GEN_2826; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2828 = 4'h6 == idx_12 ? entries_6_writtenBack : _GEN_2827; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2829 = 4'h7 == idx_12 ? entries_7_writtenBack : _GEN_2828; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2830 = 4'h8 == idx_12 ? entries_8_writtenBack : _GEN_2829; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2831 = 4'h9 == idx_12 ? entries_9_writtenBack : _GEN_2830; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2832 = 4'ha == idx_12 ? entries_10_writtenBack : _GEN_2831; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2833 = 4'hb == idx_12 ? entries_11_writtenBack : _GEN_2832; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2834 = 4'hc == idx_12 ? entries_12_writtenBack : _GEN_2833; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2835 = 4'hd == idx_12 ? entries_13_writtenBack : _GEN_2834; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2836 = 4'he == idx_12 ? entries_14_writtenBack : _GEN_2835; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2837 = 4'hf == idx_12 ? entries_15_writtenBack : _GEN_2836; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_12 = _wbCandidates_12_T_2 & ~_GEN_2837; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2871 = 4'h1 == idx_13 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2872 = 4'h2 == idx_13 ? entries_2_dataValid : _GEN_2871; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2873 = 4'h3 == idx_13 ? entries_3_dataValid : _GEN_2872; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2874 = 4'h4 == idx_13 ? entries_4_dataValid : _GEN_2873; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2875 = 4'h5 == idx_13 ? entries_5_dataValid : _GEN_2874; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2876 = 4'h6 == idx_13 ? entries_6_dataValid : _GEN_2875; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2877 = 4'h7 == idx_13 ? entries_7_dataValid : _GEN_2876; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2878 = 4'h8 == idx_13 ? entries_8_dataValid : _GEN_2877; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2879 = 4'h9 == idx_13 ? entries_9_dataValid : _GEN_2878; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2880 = 4'ha == idx_13 ? entries_10_dataValid : _GEN_2879; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2881 = 4'hb == idx_13 ? entries_11_dataValid : _GEN_2880; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2882 = 4'hc == idx_13 ? entries_12_dataValid : _GEN_2881; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2883 = 4'hd == idx_13 ? entries_13_dataValid : _GEN_2882; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2884 = 4'he == idx_13 ? entries_14_dataValid : _GEN_2883; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2885 = 4'hf == idx_13 ? entries_15_dataValid : _GEN_2884; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2887 = 4'h1 == idx_13 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2888 = 4'h2 == idx_13 ? entries_2_paddrValid : _GEN_2887; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2889 = 4'h3 == idx_13 ? entries_3_paddrValid : _GEN_2888; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2890 = 4'h4 == idx_13 ? entries_4_paddrValid : _GEN_2889; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2891 = 4'h5 == idx_13 ? entries_5_paddrValid : _GEN_2890; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2892 = 4'h6 == idx_13 ? entries_6_paddrValid : _GEN_2891; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2893 = 4'h7 == idx_13 ? entries_7_paddrValid : _GEN_2892; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2894 = 4'h8 == idx_13 ? entries_8_paddrValid : _GEN_2893; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2895 = 4'h9 == idx_13 ? entries_9_paddrValid : _GEN_2894; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2896 = 4'ha == idx_13 ? entries_10_paddrValid : _GEN_2895; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2897 = 4'hb == idx_13 ? entries_11_paddrValid : _GEN_2896; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2898 = 4'hc == idx_13 ? entries_12_paddrValid : _GEN_2897; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2899 = 4'hd == idx_13 ? entries_13_paddrValid : _GEN_2898; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2900 = 4'he == idx_13 ? entries_14_paddrValid : _GEN_2899; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2901 = 4'hf == idx_13 ? entries_15_paddrValid : _GEN_2900; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_13_T_2 = _mmuCandidates_13_T & _GEN_2885 & _GEN_2901; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2903 = 4'h1 == idx_13 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2904 = 4'h2 == idx_13 ? entries_2_writtenBack : _GEN_2903; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2905 = 4'h3 == idx_13 ? entries_3_writtenBack : _GEN_2904; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2906 = 4'h4 == idx_13 ? entries_4_writtenBack : _GEN_2905; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2907 = 4'h5 == idx_13 ? entries_5_writtenBack : _GEN_2906; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2908 = 4'h6 == idx_13 ? entries_6_writtenBack : _GEN_2907; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2909 = 4'h7 == idx_13 ? entries_7_writtenBack : _GEN_2908; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2910 = 4'h8 == idx_13 ? entries_8_writtenBack : _GEN_2909; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2911 = 4'h9 == idx_13 ? entries_9_writtenBack : _GEN_2910; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2912 = 4'ha == idx_13 ? entries_10_writtenBack : _GEN_2911; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2913 = 4'hb == idx_13 ? entries_11_writtenBack : _GEN_2912; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2914 = 4'hc == idx_13 ? entries_12_writtenBack : _GEN_2913; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2915 = 4'hd == idx_13 ? entries_13_writtenBack : _GEN_2914; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2916 = 4'he == idx_13 ? entries_14_writtenBack : _GEN_2915; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2917 = 4'hf == idx_13 ? entries_15_writtenBack : _GEN_2916; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_13 = _wbCandidates_13_T_2 & ~_GEN_2917; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_2951 = 4'h1 == idx_14 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2952 = 4'h2 == idx_14 ? entries_2_dataValid : _GEN_2951; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2953 = 4'h3 == idx_14 ? entries_3_dataValid : _GEN_2952; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2954 = 4'h4 == idx_14 ? entries_4_dataValid : _GEN_2953; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2955 = 4'h5 == idx_14 ? entries_5_dataValid : _GEN_2954; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2956 = 4'h6 == idx_14 ? entries_6_dataValid : _GEN_2955; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2957 = 4'h7 == idx_14 ? entries_7_dataValid : _GEN_2956; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2958 = 4'h8 == idx_14 ? entries_8_dataValid : _GEN_2957; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2959 = 4'h9 == idx_14 ? entries_9_dataValid : _GEN_2958; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2960 = 4'ha == idx_14 ? entries_10_dataValid : _GEN_2959; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2961 = 4'hb == idx_14 ? entries_11_dataValid : _GEN_2960; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2962 = 4'hc == idx_14 ? entries_12_dataValid : _GEN_2961; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2963 = 4'hd == idx_14 ? entries_13_dataValid : _GEN_2962; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2964 = 4'he == idx_14 ? entries_14_dataValid : _GEN_2963; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2965 = 4'hf == idx_14 ? entries_15_dataValid : _GEN_2964; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_2967 = 4'h1 == idx_14 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2968 = 4'h2 == idx_14 ? entries_2_paddrValid : _GEN_2967; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2969 = 4'h3 == idx_14 ? entries_3_paddrValid : _GEN_2968; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2970 = 4'h4 == idx_14 ? entries_4_paddrValid : _GEN_2969; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2971 = 4'h5 == idx_14 ? entries_5_paddrValid : _GEN_2970; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2972 = 4'h6 == idx_14 ? entries_6_paddrValid : _GEN_2971; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2973 = 4'h7 == idx_14 ? entries_7_paddrValid : _GEN_2972; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2974 = 4'h8 == idx_14 ? entries_8_paddrValid : _GEN_2973; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2975 = 4'h9 == idx_14 ? entries_9_paddrValid : _GEN_2974; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2976 = 4'ha == idx_14 ? entries_10_paddrValid : _GEN_2975; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2977 = 4'hb == idx_14 ? entries_11_paddrValid : _GEN_2976; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2978 = 4'hc == idx_14 ? entries_12_paddrValid : _GEN_2977; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2979 = 4'hd == idx_14 ? entries_13_paddrValid : _GEN_2978; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2980 = 4'he == idx_14 ? entries_14_paddrValid : _GEN_2979; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_2981 = 4'hf == idx_14 ? entries_15_paddrValid : _GEN_2980; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_14_T_2 = _mmuCandidates_14_T & _GEN_2965 & _GEN_2981; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_2983 = 4'h1 == idx_14 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2984 = 4'h2 == idx_14 ? entries_2_writtenBack : _GEN_2983; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2985 = 4'h3 == idx_14 ? entries_3_writtenBack : _GEN_2984; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2986 = 4'h4 == idx_14 ? entries_4_writtenBack : _GEN_2985; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2987 = 4'h5 == idx_14 ? entries_5_writtenBack : _GEN_2986; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2988 = 4'h6 == idx_14 ? entries_6_writtenBack : _GEN_2987; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2989 = 4'h7 == idx_14 ? entries_7_writtenBack : _GEN_2988; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2990 = 4'h8 == idx_14 ? entries_8_writtenBack : _GEN_2989; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2991 = 4'h9 == idx_14 ? entries_9_writtenBack : _GEN_2990; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2992 = 4'ha == idx_14 ? entries_10_writtenBack : _GEN_2991; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2993 = 4'hb == idx_14 ? entries_11_writtenBack : _GEN_2992; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2994 = 4'hc == idx_14 ? entries_12_writtenBack : _GEN_2993; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2995 = 4'hd == idx_14 ? entries_13_writtenBack : _GEN_2994; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2996 = 4'he == idx_14 ? entries_14_writtenBack : _GEN_2995; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_2997 = 4'hf == idx_14 ? entries_15_writtenBack : _GEN_2996; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_14 = _wbCandidates_14_T_2 & ~_GEN_2997; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire  _GEN_3031 = 4'h1 == idx_15 ? entries_1_dataValid : entries_0_dataValid; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3032 = 4'h2 == idx_15 ? entries_2_dataValid : _GEN_3031; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3033 = 4'h3 == idx_15 ? entries_3_dataValid : _GEN_3032; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3034 = 4'h4 == idx_15 ? entries_4_dataValid : _GEN_3033; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3035 = 4'h5 == idx_15 ? entries_5_dataValid : _GEN_3034; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3036 = 4'h6 == idx_15 ? entries_6_dataValid : _GEN_3035; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3037 = 4'h7 == idx_15 ? entries_7_dataValid : _GEN_3036; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3038 = 4'h8 == idx_15 ? entries_8_dataValid : _GEN_3037; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3039 = 4'h9 == idx_15 ? entries_9_dataValid : _GEN_3038; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3040 = 4'ha == idx_15 ? entries_10_dataValid : _GEN_3039; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3041 = 4'hb == idx_15 ? entries_11_dataValid : _GEN_3040; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3042 = 4'hc == idx_15 ? entries_12_dataValid : _GEN_3041; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3043 = 4'hd == idx_15 ? entries_13_dataValid : _GEN_3042; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3044 = 4'he == idx_15 ? entries_14_dataValid : _GEN_3043; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3045 = 4'hf == idx_15 ? entries_15_dataValid : _GEN_3044; // @[src/main/scala/memory/StoreQueue.scala 237:{47,47}]
  wire  _GEN_3047 = 4'h1 == idx_15 ? entries_1_paddrValid : entries_0_paddrValid; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3048 = 4'h2 == idx_15 ? entries_2_paddrValid : _GEN_3047; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3049 = 4'h3 == idx_15 ? entries_3_paddrValid : _GEN_3048; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3050 = 4'h4 == idx_15 ? entries_4_paddrValid : _GEN_3049; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3051 = 4'h5 == idx_15 ? entries_5_paddrValid : _GEN_3050; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3052 = 4'h6 == idx_15 ? entries_6_paddrValid : _GEN_3051; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3053 = 4'h7 == idx_15 ? entries_7_paddrValid : _GEN_3052; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3054 = 4'h8 == idx_15 ? entries_8_paddrValid : _GEN_3053; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3055 = 4'h9 == idx_15 ? entries_9_paddrValid : _GEN_3054; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3056 = 4'ha == idx_15 ? entries_10_paddrValid : _GEN_3055; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3057 = 4'hb == idx_15 ? entries_11_paddrValid : _GEN_3056; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3058 = 4'hc == idx_15 ? entries_12_paddrValid : _GEN_3057; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3059 = 4'hd == idx_15 ? entries_13_paddrValid : _GEN_3058; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3060 = 4'he == idx_15 ? entries_14_paddrValid : _GEN_3059; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _GEN_3061 = 4'hf == idx_15 ? entries_15_paddrValid : _GEN_3060; // @[src/main/scala/memory/StoreQueue.scala 237:{62,62}]
  wire  _wbCandidates_15_T_2 = _mmuCandidates_15_T & _GEN_3045 & _GEN_3061; // @[src/main/scala/memory/StoreQueue.scala 237:62]
  wire  _GEN_3063 = 4'h1 == idx_15 ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3064 = 4'h2 == idx_15 ? entries_2_writtenBack : _GEN_3063; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3065 = 4'h3 == idx_15 ? entries_3_writtenBack : _GEN_3064; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3066 = 4'h4 == idx_15 ? entries_4_writtenBack : _GEN_3065; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3067 = 4'h5 == idx_15 ? entries_5_writtenBack : _GEN_3066; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3068 = 4'h6 == idx_15 ? entries_6_writtenBack : _GEN_3067; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3069 = 4'h7 == idx_15 ? entries_7_writtenBack : _GEN_3068; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3070 = 4'h8 == idx_15 ? entries_8_writtenBack : _GEN_3069; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3071 = 4'h9 == idx_15 ? entries_9_writtenBack : _GEN_3070; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3072 = 4'ha == idx_15 ? entries_10_writtenBack : _GEN_3071; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3073 = 4'hb == idx_15 ? entries_11_writtenBack : _GEN_3072; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3074 = 4'hc == idx_15 ? entries_12_writtenBack : _GEN_3073; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3075 = 4'hd == idx_15 ? entries_13_writtenBack : _GEN_3074; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3076 = 4'he == idx_15 ? entries_14_writtenBack : _GEN_3075; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  _GEN_3077 = 4'hf == idx_15 ? entries_15_writtenBack : _GEN_3076; // @[src/main/scala/memory/StoreQueue.scala 238:{41,41}]
  wire  wbCandidates_15 = _wbCandidates_15_T_2 & ~_GEN_3077; // @[src/main/scala/memory/StoreQueue.scala 238:38]
  wire [3:0] _wbOffset_T = wbCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_1 = wbCandidates_13 ? 4'hd : _wbOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_2 = wbCandidates_12 ? 4'hc : _wbOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_3 = wbCandidates_11 ? 4'hb : _wbOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_4 = wbCandidates_10 ? 4'ha : _wbOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_5 = wbCandidates_9 ? 4'h9 : _wbOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_6 = wbCandidates_8 ? 4'h8 : _wbOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_7 = wbCandidates_7 ? 4'h7 : _wbOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_8 = wbCandidates_6 ? 4'h6 : _wbOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_9 = wbCandidates_5 ? 4'h5 : _wbOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_10 = wbCandidates_4 ? 4'h4 : _wbOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_11 = wbCandidates_3 ? 4'h3 : _wbOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_12 = wbCandidates_2 ? 4'h2 : _wbOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _wbOffset_T_13 = wbCandidates_1 ? 4'h1 : _wbOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] wbOffset = wbCandidates_0 ? 4'h0 : _wbOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] wbIdx = deqPtr_value + wbOffset; // @[src/main/scala/memory/StoreQueue.scala 243:38]
  wire [9:0] _GEN_3079 = 4'h1 == wbIdx ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3080 = 4'h2 == wbIdx ? entries_2_excpVec : _GEN_3079; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3081 = 4'h3 == wbIdx ? entries_3_excpVec : _GEN_3080; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3082 = 4'h4 == wbIdx ? entries_4_excpVec : _GEN_3081; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3083 = 4'h5 == wbIdx ? entries_5_excpVec : _GEN_3082; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3084 = 4'h6 == wbIdx ? entries_6_excpVec : _GEN_3083; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3085 = 4'h7 == wbIdx ? entries_7_excpVec : _GEN_3084; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3086 = 4'h8 == wbIdx ? entries_8_excpVec : _GEN_3085; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3087 = 4'h9 == wbIdx ? entries_9_excpVec : _GEN_3086; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3088 = 4'ha == wbIdx ? entries_10_excpVec : _GEN_3087; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3089 = 4'hb == wbIdx ? entries_11_excpVec : _GEN_3088; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3090 = 4'hc == wbIdx ? entries_12_excpVec : _GEN_3089; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3091 = 4'hd == wbIdx ? entries_13_excpVec : _GEN_3090; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3092 = 4'he == wbIdx ? entries_14_excpVec : _GEN_3091; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [9:0] _GEN_3093 = 4'hf == wbIdx ? entries_15_excpVec : _GEN_3092; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  wire [5:0] _GEN_3095 = 4'h1 == wbIdx ? entries_1_robIdxFull_value : entries_0_robIdxFull_value; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3096 = 4'h2 == wbIdx ? entries_2_robIdxFull_value : _GEN_3095; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3097 = 4'h3 == wbIdx ? entries_3_robIdxFull_value : _GEN_3096; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3098 = 4'h4 == wbIdx ? entries_4_robIdxFull_value : _GEN_3097; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3099 = 4'h5 == wbIdx ? entries_5_robIdxFull_value : _GEN_3098; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3100 = 4'h6 == wbIdx ? entries_6_robIdxFull_value : _GEN_3099; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3101 = 4'h7 == wbIdx ? entries_7_robIdxFull_value : _GEN_3100; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3102 = 4'h8 == wbIdx ? entries_8_robIdxFull_value : _GEN_3101; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3103 = 4'h9 == wbIdx ? entries_9_robIdxFull_value : _GEN_3102; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3104 = 4'ha == wbIdx ? entries_10_robIdxFull_value : _GEN_3103; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3105 = 4'hb == wbIdx ? entries_11_robIdxFull_value : _GEN_3104; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3106 = 4'hc == wbIdx ? entries_12_robIdxFull_value : _GEN_3105; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3107 = 4'hd == wbIdx ? entries_13_robIdxFull_value : _GEN_3106; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [5:0] _GEN_3108 = 4'he == wbIdx ? entries_14_robIdxFull_value : _GEN_3107; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3111 = 4'h1 == wbIdx ? entries_1_robIdxFull_flag : entries_0_robIdxFull_flag; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3112 = 4'h2 == wbIdx ? entries_2_robIdxFull_flag : _GEN_3111; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3113 = 4'h3 == wbIdx ? entries_3_robIdxFull_flag : _GEN_3112; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3114 = 4'h4 == wbIdx ? entries_4_robIdxFull_flag : _GEN_3113; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3115 = 4'h5 == wbIdx ? entries_5_robIdxFull_flag : _GEN_3114; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3116 = 4'h6 == wbIdx ? entries_6_robIdxFull_flag : _GEN_3115; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3117 = 4'h7 == wbIdx ? entries_7_robIdxFull_flag : _GEN_3116; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3118 = 4'h8 == wbIdx ? entries_8_robIdxFull_flag : _GEN_3117; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3119 = 4'h9 == wbIdx ? entries_9_robIdxFull_flag : _GEN_3118; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3120 = 4'ha == wbIdx ? entries_10_robIdxFull_flag : _GEN_3119; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3121 = 4'hb == wbIdx ? entries_11_robIdxFull_flag : _GEN_3120; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3122 = 4'hc == wbIdx ? entries_12_robIdxFull_flag : _GEN_3121; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3123 = 4'hd == wbIdx ? entries_13_robIdxFull_flag : _GEN_3122; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire  _GEN_3124 = 4'he == wbIdx ? entries_14_robIdxFull_flag : _GEN_3123; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  wire [31:0] _GEN_3127 = 4'h1 == wbIdx ? entries_1_pc : entries_0_pc; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3128 = 4'h2 == wbIdx ? entries_2_pc : _GEN_3127; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3129 = 4'h3 == wbIdx ? entries_3_pc : _GEN_3128; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3130 = 4'h4 == wbIdx ? entries_4_pc : _GEN_3129; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3131 = 4'h5 == wbIdx ? entries_5_pc : _GEN_3130; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3132 = 4'h6 == wbIdx ? entries_6_pc : _GEN_3131; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3133 = 4'h7 == wbIdx ? entries_7_pc : _GEN_3132; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3134 = 4'h8 == wbIdx ? entries_8_pc : _GEN_3133; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3135 = 4'h9 == wbIdx ? entries_9_pc : _GEN_3134; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3136 = 4'ha == wbIdx ? entries_10_pc : _GEN_3135; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3137 = 4'hb == wbIdx ? entries_11_pc : _GEN_3136; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3138 = 4'hc == wbIdx ? entries_12_pc : _GEN_3137; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3139 = 4'hd == wbIdx ? entries_13_pc : _GEN_3138; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [31:0] _GEN_3140 = 4'he == wbIdx ? entries_14_pc : _GEN_3139; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  wire [6:0] _GEN_3143 = 4'h1 == wbIdx ? entries_1_pdst : entries_0_pdst; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3144 = 4'h2 == wbIdx ? entries_2_pdst : _GEN_3143; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3145 = 4'h3 == wbIdx ? entries_3_pdst : _GEN_3144; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3146 = 4'h4 == wbIdx ? entries_4_pdst : _GEN_3145; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3147 = 4'h5 == wbIdx ? entries_5_pdst : _GEN_3146; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3148 = 4'h6 == wbIdx ? entries_6_pdst : _GEN_3147; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3149 = 4'h7 == wbIdx ? entries_7_pdst : _GEN_3148; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3150 = 4'h8 == wbIdx ? entries_8_pdst : _GEN_3149; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3151 = 4'h9 == wbIdx ? entries_9_pdst : _GEN_3150; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3152 = 4'ha == wbIdx ? entries_10_pdst : _GEN_3151; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3153 = 4'hb == wbIdx ? entries_11_pdst : _GEN_3152; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3154 = 4'hc == wbIdx ? entries_12_pdst : _GEN_3153; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3155 = 4'hd == wbIdx ? entries_13_pdst : _GEN_3154; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [6:0] _GEN_3156 = 4'he == wbIdx ? entries_14_pdst : _GEN_3155; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  wire [3:0] _GEN_3159 = 4'h1 == wbIdx ? entries_1_lqIdx : entries_0_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3160 = 4'h2 == wbIdx ? entries_2_lqIdx : _GEN_3159; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3161 = 4'h3 == wbIdx ? entries_3_lqIdx : _GEN_3160; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3162 = 4'h4 == wbIdx ? entries_4_lqIdx : _GEN_3161; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3163 = 4'h5 == wbIdx ? entries_5_lqIdx : _GEN_3162; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3164 = 4'h6 == wbIdx ? entries_6_lqIdx : _GEN_3163; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3165 = 4'h7 == wbIdx ? entries_7_lqIdx : _GEN_3164; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3166 = 4'h8 == wbIdx ? entries_8_lqIdx : _GEN_3165; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3167 = 4'h9 == wbIdx ? entries_9_lqIdx : _GEN_3166; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3168 = 4'ha == wbIdx ? entries_10_lqIdx : _GEN_3167; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3169 = 4'hb == wbIdx ? entries_11_lqIdx : _GEN_3168; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3170 = 4'hc == wbIdx ? entries_12_lqIdx : _GEN_3169; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3171 = 4'hd == wbIdx ? entries_13_lqIdx : _GEN_3170; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3172 = 4'he == wbIdx ? entries_14_lqIdx : _GEN_3171; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  wire [3:0] _GEN_3175 = 4'h1 == wbIdx ? entries_1_fuType : entries_0_fuType; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3176 = 4'h2 == wbIdx ? entries_2_fuType : _GEN_3175; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3177 = 4'h3 == wbIdx ? entries_3_fuType : _GEN_3176; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3178 = 4'h4 == wbIdx ? entries_4_fuType : _GEN_3177; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3179 = 4'h5 == wbIdx ? entries_5_fuType : _GEN_3178; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3180 = 4'h6 == wbIdx ? entries_6_fuType : _GEN_3179; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3181 = 4'h7 == wbIdx ? entries_7_fuType : _GEN_3180; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3182 = 4'h8 == wbIdx ? entries_8_fuType : _GEN_3181; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3183 = 4'h9 == wbIdx ? entries_9_fuType : _GEN_3182; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3184 = 4'ha == wbIdx ? entries_10_fuType : _GEN_3183; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3185 = 4'hb == wbIdx ? entries_11_fuType : _GEN_3184; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3186 = 4'hc == wbIdx ? entries_12_fuType : _GEN_3185; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3187 = 4'hd == wbIdx ? entries_13_fuType : _GEN_3186; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3188 = 4'he == wbIdx ? entries_14_fuType : _GEN_3187; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  wire [3:0] _GEN_3191 = 4'h1 == wbIdx ? entries_1_lsuOp : entries_0_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3192 = 4'h2 == wbIdx ? entries_2_lsuOp : _GEN_3191; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3193 = 4'h3 == wbIdx ? entries_3_lsuOp : _GEN_3192; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3194 = 4'h4 == wbIdx ? entries_4_lsuOp : _GEN_3193; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3195 = 4'h5 == wbIdx ? entries_5_lsuOp : _GEN_3194; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3196 = 4'h6 == wbIdx ? entries_6_lsuOp : _GEN_3195; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3197 = 4'h7 == wbIdx ? entries_7_lsuOp : _GEN_3196; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3198 = 4'h8 == wbIdx ? entries_8_lsuOp : _GEN_3197; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3199 = 4'h9 == wbIdx ? entries_9_lsuOp : _GEN_3198; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3200 = 4'ha == wbIdx ? entries_10_lsuOp : _GEN_3199; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3201 = 4'hb == wbIdx ? entries_11_lsuOp : _GEN_3200; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3202 = 4'hc == wbIdx ? entries_12_lsuOp : _GEN_3201; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3203 = 4'hd == wbIdx ? entries_13_lsuOp : _GEN_3202; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire [3:0] _GEN_3204 = 4'he == wbIdx ? entries_14_lsuOp : _GEN_3203; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  wire  _T_2 = io_outResult_ready & io_outResult_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_3206 = 4'h0 == wbIdx | _GEN_528; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3207 = 4'h1 == wbIdx | _GEN_529; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3208 = 4'h2 == wbIdx | _GEN_530; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3209 = 4'h3 == wbIdx | _GEN_531; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3210 = 4'h4 == wbIdx | _GEN_532; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3211 = 4'h5 == wbIdx | _GEN_533; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3212 = 4'h6 == wbIdx | _GEN_534; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3213 = 4'h7 == wbIdx | _GEN_535; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3214 = 4'h8 == wbIdx | _GEN_536; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3215 = 4'h9 == wbIdx | _GEN_537; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3216 = 4'ha == wbIdx | _GEN_538; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3217 = 4'hb == wbIdx | _GEN_539; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3218 = 4'hc == wbIdx | _GEN_540; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3219 = 4'hd == wbIdx | _GEN_541; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3220 = 4'he == wbIdx | _GEN_542; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3221 = 4'hf == wbIdx | _GEN_543; // @[src/main/scala/memory/StoreQueue.scala 308:{32,32}]
  wire  _GEN_3238 = 4'h0 == io_robCommit_0_sqIdx | _GEN_512; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3239 = 4'h1 == io_robCommit_0_sqIdx | _GEN_513; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3240 = 4'h2 == io_robCommit_0_sqIdx | _GEN_514; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3241 = 4'h3 == io_robCommit_0_sqIdx | _GEN_515; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3242 = 4'h4 == io_robCommit_0_sqIdx | _GEN_516; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3243 = 4'h5 == io_robCommit_0_sqIdx | _GEN_517; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3244 = 4'h6 == io_robCommit_0_sqIdx | _GEN_518; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3245 = 4'h7 == io_robCommit_0_sqIdx | _GEN_519; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3246 = 4'h8 == io_robCommit_0_sqIdx | _GEN_520; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3247 = 4'h9 == io_robCommit_0_sqIdx | _GEN_521; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3248 = 4'ha == io_robCommit_0_sqIdx | _GEN_522; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3249 = 4'hb == io_robCommit_0_sqIdx | _GEN_523; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3250 = 4'hc == io_robCommit_0_sqIdx | _GEN_524; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3251 = 4'hd == io_robCommit_0_sqIdx | _GEN_525; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3252 = 4'he == io_robCommit_0_sqIdx | _GEN_526; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3253 = 4'hf == io_robCommit_0_sqIdx | _GEN_527; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3254 = io_robCommit_0_valid ? _GEN_3238 : _GEN_512; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3255 = io_robCommit_0_valid ? _GEN_3239 : _GEN_513; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3256 = io_robCommit_0_valid ? _GEN_3240 : _GEN_514; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3257 = io_robCommit_0_valid ? _GEN_3241 : _GEN_515; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3258 = io_robCommit_0_valid ? _GEN_3242 : _GEN_516; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3259 = io_robCommit_0_valid ? _GEN_3243 : _GEN_517; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3260 = io_robCommit_0_valid ? _GEN_3244 : _GEN_518; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3261 = io_robCommit_0_valid ? _GEN_3245 : _GEN_519; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3262 = io_robCommit_0_valid ? _GEN_3246 : _GEN_520; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3263 = io_robCommit_0_valid ? _GEN_3247 : _GEN_521; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3264 = io_robCommit_0_valid ? _GEN_3248 : _GEN_522; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3265 = io_robCommit_0_valid ? _GEN_3249 : _GEN_523; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3266 = io_robCommit_0_valid ? _GEN_3250 : _GEN_524; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3267 = io_robCommit_0_valid ? _GEN_3251 : _GEN_525; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3268 = io_robCommit_0_valid ? _GEN_3252 : _GEN_526; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3269 = io_robCommit_0_valid ? _GEN_3253 : _GEN_527; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3270 = 4'h0 == io_robCommit_1_sqIdx | _GEN_3254; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3271 = 4'h1 == io_robCommit_1_sqIdx | _GEN_3255; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3272 = 4'h2 == io_robCommit_1_sqIdx | _GEN_3256; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3273 = 4'h3 == io_robCommit_1_sqIdx | _GEN_3257; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3274 = 4'h4 == io_robCommit_1_sqIdx | _GEN_3258; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3275 = 4'h5 == io_robCommit_1_sqIdx | _GEN_3259; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3276 = 4'h6 == io_robCommit_1_sqIdx | _GEN_3260; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3277 = 4'h7 == io_robCommit_1_sqIdx | _GEN_3261; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3278 = 4'h8 == io_robCommit_1_sqIdx | _GEN_3262; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3279 = 4'h9 == io_robCommit_1_sqIdx | _GEN_3263; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3280 = 4'ha == io_robCommit_1_sqIdx | _GEN_3264; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3281 = 4'hb == io_robCommit_1_sqIdx | _GEN_3265; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3282 = 4'hc == io_robCommit_1_sqIdx | _GEN_3266; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3283 = 4'hd == io_robCommit_1_sqIdx | _GEN_3267; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3284 = 4'he == io_robCommit_1_sqIdx | _GEN_3268; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3285 = 4'hf == io_robCommit_1_sqIdx | _GEN_3269; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3286 = io_robCommit_1_valid ? _GEN_3270 : _GEN_3254; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3287 = io_robCommit_1_valid ? _GEN_3271 : _GEN_3255; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3288 = io_robCommit_1_valid ? _GEN_3272 : _GEN_3256; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3289 = io_robCommit_1_valid ? _GEN_3273 : _GEN_3257; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3290 = io_robCommit_1_valid ? _GEN_3274 : _GEN_3258; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3291 = io_robCommit_1_valid ? _GEN_3275 : _GEN_3259; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3292 = io_robCommit_1_valid ? _GEN_3276 : _GEN_3260; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3293 = io_robCommit_1_valid ? _GEN_3277 : _GEN_3261; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3294 = io_robCommit_1_valid ? _GEN_3278 : _GEN_3262; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3295 = io_robCommit_1_valid ? _GEN_3279 : _GEN_3263; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3296 = io_robCommit_1_valid ? _GEN_3280 : _GEN_3264; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3297 = io_robCommit_1_valid ? _GEN_3281 : _GEN_3265; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3298 = io_robCommit_1_valid ? _GEN_3282 : _GEN_3266; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3299 = io_robCommit_1_valid ? _GEN_3283 : _GEN_3267; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3300 = io_robCommit_1_valid ? _GEN_3284 : _GEN_3268; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3301 = io_robCommit_1_valid ? _GEN_3285 : _GEN_3269; // @[src/main/scala/memory/StoreQueue.scala 316:33]
  wire  _GEN_3302 = 4'h0 == io_robCommit_2_sqIdx | _GEN_3286; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3303 = 4'h1 == io_robCommit_2_sqIdx | _GEN_3287; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3304 = 4'h2 == io_robCommit_2_sqIdx | _GEN_3288; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3305 = 4'h3 == io_robCommit_2_sqIdx | _GEN_3289; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3306 = 4'h4 == io_robCommit_2_sqIdx | _GEN_3290; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3307 = 4'h5 == io_robCommit_2_sqIdx | _GEN_3291; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3308 = 4'h6 == io_robCommit_2_sqIdx | _GEN_3292; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3309 = 4'h7 == io_robCommit_2_sqIdx | _GEN_3293; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3310 = 4'h8 == io_robCommit_2_sqIdx | _GEN_3294; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3311 = 4'h9 == io_robCommit_2_sqIdx | _GEN_3295; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3312 = 4'ha == io_robCommit_2_sqIdx | _GEN_3296; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3313 = 4'hb == io_robCommit_2_sqIdx | _GEN_3297; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3314 = 4'hc == io_robCommit_2_sqIdx | _GEN_3298; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3315 = 4'hd == io_robCommit_2_sqIdx | _GEN_3299; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3316 = 4'he == io_robCommit_2_sqIdx | _GEN_3300; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3317 = 4'hf == io_robCommit_2_sqIdx | _GEN_3301; // @[src/main/scala/memory/StoreQueue.scala 318:{30,30}]
  wire  _GEN_3351 = 4'h1 == idx ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3352 = 4'h2 == idx ? entries_2_committed : _GEN_3351; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3353 = 4'h3 == idx ? entries_3_committed : _GEN_3352; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3354 = 4'h4 == idx ? entries_4_committed : _GEN_3353; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3355 = 4'h5 == idx ? entries_5_committed : _GEN_3354; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3356 = 4'h6 == idx ? entries_6_committed : _GEN_3355; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3357 = 4'h7 == idx ? entries_7_committed : _GEN_3356; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3358 = 4'h8 == idx ? entries_8_committed : _GEN_3357; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3359 = 4'h9 == idx ? entries_9_committed : _GEN_3358; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3360 = 4'ha == idx ? entries_10_committed : _GEN_3359; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3361 = 4'hb == idx ? entries_11_committed : _GEN_3360; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3362 = 4'hc == idx ? entries_12_committed : _GEN_3361; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3363 = 4'hd == idx ? entries_13_committed : _GEN_3362; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3364 = 4'he == idx ? entries_14_committed : _GEN_3363; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3365 = 4'hf == idx ? entries_15_committed : _GEN_3364; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3367 = 4'h1 == idx ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3368 = 4'h2 == idx ? entries_2_excpVec : _GEN_3367; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3369 = 4'h3 == idx ? entries_3_excpVec : _GEN_3368; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3370 = 4'h4 == idx ? entries_4_excpVec : _GEN_3369; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3371 = 4'h5 == idx ? entries_5_excpVec : _GEN_3370; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3372 = 4'h6 == idx ? entries_6_excpVec : _GEN_3371; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3373 = 4'h7 == idx ? entries_7_excpVec : _GEN_3372; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3374 = 4'h8 == idx ? entries_8_excpVec : _GEN_3373; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3375 = 4'h9 == idx ? entries_9_excpVec : _GEN_3374; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3376 = 4'ha == idx ? entries_10_excpVec : _GEN_3375; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3377 = 4'hb == idx ? entries_11_excpVec : _GEN_3376; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3378 = 4'hc == idx ? entries_12_excpVec : _GEN_3377; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3379 = 4'hd == idx ? entries_13_excpVec : _GEN_3378; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3380 = 4'he == idx ? entries_14_excpVec : _GEN_3379; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3381 = 4'hf == idx ? entries_15_excpVec : _GEN_3380; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3383 = 4'h1 == idx ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3384 = 4'h2 == idx ? entries_2_dcacheIssued : _GEN_3383; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3385 = 4'h3 == idx ? entries_3_dcacheIssued : _GEN_3384; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3386 = 4'h4 == idx ? entries_4_dcacheIssued : _GEN_3385; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3387 = 4'h5 == idx ? entries_5_dcacheIssued : _GEN_3386; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3388 = 4'h6 == idx ? entries_6_dcacheIssued : _GEN_3387; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3389 = 4'h7 == idx ? entries_7_dcacheIssued : _GEN_3388; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3390 = 4'h8 == idx ? entries_8_dcacheIssued : _GEN_3389; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3391 = 4'h9 == idx ? entries_9_dcacheIssued : _GEN_3390; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3392 = 4'ha == idx ? entries_10_dcacheIssued : _GEN_3391; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3393 = 4'hb == idx ? entries_11_dcacheIssued : _GEN_3392; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3394 = 4'hc == idx ? entries_12_dcacheIssued : _GEN_3393; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3395 = 4'hd == idx ? entries_13_dcacheIssued : _GEN_3394; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3396 = 4'he == idx ? entries_14_dcacheIssued : _GEN_3395; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3397 = 4'hf == idx ? entries_15_dcacheIssued : _GEN_3396; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_0 = _GEN_865 & _GEN_3365 & ~(|_GEN_3381) & ~_GEN_3397; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3415 = 4'h1 == idx_1 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3416 = 4'h2 == idx_1 ? entries_2_committed : _GEN_3415; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3417 = 4'h3 == idx_1 ? entries_3_committed : _GEN_3416; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3418 = 4'h4 == idx_1 ? entries_4_committed : _GEN_3417; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3419 = 4'h5 == idx_1 ? entries_5_committed : _GEN_3418; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3420 = 4'h6 == idx_1 ? entries_6_committed : _GEN_3419; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3421 = 4'h7 == idx_1 ? entries_7_committed : _GEN_3420; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3422 = 4'h8 == idx_1 ? entries_8_committed : _GEN_3421; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3423 = 4'h9 == idx_1 ? entries_9_committed : _GEN_3422; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3424 = 4'ha == idx_1 ? entries_10_committed : _GEN_3423; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3425 = 4'hb == idx_1 ? entries_11_committed : _GEN_3424; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3426 = 4'hc == idx_1 ? entries_12_committed : _GEN_3425; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3427 = 4'hd == idx_1 ? entries_13_committed : _GEN_3426; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3428 = 4'he == idx_1 ? entries_14_committed : _GEN_3427; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3429 = 4'hf == idx_1 ? entries_15_committed : _GEN_3428; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3431 = 4'h1 == idx_1 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3432 = 4'h2 == idx_1 ? entries_2_excpVec : _GEN_3431; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3433 = 4'h3 == idx_1 ? entries_3_excpVec : _GEN_3432; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3434 = 4'h4 == idx_1 ? entries_4_excpVec : _GEN_3433; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3435 = 4'h5 == idx_1 ? entries_5_excpVec : _GEN_3434; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3436 = 4'h6 == idx_1 ? entries_6_excpVec : _GEN_3435; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3437 = 4'h7 == idx_1 ? entries_7_excpVec : _GEN_3436; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3438 = 4'h8 == idx_1 ? entries_8_excpVec : _GEN_3437; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3439 = 4'h9 == idx_1 ? entries_9_excpVec : _GEN_3438; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3440 = 4'ha == idx_1 ? entries_10_excpVec : _GEN_3439; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3441 = 4'hb == idx_1 ? entries_11_excpVec : _GEN_3440; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3442 = 4'hc == idx_1 ? entries_12_excpVec : _GEN_3441; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3443 = 4'hd == idx_1 ? entries_13_excpVec : _GEN_3442; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3444 = 4'he == idx_1 ? entries_14_excpVec : _GEN_3443; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3445 = 4'hf == idx_1 ? entries_15_excpVec : _GEN_3444; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3447 = 4'h1 == idx_1 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3448 = 4'h2 == idx_1 ? entries_2_dcacheIssued : _GEN_3447; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3449 = 4'h3 == idx_1 ? entries_3_dcacheIssued : _GEN_3448; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3450 = 4'h4 == idx_1 ? entries_4_dcacheIssued : _GEN_3449; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3451 = 4'h5 == idx_1 ? entries_5_dcacheIssued : _GEN_3450; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3452 = 4'h6 == idx_1 ? entries_6_dcacheIssued : _GEN_3451; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3453 = 4'h7 == idx_1 ? entries_7_dcacheIssued : _GEN_3452; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3454 = 4'h8 == idx_1 ? entries_8_dcacheIssued : _GEN_3453; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3455 = 4'h9 == idx_1 ? entries_9_dcacheIssued : _GEN_3454; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3456 = 4'ha == idx_1 ? entries_10_dcacheIssued : _GEN_3455; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3457 = 4'hb == idx_1 ? entries_11_dcacheIssued : _GEN_3456; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3458 = 4'hc == idx_1 ? entries_12_dcacheIssued : _GEN_3457; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3459 = 4'hd == idx_1 ? entries_13_dcacheIssued : _GEN_3458; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3460 = 4'he == idx_1 ? entries_14_dcacheIssued : _GEN_3459; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3461 = 4'hf == idx_1 ? entries_15_dcacheIssued : _GEN_3460; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_1 = _GEN_913 & _GEN_3429 & ~(|_GEN_3445) & ~_GEN_3461; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3479 = 4'h1 == idx_2 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3480 = 4'h2 == idx_2 ? entries_2_committed : _GEN_3479; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3481 = 4'h3 == idx_2 ? entries_3_committed : _GEN_3480; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3482 = 4'h4 == idx_2 ? entries_4_committed : _GEN_3481; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3483 = 4'h5 == idx_2 ? entries_5_committed : _GEN_3482; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3484 = 4'h6 == idx_2 ? entries_6_committed : _GEN_3483; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3485 = 4'h7 == idx_2 ? entries_7_committed : _GEN_3484; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3486 = 4'h8 == idx_2 ? entries_8_committed : _GEN_3485; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3487 = 4'h9 == idx_2 ? entries_9_committed : _GEN_3486; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3488 = 4'ha == idx_2 ? entries_10_committed : _GEN_3487; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3489 = 4'hb == idx_2 ? entries_11_committed : _GEN_3488; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3490 = 4'hc == idx_2 ? entries_12_committed : _GEN_3489; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3491 = 4'hd == idx_2 ? entries_13_committed : _GEN_3490; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3492 = 4'he == idx_2 ? entries_14_committed : _GEN_3491; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3493 = 4'hf == idx_2 ? entries_15_committed : _GEN_3492; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3495 = 4'h1 == idx_2 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3496 = 4'h2 == idx_2 ? entries_2_excpVec : _GEN_3495; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3497 = 4'h3 == idx_2 ? entries_3_excpVec : _GEN_3496; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3498 = 4'h4 == idx_2 ? entries_4_excpVec : _GEN_3497; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3499 = 4'h5 == idx_2 ? entries_5_excpVec : _GEN_3498; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3500 = 4'h6 == idx_2 ? entries_6_excpVec : _GEN_3499; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3501 = 4'h7 == idx_2 ? entries_7_excpVec : _GEN_3500; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3502 = 4'h8 == idx_2 ? entries_8_excpVec : _GEN_3501; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3503 = 4'h9 == idx_2 ? entries_9_excpVec : _GEN_3502; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3504 = 4'ha == idx_2 ? entries_10_excpVec : _GEN_3503; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3505 = 4'hb == idx_2 ? entries_11_excpVec : _GEN_3504; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3506 = 4'hc == idx_2 ? entries_12_excpVec : _GEN_3505; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3507 = 4'hd == idx_2 ? entries_13_excpVec : _GEN_3506; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3508 = 4'he == idx_2 ? entries_14_excpVec : _GEN_3507; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3509 = 4'hf == idx_2 ? entries_15_excpVec : _GEN_3508; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3511 = 4'h1 == idx_2 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3512 = 4'h2 == idx_2 ? entries_2_dcacheIssued : _GEN_3511; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3513 = 4'h3 == idx_2 ? entries_3_dcacheIssued : _GEN_3512; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3514 = 4'h4 == idx_2 ? entries_4_dcacheIssued : _GEN_3513; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3515 = 4'h5 == idx_2 ? entries_5_dcacheIssued : _GEN_3514; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3516 = 4'h6 == idx_2 ? entries_6_dcacheIssued : _GEN_3515; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3517 = 4'h7 == idx_2 ? entries_7_dcacheIssued : _GEN_3516; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3518 = 4'h8 == idx_2 ? entries_8_dcacheIssued : _GEN_3517; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3519 = 4'h9 == idx_2 ? entries_9_dcacheIssued : _GEN_3518; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3520 = 4'ha == idx_2 ? entries_10_dcacheIssued : _GEN_3519; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3521 = 4'hb == idx_2 ? entries_11_dcacheIssued : _GEN_3520; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3522 = 4'hc == idx_2 ? entries_12_dcacheIssued : _GEN_3521; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3523 = 4'hd == idx_2 ? entries_13_dcacheIssued : _GEN_3522; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3524 = 4'he == idx_2 ? entries_14_dcacheIssued : _GEN_3523; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3525 = 4'hf == idx_2 ? entries_15_dcacheIssued : _GEN_3524; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_2 = _GEN_961 & _GEN_3493 & ~(|_GEN_3509) & ~_GEN_3525; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3543 = 4'h1 == idx_3 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3544 = 4'h2 == idx_3 ? entries_2_committed : _GEN_3543; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3545 = 4'h3 == idx_3 ? entries_3_committed : _GEN_3544; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3546 = 4'h4 == idx_3 ? entries_4_committed : _GEN_3545; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3547 = 4'h5 == idx_3 ? entries_5_committed : _GEN_3546; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3548 = 4'h6 == idx_3 ? entries_6_committed : _GEN_3547; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3549 = 4'h7 == idx_3 ? entries_7_committed : _GEN_3548; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3550 = 4'h8 == idx_3 ? entries_8_committed : _GEN_3549; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3551 = 4'h9 == idx_3 ? entries_9_committed : _GEN_3550; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3552 = 4'ha == idx_3 ? entries_10_committed : _GEN_3551; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3553 = 4'hb == idx_3 ? entries_11_committed : _GEN_3552; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3554 = 4'hc == idx_3 ? entries_12_committed : _GEN_3553; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3555 = 4'hd == idx_3 ? entries_13_committed : _GEN_3554; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3556 = 4'he == idx_3 ? entries_14_committed : _GEN_3555; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3557 = 4'hf == idx_3 ? entries_15_committed : _GEN_3556; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3559 = 4'h1 == idx_3 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3560 = 4'h2 == idx_3 ? entries_2_excpVec : _GEN_3559; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3561 = 4'h3 == idx_3 ? entries_3_excpVec : _GEN_3560; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3562 = 4'h4 == idx_3 ? entries_4_excpVec : _GEN_3561; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3563 = 4'h5 == idx_3 ? entries_5_excpVec : _GEN_3562; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3564 = 4'h6 == idx_3 ? entries_6_excpVec : _GEN_3563; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3565 = 4'h7 == idx_3 ? entries_7_excpVec : _GEN_3564; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3566 = 4'h8 == idx_3 ? entries_8_excpVec : _GEN_3565; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3567 = 4'h9 == idx_3 ? entries_9_excpVec : _GEN_3566; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3568 = 4'ha == idx_3 ? entries_10_excpVec : _GEN_3567; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3569 = 4'hb == idx_3 ? entries_11_excpVec : _GEN_3568; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3570 = 4'hc == idx_3 ? entries_12_excpVec : _GEN_3569; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3571 = 4'hd == idx_3 ? entries_13_excpVec : _GEN_3570; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3572 = 4'he == idx_3 ? entries_14_excpVec : _GEN_3571; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3573 = 4'hf == idx_3 ? entries_15_excpVec : _GEN_3572; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3575 = 4'h1 == idx_3 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3576 = 4'h2 == idx_3 ? entries_2_dcacheIssued : _GEN_3575; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3577 = 4'h3 == idx_3 ? entries_3_dcacheIssued : _GEN_3576; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3578 = 4'h4 == idx_3 ? entries_4_dcacheIssued : _GEN_3577; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3579 = 4'h5 == idx_3 ? entries_5_dcacheIssued : _GEN_3578; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3580 = 4'h6 == idx_3 ? entries_6_dcacheIssued : _GEN_3579; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3581 = 4'h7 == idx_3 ? entries_7_dcacheIssued : _GEN_3580; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3582 = 4'h8 == idx_3 ? entries_8_dcacheIssued : _GEN_3581; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3583 = 4'h9 == idx_3 ? entries_9_dcacheIssued : _GEN_3582; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3584 = 4'ha == idx_3 ? entries_10_dcacheIssued : _GEN_3583; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3585 = 4'hb == idx_3 ? entries_11_dcacheIssued : _GEN_3584; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3586 = 4'hc == idx_3 ? entries_12_dcacheIssued : _GEN_3585; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3587 = 4'hd == idx_3 ? entries_13_dcacheIssued : _GEN_3586; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3588 = 4'he == idx_3 ? entries_14_dcacheIssued : _GEN_3587; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3589 = 4'hf == idx_3 ? entries_15_dcacheIssued : _GEN_3588; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_3 = _GEN_1009 & _GEN_3557 & ~(|_GEN_3573) & ~_GEN_3589; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3607 = 4'h1 == idx_4 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3608 = 4'h2 == idx_4 ? entries_2_committed : _GEN_3607; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3609 = 4'h3 == idx_4 ? entries_3_committed : _GEN_3608; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3610 = 4'h4 == idx_4 ? entries_4_committed : _GEN_3609; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3611 = 4'h5 == idx_4 ? entries_5_committed : _GEN_3610; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3612 = 4'h6 == idx_4 ? entries_6_committed : _GEN_3611; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3613 = 4'h7 == idx_4 ? entries_7_committed : _GEN_3612; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3614 = 4'h8 == idx_4 ? entries_8_committed : _GEN_3613; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3615 = 4'h9 == idx_4 ? entries_9_committed : _GEN_3614; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3616 = 4'ha == idx_4 ? entries_10_committed : _GEN_3615; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3617 = 4'hb == idx_4 ? entries_11_committed : _GEN_3616; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3618 = 4'hc == idx_4 ? entries_12_committed : _GEN_3617; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3619 = 4'hd == idx_4 ? entries_13_committed : _GEN_3618; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3620 = 4'he == idx_4 ? entries_14_committed : _GEN_3619; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3621 = 4'hf == idx_4 ? entries_15_committed : _GEN_3620; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3623 = 4'h1 == idx_4 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3624 = 4'h2 == idx_4 ? entries_2_excpVec : _GEN_3623; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3625 = 4'h3 == idx_4 ? entries_3_excpVec : _GEN_3624; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3626 = 4'h4 == idx_4 ? entries_4_excpVec : _GEN_3625; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3627 = 4'h5 == idx_4 ? entries_5_excpVec : _GEN_3626; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3628 = 4'h6 == idx_4 ? entries_6_excpVec : _GEN_3627; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3629 = 4'h7 == idx_4 ? entries_7_excpVec : _GEN_3628; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3630 = 4'h8 == idx_4 ? entries_8_excpVec : _GEN_3629; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3631 = 4'h9 == idx_4 ? entries_9_excpVec : _GEN_3630; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3632 = 4'ha == idx_4 ? entries_10_excpVec : _GEN_3631; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3633 = 4'hb == idx_4 ? entries_11_excpVec : _GEN_3632; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3634 = 4'hc == idx_4 ? entries_12_excpVec : _GEN_3633; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3635 = 4'hd == idx_4 ? entries_13_excpVec : _GEN_3634; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3636 = 4'he == idx_4 ? entries_14_excpVec : _GEN_3635; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3637 = 4'hf == idx_4 ? entries_15_excpVec : _GEN_3636; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3639 = 4'h1 == idx_4 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3640 = 4'h2 == idx_4 ? entries_2_dcacheIssued : _GEN_3639; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3641 = 4'h3 == idx_4 ? entries_3_dcacheIssued : _GEN_3640; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3642 = 4'h4 == idx_4 ? entries_4_dcacheIssued : _GEN_3641; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3643 = 4'h5 == idx_4 ? entries_5_dcacheIssued : _GEN_3642; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3644 = 4'h6 == idx_4 ? entries_6_dcacheIssued : _GEN_3643; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3645 = 4'h7 == idx_4 ? entries_7_dcacheIssued : _GEN_3644; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3646 = 4'h8 == idx_4 ? entries_8_dcacheIssued : _GEN_3645; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3647 = 4'h9 == idx_4 ? entries_9_dcacheIssued : _GEN_3646; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3648 = 4'ha == idx_4 ? entries_10_dcacheIssued : _GEN_3647; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3649 = 4'hb == idx_4 ? entries_11_dcacheIssued : _GEN_3648; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3650 = 4'hc == idx_4 ? entries_12_dcacheIssued : _GEN_3649; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3651 = 4'hd == idx_4 ? entries_13_dcacheIssued : _GEN_3650; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3652 = 4'he == idx_4 ? entries_14_dcacheIssued : _GEN_3651; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3653 = 4'hf == idx_4 ? entries_15_dcacheIssued : _GEN_3652; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_4 = _GEN_1057 & _GEN_3621 & ~(|_GEN_3637) & ~_GEN_3653; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3671 = 4'h1 == idx_5 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3672 = 4'h2 == idx_5 ? entries_2_committed : _GEN_3671; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3673 = 4'h3 == idx_5 ? entries_3_committed : _GEN_3672; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3674 = 4'h4 == idx_5 ? entries_4_committed : _GEN_3673; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3675 = 4'h5 == idx_5 ? entries_5_committed : _GEN_3674; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3676 = 4'h6 == idx_5 ? entries_6_committed : _GEN_3675; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3677 = 4'h7 == idx_5 ? entries_7_committed : _GEN_3676; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3678 = 4'h8 == idx_5 ? entries_8_committed : _GEN_3677; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3679 = 4'h9 == idx_5 ? entries_9_committed : _GEN_3678; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3680 = 4'ha == idx_5 ? entries_10_committed : _GEN_3679; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3681 = 4'hb == idx_5 ? entries_11_committed : _GEN_3680; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3682 = 4'hc == idx_5 ? entries_12_committed : _GEN_3681; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3683 = 4'hd == idx_5 ? entries_13_committed : _GEN_3682; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3684 = 4'he == idx_5 ? entries_14_committed : _GEN_3683; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3685 = 4'hf == idx_5 ? entries_15_committed : _GEN_3684; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3687 = 4'h1 == idx_5 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3688 = 4'h2 == idx_5 ? entries_2_excpVec : _GEN_3687; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3689 = 4'h3 == idx_5 ? entries_3_excpVec : _GEN_3688; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3690 = 4'h4 == idx_5 ? entries_4_excpVec : _GEN_3689; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3691 = 4'h5 == idx_5 ? entries_5_excpVec : _GEN_3690; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3692 = 4'h6 == idx_5 ? entries_6_excpVec : _GEN_3691; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3693 = 4'h7 == idx_5 ? entries_7_excpVec : _GEN_3692; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3694 = 4'h8 == idx_5 ? entries_8_excpVec : _GEN_3693; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3695 = 4'h9 == idx_5 ? entries_9_excpVec : _GEN_3694; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3696 = 4'ha == idx_5 ? entries_10_excpVec : _GEN_3695; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3697 = 4'hb == idx_5 ? entries_11_excpVec : _GEN_3696; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3698 = 4'hc == idx_5 ? entries_12_excpVec : _GEN_3697; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3699 = 4'hd == idx_5 ? entries_13_excpVec : _GEN_3698; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3700 = 4'he == idx_5 ? entries_14_excpVec : _GEN_3699; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3701 = 4'hf == idx_5 ? entries_15_excpVec : _GEN_3700; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3703 = 4'h1 == idx_5 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3704 = 4'h2 == idx_5 ? entries_2_dcacheIssued : _GEN_3703; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3705 = 4'h3 == idx_5 ? entries_3_dcacheIssued : _GEN_3704; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3706 = 4'h4 == idx_5 ? entries_4_dcacheIssued : _GEN_3705; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3707 = 4'h5 == idx_5 ? entries_5_dcacheIssued : _GEN_3706; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3708 = 4'h6 == idx_5 ? entries_6_dcacheIssued : _GEN_3707; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3709 = 4'h7 == idx_5 ? entries_7_dcacheIssued : _GEN_3708; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3710 = 4'h8 == idx_5 ? entries_8_dcacheIssued : _GEN_3709; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3711 = 4'h9 == idx_5 ? entries_9_dcacheIssued : _GEN_3710; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3712 = 4'ha == idx_5 ? entries_10_dcacheIssued : _GEN_3711; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3713 = 4'hb == idx_5 ? entries_11_dcacheIssued : _GEN_3712; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3714 = 4'hc == idx_5 ? entries_12_dcacheIssued : _GEN_3713; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3715 = 4'hd == idx_5 ? entries_13_dcacheIssued : _GEN_3714; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3716 = 4'he == idx_5 ? entries_14_dcacheIssued : _GEN_3715; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3717 = 4'hf == idx_5 ? entries_15_dcacheIssued : _GEN_3716; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_5 = _GEN_1105 & _GEN_3685 & ~(|_GEN_3701) & ~_GEN_3717; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3735 = 4'h1 == idx_6 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3736 = 4'h2 == idx_6 ? entries_2_committed : _GEN_3735; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3737 = 4'h3 == idx_6 ? entries_3_committed : _GEN_3736; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3738 = 4'h4 == idx_6 ? entries_4_committed : _GEN_3737; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3739 = 4'h5 == idx_6 ? entries_5_committed : _GEN_3738; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3740 = 4'h6 == idx_6 ? entries_6_committed : _GEN_3739; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3741 = 4'h7 == idx_6 ? entries_7_committed : _GEN_3740; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3742 = 4'h8 == idx_6 ? entries_8_committed : _GEN_3741; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3743 = 4'h9 == idx_6 ? entries_9_committed : _GEN_3742; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3744 = 4'ha == idx_6 ? entries_10_committed : _GEN_3743; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3745 = 4'hb == idx_6 ? entries_11_committed : _GEN_3744; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3746 = 4'hc == idx_6 ? entries_12_committed : _GEN_3745; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3747 = 4'hd == idx_6 ? entries_13_committed : _GEN_3746; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3748 = 4'he == idx_6 ? entries_14_committed : _GEN_3747; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3749 = 4'hf == idx_6 ? entries_15_committed : _GEN_3748; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3751 = 4'h1 == idx_6 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3752 = 4'h2 == idx_6 ? entries_2_excpVec : _GEN_3751; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3753 = 4'h3 == idx_6 ? entries_3_excpVec : _GEN_3752; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3754 = 4'h4 == idx_6 ? entries_4_excpVec : _GEN_3753; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3755 = 4'h5 == idx_6 ? entries_5_excpVec : _GEN_3754; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3756 = 4'h6 == idx_6 ? entries_6_excpVec : _GEN_3755; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3757 = 4'h7 == idx_6 ? entries_7_excpVec : _GEN_3756; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3758 = 4'h8 == idx_6 ? entries_8_excpVec : _GEN_3757; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3759 = 4'h9 == idx_6 ? entries_9_excpVec : _GEN_3758; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3760 = 4'ha == idx_6 ? entries_10_excpVec : _GEN_3759; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3761 = 4'hb == idx_6 ? entries_11_excpVec : _GEN_3760; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3762 = 4'hc == idx_6 ? entries_12_excpVec : _GEN_3761; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3763 = 4'hd == idx_6 ? entries_13_excpVec : _GEN_3762; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3764 = 4'he == idx_6 ? entries_14_excpVec : _GEN_3763; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3765 = 4'hf == idx_6 ? entries_15_excpVec : _GEN_3764; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3767 = 4'h1 == idx_6 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3768 = 4'h2 == idx_6 ? entries_2_dcacheIssued : _GEN_3767; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3769 = 4'h3 == idx_6 ? entries_3_dcacheIssued : _GEN_3768; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3770 = 4'h4 == idx_6 ? entries_4_dcacheIssued : _GEN_3769; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3771 = 4'h5 == idx_6 ? entries_5_dcacheIssued : _GEN_3770; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3772 = 4'h6 == idx_6 ? entries_6_dcacheIssued : _GEN_3771; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3773 = 4'h7 == idx_6 ? entries_7_dcacheIssued : _GEN_3772; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3774 = 4'h8 == idx_6 ? entries_8_dcacheIssued : _GEN_3773; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3775 = 4'h9 == idx_6 ? entries_9_dcacheIssued : _GEN_3774; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3776 = 4'ha == idx_6 ? entries_10_dcacheIssued : _GEN_3775; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3777 = 4'hb == idx_6 ? entries_11_dcacheIssued : _GEN_3776; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3778 = 4'hc == idx_6 ? entries_12_dcacheIssued : _GEN_3777; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3779 = 4'hd == idx_6 ? entries_13_dcacheIssued : _GEN_3778; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3780 = 4'he == idx_6 ? entries_14_dcacheIssued : _GEN_3779; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3781 = 4'hf == idx_6 ? entries_15_dcacheIssued : _GEN_3780; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_6 = _GEN_1153 & _GEN_3749 & ~(|_GEN_3765) & ~_GEN_3781; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3799 = 4'h1 == idx_7 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3800 = 4'h2 == idx_7 ? entries_2_committed : _GEN_3799; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3801 = 4'h3 == idx_7 ? entries_3_committed : _GEN_3800; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3802 = 4'h4 == idx_7 ? entries_4_committed : _GEN_3801; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3803 = 4'h5 == idx_7 ? entries_5_committed : _GEN_3802; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3804 = 4'h6 == idx_7 ? entries_6_committed : _GEN_3803; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3805 = 4'h7 == idx_7 ? entries_7_committed : _GEN_3804; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3806 = 4'h8 == idx_7 ? entries_8_committed : _GEN_3805; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3807 = 4'h9 == idx_7 ? entries_9_committed : _GEN_3806; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3808 = 4'ha == idx_7 ? entries_10_committed : _GEN_3807; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3809 = 4'hb == idx_7 ? entries_11_committed : _GEN_3808; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3810 = 4'hc == idx_7 ? entries_12_committed : _GEN_3809; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3811 = 4'hd == idx_7 ? entries_13_committed : _GEN_3810; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3812 = 4'he == idx_7 ? entries_14_committed : _GEN_3811; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3813 = 4'hf == idx_7 ? entries_15_committed : _GEN_3812; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3815 = 4'h1 == idx_7 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3816 = 4'h2 == idx_7 ? entries_2_excpVec : _GEN_3815; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3817 = 4'h3 == idx_7 ? entries_3_excpVec : _GEN_3816; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3818 = 4'h4 == idx_7 ? entries_4_excpVec : _GEN_3817; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3819 = 4'h5 == idx_7 ? entries_5_excpVec : _GEN_3818; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3820 = 4'h6 == idx_7 ? entries_6_excpVec : _GEN_3819; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3821 = 4'h7 == idx_7 ? entries_7_excpVec : _GEN_3820; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3822 = 4'h8 == idx_7 ? entries_8_excpVec : _GEN_3821; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3823 = 4'h9 == idx_7 ? entries_9_excpVec : _GEN_3822; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3824 = 4'ha == idx_7 ? entries_10_excpVec : _GEN_3823; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3825 = 4'hb == idx_7 ? entries_11_excpVec : _GEN_3824; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3826 = 4'hc == idx_7 ? entries_12_excpVec : _GEN_3825; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3827 = 4'hd == idx_7 ? entries_13_excpVec : _GEN_3826; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3828 = 4'he == idx_7 ? entries_14_excpVec : _GEN_3827; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3829 = 4'hf == idx_7 ? entries_15_excpVec : _GEN_3828; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3831 = 4'h1 == idx_7 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3832 = 4'h2 == idx_7 ? entries_2_dcacheIssued : _GEN_3831; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3833 = 4'h3 == idx_7 ? entries_3_dcacheIssued : _GEN_3832; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3834 = 4'h4 == idx_7 ? entries_4_dcacheIssued : _GEN_3833; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3835 = 4'h5 == idx_7 ? entries_5_dcacheIssued : _GEN_3834; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3836 = 4'h6 == idx_7 ? entries_6_dcacheIssued : _GEN_3835; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3837 = 4'h7 == idx_7 ? entries_7_dcacheIssued : _GEN_3836; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3838 = 4'h8 == idx_7 ? entries_8_dcacheIssued : _GEN_3837; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3839 = 4'h9 == idx_7 ? entries_9_dcacheIssued : _GEN_3838; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3840 = 4'ha == idx_7 ? entries_10_dcacheIssued : _GEN_3839; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3841 = 4'hb == idx_7 ? entries_11_dcacheIssued : _GEN_3840; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3842 = 4'hc == idx_7 ? entries_12_dcacheIssued : _GEN_3841; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3843 = 4'hd == idx_7 ? entries_13_dcacheIssued : _GEN_3842; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3844 = 4'he == idx_7 ? entries_14_dcacheIssued : _GEN_3843; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3845 = 4'hf == idx_7 ? entries_15_dcacheIssued : _GEN_3844; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_7 = _GEN_1201 & _GEN_3813 & ~(|_GEN_3829) & ~_GEN_3845; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3863 = 4'h1 == idx_8 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3864 = 4'h2 == idx_8 ? entries_2_committed : _GEN_3863; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3865 = 4'h3 == idx_8 ? entries_3_committed : _GEN_3864; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3866 = 4'h4 == idx_8 ? entries_4_committed : _GEN_3865; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3867 = 4'h5 == idx_8 ? entries_5_committed : _GEN_3866; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3868 = 4'h6 == idx_8 ? entries_6_committed : _GEN_3867; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3869 = 4'h7 == idx_8 ? entries_7_committed : _GEN_3868; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3870 = 4'h8 == idx_8 ? entries_8_committed : _GEN_3869; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3871 = 4'h9 == idx_8 ? entries_9_committed : _GEN_3870; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3872 = 4'ha == idx_8 ? entries_10_committed : _GEN_3871; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3873 = 4'hb == idx_8 ? entries_11_committed : _GEN_3872; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3874 = 4'hc == idx_8 ? entries_12_committed : _GEN_3873; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3875 = 4'hd == idx_8 ? entries_13_committed : _GEN_3874; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3876 = 4'he == idx_8 ? entries_14_committed : _GEN_3875; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3877 = 4'hf == idx_8 ? entries_15_committed : _GEN_3876; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3879 = 4'h1 == idx_8 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3880 = 4'h2 == idx_8 ? entries_2_excpVec : _GEN_3879; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3881 = 4'h3 == idx_8 ? entries_3_excpVec : _GEN_3880; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3882 = 4'h4 == idx_8 ? entries_4_excpVec : _GEN_3881; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3883 = 4'h5 == idx_8 ? entries_5_excpVec : _GEN_3882; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3884 = 4'h6 == idx_8 ? entries_6_excpVec : _GEN_3883; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3885 = 4'h7 == idx_8 ? entries_7_excpVec : _GEN_3884; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3886 = 4'h8 == idx_8 ? entries_8_excpVec : _GEN_3885; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3887 = 4'h9 == idx_8 ? entries_9_excpVec : _GEN_3886; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3888 = 4'ha == idx_8 ? entries_10_excpVec : _GEN_3887; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3889 = 4'hb == idx_8 ? entries_11_excpVec : _GEN_3888; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3890 = 4'hc == idx_8 ? entries_12_excpVec : _GEN_3889; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3891 = 4'hd == idx_8 ? entries_13_excpVec : _GEN_3890; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3892 = 4'he == idx_8 ? entries_14_excpVec : _GEN_3891; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3893 = 4'hf == idx_8 ? entries_15_excpVec : _GEN_3892; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3895 = 4'h1 == idx_8 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3896 = 4'h2 == idx_8 ? entries_2_dcacheIssued : _GEN_3895; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3897 = 4'h3 == idx_8 ? entries_3_dcacheIssued : _GEN_3896; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3898 = 4'h4 == idx_8 ? entries_4_dcacheIssued : _GEN_3897; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3899 = 4'h5 == idx_8 ? entries_5_dcacheIssued : _GEN_3898; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3900 = 4'h6 == idx_8 ? entries_6_dcacheIssued : _GEN_3899; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3901 = 4'h7 == idx_8 ? entries_7_dcacheIssued : _GEN_3900; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3902 = 4'h8 == idx_8 ? entries_8_dcacheIssued : _GEN_3901; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3903 = 4'h9 == idx_8 ? entries_9_dcacheIssued : _GEN_3902; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3904 = 4'ha == idx_8 ? entries_10_dcacheIssued : _GEN_3903; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3905 = 4'hb == idx_8 ? entries_11_dcacheIssued : _GEN_3904; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3906 = 4'hc == idx_8 ? entries_12_dcacheIssued : _GEN_3905; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3907 = 4'hd == idx_8 ? entries_13_dcacheIssued : _GEN_3906; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3908 = 4'he == idx_8 ? entries_14_dcacheIssued : _GEN_3907; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3909 = 4'hf == idx_8 ? entries_15_dcacheIssued : _GEN_3908; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_8 = _GEN_1249 & _GEN_3877 & ~(|_GEN_3893) & ~_GEN_3909; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3927 = 4'h1 == idx_9 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3928 = 4'h2 == idx_9 ? entries_2_committed : _GEN_3927; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3929 = 4'h3 == idx_9 ? entries_3_committed : _GEN_3928; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3930 = 4'h4 == idx_9 ? entries_4_committed : _GEN_3929; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3931 = 4'h5 == idx_9 ? entries_5_committed : _GEN_3930; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3932 = 4'h6 == idx_9 ? entries_6_committed : _GEN_3931; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3933 = 4'h7 == idx_9 ? entries_7_committed : _GEN_3932; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3934 = 4'h8 == idx_9 ? entries_8_committed : _GEN_3933; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3935 = 4'h9 == idx_9 ? entries_9_committed : _GEN_3934; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3936 = 4'ha == idx_9 ? entries_10_committed : _GEN_3935; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3937 = 4'hb == idx_9 ? entries_11_committed : _GEN_3936; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3938 = 4'hc == idx_9 ? entries_12_committed : _GEN_3937; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3939 = 4'hd == idx_9 ? entries_13_committed : _GEN_3938; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3940 = 4'he == idx_9 ? entries_14_committed : _GEN_3939; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3941 = 4'hf == idx_9 ? entries_15_committed : _GEN_3940; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_3943 = 4'h1 == idx_9 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3944 = 4'h2 == idx_9 ? entries_2_excpVec : _GEN_3943; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3945 = 4'h3 == idx_9 ? entries_3_excpVec : _GEN_3944; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3946 = 4'h4 == idx_9 ? entries_4_excpVec : _GEN_3945; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3947 = 4'h5 == idx_9 ? entries_5_excpVec : _GEN_3946; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3948 = 4'h6 == idx_9 ? entries_6_excpVec : _GEN_3947; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3949 = 4'h7 == idx_9 ? entries_7_excpVec : _GEN_3948; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3950 = 4'h8 == idx_9 ? entries_8_excpVec : _GEN_3949; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3951 = 4'h9 == idx_9 ? entries_9_excpVec : _GEN_3950; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3952 = 4'ha == idx_9 ? entries_10_excpVec : _GEN_3951; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3953 = 4'hb == idx_9 ? entries_11_excpVec : _GEN_3952; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3954 = 4'hc == idx_9 ? entries_12_excpVec : _GEN_3953; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3955 = 4'hd == idx_9 ? entries_13_excpVec : _GEN_3954; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3956 = 4'he == idx_9 ? entries_14_excpVec : _GEN_3955; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_3957 = 4'hf == idx_9 ? entries_15_excpVec : _GEN_3956; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_3959 = 4'h1 == idx_9 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3960 = 4'h2 == idx_9 ? entries_2_dcacheIssued : _GEN_3959; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3961 = 4'h3 == idx_9 ? entries_3_dcacheIssued : _GEN_3960; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3962 = 4'h4 == idx_9 ? entries_4_dcacheIssued : _GEN_3961; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3963 = 4'h5 == idx_9 ? entries_5_dcacheIssued : _GEN_3962; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3964 = 4'h6 == idx_9 ? entries_6_dcacheIssued : _GEN_3963; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3965 = 4'h7 == idx_9 ? entries_7_dcacheIssued : _GEN_3964; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3966 = 4'h8 == idx_9 ? entries_8_dcacheIssued : _GEN_3965; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3967 = 4'h9 == idx_9 ? entries_9_dcacheIssued : _GEN_3966; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3968 = 4'ha == idx_9 ? entries_10_dcacheIssued : _GEN_3967; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3969 = 4'hb == idx_9 ? entries_11_dcacheIssued : _GEN_3968; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3970 = 4'hc == idx_9 ? entries_12_dcacheIssued : _GEN_3969; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3971 = 4'hd == idx_9 ? entries_13_dcacheIssued : _GEN_3970; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3972 = 4'he == idx_9 ? entries_14_dcacheIssued : _GEN_3971; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_3973 = 4'hf == idx_9 ? entries_15_dcacheIssued : _GEN_3972; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_9 = _GEN_1297 & _GEN_3941 & ~(|_GEN_3957) & ~_GEN_3973; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_3991 = 4'h1 == idx_10 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3992 = 4'h2 == idx_10 ? entries_2_committed : _GEN_3991; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3993 = 4'h3 == idx_10 ? entries_3_committed : _GEN_3992; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3994 = 4'h4 == idx_10 ? entries_4_committed : _GEN_3993; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3995 = 4'h5 == idx_10 ? entries_5_committed : _GEN_3994; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3996 = 4'h6 == idx_10 ? entries_6_committed : _GEN_3995; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3997 = 4'h7 == idx_10 ? entries_7_committed : _GEN_3996; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3998 = 4'h8 == idx_10 ? entries_8_committed : _GEN_3997; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_3999 = 4'h9 == idx_10 ? entries_9_committed : _GEN_3998; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4000 = 4'ha == idx_10 ? entries_10_committed : _GEN_3999; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4001 = 4'hb == idx_10 ? entries_11_committed : _GEN_4000; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4002 = 4'hc == idx_10 ? entries_12_committed : _GEN_4001; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4003 = 4'hd == idx_10 ? entries_13_committed : _GEN_4002; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4004 = 4'he == idx_10 ? entries_14_committed : _GEN_4003; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4005 = 4'hf == idx_10 ? entries_15_committed : _GEN_4004; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4007 = 4'h1 == idx_10 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4008 = 4'h2 == idx_10 ? entries_2_excpVec : _GEN_4007; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4009 = 4'h3 == idx_10 ? entries_3_excpVec : _GEN_4008; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4010 = 4'h4 == idx_10 ? entries_4_excpVec : _GEN_4009; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4011 = 4'h5 == idx_10 ? entries_5_excpVec : _GEN_4010; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4012 = 4'h6 == idx_10 ? entries_6_excpVec : _GEN_4011; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4013 = 4'h7 == idx_10 ? entries_7_excpVec : _GEN_4012; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4014 = 4'h8 == idx_10 ? entries_8_excpVec : _GEN_4013; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4015 = 4'h9 == idx_10 ? entries_9_excpVec : _GEN_4014; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4016 = 4'ha == idx_10 ? entries_10_excpVec : _GEN_4015; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4017 = 4'hb == idx_10 ? entries_11_excpVec : _GEN_4016; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4018 = 4'hc == idx_10 ? entries_12_excpVec : _GEN_4017; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4019 = 4'hd == idx_10 ? entries_13_excpVec : _GEN_4018; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4020 = 4'he == idx_10 ? entries_14_excpVec : _GEN_4019; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4021 = 4'hf == idx_10 ? entries_15_excpVec : _GEN_4020; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4023 = 4'h1 == idx_10 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4024 = 4'h2 == idx_10 ? entries_2_dcacheIssued : _GEN_4023; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4025 = 4'h3 == idx_10 ? entries_3_dcacheIssued : _GEN_4024; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4026 = 4'h4 == idx_10 ? entries_4_dcacheIssued : _GEN_4025; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4027 = 4'h5 == idx_10 ? entries_5_dcacheIssued : _GEN_4026; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4028 = 4'h6 == idx_10 ? entries_6_dcacheIssued : _GEN_4027; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4029 = 4'h7 == idx_10 ? entries_7_dcacheIssued : _GEN_4028; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4030 = 4'h8 == idx_10 ? entries_8_dcacheIssued : _GEN_4029; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4031 = 4'h9 == idx_10 ? entries_9_dcacheIssued : _GEN_4030; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4032 = 4'ha == idx_10 ? entries_10_dcacheIssued : _GEN_4031; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4033 = 4'hb == idx_10 ? entries_11_dcacheIssued : _GEN_4032; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4034 = 4'hc == idx_10 ? entries_12_dcacheIssued : _GEN_4033; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4035 = 4'hd == idx_10 ? entries_13_dcacheIssued : _GEN_4034; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4036 = 4'he == idx_10 ? entries_14_dcacheIssued : _GEN_4035; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4037 = 4'hf == idx_10 ? entries_15_dcacheIssued : _GEN_4036; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_10 = _GEN_1345 & _GEN_4005 & ~(|_GEN_4021) & ~_GEN_4037; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_4055 = 4'h1 == idx_11 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4056 = 4'h2 == idx_11 ? entries_2_committed : _GEN_4055; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4057 = 4'h3 == idx_11 ? entries_3_committed : _GEN_4056; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4058 = 4'h4 == idx_11 ? entries_4_committed : _GEN_4057; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4059 = 4'h5 == idx_11 ? entries_5_committed : _GEN_4058; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4060 = 4'h6 == idx_11 ? entries_6_committed : _GEN_4059; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4061 = 4'h7 == idx_11 ? entries_7_committed : _GEN_4060; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4062 = 4'h8 == idx_11 ? entries_8_committed : _GEN_4061; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4063 = 4'h9 == idx_11 ? entries_9_committed : _GEN_4062; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4064 = 4'ha == idx_11 ? entries_10_committed : _GEN_4063; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4065 = 4'hb == idx_11 ? entries_11_committed : _GEN_4064; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4066 = 4'hc == idx_11 ? entries_12_committed : _GEN_4065; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4067 = 4'hd == idx_11 ? entries_13_committed : _GEN_4066; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4068 = 4'he == idx_11 ? entries_14_committed : _GEN_4067; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4069 = 4'hf == idx_11 ? entries_15_committed : _GEN_4068; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4071 = 4'h1 == idx_11 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4072 = 4'h2 == idx_11 ? entries_2_excpVec : _GEN_4071; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4073 = 4'h3 == idx_11 ? entries_3_excpVec : _GEN_4072; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4074 = 4'h4 == idx_11 ? entries_4_excpVec : _GEN_4073; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4075 = 4'h5 == idx_11 ? entries_5_excpVec : _GEN_4074; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4076 = 4'h6 == idx_11 ? entries_6_excpVec : _GEN_4075; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4077 = 4'h7 == idx_11 ? entries_7_excpVec : _GEN_4076; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4078 = 4'h8 == idx_11 ? entries_8_excpVec : _GEN_4077; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4079 = 4'h9 == idx_11 ? entries_9_excpVec : _GEN_4078; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4080 = 4'ha == idx_11 ? entries_10_excpVec : _GEN_4079; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4081 = 4'hb == idx_11 ? entries_11_excpVec : _GEN_4080; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4082 = 4'hc == idx_11 ? entries_12_excpVec : _GEN_4081; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4083 = 4'hd == idx_11 ? entries_13_excpVec : _GEN_4082; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4084 = 4'he == idx_11 ? entries_14_excpVec : _GEN_4083; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4085 = 4'hf == idx_11 ? entries_15_excpVec : _GEN_4084; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4087 = 4'h1 == idx_11 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4088 = 4'h2 == idx_11 ? entries_2_dcacheIssued : _GEN_4087; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4089 = 4'h3 == idx_11 ? entries_3_dcacheIssued : _GEN_4088; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4090 = 4'h4 == idx_11 ? entries_4_dcacheIssued : _GEN_4089; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4091 = 4'h5 == idx_11 ? entries_5_dcacheIssued : _GEN_4090; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4092 = 4'h6 == idx_11 ? entries_6_dcacheIssued : _GEN_4091; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4093 = 4'h7 == idx_11 ? entries_7_dcacheIssued : _GEN_4092; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4094 = 4'h8 == idx_11 ? entries_8_dcacheIssued : _GEN_4093; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4095 = 4'h9 == idx_11 ? entries_9_dcacheIssued : _GEN_4094; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4096 = 4'ha == idx_11 ? entries_10_dcacheIssued : _GEN_4095; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4097 = 4'hb == idx_11 ? entries_11_dcacheIssued : _GEN_4096; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4098 = 4'hc == idx_11 ? entries_12_dcacheIssued : _GEN_4097; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4099 = 4'hd == idx_11 ? entries_13_dcacheIssued : _GEN_4098; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4100 = 4'he == idx_11 ? entries_14_dcacheIssued : _GEN_4099; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4101 = 4'hf == idx_11 ? entries_15_dcacheIssued : _GEN_4100; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_11 = _GEN_1393 & _GEN_4069 & ~(|_GEN_4085) & ~_GEN_4101; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_4119 = 4'h1 == idx_12 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4120 = 4'h2 == idx_12 ? entries_2_committed : _GEN_4119; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4121 = 4'h3 == idx_12 ? entries_3_committed : _GEN_4120; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4122 = 4'h4 == idx_12 ? entries_4_committed : _GEN_4121; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4123 = 4'h5 == idx_12 ? entries_5_committed : _GEN_4122; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4124 = 4'h6 == idx_12 ? entries_6_committed : _GEN_4123; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4125 = 4'h7 == idx_12 ? entries_7_committed : _GEN_4124; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4126 = 4'h8 == idx_12 ? entries_8_committed : _GEN_4125; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4127 = 4'h9 == idx_12 ? entries_9_committed : _GEN_4126; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4128 = 4'ha == idx_12 ? entries_10_committed : _GEN_4127; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4129 = 4'hb == idx_12 ? entries_11_committed : _GEN_4128; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4130 = 4'hc == idx_12 ? entries_12_committed : _GEN_4129; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4131 = 4'hd == idx_12 ? entries_13_committed : _GEN_4130; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4132 = 4'he == idx_12 ? entries_14_committed : _GEN_4131; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4133 = 4'hf == idx_12 ? entries_15_committed : _GEN_4132; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4135 = 4'h1 == idx_12 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4136 = 4'h2 == idx_12 ? entries_2_excpVec : _GEN_4135; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4137 = 4'h3 == idx_12 ? entries_3_excpVec : _GEN_4136; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4138 = 4'h4 == idx_12 ? entries_4_excpVec : _GEN_4137; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4139 = 4'h5 == idx_12 ? entries_5_excpVec : _GEN_4138; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4140 = 4'h6 == idx_12 ? entries_6_excpVec : _GEN_4139; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4141 = 4'h7 == idx_12 ? entries_7_excpVec : _GEN_4140; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4142 = 4'h8 == idx_12 ? entries_8_excpVec : _GEN_4141; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4143 = 4'h9 == idx_12 ? entries_9_excpVec : _GEN_4142; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4144 = 4'ha == idx_12 ? entries_10_excpVec : _GEN_4143; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4145 = 4'hb == idx_12 ? entries_11_excpVec : _GEN_4144; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4146 = 4'hc == idx_12 ? entries_12_excpVec : _GEN_4145; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4147 = 4'hd == idx_12 ? entries_13_excpVec : _GEN_4146; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4148 = 4'he == idx_12 ? entries_14_excpVec : _GEN_4147; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4149 = 4'hf == idx_12 ? entries_15_excpVec : _GEN_4148; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4151 = 4'h1 == idx_12 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4152 = 4'h2 == idx_12 ? entries_2_dcacheIssued : _GEN_4151; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4153 = 4'h3 == idx_12 ? entries_3_dcacheIssued : _GEN_4152; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4154 = 4'h4 == idx_12 ? entries_4_dcacheIssued : _GEN_4153; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4155 = 4'h5 == idx_12 ? entries_5_dcacheIssued : _GEN_4154; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4156 = 4'h6 == idx_12 ? entries_6_dcacheIssued : _GEN_4155; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4157 = 4'h7 == idx_12 ? entries_7_dcacheIssued : _GEN_4156; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4158 = 4'h8 == idx_12 ? entries_8_dcacheIssued : _GEN_4157; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4159 = 4'h9 == idx_12 ? entries_9_dcacheIssued : _GEN_4158; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4160 = 4'ha == idx_12 ? entries_10_dcacheIssued : _GEN_4159; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4161 = 4'hb == idx_12 ? entries_11_dcacheIssued : _GEN_4160; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4162 = 4'hc == idx_12 ? entries_12_dcacheIssued : _GEN_4161; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4163 = 4'hd == idx_12 ? entries_13_dcacheIssued : _GEN_4162; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4164 = 4'he == idx_12 ? entries_14_dcacheIssued : _GEN_4163; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4165 = 4'hf == idx_12 ? entries_15_dcacheIssued : _GEN_4164; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_12 = _GEN_1441 & _GEN_4133 & ~(|_GEN_4149) & ~_GEN_4165; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_4183 = 4'h1 == idx_13 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4184 = 4'h2 == idx_13 ? entries_2_committed : _GEN_4183; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4185 = 4'h3 == idx_13 ? entries_3_committed : _GEN_4184; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4186 = 4'h4 == idx_13 ? entries_4_committed : _GEN_4185; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4187 = 4'h5 == idx_13 ? entries_5_committed : _GEN_4186; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4188 = 4'h6 == idx_13 ? entries_6_committed : _GEN_4187; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4189 = 4'h7 == idx_13 ? entries_7_committed : _GEN_4188; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4190 = 4'h8 == idx_13 ? entries_8_committed : _GEN_4189; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4191 = 4'h9 == idx_13 ? entries_9_committed : _GEN_4190; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4192 = 4'ha == idx_13 ? entries_10_committed : _GEN_4191; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4193 = 4'hb == idx_13 ? entries_11_committed : _GEN_4192; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4194 = 4'hc == idx_13 ? entries_12_committed : _GEN_4193; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4195 = 4'hd == idx_13 ? entries_13_committed : _GEN_4194; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4196 = 4'he == idx_13 ? entries_14_committed : _GEN_4195; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4197 = 4'hf == idx_13 ? entries_15_committed : _GEN_4196; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4199 = 4'h1 == idx_13 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4200 = 4'h2 == idx_13 ? entries_2_excpVec : _GEN_4199; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4201 = 4'h3 == idx_13 ? entries_3_excpVec : _GEN_4200; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4202 = 4'h4 == idx_13 ? entries_4_excpVec : _GEN_4201; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4203 = 4'h5 == idx_13 ? entries_5_excpVec : _GEN_4202; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4204 = 4'h6 == idx_13 ? entries_6_excpVec : _GEN_4203; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4205 = 4'h7 == idx_13 ? entries_7_excpVec : _GEN_4204; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4206 = 4'h8 == idx_13 ? entries_8_excpVec : _GEN_4205; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4207 = 4'h9 == idx_13 ? entries_9_excpVec : _GEN_4206; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4208 = 4'ha == idx_13 ? entries_10_excpVec : _GEN_4207; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4209 = 4'hb == idx_13 ? entries_11_excpVec : _GEN_4208; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4210 = 4'hc == idx_13 ? entries_12_excpVec : _GEN_4209; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4211 = 4'hd == idx_13 ? entries_13_excpVec : _GEN_4210; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4212 = 4'he == idx_13 ? entries_14_excpVec : _GEN_4211; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4213 = 4'hf == idx_13 ? entries_15_excpVec : _GEN_4212; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4215 = 4'h1 == idx_13 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4216 = 4'h2 == idx_13 ? entries_2_dcacheIssued : _GEN_4215; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4217 = 4'h3 == idx_13 ? entries_3_dcacheIssued : _GEN_4216; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4218 = 4'h4 == idx_13 ? entries_4_dcacheIssued : _GEN_4217; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4219 = 4'h5 == idx_13 ? entries_5_dcacheIssued : _GEN_4218; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4220 = 4'h6 == idx_13 ? entries_6_dcacheIssued : _GEN_4219; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4221 = 4'h7 == idx_13 ? entries_7_dcacheIssued : _GEN_4220; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4222 = 4'h8 == idx_13 ? entries_8_dcacheIssued : _GEN_4221; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4223 = 4'h9 == idx_13 ? entries_9_dcacheIssued : _GEN_4222; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4224 = 4'ha == idx_13 ? entries_10_dcacheIssued : _GEN_4223; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4225 = 4'hb == idx_13 ? entries_11_dcacheIssued : _GEN_4224; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4226 = 4'hc == idx_13 ? entries_12_dcacheIssued : _GEN_4225; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4227 = 4'hd == idx_13 ? entries_13_dcacheIssued : _GEN_4226; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4228 = 4'he == idx_13 ? entries_14_dcacheIssued : _GEN_4227; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4229 = 4'hf == idx_13 ? entries_15_dcacheIssued : _GEN_4228; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_13 = _GEN_1489 & _GEN_4197 & ~(|_GEN_4213) & ~_GEN_4229; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_4247 = 4'h1 == idx_14 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4248 = 4'h2 == idx_14 ? entries_2_committed : _GEN_4247; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4249 = 4'h3 == idx_14 ? entries_3_committed : _GEN_4248; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4250 = 4'h4 == idx_14 ? entries_4_committed : _GEN_4249; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4251 = 4'h5 == idx_14 ? entries_5_committed : _GEN_4250; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4252 = 4'h6 == idx_14 ? entries_6_committed : _GEN_4251; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4253 = 4'h7 == idx_14 ? entries_7_committed : _GEN_4252; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4254 = 4'h8 == idx_14 ? entries_8_committed : _GEN_4253; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4255 = 4'h9 == idx_14 ? entries_9_committed : _GEN_4254; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4256 = 4'ha == idx_14 ? entries_10_committed : _GEN_4255; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4257 = 4'hb == idx_14 ? entries_11_committed : _GEN_4256; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4258 = 4'hc == idx_14 ? entries_12_committed : _GEN_4257; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4259 = 4'hd == idx_14 ? entries_13_committed : _GEN_4258; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4260 = 4'he == idx_14 ? entries_14_committed : _GEN_4259; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4261 = 4'hf == idx_14 ? entries_15_committed : _GEN_4260; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4263 = 4'h1 == idx_14 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4264 = 4'h2 == idx_14 ? entries_2_excpVec : _GEN_4263; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4265 = 4'h3 == idx_14 ? entries_3_excpVec : _GEN_4264; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4266 = 4'h4 == idx_14 ? entries_4_excpVec : _GEN_4265; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4267 = 4'h5 == idx_14 ? entries_5_excpVec : _GEN_4266; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4268 = 4'h6 == idx_14 ? entries_6_excpVec : _GEN_4267; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4269 = 4'h7 == idx_14 ? entries_7_excpVec : _GEN_4268; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4270 = 4'h8 == idx_14 ? entries_8_excpVec : _GEN_4269; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4271 = 4'h9 == idx_14 ? entries_9_excpVec : _GEN_4270; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4272 = 4'ha == idx_14 ? entries_10_excpVec : _GEN_4271; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4273 = 4'hb == idx_14 ? entries_11_excpVec : _GEN_4272; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4274 = 4'hc == idx_14 ? entries_12_excpVec : _GEN_4273; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4275 = 4'hd == idx_14 ? entries_13_excpVec : _GEN_4274; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4276 = 4'he == idx_14 ? entries_14_excpVec : _GEN_4275; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4277 = 4'hf == idx_14 ? entries_15_excpVec : _GEN_4276; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4279 = 4'h1 == idx_14 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4280 = 4'h2 == idx_14 ? entries_2_dcacheIssued : _GEN_4279; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4281 = 4'h3 == idx_14 ? entries_3_dcacheIssued : _GEN_4280; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4282 = 4'h4 == idx_14 ? entries_4_dcacheIssued : _GEN_4281; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4283 = 4'h5 == idx_14 ? entries_5_dcacheIssued : _GEN_4282; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4284 = 4'h6 == idx_14 ? entries_6_dcacheIssued : _GEN_4283; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4285 = 4'h7 == idx_14 ? entries_7_dcacheIssued : _GEN_4284; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4286 = 4'h8 == idx_14 ? entries_8_dcacheIssued : _GEN_4285; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4287 = 4'h9 == idx_14 ? entries_9_dcacheIssued : _GEN_4286; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4288 = 4'ha == idx_14 ? entries_10_dcacheIssued : _GEN_4287; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4289 = 4'hb == idx_14 ? entries_11_dcacheIssued : _GEN_4288; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4290 = 4'hc == idx_14 ? entries_12_dcacheIssued : _GEN_4289; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4291 = 4'hd == idx_14 ? entries_13_dcacheIssued : _GEN_4290; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4292 = 4'he == idx_14 ? entries_14_dcacheIssued : _GEN_4291; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4293 = 4'hf == idx_14 ? entries_15_dcacheIssued : _GEN_4292; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_14 = _GEN_1537 & _GEN_4261 & ~(|_GEN_4277) & ~_GEN_4293; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire  _GEN_4311 = 4'h1 == idx_15 ? entries_1_committed : entries_0_committed; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4312 = 4'h2 == idx_15 ? entries_2_committed : _GEN_4311; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4313 = 4'h3 == idx_15 ? entries_3_committed : _GEN_4312; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4314 = 4'h4 == idx_15 ? entries_4_committed : _GEN_4313; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4315 = 4'h5 == idx_15 ? entries_5_committed : _GEN_4314; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4316 = 4'h6 == idx_15 ? entries_6_committed : _GEN_4315; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4317 = 4'h7 == idx_15 ? entries_7_committed : _GEN_4316; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4318 = 4'h8 == idx_15 ? entries_8_committed : _GEN_4317; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4319 = 4'h9 == idx_15 ? entries_9_committed : _GEN_4318; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4320 = 4'ha == idx_15 ? entries_10_committed : _GEN_4319; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4321 = 4'hb == idx_15 ? entries_11_committed : _GEN_4320; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4322 = 4'hc == idx_15 ? entries_12_committed : _GEN_4321; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4323 = 4'hd == idx_15 ? entries_13_committed : _GEN_4322; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4324 = 4'he == idx_15 ? entries_14_committed : _GEN_4323; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire  _GEN_4325 = 4'hf == idx_15 ? entries_15_committed : _GEN_4324; // @[src/main/scala/memory/StoreQueue.scala 332:{36,36}]
  wire [9:0] _GEN_4327 = 4'h1 == idx_15 ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4328 = 4'h2 == idx_15 ? entries_2_excpVec : _GEN_4327; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4329 = 4'h3 == idx_15 ? entries_3_excpVec : _GEN_4328; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4330 = 4'h4 == idx_15 ? entries_4_excpVec : _GEN_4329; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4331 = 4'h5 == idx_15 ? entries_5_excpVec : _GEN_4330; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4332 = 4'h6 == idx_15 ? entries_6_excpVec : _GEN_4331; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4333 = 4'h7 == idx_15 ? entries_7_excpVec : _GEN_4332; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4334 = 4'h8 == idx_15 ? entries_8_excpVec : _GEN_4333; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4335 = 4'h9 == idx_15 ? entries_9_excpVec : _GEN_4334; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4336 = 4'ha == idx_15 ? entries_10_excpVec : _GEN_4335; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4337 = 4'hb == idx_15 ? entries_11_excpVec : _GEN_4336; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4338 = 4'hc == idx_15 ? entries_12_excpVec : _GEN_4337; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4339 = 4'hd == idx_15 ? entries_13_excpVec : _GEN_4338; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4340 = 4'he == idx_15 ? entries_14_excpVec : _GEN_4339; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire [9:0] _GEN_4341 = 4'hf == idx_15 ? entries_15_excpVec : _GEN_4340; // @[src/main/scala/memory/StoreQueue.scala 332:{65,65}]
  wire  _GEN_4343 = 4'h1 == idx_15 ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4344 = 4'h2 == idx_15 ? entries_2_dcacheIssued : _GEN_4343; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4345 = 4'h3 == idx_15 ? entries_3_dcacheIssued : _GEN_4344; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4346 = 4'h4 == idx_15 ? entries_4_dcacheIssued : _GEN_4345; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4347 = 4'h5 == idx_15 ? entries_5_dcacheIssued : _GEN_4346; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4348 = 4'h6 == idx_15 ? entries_6_dcacheIssued : _GEN_4347; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4349 = 4'h7 == idx_15 ? entries_7_dcacheIssued : _GEN_4348; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4350 = 4'h8 == idx_15 ? entries_8_dcacheIssued : _GEN_4349; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4351 = 4'h9 == idx_15 ? entries_9_dcacheIssued : _GEN_4350; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4352 = 4'ha == idx_15 ? entries_10_dcacheIssued : _GEN_4351; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4353 = 4'hb == idx_15 ? entries_11_dcacheIssued : _GEN_4352; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4354 = 4'hc == idx_15 ? entries_12_dcacheIssued : _GEN_4353; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4355 = 4'hd == idx_15 ? entries_13_dcacheIssued : _GEN_4354; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4356 = 4'he == idx_15 ? entries_14_dcacheIssued : _GEN_4355; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  _GEN_4357 = 4'hf == idx_15 ? entries_15_dcacheIssued : _GEN_4356; // @[src/main/scala/memory/StoreQueue.scala 332:{72,72}]
  wire  dcacheCandidates_15 = _GEN_1585 & _GEN_4325 & ~(|_GEN_4341) & ~_GEN_4357; // @[src/main/scala/memory/StoreQueue.scala 332:69]
  wire [3:0] _dcacheOffset_T = dcacheCandidates_14 ? 4'he : 4'hf; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_1 = dcacheCandidates_13 ? 4'hd : _dcacheOffset_T; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_2 = dcacheCandidates_12 ? 4'hc : _dcacheOffset_T_1; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_3 = dcacheCandidates_11 ? 4'hb : _dcacheOffset_T_2; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_4 = dcacheCandidates_10 ? 4'ha : _dcacheOffset_T_3; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_5 = dcacheCandidates_9 ? 4'h9 : _dcacheOffset_T_4; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_6 = dcacheCandidates_8 ? 4'h8 : _dcacheOffset_T_5; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_7 = dcacheCandidates_7 ? 4'h7 : _dcacheOffset_T_6; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_8 = dcacheCandidates_6 ? 4'h6 : _dcacheOffset_T_7; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_9 = dcacheCandidates_5 ? 4'h5 : _dcacheOffset_T_8; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_10 = dcacheCandidates_4 ? 4'h4 : _dcacheOffset_T_9; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_11 = dcacheCandidates_3 ? 4'h3 : _dcacheOffset_T_10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_12 = dcacheCandidates_2 ? 4'h2 : _dcacheOffset_T_11; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _dcacheOffset_T_13 = dcacheCandidates_1 ? 4'h1 : _dcacheOffset_T_12; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] dcacheOffset = dcacheCandidates_0 ? 4'h0 : _dcacheOffset_T_13; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] dcacheIdx = deqPtr_value + dcacheOffset; // @[src/main/scala/memory/StoreQueue.scala 337:42]
  wire [31:0] _GEN_4359 = 4'h1 == dcacheIdx ? entries_1_paddr : entries_0_paddr; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4360 = 4'h2 == dcacheIdx ? entries_2_paddr : _GEN_4359; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4361 = 4'h3 == dcacheIdx ? entries_3_paddr : _GEN_4360; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4362 = 4'h4 == dcacheIdx ? entries_4_paddr : _GEN_4361; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4363 = 4'h5 == dcacheIdx ? entries_5_paddr : _GEN_4362; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4364 = 4'h6 == dcacheIdx ? entries_6_paddr : _GEN_4363; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4365 = 4'h7 == dcacheIdx ? entries_7_paddr : _GEN_4364; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4366 = 4'h8 == dcacheIdx ? entries_8_paddr : _GEN_4365; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4367 = 4'h9 == dcacheIdx ? entries_9_paddr : _GEN_4366; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4368 = 4'ha == dcacheIdx ? entries_10_paddr : _GEN_4367; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4369 = 4'hb == dcacheIdx ? entries_11_paddr : _GEN_4368; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4370 = 4'hc == dcacheIdx ? entries_12_paddr : _GEN_4369; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4371 = 4'hd == dcacheIdx ? entries_13_paddr : _GEN_4370; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4372 = 4'he == dcacheIdx ? entries_14_paddr : _GEN_4371; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [31:0] _GEN_4373 = 4'hf == dcacheIdx ? entries_15_paddr : _GEN_4372; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  wire [6:0] _storeMask_T_1 = 7'h1 << _GEN_4373[1:0]; // @[src/main/scala/memory/StoreQueue.scala 341:37]
  wire [1:0] _storeMask_T_3 = {_GEN_4373[1],1'h0}; // @[src/main/scala/memory/StoreQueue.scala 342:43]
  wire [6:0] _storeMask_T_4 = 7'h3 << _storeMask_T_3; // @[src/main/scala/memory/StoreQueue.scala 342:37]
  wire [4:0] _storeMask_T_7 = 5'h10 - 5'h1; // @[src/main/scala/memory/StoreQueue.scala 343:39]
  wire [3:0] _GEN_4375 = 4'h1 == dcacheIdx ? entries_1_lsuOp : entries_0_lsuOp; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4376 = 4'h2 == dcacheIdx ? entries_2_lsuOp : _GEN_4375; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4377 = 4'h3 == dcacheIdx ? entries_3_lsuOp : _GEN_4376; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4378 = 4'h4 == dcacheIdx ? entries_4_lsuOp : _GEN_4377; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4379 = 4'h5 == dcacheIdx ? entries_5_lsuOp : _GEN_4378; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4380 = 4'h6 == dcacheIdx ? entries_6_lsuOp : _GEN_4379; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4381 = 4'h7 == dcacheIdx ? entries_7_lsuOp : _GEN_4380; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4382 = 4'h8 == dcacheIdx ? entries_8_lsuOp : _GEN_4381; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4383 = 4'h9 == dcacheIdx ? entries_9_lsuOp : _GEN_4382; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4384 = 4'ha == dcacheIdx ? entries_10_lsuOp : _GEN_4383; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4385 = 4'hb == dcacheIdx ? entries_11_lsuOp : _GEN_4384; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4386 = 4'hc == dcacheIdx ? entries_12_lsuOp : _GEN_4385; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4387 = 4'hd == dcacheIdx ? entries_13_lsuOp : _GEN_4386; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4388 = 4'he == dcacheIdx ? entries_14_lsuOp : _GEN_4387; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [3:0] _GEN_4389 = 4'hf == dcacheIdx ? entries_15_lsuOp : _GEN_4388; // @[src/main/scala/chisel3/util/Mux.scala 77:{13,13}]
  wire [6:0] _storeMask_T_9 = 4'h4 == _GEN_4389 ? _storeMask_T_1 : 7'h0; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [6:0] _storeMask_T_11 = 4'h5 == _GEN_4389 ? _storeMask_T_4 : _storeMask_T_9; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [6:0] storeMask = 4'h6 == _GEN_4389 ? {{2'd0}, _storeMask_T_7} : _storeMask_T_11; // @[src/main/scala/chisel3/util/Mux.scala 77:13]
  wire [31:0] _GEN_4391 = 4'h1 == dcacheIdx ? entries_1_data : entries_0_data; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4392 = 4'h2 == dcacheIdx ? entries_2_data : _GEN_4391; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4393 = 4'h3 == dcacheIdx ? entries_3_data : _GEN_4392; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4394 = 4'h4 == dcacheIdx ? entries_4_data : _GEN_4393; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4395 = 4'h5 == dcacheIdx ? entries_5_data : _GEN_4394; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4396 = 4'h6 == dcacheIdx ? entries_6_data : _GEN_4395; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4397 = 4'h7 == dcacheIdx ? entries_7_data : _GEN_4396; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4398 = 4'h8 == dcacheIdx ? entries_8_data : _GEN_4397; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4399 = 4'h9 == dcacheIdx ? entries_9_data : _GEN_4398; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4400 = 4'ha == dcacheIdx ? entries_10_data : _GEN_4399; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4401 = 4'hb == dcacheIdx ? entries_11_data : _GEN_4400; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4402 = 4'hc == dcacheIdx ? entries_12_data : _GEN_4401; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4403 = 4'hd == dcacheIdx ? entries_13_data : _GEN_4402; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire [31:0] _GEN_4404 = 4'he == dcacheIdx ? entries_14_data : _GEN_4403; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  wire  _T_3 = io_dcacheReq_ready & io_dcacheReq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  _GEN_4406 = 4'h0 == dcacheIdx | _GEN_544; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4407 = 4'h1 == dcacheIdx | _GEN_545; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4408 = 4'h2 == dcacheIdx | _GEN_546; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4409 = 4'h3 == dcacheIdx | _GEN_547; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4410 = 4'h4 == dcacheIdx | _GEN_548; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4411 = 4'h5 == dcacheIdx | _GEN_549; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4412 = 4'h6 == dcacheIdx | _GEN_550; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4413 = 4'h7 == dcacheIdx | _GEN_551; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4414 = 4'h8 == dcacheIdx | _GEN_552; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4415 = 4'h9 == dcacheIdx | _GEN_553; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4416 = 4'ha == dcacheIdx | _GEN_554; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4417 = 4'hb == dcacheIdx | _GEN_555; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4418 = 4'hc == dcacheIdx | _GEN_556; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4419 = 4'hd == dcacheIdx | _GEN_557; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4420 = 4'he == dcacheIdx | _GEN_558; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4421 = 4'hf == dcacheIdx | _GEN_559; // @[src/main/scala/memory/StoreQueue.scala 352:{37,37}]
  wire  _GEN_4439 = 4'h1 == deqPtr_value ? entries_1_dcacheIssued : entries_0_dcacheIssued; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4440 = 4'h2 == deqPtr_value ? entries_2_dcacheIssued : _GEN_4439; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4441 = 4'h3 == deqPtr_value ? entries_3_dcacheIssued : _GEN_4440; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4442 = 4'h4 == deqPtr_value ? entries_4_dcacheIssued : _GEN_4441; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4443 = 4'h5 == deqPtr_value ? entries_5_dcacheIssued : _GEN_4442; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4444 = 4'h6 == deqPtr_value ? entries_6_dcacheIssued : _GEN_4443; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4445 = 4'h7 == deqPtr_value ? entries_7_dcacheIssued : _GEN_4444; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4446 = 4'h8 == deqPtr_value ? entries_8_dcacheIssued : _GEN_4445; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4447 = 4'h9 == deqPtr_value ? entries_9_dcacheIssued : _GEN_4446; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4448 = 4'ha == deqPtr_value ? entries_10_dcacheIssued : _GEN_4447; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4449 = 4'hb == deqPtr_value ? entries_11_dcacheIssued : _GEN_4448; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4450 = 4'hc == deqPtr_value ? entries_12_dcacheIssued : _GEN_4449; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4451 = 4'hd == deqPtr_value ? entries_13_dcacheIssued : _GEN_4450; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4452 = 4'he == deqPtr_value ? entries_14_dcacheIssued : _GEN_4451; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  _GEN_4453 = 4'hf == deqPtr_value ? entries_15_dcacheIssued : _GEN_4452; // @[src/main/scala/memory/StoreQueue.scala 358:{50,50}]
  wire  canDeqNormal = _GEN_15 & _GEN_4453; // @[src/main/scala/memory/StoreQueue.scala 358:50]
  wire  _GEN_4455 = 4'h1 == deqPtr_value ? entries_1_writtenBack : entries_0_writtenBack; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4456 = 4'h2 == deqPtr_value ? entries_2_writtenBack : _GEN_4455; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4457 = 4'h3 == deqPtr_value ? entries_3_writtenBack : _GEN_4456; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4458 = 4'h4 == deqPtr_value ? entries_4_writtenBack : _GEN_4457; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4459 = 4'h5 == deqPtr_value ? entries_5_writtenBack : _GEN_4458; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4460 = 4'h6 == deqPtr_value ? entries_6_writtenBack : _GEN_4459; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4461 = 4'h7 == deqPtr_value ? entries_7_writtenBack : _GEN_4460; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4462 = 4'h8 == deqPtr_value ? entries_8_writtenBack : _GEN_4461; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4463 = 4'h9 == deqPtr_value ? entries_9_writtenBack : _GEN_4462; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4464 = 4'ha == deqPtr_value ? entries_10_writtenBack : _GEN_4463; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4465 = 4'hb == deqPtr_value ? entries_11_writtenBack : _GEN_4464; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4466 = 4'hc == deqPtr_value ? entries_12_writtenBack : _GEN_4465; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4467 = 4'hd == deqPtr_value ? entries_13_writtenBack : _GEN_4466; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4468 = 4'he == deqPtr_value ? entries_14_writtenBack : _GEN_4467; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire  _GEN_4469 = 4'hf == deqPtr_value ? entries_15_writtenBack : _GEN_4468; // @[src/main/scala/memory/StoreQueue.scala 359:{50,50}]
  wire [9:0] _GEN_4471 = 4'h1 == deqPtr_value ? entries_1_excpVec : entries_0_excpVec; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4472 = 4'h2 == deqPtr_value ? entries_2_excpVec : _GEN_4471; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4473 = 4'h3 == deqPtr_value ? entries_3_excpVec : _GEN_4472; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4474 = 4'h4 == deqPtr_value ? entries_4_excpVec : _GEN_4473; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4475 = 4'h5 == deqPtr_value ? entries_5_excpVec : _GEN_4474; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4476 = 4'h6 == deqPtr_value ? entries_6_excpVec : _GEN_4475; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4477 = 4'h7 == deqPtr_value ? entries_7_excpVec : _GEN_4476; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4478 = 4'h8 == deqPtr_value ? entries_8_excpVec : _GEN_4477; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4479 = 4'h9 == deqPtr_value ? entries_9_excpVec : _GEN_4478; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4480 = 4'ha == deqPtr_value ? entries_10_excpVec : _GEN_4479; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4481 = 4'hb == deqPtr_value ? entries_11_excpVec : _GEN_4480; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4482 = 4'hc == deqPtr_value ? entries_12_excpVec : _GEN_4481; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4483 = 4'hd == deqPtr_value ? entries_13_excpVec : _GEN_4482; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4484 = 4'he == deqPtr_value ? entries_14_excpVec : _GEN_4483; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire [9:0] _GEN_4485 = 4'hf == deqPtr_value ? entries_15_excpVec : _GEN_4484; // @[src/main/scala/memory/StoreQueue.scala 360:{52,52}]
  wire  _canDeqExcp_T_1 = |_GEN_4485; // @[src/main/scala/memory/StoreQueue.scala 360:52]
  wire  canDeqExcp = _GEN_15 & _GEN_4469 & _canDeqExcp_T_1; // @[src/main/scala/memory/StoreQueue.scala 359:87]
  wire  canDeq = canDeqNormal | canDeqExcp; // @[src/main/scala/memory/StoreQueue.scala 361:29]
  wire  deqPtr_wrap = _idx_T_2 >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] deqPtr_newPtr_value = _idx_T_2[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  assign io_mmuReq_valid = mmuCandidates_0 | mmuCandidates_1 | mmuCandidates_2 | mmuCandidates_3 | mmuCandidates_4 |
    mmuCandidates_5 | mmuCandidates_6 | mmuCandidates_7 | mmuCandidates_8 | mmuCandidates_9 | mmuCandidates_10 |
    mmuCandidates_11 | mmuCandidates_12 | mmuCandidates_13 | mmuCandidates_14 | mmuCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 186:48]
  assign io_mmuReq_bits_vaddr = 4'hf == mmuIdx ? entries_15_vaddr : _GEN_1632; // @[src/main/scala/memory/StoreQueue.scala 193:{24,24}]
  assign io_mmuReq_bits_sqIdx = deqPtr_value + mmuOffset; // @[src/main/scala/memory/StoreQueue.scala 188:39]
  assign io_mmuResp_ready = 1'h1; // @[src/main/scala/memory/StoreQueue.scala 210:20]
  assign io_dcacheReq_valid = dcacheCandidates_0 | dcacheCandidates_1 | dcacheCandidates_2 | dcacheCandidates_3 |
    dcacheCandidates_4 | dcacheCandidates_5 | dcacheCandidates_6 | dcacheCandidates_7 | dcacheCandidates_8 |
    dcacheCandidates_9 | dcacheCandidates_10 | dcacheCandidates_11 | dcacheCandidates_12 | dcacheCandidates_13 |
    dcacheCandidates_14 | dcacheCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 335:54]
  assign io_dcacheReq_bits_paddr = 4'hf == dcacheIdx ? entries_15_paddr : _GEN_4372; // @[src/main/scala/memory/StoreQueue.scala 341:{57,57}]
  assign io_dcacheReq_bits_data = 4'hf == dcacheIdx ? entries_15_data : _GEN_4404; // @[src/main/scala/memory/StoreQueue.scala 348:{27,27}]
  assign io_dcacheReq_bits_mask = storeMask[3:0]; // @[src/main/scala/memory/StoreQueue.scala 349:27]
  assign io_outResult_valid = wbCandidates_0 | wbCandidates_1 | wbCandidates_2 | wbCandidates_3 | wbCandidates_4 |
    wbCandidates_5 | wbCandidates_6 | wbCandidates_7 | wbCandidates_8 | wbCandidates_9 | wbCandidates_10 |
    wbCandidates_11 | wbCandidates_12 | wbCandidates_13 | wbCandidates_14 | wbCandidates_15; // @[src/main/scala/memory/StoreQueue.scala 241:46]
  assign io_outResult_bits_uop_pc = 4'hf == wbIdx ? entries_15_pc : _GEN_3140; // @[src/main/scala/memory/StoreQueue.scala 254:{20,20}]
  assign io_outResult_bits_uop_ctrl_fuType = 4'hf == wbIdx ? entries_15_fuType : _GEN_3188; // @[src/main/scala/memory/StoreQueue.scala 287:{23,23}]
  assign io_outResult_bits_uop_ctrl_lsuOp = 4'hf == wbIdx ? entries_15_lsuOp : _GEN_3204; // @[src/main/scala/memory/StoreQueue.scala 288:{23,23}]
  assign io_outResult_bits_uop_excpVec = 4'hf == wbIdx ? entries_15_excpVec : _GEN_3092; // @[src/main/scala/memory/StoreQueue.scala 248:{56,56}]
  assign io_outResult_bits_uop_pdst = 4'hf == wbIdx ? entries_15_pdst : _GEN_3156; // @[src/main/scala/memory/StoreQueue.scala 262:{20,20}]
  assign io_outResult_bits_uop_robIdx_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_3108; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_outResult_bits_uop_robIdx_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_3124; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_outResult_bits_uop_robIdxFull_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_3108; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_outResult_bits_uop_robIdxFull_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_3124; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_outResult_bits_uop_lqIdx_value = 4'hf == wbIdx ? entries_15_lqIdx : _GEN_3172; // @[src/main/scala/memory/StoreQueue.scala 278:{17,17}]
  assign io_outResult_bits_uop_sqIdx_value = deqPtr_value + wbOffset; // @[src/main/scala/memory/StoreQueue.scala 243:38]
  assign io_outResult_bits_redirect_valid = |_GEN_3093; // @[src/main/scala/memory/StoreQueue.scala 248:56]
  assign io_outResult_bits_redirect_bits_valid = |_GEN_3093; // @[src/main/scala/memory/StoreQueue.scala 249:64]
  assign io_outResult_bits_redirect_bits_robIdx_value = 4'hf == wbIdx ? entries_15_robIdxFull_value : _GEN_3108; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_outResult_bits_redirect_bits_robIdx_flag = 4'hf == wbIdx ? entries_15_robIdxFull_flag : _GEN_3124; // @[src/main/scala/memory/StoreQueue.scala 250:{45,45}]
  assign io_oldestRobIdx_value = _GEN_15 ? _GEN_46 : 6'h0; // @[src/main/scala/memory/StoreQueue.scala 122:25]
  assign io_oldestRobIdx_flag = _GEN_15 & _GEN_47; // @[src/main/scala/memory/StoreQueue.scala 122:25]
  assign io_sqEmpty = deqPtr_value == enqPtr_value & deqPtr_flag == enqPtr_flag; // @[src/main/scala/util/CircularQueuePtr.scala 103:54]
  assign io_full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/memory/StoreQueue.scala 112:47]
  always @(posedge clock) begin
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_0_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_0_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_0_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h0 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_0_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_0_valid <= _GEN_432;
      end
    end else begin
      entries_0_valid <= _GEN_432;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_0_addrValid <= _GEN_722;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_0_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_0_dataValid <= _GEN_786;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_0_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_0_paddrValid <= _GEN_1670;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_0_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_0_mmuIssued <= _GEN_1634;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_0_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_0_committed <= _GEN_3302;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_0_committed <= _GEN_3270;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_0_committed <= _GEN_3238;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_0_committed <= _GEN_176;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_0_writtenBack <= _GEN_3206;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_0_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_0_dcacheIssued <= _GEN_4406;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_0_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h0 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_0_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_0_vaddr <= _GEN_560;
      end
    end else begin
      entries_0_vaddr <= _GEN_560;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h0 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_0_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_0_paddr <= _GEN_576;
      end
    end else begin
      entries_0_paddr <= _GEN_576;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h0 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_0_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_0_data <= _GEN_592;
      end
    end else begin
      entries_0_data <= _GEN_592;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h0 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_0_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_0_excpVec <= _GEN_608;
      end
    end else begin
      entries_0_excpVec <= _GEN_608;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_0_cacheable <= _GEN_1702;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_0_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_0_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_0_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_0_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_0_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_0_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_1_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_1_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_1_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h1 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_1_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_1_valid <= _GEN_433;
      end
    end else begin
      entries_1_valid <= _GEN_433;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_1_addrValid <= _GEN_723;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_1_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_1_dataValid <= _GEN_787;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_1_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_1_paddrValid <= _GEN_1671;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_1_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_1_mmuIssued <= _GEN_1635;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_1_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_1_committed <= _GEN_3303;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_1_committed <= _GEN_3271;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_1_committed <= _GEN_3239;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_1_committed <= _GEN_177;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_1_writtenBack <= _GEN_3207;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_1_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_1_dcacheIssued <= _GEN_4407;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_1_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h1 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_1_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_1_vaddr <= _GEN_561;
      end
    end else begin
      entries_1_vaddr <= _GEN_561;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h1 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_1_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_1_paddr <= _GEN_577;
      end
    end else begin
      entries_1_paddr <= _GEN_577;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h1 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_1_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_1_data <= _GEN_593;
      end
    end else begin
      entries_1_data <= _GEN_593;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h1 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_1_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_1_excpVec <= _GEN_609;
      end
    end else begin
      entries_1_excpVec <= _GEN_609;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_1_cacheable <= _GEN_1703;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_1_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_1_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_1_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_1_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_1_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_1_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_2_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_2_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_2_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h2 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_2_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_2_valid <= _GEN_434;
      end
    end else begin
      entries_2_valid <= _GEN_434;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_2_addrValid <= _GEN_724;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_2_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_2_dataValid <= _GEN_788;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_2_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_2_paddrValid <= _GEN_1672;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_2_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_2_mmuIssued <= _GEN_1636;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_2_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_2_committed <= _GEN_3304;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_2_committed <= _GEN_3272;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_2_committed <= _GEN_3240;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_2_committed <= _GEN_178;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_2_writtenBack <= _GEN_3208;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_2_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_2_dcacheIssued <= _GEN_4408;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_2_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h2 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_2_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_2_vaddr <= _GEN_562;
      end
    end else begin
      entries_2_vaddr <= _GEN_562;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h2 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_2_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_2_paddr <= _GEN_578;
      end
    end else begin
      entries_2_paddr <= _GEN_578;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h2 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_2_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_2_data <= _GEN_594;
      end
    end else begin
      entries_2_data <= _GEN_594;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h2 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_2_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_2_excpVec <= _GEN_610;
      end
    end else begin
      entries_2_excpVec <= _GEN_610;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_2_cacheable <= _GEN_1704;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_2_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_2_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_2_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_2_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_2_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_2_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_3_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_3_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_3_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h3 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_3_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_3_valid <= _GEN_435;
      end
    end else begin
      entries_3_valid <= _GEN_435;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_3_addrValid <= _GEN_725;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_3_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_3_dataValid <= _GEN_789;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_3_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_3_paddrValid <= _GEN_1673;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_3_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_3_mmuIssued <= _GEN_1637;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_3_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_3_committed <= _GEN_3305;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_3_committed <= _GEN_3273;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_3_committed <= _GEN_3241;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_3_committed <= _GEN_179;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_3_writtenBack <= _GEN_3209;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_3_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_3_dcacheIssued <= _GEN_4409;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_3_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h3 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_3_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_3_vaddr <= _GEN_563;
      end
    end else begin
      entries_3_vaddr <= _GEN_563;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h3 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_3_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_3_paddr <= _GEN_579;
      end
    end else begin
      entries_3_paddr <= _GEN_579;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h3 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_3_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_3_data <= _GEN_595;
      end
    end else begin
      entries_3_data <= _GEN_595;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h3 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_3_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_3_excpVec <= _GEN_611;
      end
    end else begin
      entries_3_excpVec <= _GEN_611;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_3_cacheable <= _GEN_1705;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_3_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_3_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_3_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_3_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_3_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_3_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_4_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_4_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_4_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h4 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_4_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_4_valid <= _GEN_436;
      end
    end else begin
      entries_4_valid <= _GEN_436;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_4_addrValid <= _GEN_726;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_4_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_4_dataValid <= _GEN_790;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_4_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_4_paddrValid <= _GEN_1674;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_4_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_4_mmuIssued <= _GEN_1638;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_4_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_4_committed <= _GEN_3306;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_4_committed <= _GEN_3274;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_4_committed <= _GEN_3242;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_4_committed <= _GEN_180;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_4_writtenBack <= _GEN_3210;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_4_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_4_dcacheIssued <= _GEN_4410;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_4_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h4 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_4_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_4_vaddr <= _GEN_564;
      end
    end else begin
      entries_4_vaddr <= _GEN_564;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h4 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_4_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_4_paddr <= _GEN_580;
      end
    end else begin
      entries_4_paddr <= _GEN_580;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h4 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_4_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_4_data <= _GEN_596;
      end
    end else begin
      entries_4_data <= _GEN_596;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h4 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_4_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_4_excpVec <= _GEN_612;
      end
    end else begin
      entries_4_excpVec <= _GEN_612;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_4_cacheable <= _GEN_1706;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_4_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_4_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_4_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_4_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_4_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_4_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_5_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_5_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_5_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h5 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_5_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_5_valid <= _GEN_437;
      end
    end else begin
      entries_5_valid <= _GEN_437;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_5_addrValid <= _GEN_727;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_5_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_5_dataValid <= _GEN_791;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_5_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_5_paddrValid <= _GEN_1675;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_5_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_5_mmuIssued <= _GEN_1639;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_5_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_5_committed <= _GEN_3307;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_5_committed <= _GEN_3275;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_5_committed <= _GEN_3243;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_5_committed <= _GEN_181;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_5_writtenBack <= _GEN_3211;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_5_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_5_dcacheIssued <= _GEN_4411;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_5_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h5 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_5_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_5_vaddr <= _GEN_565;
      end
    end else begin
      entries_5_vaddr <= _GEN_565;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h5 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_5_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_5_paddr <= _GEN_581;
      end
    end else begin
      entries_5_paddr <= _GEN_581;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h5 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_5_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_5_data <= _GEN_597;
      end
    end else begin
      entries_5_data <= _GEN_597;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h5 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_5_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_5_excpVec <= _GEN_613;
      end
    end else begin
      entries_5_excpVec <= _GEN_613;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_5_cacheable <= _GEN_1707;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_5_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_5_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_5_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_5_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_5_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_5_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_6_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_6_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_6_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h6 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_6_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_6_valid <= _GEN_438;
      end
    end else begin
      entries_6_valid <= _GEN_438;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_6_addrValid <= _GEN_728;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_6_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_6_dataValid <= _GEN_792;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_6_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_6_paddrValid <= _GEN_1676;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_6_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_6_mmuIssued <= _GEN_1640;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_6_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_6_committed <= _GEN_3308;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_6_committed <= _GEN_3276;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_6_committed <= _GEN_3244;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_6_committed <= _GEN_182;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_6_writtenBack <= _GEN_3212;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_6_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_6_dcacheIssued <= _GEN_4412;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_6_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h6 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_6_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_6_vaddr <= _GEN_566;
      end
    end else begin
      entries_6_vaddr <= _GEN_566;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h6 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_6_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_6_paddr <= _GEN_582;
      end
    end else begin
      entries_6_paddr <= _GEN_582;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h6 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_6_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_6_data <= _GEN_598;
      end
    end else begin
      entries_6_data <= _GEN_598;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h6 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_6_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_6_excpVec <= _GEN_614;
      end
    end else begin
      entries_6_excpVec <= _GEN_614;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_6_cacheable <= _GEN_1708;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_6_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_6_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_6_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_6_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_6_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_6_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_7_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_7_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_7_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h7 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_7_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_7_valid <= _GEN_439;
      end
    end else begin
      entries_7_valid <= _GEN_439;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_7_addrValid <= _GEN_729;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_7_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_7_dataValid <= _GEN_793;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_7_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_7_paddrValid <= _GEN_1677;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_7_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_7_mmuIssued <= _GEN_1641;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_7_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_7_committed <= _GEN_3309;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_7_committed <= _GEN_3277;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_7_committed <= _GEN_3245;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_7_committed <= _GEN_183;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_7_writtenBack <= _GEN_3213;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_7_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_7_dcacheIssued <= _GEN_4413;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_7_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h7 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_7_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_7_vaddr <= _GEN_567;
      end
    end else begin
      entries_7_vaddr <= _GEN_567;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h7 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_7_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_7_paddr <= _GEN_583;
      end
    end else begin
      entries_7_paddr <= _GEN_583;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h7 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_7_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_7_data <= _GEN_599;
      end
    end else begin
      entries_7_data <= _GEN_599;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h7 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_7_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_7_excpVec <= _GEN_615;
      end
    end else begin
      entries_7_excpVec <= _GEN_615;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_7_cacheable <= _GEN_1709;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_7_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_7_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_7_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_7_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_7_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_7_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_8_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_8_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_8_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h8 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_8_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_8_valid <= _GEN_440;
      end
    end else begin
      entries_8_valid <= _GEN_440;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_8_addrValid <= _GEN_730;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_8_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_8_dataValid <= _GEN_794;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_8_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_8_paddrValid <= _GEN_1678;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_8_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_8_mmuIssued <= _GEN_1642;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_8_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_8_committed <= _GEN_3310;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_8_committed <= _GEN_3278;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_8_committed <= _GEN_3246;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_8_committed <= _GEN_184;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_8_writtenBack <= _GEN_3214;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_8_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_8_dcacheIssued <= _GEN_4414;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_8_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h8 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_8_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_8_vaddr <= _GEN_568;
      end
    end else begin
      entries_8_vaddr <= _GEN_568;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h8 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_8_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_8_paddr <= _GEN_584;
      end
    end else begin
      entries_8_paddr <= _GEN_584;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h8 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_8_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_8_data <= _GEN_600;
      end
    end else begin
      entries_8_data <= _GEN_600;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h8 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_8_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_8_excpVec <= _GEN_616;
      end
    end else begin
      entries_8_excpVec <= _GEN_616;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_8_cacheable <= _GEN_1710;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_8_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_8_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_8_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_8_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_8_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_8_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_9_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_9_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_9_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'h9 == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_9_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_9_valid <= _GEN_441;
      end
    end else begin
      entries_9_valid <= _GEN_441;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_9_addrValid <= _GEN_731;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_9_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_9_dataValid <= _GEN_795;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_9_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_9_paddrValid <= _GEN_1679;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_9_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_9_mmuIssued <= _GEN_1643;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_9_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_9_committed <= _GEN_3311;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_9_committed <= _GEN_3279;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_9_committed <= _GEN_3247;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_9_committed <= _GEN_185;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_9_writtenBack <= _GEN_3215;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_9_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_9_dcacheIssued <= _GEN_4415;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_9_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'h9 == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_9_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_9_vaddr <= _GEN_569;
      end
    end else begin
      entries_9_vaddr <= _GEN_569;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h9 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_9_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_9_paddr <= _GEN_585;
      end
    end else begin
      entries_9_paddr <= _GEN_585;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'h9 == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_9_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_9_data <= _GEN_601;
      end
    end else begin
      entries_9_data <= _GEN_601;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'h9 == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_9_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_9_excpVec <= _GEN_617;
      end
    end else begin
      entries_9_excpVec <= _GEN_617;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_9_cacheable <= _GEN_1711;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_9_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_9_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_9_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_9_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_9_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_9_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_10_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_10_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_10_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'ha == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_10_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_10_valid <= _GEN_442;
      end
    end else begin
      entries_10_valid <= _GEN_442;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_10_addrValid <= _GEN_732;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_10_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_10_dataValid <= _GEN_796;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_10_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_10_paddrValid <= _GEN_1680;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_10_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_10_mmuIssued <= _GEN_1644;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_10_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_10_committed <= _GEN_3312;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_10_committed <= _GEN_3280;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_10_committed <= _GEN_3248;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_10_committed <= _GEN_186;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_10_writtenBack <= _GEN_3216;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_10_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_10_dcacheIssued <= _GEN_4416;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_10_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'ha == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_10_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_10_vaddr <= _GEN_570;
      end
    end else begin
      entries_10_vaddr <= _GEN_570;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'ha == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_10_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_10_paddr <= _GEN_586;
      end
    end else begin
      entries_10_paddr <= _GEN_586;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'ha == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_10_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_10_data <= _GEN_602;
      end
    end else begin
      entries_10_data <= _GEN_602;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'ha == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_10_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_10_excpVec <= _GEN_618;
      end
    end else begin
      entries_10_excpVec <= _GEN_618;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_10_cacheable <= _GEN_1712;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_10_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_10_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_10_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_10_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_10_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_10_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_11_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_11_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_11_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'hb == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_11_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_11_valid <= _GEN_443;
      end
    end else begin
      entries_11_valid <= _GEN_443;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_11_addrValid <= _GEN_733;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_11_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_11_dataValid <= _GEN_797;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_11_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_11_paddrValid <= _GEN_1681;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_11_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_11_mmuIssued <= _GEN_1645;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_11_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_11_committed <= _GEN_3313;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_11_committed <= _GEN_3281;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_11_committed <= _GEN_3249;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_11_committed <= _GEN_187;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_11_writtenBack <= _GEN_3217;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_11_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_11_dcacheIssued <= _GEN_4417;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_11_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'hb == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_11_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_11_vaddr <= _GEN_571;
      end
    end else begin
      entries_11_vaddr <= _GEN_571;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hb == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_11_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_11_paddr <= _GEN_587;
      end
    end else begin
      entries_11_paddr <= _GEN_587;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'hb == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_11_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_11_data <= _GEN_603;
      end
    end else begin
      entries_11_data <= _GEN_603;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hb == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_11_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_11_excpVec <= _GEN_619;
      end
    end else begin
      entries_11_excpVec <= _GEN_619;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_11_cacheable <= _GEN_1713;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_11_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_11_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_11_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_11_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_11_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_11_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_12_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_12_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_12_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'hc == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_12_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_12_valid <= _GEN_444;
      end
    end else begin
      entries_12_valid <= _GEN_444;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_12_addrValid <= _GEN_734;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_12_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_12_dataValid <= _GEN_798;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_12_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_12_paddrValid <= _GEN_1682;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_12_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_12_mmuIssued <= _GEN_1646;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_12_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_12_committed <= _GEN_3314;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_12_committed <= _GEN_3282;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_12_committed <= _GEN_3250;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_12_committed <= _GEN_188;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_12_writtenBack <= _GEN_3218;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_12_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_12_dcacheIssued <= _GEN_4418;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_12_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'hc == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_12_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_12_vaddr <= _GEN_572;
      end
    end else begin
      entries_12_vaddr <= _GEN_572;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hc == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_12_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_12_paddr <= _GEN_588;
      end
    end else begin
      entries_12_paddr <= _GEN_588;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'hc == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_12_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_12_data <= _GEN_604;
      end
    end else begin
      entries_12_data <= _GEN_604;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hc == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_12_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_12_excpVec <= _GEN_620;
      end
    end else begin
      entries_12_excpVec <= _GEN_620;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_12_cacheable <= _GEN_1714;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_12_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_12_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_12_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_12_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_12_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_12_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_13_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_13_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_13_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'hd == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_13_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_13_valid <= _GEN_445;
      end
    end else begin
      entries_13_valid <= _GEN_445;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_13_addrValid <= _GEN_735;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_13_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_13_dataValid <= _GEN_799;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_13_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_13_paddrValid <= _GEN_1683;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_13_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_13_mmuIssued <= _GEN_1647;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_13_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_13_committed <= _GEN_3315;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_13_committed <= _GEN_3283;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_13_committed <= _GEN_3251;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_13_committed <= _GEN_189;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_13_writtenBack <= _GEN_3219;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_13_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_13_dcacheIssued <= _GEN_4419;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_13_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'hd == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_13_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_13_vaddr <= _GEN_573;
      end
    end else begin
      entries_13_vaddr <= _GEN_573;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hd == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_13_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_13_paddr <= _GEN_589;
      end
    end else begin
      entries_13_paddr <= _GEN_589;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'hd == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_13_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_13_data <= _GEN_605;
      end
    end else begin
      entries_13_data <= _GEN_605;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hd == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_13_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_13_excpVec <= _GEN_621;
      end
    end else begin
      entries_13_excpVec <= _GEN_621;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_13_cacheable <= _GEN_1715;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_13_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_13_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_13_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_13_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_13_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_13_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_14_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_14_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_14_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'he == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_14_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_14_valid <= _GEN_446;
      end
    end else begin
      entries_14_valid <= _GEN_446;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_14_addrValid <= _GEN_736;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_14_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_14_dataValid <= _GEN_800;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_14_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_14_paddrValid <= _GEN_1684;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_14_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_14_mmuIssued <= _GEN_1648;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_14_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_14_committed <= _GEN_3316;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_14_committed <= _GEN_3284;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_14_committed <= _GEN_3252;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_14_committed <= _GEN_190;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_14_writtenBack <= _GEN_3220;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_14_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_14_dcacheIssued <= _GEN_4420;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_14_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'he == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_14_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_14_vaddr <= _GEN_574;
      end
    end else begin
      entries_14_vaddr <= _GEN_574;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'he == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_14_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_14_paddr <= _GEN_590;
      end
    end else begin
      entries_14_paddr <= _GEN_590;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'he == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_14_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_14_data <= _GEN_606;
      end
    end else begin
      entries_14_data <= _GEN_606;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'he == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_14_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_14_excpVec <= _GEN_622;
      end
    end else begin
      entries_14_excpVec <= _GEN_622;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_14_cacheable <= _GEN_1716;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_14_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_14_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_14_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_14_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_14_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_14_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_15_robIdxFull_value <= io_enq_robIdx_value; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 133:31]
        entries_15_robIdxFull_flag <= io_enq_robIdx_flag; // @[src/main/scala/memory/StoreQueue.scala 133:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 134:31]
        entries_15_lqIdx <= io_enq_lqIdx; // @[src/main/scala/memory/StoreQueue.scala 134:31]
      end
    end
    if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (4'hf == deqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 364:33]
        entries_15_valid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 364:33]
      end else begin
        entries_15_valid <= _GEN_447;
      end
    end else begin
      entries_15_valid <= _GEN_447;
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      entries_15_addrValid <= _GEN_737;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 136:31]
        entries_15_addrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 136:31]
      end
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      entries_15_dataValid <= _GEN_801;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 137:31]
        entries_15_dataValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 137:31]
      end
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_15_paddrValid <= _GEN_1685;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 138:31]
        entries_15_paddrValid <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 138:31]
      end
    end
    if (io_mmuReq_valid) begin // @[src/main/scala/memory/StoreQueue.scala 196:24]
      entries_15_mmuIssued <= _GEN_1649;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 139:31]
        entries_15_mmuIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 139:31]
      end
    end
    if (io_robCommit_2_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_15_committed <= _GEN_3317;
    end else if (io_robCommit_1_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_15_committed <= _GEN_3285;
    end else if (io_robCommit_0_valid) begin // @[src/main/scala/memory/StoreQueue.scala 316:33]
      entries_15_committed <= _GEN_3253;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      entries_15_committed <= _GEN_191;
    end
    if (_T_2) begin // @[src/main/scala/memory/StoreQueue.scala 307:27]
      entries_15_writtenBack <= _GEN_3221;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 141:31]
        entries_15_writtenBack <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 141:31]
      end
    end
    if (_T_3) begin // @[src/main/scala/memory/StoreQueue.scala 351:27]
      entries_15_dcacheIssued <= _GEN_4421;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 142:31]
        entries_15_dcacheIssued <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 142:31]
      end
    end
    if (io_addrWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 159:28]
      if (4'hf == io_addrWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 162:28]
        entries_15_vaddr <= io_addrWrite_vaddr; // @[src/main/scala/memory/StoreQueue.scala 162:28]
      end else begin
        entries_15_vaddr <= _GEN_575;
      end
    end else begin
      entries_15_vaddr <= _GEN_575;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hf == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 224:29]
        entries_15_paddr <= io_mmuResp_bits_paddr; // @[src/main/scala/memory/StoreQueue.scala 224:29]
      end else begin
        entries_15_paddr <= _GEN_591;
      end
    end else begin
      entries_15_paddr <= _GEN_591;
    end
    if (io_dataWrite_valid) begin // @[src/main/scala/memory/StoreQueue.scala 168:28]
      if (4'hf == io_dataWrite_idx) begin // @[src/main/scala/memory/StoreQueue.scala 171:28]
        entries_15_data <= io_dataWrite_data; // @[src/main/scala/memory/StoreQueue.scala 171:28]
      end else begin
        entries_15_data <= _GEN_607;
      end
    end else begin
      entries_15_data <= _GEN_607;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      if (4'hf == io_mmuResp_bits_sqIdx) begin // @[src/main/scala/memory/StoreQueue.scala 226:29]
        entries_15_excpVec <= 10'h0; // @[src/main/scala/memory/StoreQueue.scala 226:29]
      end else begin
        entries_15_excpVec <= _GEN_623;
      end
    end else begin
      entries_15_excpVec <= _GEN_623;
    end
    if (_T_1) begin // @[src/main/scala/memory/StoreQueue.scala 211:25]
      entries_15_cacheable <= _GEN_1717;
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 147:31]
        entries_15_cacheable <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 147:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 148:31]
        entries_15_lsuOp <= io_enq_lsuOp; // @[src/main/scala/memory/StoreQueue.scala 148:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 149:31]
        entries_15_pc <= io_enq_pc; // @[src/main/scala/memory/StoreQueue.scala 149:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 150:31]
        entries_15_pdst <= io_enq_pdst; // @[src/main/scala/memory/StoreQueue.scala 150:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 151:31]
        entries_15_rfWen <= io_enq_rfWen; // @[src/main/scala/memory/StoreQueue.scala 151:31]
      end
    end
    if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/memory/StoreQueue.scala 152:31]
        entries_15_fuType <= io_enq_fuType; // @[src/main/scala/memory/StoreQueue.scala 152:31]
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 104:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 104:23]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      enqPtr_value <= enqPtr_newPtr_value; // @[src/main/scala/memory/StoreQueue.scala 153:12]
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 104:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 104:23]
    end else if (enqFire) begin // @[src/main/scala/memory/StoreQueue.scala 131:17]
      if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        enqPtr_flag <= ~enqPtr_flag;
      end
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 107:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/memory/StoreQueue.scala 107:23]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      deqPtr_value <= deqPtr_newPtr_value; // @[src/main/scala/memory/StoreQueue.scala 365:12]
    end
    if (reset) begin // @[src/main/scala/memory/StoreQueue.scala 107:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/memory/StoreQueue.scala 107:23]
    end else if (canDeq) begin // @[src/main/scala/memory/StoreQueue.scala 363:16]
      if (deqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        deqPtr_flag <= ~deqPtr_flag;
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
  entries_0_robIdxFull_value = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_robIdxFull_flag = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_lqIdx = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_addrValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_dataValid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_paddrValid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_mmuIssued = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_committed = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_writtenBack = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_dcacheIssued = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  entries_0_vaddr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  entries_0_paddr = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  entries_0_data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  entries_0_excpVec = _RAND_14[9:0];
  _RAND_15 = {1{`RANDOM}};
  entries_0_cacheable = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entries_0_lsuOp = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  entries_0_pc = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  entries_0_pdst = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  entries_0_rfWen = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  entries_0_fuType = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_robIdxFull_value = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  entries_1_robIdxFull_flag = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_1_lqIdx = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  entries_1_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entries_1_addrValid = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entries_1_dataValid = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entries_1_paddrValid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  entries_1_mmuIssued = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entries_1_committed = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  entries_1_writtenBack = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entries_1_dcacheIssued = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entries_1_vaddr = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  entries_1_paddr = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  entries_1_data = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  entries_1_excpVec = _RAND_35[9:0];
  _RAND_36 = {1{`RANDOM}};
  entries_1_cacheable = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  entries_1_lsuOp = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  entries_1_pc = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entries_1_pdst = _RAND_39[6:0];
  _RAND_40 = {1{`RANDOM}};
  entries_1_rfWen = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  entries_1_fuType = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  entries_2_robIdxFull_value = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  entries_2_robIdxFull_flag = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entries_2_lqIdx = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  entries_2_valid = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entries_2_addrValid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  entries_2_dataValid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entries_2_paddrValid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entries_2_mmuIssued = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_2_committed = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entries_2_writtenBack = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  entries_2_dcacheIssued = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_2_vaddr = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  entries_2_paddr = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  entries_2_data = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_2_excpVec = _RAND_56[9:0];
  _RAND_57 = {1{`RANDOM}};
  entries_2_cacheable = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  entries_2_lsuOp = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  entries_2_pc = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  entries_2_pdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  entries_2_rfWen = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  entries_2_fuType = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  entries_3_robIdxFull_value = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  entries_3_robIdxFull_flag = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  entries_3_lqIdx = _RAND_65[3:0];
  _RAND_66 = {1{`RANDOM}};
  entries_3_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entries_3_addrValid = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  entries_3_dataValid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  entries_3_paddrValid = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  entries_3_mmuIssued = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entries_3_committed = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  entries_3_writtenBack = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entries_3_dcacheIssued = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  entries_3_vaddr = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  entries_3_paddr = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  entries_3_data = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entries_3_excpVec = _RAND_77[9:0];
  _RAND_78 = {1{`RANDOM}};
  entries_3_cacheable = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  entries_3_lsuOp = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  entries_3_pc = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  entries_3_pdst = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  entries_3_rfWen = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  entries_3_fuType = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  entries_4_robIdxFull_value = _RAND_84[5:0];
  _RAND_85 = {1{`RANDOM}};
  entries_4_robIdxFull_flag = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  entries_4_lqIdx = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  entries_4_valid = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  entries_4_addrValid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entries_4_dataValid = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  entries_4_paddrValid = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  entries_4_mmuIssued = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  entries_4_committed = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entries_4_writtenBack = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entries_4_dcacheIssued = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entries_4_vaddr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  entries_4_paddr = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  entries_4_data = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  entries_4_excpVec = _RAND_98[9:0];
  _RAND_99 = {1{`RANDOM}};
  entries_4_cacheable = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  entries_4_lsuOp = _RAND_100[3:0];
  _RAND_101 = {1{`RANDOM}};
  entries_4_pc = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  entries_4_pdst = _RAND_102[6:0];
  _RAND_103 = {1{`RANDOM}};
  entries_4_rfWen = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entries_4_fuType = _RAND_104[3:0];
  _RAND_105 = {1{`RANDOM}};
  entries_5_robIdxFull_value = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  entries_5_robIdxFull_flag = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  entries_5_lqIdx = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  entries_5_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  entries_5_addrValid = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entries_5_dataValid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entries_5_paddrValid = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  entries_5_mmuIssued = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entries_5_committed = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entries_5_writtenBack = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entries_5_dcacheIssued = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entries_5_vaddr = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  entries_5_paddr = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  entries_5_data = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  entries_5_excpVec = _RAND_119[9:0];
  _RAND_120 = {1{`RANDOM}};
  entries_5_cacheable = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  entries_5_lsuOp = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  entries_5_pc = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  entries_5_pdst = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  entries_5_rfWen = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  entries_5_fuType = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  entries_6_robIdxFull_value = _RAND_126[5:0];
  _RAND_127 = {1{`RANDOM}};
  entries_6_robIdxFull_flag = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  entries_6_lqIdx = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  entries_6_valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entries_6_addrValid = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entries_6_dataValid = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  entries_6_paddrValid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entries_6_mmuIssued = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entries_6_committed = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entries_6_writtenBack = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  entries_6_dcacheIssued = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entries_6_vaddr = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  entries_6_paddr = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  entries_6_data = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  entries_6_excpVec = _RAND_140[9:0];
  _RAND_141 = {1{`RANDOM}};
  entries_6_cacheable = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  entries_6_lsuOp = _RAND_142[3:0];
  _RAND_143 = {1{`RANDOM}};
  entries_6_pc = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  entries_6_pdst = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  entries_6_rfWen = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  entries_6_fuType = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  entries_7_robIdxFull_value = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  entries_7_robIdxFull_flag = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  entries_7_lqIdx = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  entries_7_valid = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  entries_7_addrValid = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  entries_7_dataValid = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  entries_7_paddrValid = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  entries_7_mmuIssued = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  entries_7_committed = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  entries_7_writtenBack = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  entries_7_dcacheIssued = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  entries_7_vaddr = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  entries_7_paddr = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  entries_7_data = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  entries_7_excpVec = _RAND_161[9:0];
  _RAND_162 = {1{`RANDOM}};
  entries_7_cacheable = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  entries_7_lsuOp = _RAND_163[3:0];
  _RAND_164 = {1{`RANDOM}};
  entries_7_pc = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  entries_7_pdst = _RAND_165[6:0];
  _RAND_166 = {1{`RANDOM}};
  entries_7_rfWen = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  entries_7_fuType = _RAND_167[3:0];
  _RAND_168 = {1{`RANDOM}};
  entries_8_robIdxFull_value = _RAND_168[5:0];
  _RAND_169 = {1{`RANDOM}};
  entries_8_robIdxFull_flag = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  entries_8_lqIdx = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  entries_8_valid = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  entries_8_addrValid = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  entries_8_dataValid = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  entries_8_paddrValid = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  entries_8_mmuIssued = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  entries_8_committed = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  entries_8_writtenBack = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  entries_8_dcacheIssued = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  entries_8_vaddr = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  entries_8_paddr = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  entries_8_data = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  entries_8_excpVec = _RAND_182[9:0];
  _RAND_183 = {1{`RANDOM}};
  entries_8_cacheable = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  entries_8_lsuOp = _RAND_184[3:0];
  _RAND_185 = {1{`RANDOM}};
  entries_8_pc = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  entries_8_pdst = _RAND_186[6:0];
  _RAND_187 = {1{`RANDOM}};
  entries_8_rfWen = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  entries_8_fuType = _RAND_188[3:0];
  _RAND_189 = {1{`RANDOM}};
  entries_9_robIdxFull_value = _RAND_189[5:0];
  _RAND_190 = {1{`RANDOM}};
  entries_9_robIdxFull_flag = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  entries_9_lqIdx = _RAND_191[3:0];
  _RAND_192 = {1{`RANDOM}};
  entries_9_valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  entries_9_addrValid = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  entries_9_dataValid = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  entries_9_paddrValid = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  entries_9_mmuIssued = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  entries_9_committed = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  entries_9_writtenBack = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  entries_9_dcacheIssued = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  entries_9_vaddr = _RAND_200[31:0];
  _RAND_201 = {1{`RANDOM}};
  entries_9_paddr = _RAND_201[31:0];
  _RAND_202 = {1{`RANDOM}};
  entries_9_data = _RAND_202[31:0];
  _RAND_203 = {1{`RANDOM}};
  entries_9_excpVec = _RAND_203[9:0];
  _RAND_204 = {1{`RANDOM}};
  entries_9_cacheable = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  entries_9_lsuOp = _RAND_205[3:0];
  _RAND_206 = {1{`RANDOM}};
  entries_9_pc = _RAND_206[31:0];
  _RAND_207 = {1{`RANDOM}};
  entries_9_pdst = _RAND_207[6:0];
  _RAND_208 = {1{`RANDOM}};
  entries_9_rfWen = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  entries_9_fuType = _RAND_209[3:0];
  _RAND_210 = {1{`RANDOM}};
  entries_10_robIdxFull_value = _RAND_210[5:0];
  _RAND_211 = {1{`RANDOM}};
  entries_10_robIdxFull_flag = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  entries_10_lqIdx = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  entries_10_valid = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  entries_10_addrValid = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  entries_10_dataValid = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  entries_10_paddrValid = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  entries_10_mmuIssued = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  entries_10_committed = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  entries_10_writtenBack = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  entries_10_dcacheIssued = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  entries_10_vaddr = _RAND_221[31:0];
  _RAND_222 = {1{`RANDOM}};
  entries_10_paddr = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  entries_10_data = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  entries_10_excpVec = _RAND_224[9:0];
  _RAND_225 = {1{`RANDOM}};
  entries_10_cacheable = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  entries_10_lsuOp = _RAND_226[3:0];
  _RAND_227 = {1{`RANDOM}};
  entries_10_pc = _RAND_227[31:0];
  _RAND_228 = {1{`RANDOM}};
  entries_10_pdst = _RAND_228[6:0];
  _RAND_229 = {1{`RANDOM}};
  entries_10_rfWen = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  entries_10_fuType = _RAND_230[3:0];
  _RAND_231 = {1{`RANDOM}};
  entries_11_robIdxFull_value = _RAND_231[5:0];
  _RAND_232 = {1{`RANDOM}};
  entries_11_robIdxFull_flag = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  entries_11_lqIdx = _RAND_233[3:0];
  _RAND_234 = {1{`RANDOM}};
  entries_11_valid = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  entries_11_addrValid = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  entries_11_dataValid = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  entries_11_paddrValid = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  entries_11_mmuIssued = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  entries_11_committed = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  entries_11_writtenBack = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  entries_11_dcacheIssued = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  entries_11_vaddr = _RAND_242[31:0];
  _RAND_243 = {1{`RANDOM}};
  entries_11_paddr = _RAND_243[31:0];
  _RAND_244 = {1{`RANDOM}};
  entries_11_data = _RAND_244[31:0];
  _RAND_245 = {1{`RANDOM}};
  entries_11_excpVec = _RAND_245[9:0];
  _RAND_246 = {1{`RANDOM}};
  entries_11_cacheable = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  entries_11_lsuOp = _RAND_247[3:0];
  _RAND_248 = {1{`RANDOM}};
  entries_11_pc = _RAND_248[31:0];
  _RAND_249 = {1{`RANDOM}};
  entries_11_pdst = _RAND_249[6:0];
  _RAND_250 = {1{`RANDOM}};
  entries_11_rfWen = _RAND_250[0:0];
  _RAND_251 = {1{`RANDOM}};
  entries_11_fuType = _RAND_251[3:0];
  _RAND_252 = {1{`RANDOM}};
  entries_12_robIdxFull_value = _RAND_252[5:0];
  _RAND_253 = {1{`RANDOM}};
  entries_12_robIdxFull_flag = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  entries_12_lqIdx = _RAND_254[3:0];
  _RAND_255 = {1{`RANDOM}};
  entries_12_valid = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  entries_12_addrValid = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  entries_12_dataValid = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  entries_12_paddrValid = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  entries_12_mmuIssued = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  entries_12_committed = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  entries_12_writtenBack = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  entries_12_dcacheIssued = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  entries_12_vaddr = _RAND_263[31:0];
  _RAND_264 = {1{`RANDOM}};
  entries_12_paddr = _RAND_264[31:0];
  _RAND_265 = {1{`RANDOM}};
  entries_12_data = _RAND_265[31:0];
  _RAND_266 = {1{`RANDOM}};
  entries_12_excpVec = _RAND_266[9:0];
  _RAND_267 = {1{`RANDOM}};
  entries_12_cacheable = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  entries_12_lsuOp = _RAND_268[3:0];
  _RAND_269 = {1{`RANDOM}};
  entries_12_pc = _RAND_269[31:0];
  _RAND_270 = {1{`RANDOM}};
  entries_12_pdst = _RAND_270[6:0];
  _RAND_271 = {1{`RANDOM}};
  entries_12_rfWen = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  entries_12_fuType = _RAND_272[3:0];
  _RAND_273 = {1{`RANDOM}};
  entries_13_robIdxFull_value = _RAND_273[5:0];
  _RAND_274 = {1{`RANDOM}};
  entries_13_robIdxFull_flag = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  entries_13_lqIdx = _RAND_275[3:0];
  _RAND_276 = {1{`RANDOM}};
  entries_13_valid = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  entries_13_addrValid = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  entries_13_dataValid = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  entries_13_paddrValid = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  entries_13_mmuIssued = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  entries_13_committed = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  entries_13_writtenBack = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  entries_13_dcacheIssued = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  entries_13_vaddr = _RAND_284[31:0];
  _RAND_285 = {1{`RANDOM}};
  entries_13_paddr = _RAND_285[31:0];
  _RAND_286 = {1{`RANDOM}};
  entries_13_data = _RAND_286[31:0];
  _RAND_287 = {1{`RANDOM}};
  entries_13_excpVec = _RAND_287[9:0];
  _RAND_288 = {1{`RANDOM}};
  entries_13_cacheable = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  entries_13_lsuOp = _RAND_289[3:0];
  _RAND_290 = {1{`RANDOM}};
  entries_13_pc = _RAND_290[31:0];
  _RAND_291 = {1{`RANDOM}};
  entries_13_pdst = _RAND_291[6:0];
  _RAND_292 = {1{`RANDOM}};
  entries_13_rfWen = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  entries_13_fuType = _RAND_293[3:0];
  _RAND_294 = {1{`RANDOM}};
  entries_14_robIdxFull_value = _RAND_294[5:0];
  _RAND_295 = {1{`RANDOM}};
  entries_14_robIdxFull_flag = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  entries_14_lqIdx = _RAND_296[3:0];
  _RAND_297 = {1{`RANDOM}};
  entries_14_valid = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  entries_14_addrValid = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  entries_14_dataValid = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  entries_14_paddrValid = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  entries_14_mmuIssued = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  entries_14_committed = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  entries_14_writtenBack = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  entries_14_dcacheIssued = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  entries_14_vaddr = _RAND_305[31:0];
  _RAND_306 = {1{`RANDOM}};
  entries_14_paddr = _RAND_306[31:0];
  _RAND_307 = {1{`RANDOM}};
  entries_14_data = _RAND_307[31:0];
  _RAND_308 = {1{`RANDOM}};
  entries_14_excpVec = _RAND_308[9:0];
  _RAND_309 = {1{`RANDOM}};
  entries_14_cacheable = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  entries_14_lsuOp = _RAND_310[3:0];
  _RAND_311 = {1{`RANDOM}};
  entries_14_pc = _RAND_311[31:0];
  _RAND_312 = {1{`RANDOM}};
  entries_14_pdst = _RAND_312[6:0];
  _RAND_313 = {1{`RANDOM}};
  entries_14_rfWen = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  entries_14_fuType = _RAND_314[3:0];
  _RAND_315 = {1{`RANDOM}};
  entries_15_robIdxFull_value = _RAND_315[5:0];
  _RAND_316 = {1{`RANDOM}};
  entries_15_robIdxFull_flag = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  entries_15_lqIdx = _RAND_317[3:0];
  _RAND_318 = {1{`RANDOM}};
  entries_15_valid = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  entries_15_addrValid = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  entries_15_dataValid = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  entries_15_paddrValid = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  entries_15_mmuIssued = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  entries_15_committed = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  entries_15_writtenBack = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  entries_15_dcacheIssued = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  entries_15_vaddr = _RAND_326[31:0];
  _RAND_327 = {1{`RANDOM}};
  entries_15_paddr = _RAND_327[31:0];
  _RAND_328 = {1{`RANDOM}};
  entries_15_data = _RAND_328[31:0];
  _RAND_329 = {1{`RANDOM}};
  entries_15_excpVec = _RAND_329[9:0];
  _RAND_330 = {1{`RANDOM}};
  entries_15_cacheable = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  entries_15_lsuOp = _RAND_331[3:0];
  _RAND_332 = {1{`RANDOM}};
  entries_15_pc = _RAND_332[31:0];
  _RAND_333 = {1{`RANDOM}};
  entries_15_pdst = _RAND_333[6:0];
  _RAND_334 = {1{`RANDOM}};
  entries_15_rfWen = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  entries_15_fuType = _RAND_335[3:0];
  _RAND_336 = {1{`RANDOM}};
  enqPtr_value = _RAND_336[3:0];
  _RAND_337 = {1{`RANDOM}};
  enqPtr_flag = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  deqPtr_value = _RAND_338[3:0];
  _RAND_339 = {1{`RANDOM}};
  deqPtr_flag = _RAND_339[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
