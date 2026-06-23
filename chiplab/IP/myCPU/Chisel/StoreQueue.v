module StoreQueue(
  input         clock,
  input         reset,
  input         io_enqValid, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [5:0]  io_enqRobIdx, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [3:0]  io_enqLqIdx, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [31:0] io_enqPc, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input         io_addrWriteValid, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [3:0]  io_addrWriteIdx, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [31:0] io_addrWriteVaddr, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [3:0]  io_addrWriteLsuOp, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input         io_dataWriteValid, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [3:0]  io_dataWriteIdx, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  input  [31:0] io_dataWriteData, // @[src/main/scala/mem/StoreQueue.scala 39:14]
  output        io_full // @[src/main/scala/mem/StoreQueue.scala 39:14]
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
`endif // RANDOMIZE_REG_INIT
  reg [5:0] entries_0_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_0_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_0_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_0_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_0_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_0_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_0_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_0_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_0_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_0_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_1_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_1_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_1_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_1_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_1_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_1_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_1_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_1_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_1_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_1_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_2_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_2_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_2_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_2_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_2_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_2_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_2_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_2_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_2_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_2_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_3_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_3_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_3_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_3_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_3_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_3_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_3_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_3_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_3_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_3_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_4_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_4_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_4_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_4_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_4_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_4_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_4_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_4_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_4_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_4_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_5_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_5_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_5_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_5_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_5_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_5_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_5_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_5_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_5_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_5_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_6_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_6_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_6_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_6_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_6_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_6_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_6_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_6_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_6_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_6_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_7_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_7_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_7_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_7_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_7_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_7_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_7_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_7_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_7_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_7_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_8_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_8_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_8_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_8_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_8_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_8_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_8_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_8_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_8_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_8_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_9_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_9_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_9_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_9_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_9_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_9_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_9_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_9_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_9_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_9_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_10_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_10_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_10_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_10_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_10_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_10_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_10_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_10_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_10_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_10_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_11_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_11_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_11_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_11_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_11_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_11_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_11_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_11_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_11_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_11_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_12_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_12_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_12_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_12_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_12_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_12_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_12_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_12_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_12_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_12_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_13_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_13_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_13_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_13_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_13_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_13_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_13_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_13_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_13_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_13_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_14_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_14_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_14_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_14_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_14_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_14_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_14_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_14_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_14_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_14_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [5:0] entries_15_robIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_15_lqIdx; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_15_valid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_15_addrValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_15_dataValid; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_15_vaddr; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_15_data; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] entries_15_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [31:0] entries_15_pc; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg  entries_15_committed; // @[src/main/scala/mem/StoreQueue.scala 78:20]
  reg [3:0] enqPtr_value; // @[src/main/scala/mem/StoreQueue.scala 81:23]
  reg  enqPtr_flag; // @[src/main/scala/mem/StoreQueue.scala 81:23]
  reg [3:0] deqPtr_value; // @[src/main/scala/mem/StoreQueue.scala 84:23]
  reg  deqPtr_flag; // @[src/main/scala/mem/StoreQueue.scala 84:23]
  wire  _empty_T = deqPtr_value == enqPtr_value; // @[src/main/scala/util/CircularQueuePtr.scala 103:39]
  wire  full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/mem/StoreQueue.scala 94:47]
  wire  enqFire = io_enqValid & ~full; // @[src/main/scala/mem/StoreQueue.scala 103:29]
  wire  _GEN_32 = 4'h0 == enqPtr_value | entries_0_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_33 = 4'h1 == enqPtr_value | entries_1_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_34 = 4'h2 == enqPtr_value | entries_2_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_35 = 4'h3 == enqPtr_value | entries_3_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_36 = 4'h4 == enqPtr_value | entries_4_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_37 = 4'h5 == enqPtr_value | entries_5_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_38 = 4'h6 == enqPtr_value | entries_6_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_39 = 4'h7 == enqPtr_value | entries_7_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_40 = 4'h8 == enqPtr_value | entries_8_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_41 = 4'h9 == enqPtr_value | entries_9_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_42 = 4'ha == enqPtr_value | entries_10_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_43 = 4'hb == enqPtr_value | entries_11_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_44 = 4'hc == enqPtr_value | entries_12_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_45 = 4'hd == enqPtr_value | entries_13_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_46 = 4'he == enqPtr_value | entries_14_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_47 = 4'hf == enqPtr_value | entries_15_valid; // @[src/main/scala/mem/StoreQueue.scala 109:{28,28} 78:20]
  wire  _GEN_48 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_49 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_50 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_51 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_52 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_53 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_54 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_55 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_56 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_57 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_58 = 4'ha == enqPtr_value ? 1'h0 : entries_10_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_59 = 4'hb == enqPtr_value ? 1'h0 : entries_11_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_60 = 4'hc == enqPtr_value ? 1'h0 : entries_12_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_61 = 4'hd == enqPtr_value ? 1'h0 : entries_13_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_62 = 4'he == enqPtr_value ? 1'h0 : entries_14_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_63 = 4'hf == enqPtr_value ? 1'h0 : entries_15_addrValid; // @[src/main/scala/mem/StoreQueue.scala 110:{28,28} 78:20]
  wire  _GEN_64 = 4'h0 == enqPtr_value ? 1'h0 : entries_0_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_65 = 4'h1 == enqPtr_value ? 1'h0 : entries_1_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_66 = 4'h2 == enqPtr_value ? 1'h0 : entries_2_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_67 = 4'h3 == enqPtr_value ? 1'h0 : entries_3_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_68 = 4'h4 == enqPtr_value ? 1'h0 : entries_4_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_69 = 4'h5 == enqPtr_value ? 1'h0 : entries_5_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_70 = 4'h6 == enqPtr_value ? 1'h0 : entries_6_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_71 = 4'h7 == enqPtr_value ? 1'h0 : entries_7_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_72 = 4'h8 == enqPtr_value ? 1'h0 : entries_8_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_73 = 4'h9 == enqPtr_value ? 1'h0 : entries_9_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_74 = 4'ha == enqPtr_value ? 1'h0 : entries_10_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_75 = 4'hb == enqPtr_value ? 1'h0 : entries_11_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_76 = 4'hc == enqPtr_value ? 1'h0 : entries_12_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_77 = 4'hd == enqPtr_value ? 1'h0 : entries_13_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_78 = 4'he == enqPtr_value ? 1'h0 : entries_14_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire  _GEN_79 = 4'hf == enqPtr_value ? 1'h0 : entries_15_dataValid; // @[src/main/scala/mem/StoreQueue.scala 111:{28,28} 78:20]
  wire [31:0] _GEN_80 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_81 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_82 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_83 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_84 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_85 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_86 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_87 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_88 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_89 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_90 = 4'ha == enqPtr_value ? 32'h0 : entries_10_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_91 = 4'hb == enqPtr_value ? 32'h0 : entries_11_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_92 = 4'hc == enqPtr_value ? 32'h0 : entries_12_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_93 = 4'hd == enqPtr_value ? 32'h0 : entries_13_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_94 = 4'he == enqPtr_value ? 32'h0 : entries_14_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_95 = 4'hf == enqPtr_value ? 32'h0 : entries_15_vaddr; // @[src/main/scala/mem/StoreQueue.scala 112:{28,28} 78:20]
  wire [31:0] _GEN_96 = 4'h0 == enqPtr_value ? 32'h0 : entries_0_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_97 = 4'h1 == enqPtr_value ? 32'h0 : entries_1_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_98 = 4'h2 == enqPtr_value ? 32'h0 : entries_2_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_99 = 4'h3 == enqPtr_value ? 32'h0 : entries_3_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_100 = 4'h4 == enqPtr_value ? 32'h0 : entries_4_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_101 = 4'h5 == enqPtr_value ? 32'h0 : entries_5_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_102 = 4'h6 == enqPtr_value ? 32'h0 : entries_6_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_103 = 4'h7 == enqPtr_value ? 32'h0 : entries_7_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_104 = 4'h8 == enqPtr_value ? 32'h0 : entries_8_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_105 = 4'h9 == enqPtr_value ? 32'h0 : entries_9_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_106 = 4'ha == enqPtr_value ? 32'h0 : entries_10_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_107 = 4'hb == enqPtr_value ? 32'h0 : entries_11_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_108 = 4'hc == enqPtr_value ? 32'h0 : entries_12_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_109 = 4'hd == enqPtr_value ? 32'h0 : entries_13_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_110 = 4'he == enqPtr_value ? 32'h0 : entries_14_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [31:0] _GEN_111 = 4'hf == enqPtr_value ? 32'h0 : entries_15_data; // @[src/main/scala/mem/StoreQueue.scala 113:{28,28} 78:20]
  wire [3:0] _GEN_112 = 4'h0 == enqPtr_value ? 4'h0 : entries_0_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_113 = 4'h1 == enqPtr_value ? 4'h0 : entries_1_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_114 = 4'h2 == enqPtr_value ? 4'h0 : entries_2_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_115 = 4'h3 == enqPtr_value ? 4'h0 : entries_3_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_116 = 4'h4 == enqPtr_value ? 4'h0 : entries_4_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_117 = 4'h5 == enqPtr_value ? 4'h0 : entries_5_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_118 = 4'h6 == enqPtr_value ? 4'h0 : entries_6_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_119 = 4'h7 == enqPtr_value ? 4'h0 : entries_7_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_120 = 4'h8 == enqPtr_value ? 4'h0 : entries_8_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_121 = 4'h9 == enqPtr_value ? 4'h0 : entries_9_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_122 = 4'ha == enqPtr_value ? 4'h0 : entries_10_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_123 = 4'hb == enqPtr_value ? 4'h0 : entries_11_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_124 = 4'hc == enqPtr_value ? 4'h0 : entries_12_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_125 = 4'hd == enqPtr_value ? 4'h0 : entries_13_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_126 = 4'he == enqPtr_value ? 4'h0 : entries_14_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [3:0] _GEN_127 = 4'hf == enqPtr_value ? 4'h0 : entries_15_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 114:{28,28} 78:20]
  wire [4:0] enqPtr_newIncValue = enqPtr_value + 4'h1; // @[src/main/scala/util/CircularQueuePtr.scala 83:34]
  wire  enqPtr_wrap = enqPtr_newIncValue >= 5'h10; // @[src/main/scala/util/CircularQueuePtr.scala 86:28]
  wire [3:0] enqPtr_newPtr_value = enqPtr_newIncValue[3:0]; // @[src/main/scala/util/CircularQueuePtr.scala 87:32]
  wire  _GEN_208 = enqFire ? _GEN_48 : entries_0_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_209 = enqFire ? _GEN_49 : entries_1_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_210 = enqFire ? _GEN_50 : entries_2_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_211 = enqFire ? _GEN_51 : entries_3_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_212 = enqFire ? _GEN_52 : entries_4_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_213 = enqFire ? _GEN_53 : entries_5_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_214 = enqFire ? _GEN_54 : entries_6_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_215 = enqFire ? _GEN_55 : entries_7_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_216 = enqFire ? _GEN_56 : entries_8_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_217 = enqFire ? _GEN_57 : entries_9_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_218 = enqFire ? _GEN_58 : entries_10_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_219 = enqFire ? _GEN_59 : entries_11_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_220 = enqFire ? _GEN_60 : entries_12_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_221 = enqFire ? _GEN_61 : entries_13_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_222 = enqFire ? _GEN_62 : entries_14_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_223 = enqFire ? _GEN_63 : entries_15_addrValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_224 = enqFire ? _GEN_64 : entries_0_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_225 = enqFire ? _GEN_65 : entries_1_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_226 = enqFire ? _GEN_66 : entries_2_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_227 = enqFire ? _GEN_67 : entries_3_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_228 = enqFire ? _GEN_68 : entries_4_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_229 = enqFire ? _GEN_69 : entries_5_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_230 = enqFire ? _GEN_70 : entries_6_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_231 = enqFire ? _GEN_71 : entries_7_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_232 = enqFire ? _GEN_72 : entries_8_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_233 = enqFire ? _GEN_73 : entries_9_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_234 = enqFire ? _GEN_74 : entries_10_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_235 = enqFire ? _GEN_75 : entries_11_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_236 = enqFire ? _GEN_76 : entries_12_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_237 = enqFire ? _GEN_77 : entries_13_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_238 = enqFire ? _GEN_78 : entries_14_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_239 = enqFire ? _GEN_79 : entries_15_dataValid; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_240 = enqFire ? _GEN_80 : entries_0_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_241 = enqFire ? _GEN_81 : entries_1_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_242 = enqFire ? _GEN_82 : entries_2_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_243 = enqFire ? _GEN_83 : entries_3_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_244 = enqFire ? _GEN_84 : entries_4_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_245 = enqFire ? _GEN_85 : entries_5_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_246 = enqFire ? _GEN_86 : entries_6_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_247 = enqFire ? _GEN_87 : entries_7_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_248 = enqFire ? _GEN_88 : entries_8_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_249 = enqFire ? _GEN_89 : entries_9_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_250 = enqFire ? _GEN_90 : entries_10_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_251 = enqFire ? _GEN_91 : entries_11_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_252 = enqFire ? _GEN_92 : entries_12_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_253 = enqFire ? _GEN_93 : entries_13_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_254 = enqFire ? _GEN_94 : entries_14_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_255 = enqFire ? _GEN_95 : entries_15_vaddr; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_256 = enqFire ? _GEN_96 : entries_0_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_257 = enqFire ? _GEN_97 : entries_1_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_258 = enqFire ? _GEN_98 : entries_2_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_259 = enqFire ? _GEN_99 : entries_3_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_260 = enqFire ? _GEN_100 : entries_4_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_261 = enqFire ? _GEN_101 : entries_5_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_262 = enqFire ? _GEN_102 : entries_6_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_263 = enqFire ? _GEN_103 : entries_7_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_264 = enqFire ? _GEN_104 : entries_8_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_265 = enqFire ? _GEN_105 : entries_9_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_266 = enqFire ? _GEN_106 : entries_10_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_267 = enqFire ? _GEN_107 : entries_11_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_268 = enqFire ? _GEN_108 : entries_12_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_269 = enqFire ? _GEN_109 : entries_13_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_270 = enqFire ? _GEN_110 : entries_14_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [31:0] _GEN_271 = enqFire ? _GEN_111 : entries_15_data; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_272 = enqFire ? _GEN_112 : entries_0_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_273 = enqFire ? _GEN_113 : entries_1_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_274 = enqFire ? _GEN_114 : entries_2_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_275 = enqFire ? _GEN_115 : entries_3_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_276 = enqFire ? _GEN_116 : entries_4_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_277 = enqFire ? _GEN_117 : entries_5_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_278 = enqFire ? _GEN_118 : entries_6_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_279 = enqFire ? _GEN_119 : entries_7_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_280 = enqFire ? _GEN_120 : entries_8_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_281 = enqFire ? _GEN_121 : entries_9_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_282 = enqFire ? _GEN_122 : entries_10_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_283 = enqFire ? _GEN_123 : entries_11_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_284 = enqFire ? _GEN_124 : entries_12_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_285 = enqFire ? _GEN_125 : entries_13_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_286 = enqFire ? _GEN_126 : entries_14_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire [3:0] _GEN_287 = enqFire ? _GEN_127 : entries_15_lsuOp; // @[src/main/scala/mem/StoreQueue.scala 105:17 78:20]
  wire  _GEN_322 = 4'h0 == io_addrWriteIdx | _GEN_208; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_323 = 4'h1 == io_addrWriteIdx | _GEN_209; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_324 = 4'h2 == io_addrWriteIdx | _GEN_210; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_325 = 4'h3 == io_addrWriteIdx | _GEN_211; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_326 = 4'h4 == io_addrWriteIdx | _GEN_212; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_327 = 4'h5 == io_addrWriteIdx | _GEN_213; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_328 = 4'h6 == io_addrWriteIdx | _GEN_214; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_329 = 4'h7 == io_addrWriteIdx | _GEN_215; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_330 = 4'h8 == io_addrWriteIdx | _GEN_216; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_331 = 4'h9 == io_addrWriteIdx | _GEN_217; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_332 = 4'ha == io_addrWriteIdx | _GEN_218; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_333 = 4'hb == io_addrWriteIdx | _GEN_219; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_334 = 4'hc == io_addrWriteIdx | _GEN_220; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_335 = 4'hd == io_addrWriteIdx | _GEN_221; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_336 = 4'he == io_addrWriteIdx | _GEN_222; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_337 = 4'hf == io_addrWriteIdx | _GEN_223; // @[src/main/scala/mem/StoreQueue.scala 128:{28,28}]
  wire  _GEN_418 = 4'h0 == io_dataWriteIdx | _GEN_224; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_419 = 4'h1 == io_dataWriteIdx | _GEN_225; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_420 = 4'h2 == io_dataWriteIdx | _GEN_226; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_421 = 4'h3 == io_dataWriteIdx | _GEN_227; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_422 = 4'h4 == io_dataWriteIdx | _GEN_228; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_423 = 4'h5 == io_dataWriteIdx | _GEN_229; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_424 = 4'h6 == io_dataWriteIdx | _GEN_230; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_425 = 4'h7 == io_dataWriteIdx | _GEN_231; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_426 = 4'h8 == io_dataWriteIdx | _GEN_232; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_427 = 4'h9 == io_dataWriteIdx | _GEN_233; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_428 = 4'ha == io_dataWriteIdx | _GEN_234; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_429 = 4'hb == io_dataWriteIdx | _GEN_235; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_430 = 4'hc == io_dataWriteIdx | _GEN_236; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_431 = 4'hd == io_dataWriteIdx | _GEN_237; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_432 = 4'he == io_dataWriteIdx | _GEN_238; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  wire  _GEN_433 = 4'hf == io_dataWriteIdx | _GEN_239; // @[src/main/scala/mem/StoreQueue.scala 138:{28,28}]
  assign io_full = _empty_T & deqPtr_flag != enqPtr_flag; // @[src/main/scala/mem/StoreQueue.scala 94:47]
  always @(posedge clock) begin
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_0_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_0_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_0_valid <= _GEN_32;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_0_addrValid <= _GEN_322;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_0_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_0_dataValid <= _GEN_418;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_0_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h0 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_0_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_0_vaddr <= _GEN_240;
      end
    end else begin
      entries_0_vaddr <= _GEN_240;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h0 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_0_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_0_data <= _GEN_256;
      end
    end else begin
      entries_0_data <= _GEN_256;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h0 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_0_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_0_lsuOp <= _GEN_272;
      end
    end else begin
      entries_0_lsuOp <= _GEN_272;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_0_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h0 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_0_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_1_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_1_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_1_valid <= _GEN_33;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_1_addrValid <= _GEN_323;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_1_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_1_dataValid <= _GEN_419;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_1_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h1 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_1_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_1_vaddr <= _GEN_241;
      end
    end else begin
      entries_1_vaddr <= _GEN_241;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h1 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_1_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_1_data <= _GEN_257;
      end
    end else begin
      entries_1_data <= _GEN_257;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h1 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_1_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_1_lsuOp <= _GEN_273;
      end
    end else begin
      entries_1_lsuOp <= _GEN_273;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_1_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h1 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_1_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_2_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_2_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_2_valid <= _GEN_34;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_2_addrValid <= _GEN_324;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_2_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_2_dataValid <= _GEN_420;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_2_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h2 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_2_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_2_vaddr <= _GEN_242;
      end
    end else begin
      entries_2_vaddr <= _GEN_242;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h2 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_2_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_2_data <= _GEN_258;
      end
    end else begin
      entries_2_data <= _GEN_258;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h2 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_2_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_2_lsuOp <= _GEN_274;
      end
    end else begin
      entries_2_lsuOp <= _GEN_274;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_2_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h2 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_2_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_3_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_3_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_3_valid <= _GEN_35;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_3_addrValid <= _GEN_325;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_3_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_3_dataValid <= _GEN_421;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_3_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h3 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_3_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_3_vaddr <= _GEN_243;
      end
    end else begin
      entries_3_vaddr <= _GEN_243;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h3 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_3_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_3_data <= _GEN_259;
      end
    end else begin
      entries_3_data <= _GEN_259;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h3 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_3_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_3_lsuOp <= _GEN_275;
      end
    end else begin
      entries_3_lsuOp <= _GEN_275;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_3_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h3 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_3_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_4_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_4_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_4_valid <= _GEN_36;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_4_addrValid <= _GEN_326;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_4_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_4_dataValid <= _GEN_422;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_4_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h4 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_4_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_4_vaddr <= _GEN_244;
      end
    end else begin
      entries_4_vaddr <= _GEN_244;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h4 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_4_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_4_data <= _GEN_260;
      end
    end else begin
      entries_4_data <= _GEN_260;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h4 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_4_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_4_lsuOp <= _GEN_276;
      end
    end else begin
      entries_4_lsuOp <= _GEN_276;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_4_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h4 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_4_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_5_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_5_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_5_valid <= _GEN_37;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_5_addrValid <= _GEN_327;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_5_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_5_dataValid <= _GEN_423;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_5_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h5 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_5_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_5_vaddr <= _GEN_245;
      end
    end else begin
      entries_5_vaddr <= _GEN_245;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h5 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_5_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_5_data <= _GEN_261;
      end
    end else begin
      entries_5_data <= _GEN_261;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h5 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_5_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_5_lsuOp <= _GEN_277;
      end
    end else begin
      entries_5_lsuOp <= _GEN_277;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_5_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h5 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_5_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_6_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_6_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_6_valid <= _GEN_38;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_6_addrValid <= _GEN_328;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_6_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_6_dataValid <= _GEN_424;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_6_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h6 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_6_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_6_vaddr <= _GEN_246;
      end
    end else begin
      entries_6_vaddr <= _GEN_246;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h6 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_6_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_6_data <= _GEN_262;
      end
    end else begin
      entries_6_data <= _GEN_262;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h6 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_6_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_6_lsuOp <= _GEN_278;
      end
    end else begin
      entries_6_lsuOp <= _GEN_278;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_6_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h6 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_6_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_7_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_7_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_7_valid <= _GEN_39;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_7_addrValid <= _GEN_329;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_7_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_7_dataValid <= _GEN_425;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_7_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h7 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_7_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_7_vaddr <= _GEN_247;
      end
    end else begin
      entries_7_vaddr <= _GEN_247;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h7 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_7_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_7_data <= _GEN_263;
      end
    end else begin
      entries_7_data <= _GEN_263;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h7 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_7_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_7_lsuOp <= _GEN_279;
      end
    end else begin
      entries_7_lsuOp <= _GEN_279;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_7_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h7 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_7_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_8_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_8_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_8_valid <= _GEN_40;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_8_addrValid <= _GEN_330;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_8_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_8_dataValid <= _GEN_426;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_8_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h8 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_8_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_8_vaddr <= _GEN_248;
      end
    end else begin
      entries_8_vaddr <= _GEN_248;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h8 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_8_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_8_data <= _GEN_264;
      end
    end else begin
      entries_8_data <= _GEN_264;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h8 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_8_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_8_lsuOp <= _GEN_280;
      end
    end else begin
      entries_8_lsuOp <= _GEN_280;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_8_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h8 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_8_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_9_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_9_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_9_valid <= _GEN_41;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_9_addrValid <= _GEN_331;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_9_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_9_dataValid <= _GEN_427;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_9_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h9 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_9_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_9_vaddr <= _GEN_249;
      end
    end else begin
      entries_9_vaddr <= _GEN_249;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'h9 == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_9_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_9_data <= _GEN_265;
      end
    end else begin
      entries_9_data <= _GEN_265;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'h9 == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_9_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_9_lsuOp <= _GEN_281;
      end
    end else begin
      entries_9_lsuOp <= _GEN_281;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_9_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'h9 == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_9_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_10_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_10_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_10_valid <= _GEN_42;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_10_addrValid <= _GEN_332;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_10_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_10_dataValid <= _GEN_428;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_10_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'ha == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_10_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_10_vaddr <= _GEN_250;
      end
    end else begin
      entries_10_vaddr <= _GEN_250;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'ha == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_10_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_10_data <= _GEN_266;
      end
    end else begin
      entries_10_data <= _GEN_266;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'ha == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_10_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_10_lsuOp <= _GEN_282;
      end
    end else begin
      entries_10_lsuOp <= _GEN_282;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_10_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'ha == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_10_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_11_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_11_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_11_valid <= _GEN_43;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_11_addrValid <= _GEN_333;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_11_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_11_dataValid <= _GEN_429;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_11_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hb == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_11_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_11_vaddr <= _GEN_251;
      end
    end else begin
      entries_11_vaddr <= _GEN_251;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'hb == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_11_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_11_data <= _GEN_267;
      end
    end else begin
      entries_11_data <= _GEN_267;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hb == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_11_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_11_lsuOp <= _GEN_283;
      end
    end else begin
      entries_11_lsuOp <= _GEN_283;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_11_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hb == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_11_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_12_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_12_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_12_valid <= _GEN_44;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_12_addrValid <= _GEN_334;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_12_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_12_dataValid <= _GEN_430;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_12_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hc == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_12_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_12_vaddr <= _GEN_252;
      end
    end else begin
      entries_12_vaddr <= _GEN_252;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'hc == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_12_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_12_data <= _GEN_268;
      end
    end else begin
      entries_12_data <= _GEN_268;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hc == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_12_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_12_lsuOp <= _GEN_284;
      end
    end else begin
      entries_12_lsuOp <= _GEN_284;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_12_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hc == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_12_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_13_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_13_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_13_valid <= _GEN_45;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_13_addrValid <= _GEN_335;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_13_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_13_dataValid <= _GEN_431;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_13_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hd == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_13_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_13_vaddr <= _GEN_253;
      end
    end else begin
      entries_13_vaddr <= _GEN_253;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'hd == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_13_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_13_data <= _GEN_269;
      end
    end else begin
      entries_13_data <= _GEN_269;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hd == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_13_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_13_lsuOp <= _GEN_285;
      end
    end else begin
      entries_13_lsuOp <= _GEN_285;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_13_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hd == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_13_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_14_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_14_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_14_valid <= _GEN_46;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_14_addrValid <= _GEN_336;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_14_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_14_dataValid <= _GEN_432;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_14_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'he == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_14_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_14_vaddr <= _GEN_254;
      end
    end else begin
      entries_14_vaddr <= _GEN_254;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'he == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_14_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_14_data <= _GEN_270;
      end
    end else begin
      entries_14_data <= _GEN_270;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'he == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_14_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_14_lsuOp <= _GEN_286;
      end
    end else begin
      entries_14_lsuOp <= _GEN_286;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_14_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'he == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_14_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 107:28]
        entries_15_robIdx <= io_enqRobIdx; // @[src/main/scala/mem/StoreQueue.scala 107:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 108:28]
        entries_15_lqIdx <= io_enqLqIdx; // @[src/main/scala/mem/StoreQueue.scala 108:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      entries_15_valid <= _GEN_47;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      entries_15_addrValid <= _GEN_337;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 110:28]
        entries_15_addrValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 110:28]
      end
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      entries_15_dataValid <= _GEN_433;
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 111:28]
        entries_15_dataValid <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 111:28]
      end
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hf == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 129:28]
        entries_15_vaddr <= io_addrWriteVaddr; // @[src/main/scala/mem/StoreQueue.scala 129:28]
      end else begin
        entries_15_vaddr <= _GEN_255;
      end
    end else begin
      entries_15_vaddr <= _GEN_255;
    end
    if (io_dataWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 136:27]
      if (4'hf == io_dataWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 139:28]
        entries_15_data <= io_dataWriteData; // @[src/main/scala/mem/StoreQueue.scala 139:28]
      end else begin
        entries_15_data <= _GEN_271;
      end
    end else begin
      entries_15_data <= _GEN_271;
    end
    if (io_addrWriteValid) begin // @[src/main/scala/mem/StoreQueue.scala 126:27]
      if (4'hf == io_addrWriteIdx) begin // @[src/main/scala/mem/StoreQueue.scala 130:28]
        entries_15_lsuOp <= io_addrWriteLsuOp; // @[src/main/scala/mem/StoreQueue.scala 130:28]
      end else begin
        entries_15_lsuOp <= _GEN_287;
      end
    end else begin
      entries_15_lsuOp <= _GEN_287;
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 115:28]
        entries_15_pc <= io_enqPc; // @[src/main/scala/mem/StoreQueue.scala 115:28]
      end
    end
    if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (4'hf == enqPtr_value) begin // @[src/main/scala/mem/StoreQueue.scala 116:28]
        entries_15_committed <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 116:28]
      end
    end
    if (reset) begin // @[src/main/scala/mem/StoreQueue.scala 81:23]
      enqPtr_value <= 4'h0; // @[src/main/scala/mem/StoreQueue.scala 81:23]
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      enqPtr_value <= enqPtr_newPtr_value; // @[src/main/scala/mem/StoreQueue.scala 118:12]
    end
    if (reset) begin // @[src/main/scala/mem/StoreQueue.scala 81:23]
      enqPtr_flag <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 81:23]
    end else if (enqFire) begin // @[src/main/scala/mem/StoreQueue.scala 105:17]
      if (enqPtr_wrap) begin // @[src/main/scala/util/CircularQueuePtr.scala 88:24]
        enqPtr_flag <= ~enqPtr_flag;
      end
    end
    if (reset) begin // @[src/main/scala/mem/StoreQueue.scala 84:23]
      deqPtr_value <= 4'h0; // @[src/main/scala/mem/StoreQueue.scala 84:23]
    end
    if (reset) begin // @[src/main/scala/mem/StoreQueue.scala 84:23]
      deqPtr_flag <= 1'h0; // @[src/main/scala/mem/StoreQueue.scala 84:23]
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
  entries_0_robIdx = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_lqIdx = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_addrValid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_dataValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_vaddr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_lsuOp = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_pc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_committed = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  entries_1_robIdx = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  entries_1_lqIdx = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  entries_1_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_addrValid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_dataValid = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_vaddr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_data = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_lsuOp = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_committed = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  entries_2_robIdx = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  entries_2_lqIdx = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  entries_2_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_2_addrValid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entries_2_dataValid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entries_2_vaddr = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_data = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  entries_2_lsuOp = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  entries_2_pc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  entries_2_committed = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  entries_3_robIdx = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  entries_3_lqIdx = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  entries_3_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entries_3_addrValid = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entries_3_dataValid = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entries_3_vaddr = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  entries_3_data = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entries_3_lsuOp = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  entries_3_pc = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entries_3_committed = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entries_4_robIdx = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  entries_4_lqIdx = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  entries_4_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  entries_4_addrValid = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  entries_4_dataValid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entries_4_vaddr = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  entries_4_data = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  entries_4_lsuOp = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  entries_4_pc = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  entries_4_committed = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_5_robIdx = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  entries_5_lqIdx = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  entries_5_valid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_5_addrValid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  entries_5_dataValid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  entries_5_vaddr = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_5_data = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  entries_5_lsuOp = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  entries_5_pc = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  entries_5_committed = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  entries_6_robIdx = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  entries_6_lqIdx = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  entries_6_valid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  entries_6_addrValid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  entries_6_dataValid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  entries_6_vaddr = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  entries_6_data = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  entries_6_lsuOp = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  entries_6_pc = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  entries_6_committed = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  entries_7_robIdx = _RAND_70[5:0];
  _RAND_71 = {1{`RANDOM}};
  entries_7_lqIdx = _RAND_71[3:0];
  _RAND_72 = {1{`RANDOM}};
  entries_7_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entries_7_addrValid = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  entries_7_dataValid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entries_7_vaddr = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  entries_7_data = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entries_7_lsuOp = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  entries_7_pc = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  entries_7_committed = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  entries_8_robIdx = _RAND_80[5:0];
  _RAND_81 = {1{`RANDOM}};
  entries_8_lqIdx = _RAND_81[3:0];
  _RAND_82 = {1{`RANDOM}};
  entries_8_valid = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  entries_8_addrValid = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  entries_8_dataValid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  entries_8_vaddr = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  entries_8_data = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  entries_8_lsuOp = _RAND_87[3:0];
  _RAND_88 = {1{`RANDOM}};
  entries_8_pc = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  entries_8_committed = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  entries_9_robIdx = _RAND_90[5:0];
  _RAND_91 = {1{`RANDOM}};
  entries_9_lqIdx = _RAND_91[3:0];
  _RAND_92 = {1{`RANDOM}};
  entries_9_valid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  entries_9_addrValid = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entries_9_dataValid = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entries_9_vaddr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  entries_9_data = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  entries_9_lsuOp = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  entries_9_pc = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  entries_9_committed = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  entries_10_robIdx = _RAND_100[5:0];
  _RAND_101 = {1{`RANDOM}};
  entries_10_lqIdx = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  entries_10_valid = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  entries_10_addrValid = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  entries_10_dataValid = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entries_10_vaddr = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  entries_10_data = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  entries_10_lsuOp = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  entries_10_pc = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entries_10_committed = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entries_11_robIdx = _RAND_110[5:0];
  _RAND_111 = {1{`RANDOM}};
  entries_11_lqIdx = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  entries_11_valid = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  entries_11_addrValid = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  entries_11_dataValid = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entries_11_vaddr = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  entries_11_data = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  entries_11_lsuOp = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  entries_11_pc = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  entries_11_committed = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  entries_12_robIdx = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  entries_12_lqIdx = _RAND_121[3:0];
  _RAND_122 = {1{`RANDOM}};
  entries_12_valid = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  entries_12_addrValid = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  entries_12_dataValid = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  entries_12_vaddr = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  entries_12_data = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  entries_12_lsuOp = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  entries_12_pc = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  entries_12_committed = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entries_13_robIdx = _RAND_130[5:0];
  _RAND_131 = {1{`RANDOM}};
  entries_13_lqIdx = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  entries_13_valid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  entries_13_addrValid = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  entries_13_dataValid = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  entries_13_vaddr = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  entries_13_data = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  entries_13_lsuOp = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  entries_13_pc = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  entries_13_committed = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  entries_14_robIdx = _RAND_140[5:0];
  _RAND_141 = {1{`RANDOM}};
  entries_14_lqIdx = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  entries_14_valid = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  entries_14_addrValid = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  entries_14_dataValid = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  entries_14_vaddr = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  entries_14_data = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  entries_14_lsuOp = _RAND_147[3:0];
  _RAND_148 = {1{`RANDOM}};
  entries_14_pc = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  entries_14_committed = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  entries_15_robIdx = _RAND_150[5:0];
  _RAND_151 = {1{`RANDOM}};
  entries_15_lqIdx = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  entries_15_valid = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  entries_15_addrValid = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  entries_15_dataValid = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  entries_15_vaddr = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  entries_15_data = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  entries_15_lsuOp = _RAND_157[3:0];
  _RAND_158 = {1{`RANDOM}};
  entries_15_pc = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  entries_15_committed = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  enqPtr_value = _RAND_160[3:0];
  _RAND_161 = {1{`RANDOM}};
  enqPtr_flag = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  deqPtr_value = _RAND_162[3:0];
  _RAND_163 = {1{`RANDOM}};
  deqPtr_flag = _RAND_163[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
