module IssueQueue_4(
  input        clock,
  input        reset,
  input        io_enq_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0] io_enq_bits_prs1, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0] io_enq_bits_prs2, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_enq_bits_rs1Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_enq_bits_rs2Valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_enq_bits_prs1Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_enq_bits_prs2Busy, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_issue_ready, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output       io_issue_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_wakeupPorts_0_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0] io_wakeupPorts_0_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_wakeupPorts_1_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0] io_wakeupPorts_1_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input        io_wakeupPorts_2_valid, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  input  [6:0] io_wakeupPorts_2_bits_pdst, // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
  output [3:0] io_freeEntries // @[src/main/scala/backend/scheduler/IssueQueue.scala 24:14]
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
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg  valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
  reg [6:0] uops_0_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_0_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_0_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_1_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_1_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_2_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_2_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_3_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_3_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_4_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_4_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_5_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_5_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_6_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_6_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg [6:0] uops_7_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
  reg  uops_7_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 44:20]
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
  wire  wValid = io_wakeupPorts_0_valid & valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_1 = io_wakeupPorts_1_valid & valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_2 = io_wakeupPorts_2_valid & valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_0 = wValid & uops_0_rs1Valid & uops_0_prs1 == io_wakeupPorts_0_bits_pdst | wValid_1 & uops_0_rs1Valid
     & uops_0_prs1 == io_wakeupPorts_1_bits_pdst | wValid_2 & uops_0_rs1Valid & uops_0_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_0 = wValid & uops_0_rs2Valid & uops_0_prs2 == io_wakeupPorts_0_bits_pdst | wValid_1 & uops_0_rs2Valid
     & uops_0_prs2 == io_wakeupPorts_1_bits_pdst | wValid_2 & uops_0_rs2Valid & uops_0_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_4 = io_wakeupPorts_0_valid & valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_5 = io_wakeupPorts_1_valid & valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_6 = io_wakeupPorts_2_valid & valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_1 = wValid_4 & uops_1_rs1Valid & uops_1_prs1 == io_wakeupPorts_0_bits_pdst | wValid_5 & uops_1_rs1Valid
     & uops_1_prs1 == io_wakeupPorts_1_bits_pdst | wValid_6 & uops_1_rs1Valid & uops_1_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_1 = wValid_4 & uops_1_rs2Valid & uops_1_prs2 == io_wakeupPorts_0_bits_pdst | wValid_5 & uops_1_rs2Valid
     & uops_1_prs2 == io_wakeupPorts_1_bits_pdst | wValid_6 & uops_1_rs2Valid & uops_1_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_8 = io_wakeupPorts_0_valid & valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_9 = io_wakeupPorts_1_valid & valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_10 = io_wakeupPorts_2_valid & valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_2 = wValid_8 & uops_2_rs1Valid & uops_2_prs1 == io_wakeupPorts_0_bits_pdst | wValid_9 & uops_2_rs1Valid
     & uops_2_prs1 == io_wakeupPorts_1_bits_pdst | wValid_10 & uops_2_rs1Valid & uops_2_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_2 = wValid_8 & uops_2_rs2Valid & uops_2_prs2 == io_wakeupPorts_0_bits_pdst | wValid_9 & uops_2_rs2Valid
     & uops_2_prs2 == io_wakeupPorts_1_bits_pdst | wValid_10 & uops_2_rs2Valid & uops_2_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_12 = io_wakeupPorts_0_valid & valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_13 = io_wakeupPorts_1_valid & valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_14 = io_wakeupPorts_2_valid & valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_3 = wValid_12 & uops_3_rs1Valid & uops_3_prs1 == io_wakeupPorts_0_bits_pdst | wValid_13 &
    uops_3_rs1Valid & uops_3_prs1 == io_wakeupPorts_1_bits_pdst | wValid_14 & uops_3_rs1Valid & uops_3_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_3 = wValid_12 & uops_3_rs2Valid & uops_3_prs2 == io_wakeupPorts_0_bits_pdst | wValid_13 &
    uops_3_rs2Valid & uops_3_prs2 == io_wakeupPorts_1_bits_pdst | wValid_14 & uops_3_rs2Valid & uops_3_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_16 = io_wakeupPorts_0_valid & valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_17 = io_wakeupPorts_1_valid & valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_18 = io_wakeupPorts_2_valid & valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_4 = wValid_16 & uops_4_rs1Valid & uops_4_prs1 == io_wakeupPorts_0_bits_pdst | wValid_17 &
    uops_4_rs1Valid & uops_4_prs1 == io_wakeupPorts_1_bits_pdst | wValid_18 & uops_4_rs1Valid & uops_4_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_4 = wValid_16 & uops_4_rs2Valid & uops_4_prs2 == io_wakeupPorts_0_bits_pdst | wValid_17 &
    uops_4_rs2Valid & uops_4_prs2 == io_wakeupPorts_1_bits_pdst | wValid_18 & uops_4_rs2Valid & uops_4_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_20 = io_wakeupPorts_0_valid & valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_21 = io_wakeupPorts_1_valid & valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_22 = io_wakeupPorts_2_valid & valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_5 = wValid_20 & uops_5_rs1Valid & uops_5_prs1 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    uops_5_rs1Valid & uops_5_prs1 == io_wakeupPorts_1_bits_pdst | wValid_22 & uops_5_rs1Valid & uops_5_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_5 = wValid_20 & uops_5_rs2Valid & uops_5_prs2 == io_wakeupPorts_0_bits_pdst | wValid_21 &
    uops_5_rs2Valid & uops_5_prs2 == io_wakeupPorts_1_bits_pdst | wValid_22 & uops_5_rs2Valid & uops_5_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_24 = io_wakeupPorts_0_valid & valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_25 = io_wakeupPorts_1_valid & valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_26 = io_wakeupPorts_2_valid & valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_6 = wValid_24 & uops_6_rs1Valid & uops_6_prs1 == io_wakeupPorts_0_bits_pdst | wValid_25 &
    uops_6_rs1Valid & uops_6_prs1 == io_wakeupPorts_1_bits_pdst | wValid_26 & uops_6_rs1Valid & uops_6_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_6 = wValid_24 & uops_6_rs2Valid & uops_6_prs2 == io_wakeupPorts_0_bits_pdst | wValid_25 &
    uops_6_rs2Valid & uops_6_prs2 == io_wakeupPorts_1_bits_pdst | wValid_26 & uops_6_rs2Valid & uops_6_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  wValid_28 = io_wakeupPorts_0_valid & valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_29 = io_wakeupPorts_1_valid & valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  wValid_30 = io_wakeupPorts_2_valid & valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 64:44]
  wire  p1Wakeup_7 = wValid_28 & uops_7_rs1Valid & uops_7_prs1 == io_wakeupPorts_0_bits_pdst | wValid_29 &
    uops_7_rs1Valid & uops_7_prs1 == io_wakeupPorts_1_bits_pdst | wValid_30 & uops_7_rs1Valid & uops_7_prs1 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 65:25]
  wire  p2Wakeup_7 = wValid_28 & uops_7_rs2Valid & uops_7_prs2 == io_wakeupPorts_0_bits_pdst | wValid_29 &
    uops_7_rs2Valid & uops_7_prs2 == io_wakeupPorts_1_bits_pdst | wValid_30 & uops_7_rs2Valid & uops_7_prs2 ==
    io_wakeupPorts_2_bits_pdst; // @[src/main/scala/backend/scheduler/IssueQueue.scala 66:25]
  wire  p1Eff_0 = p1Ready_0 | p1Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_0 = p2Ready_0 | p2Wakeup_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_1 = p1Ready_1 | p1Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_1 = p2Ready_1 | p2Wakeup_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_2 = p1Ready_2 | p1Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_2 = p2Ready_2 | p2Wakeup_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_3 = p1Ready_3 | p1Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_3 = p2Ready_3 | p2Wakeup_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_4 = p1Ready_4 | p1Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_4 = p2Ready_4 | p2Wakeup_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_5 = p1Ready_5 | p1Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_5 = p2Ready_5 | p2Wakeup_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_6 = p1Ready_6 | p1Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_6 = p2Ready_6 | p2Wakeup_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  p1Eff_7 = p1Ready_7 | p1Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 76:28]
  wire  p2Eff_7 = p2Ready_7 | p2Wakeup_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 77:28]
  wire  request_0 = valid_0 & p1Eff_0 & p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_1 = valid_1 & p1Eff_1 & p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_2 = valid_2 & p1Eff_2 & p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_3 = valid_3 & p1Eff_3 & p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_4 = valid_4 & p1Eff_4 & p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_5 = valid_5 & p1Eff_5 & p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_6 = valid_6 & p1Eff_6 & p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
  wire  request_7 = valid_7 & p1Eff_7 & p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 104:40]
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
  wire  validAfterKillGrant_0 = valid_0 & ~(oldest_0 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_1_T_2 = oldest_1 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_1 = valid_1 & ~(oldest_1 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_2_T_2 = oldest_2 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_2 = valid_2 & ~(oldest_2 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_3_T_2 = oldest_3 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_3 = valid_3 & ~(oldest_3 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_4_T_2 = oldest_4 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_4 = valid_4 & ~(oldest_4 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_5_T_2 = oldest_5 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_5 = valid_5 & ~(oldest_5 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_6_T_2 = oldest_6 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_6 = valid_6 & ~(oldest_6 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _validAfterKillGrant_7_T_2 = oldest_7 & issueFire; // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:68]
  wire  validAfterKillGrant_7 = valid_7 & ~(oldest_7 & issueFire); // @[src/main/scala/backend/scheduler/IssueQueue.scala 147:54]
  wire  _T_426 = enqFire & enqIdx == 3'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:24]
  wire  _GEN_0 = enqFire & enqIdx == 3'h0 | valid_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _T_440 = enqFire & enqIdx == 3'h1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_449 = enqFire & enqIdx == 3'h2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_458 = enqFire & enqIdx == 3'h3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_467 = enqFire & enqIdx == 3'h4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_476 = enqFire & enqIdx == 3'h5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_485 = enqFire & enqIdx == 3'h6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _T_494 = enqFire & enqIdx == 3'h7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:26]
  wire  _GEN_88 = _T_440 | valid_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_176 = _T_449 | valid_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_264 = _T_458 | valid_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_352 = _T_467 | valid_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_440 = _T_476 | valid_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_528 = _T_485 | valid_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire  _GEN_616 = _T_494 | valid_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 163:43 164:16 43:24]
  wire [1:0] _io_freeEntries_T = freeMask_0 + freeMask_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_2 = freeMask_2 + freeMask_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [2:0] _io_freeEntries_T_4 = _io_freeEntries_T + _io_freeEntries_T_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_6 = freeMask_4 + freeMask_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [1:0] _io_freeEntries_T_8 = freeMask_6 + freeMask_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  wire [2:0] _io_freeEntries_T_10 = _io_freeEntries_T_6 + _io_freeEntries_T_8; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  assign io_issue_valid = oldest_0 | oldest_1 | oldest_2 | oldest_3 | oldest_4 | oldest_5 | oldest_6 | oldest_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 131:36]
  assign io_freeEntries = _io_freeEntries_T_4 + _io_freeEntries_T_10; // @[src/main/scala/backend/scheduler/IssueQueue.scala 205:29]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_0 <= _GEN_0;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_1 <= _GEN_88;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_2 <= _GEN_176;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_3 <= _GEN_264;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_4 <= _GEN_352;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_5 <= _GEN_440;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_6 <= _GEN_528;
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
      valid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 43:24]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 161:39]
      valid_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 162:16]
    end else begin
      valid_7 <= _GEN_616;
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_0_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_1_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_2_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_3_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_4_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_5_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_6_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_prs1 <= io_enq_bits_prs1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_prs2 <= io_enq_bits_prs2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_rs1Valid <= io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 180:37]
      uops_7_rs2Valid <= io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 181:15]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_0 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_0 <= p1Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_1 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_1 <= p1Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_2 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_2 <= p1Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_3 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_3 <= p1Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_4 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_4 <= p1Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_5 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_5 <= p1Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_6 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_6 <= p1Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
      p1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 45:24]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p1Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 169:18]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p1Ready_7 <= ~io_enq_bits_prs1Busy | ~io_enq_bits_rs1Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 172:18]
    end else begin
      p1Ready_7 <= p1Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 175:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_0 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_0 <= p2Eff_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_1 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_1 <= p2Eff_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_2 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_2 <= p2Eff_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_3 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_3 <= p2Eff_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_4 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_4 <= p2Eff_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_5 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_5 <= p2Eff_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_6 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_6 <= p2Eff_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
      p2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 46:24]
    end else if (_validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 168:68]
      p2Ready_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 170:18]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 171:43]
      p2Ready_7 <= ~io_enq_bits_prs2Busy | ~io_enq_bits_rs2Valid; // @[src/main/scala/backend/scheduler/IssueQueue.scala 173:18]
    end else begin
      p2Ready_7 <= p2Eff_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 176:18]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_1 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_2 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_3 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_4 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_5 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_6 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_0_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_0_7 <= validAfterKillGrant_0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_0_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_0 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_2 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_3 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_4 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_5 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_6 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_1_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_1_7 <= validAfterKillGrant_1; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_440) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_1_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_0 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_1 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_3 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_4 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_5 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_6 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_2_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_2_7 <= validAfterKillGrant_2; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_449) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_2_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_0 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_1 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_2 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_4 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_5 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_6 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_3_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_3_7 <= validAfterKillGrant_3; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_458) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_3_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_0 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_1 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_2 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_3 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_5 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_6 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_4_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_4_7 <= validAfterKillGrant_4; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_467) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_4_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_0 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_1 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_2 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_3 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_4 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h6) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_6 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_5_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_5_7 <= validAfterKillGrant_5; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_476) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_5_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_0 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_1 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_2 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_3 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_4 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_5 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_6_T_2 | _validAfterKillGrant_7_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h7) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_6_7 <= validAfterKillGrant_6; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_485) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_6_7 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_0_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (_T_426) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_0 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_0 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_1_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h1) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_1 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_1 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_2_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_2 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_2 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_3_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h3) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_3 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_3 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_4_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h4) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_4 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_4 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_5_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 190:19]
    end else if (enqFire & enqIdx == 3'h5) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 191:45]
      age_7_5 <= validAfterKillGrant_7; // @[src/main/scala/backend/scheduler/IssueQueue.scala 193:19]
    end else if (_T_494) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 194:45]
      age_7_5 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 196:19]
    end
    if (reset) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
      age_7_6 <= 1'h0; // @[src/main/scala/backend/scheduler/IssueQueue.scala 51:20]
    end else if (_validAfterKillGrant_7_T_2 | _validAfterKillGrant_6_T_2) begin // @[src/main/scala/backend/scheduler/IssueQueue.scala 189:96]
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
  uops_0_prs1 = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_rs1Valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_rs2Valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  uops_1_rs1Valid = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  uops_1_rs2Valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  uops_2_rs1Valid = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uops_2_rs2Valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_20[6:0];
  _RAND_21 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_21[6:0];
  _RAND_22 = {1{`RANDOM}};
  uops_3_rs1Valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uops_3_rs2Valid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  uops_4_rs1Valid = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uops_4_rs2Valid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_28[6:0];
  _RAND_29 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_29[6:0];
  _RAND_30 = {1{`RANDOM}};
  uops_5_rs1Valid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  uops_5_rs2Valid = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_32[6:0];
  _RAND_33 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_33[6:0];
  _RAND_34 = {1{`RANDOM}};
  uops_6_rs1Valid = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  uops_6_rs2Valid = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  uops_7_prs1 = _RAND_36[6:0];
  _RAND_37 = {1{`RANDOM}};
  uops_7_prs2 = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  uops_7_rs1Valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uops_7_rs2Valid = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  p1Ready_0 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  p1Ready_1 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  p1Ready_2 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  p1Ready_3 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  p1Ready_4 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  p1Ready_5 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  p1Ready_6 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  p1Ready_7 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  p2Ready_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  p2Ready_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  p2Ready_2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  p2Ready_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  p2Ready_4 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  p2Ready_5 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  p2Ready_6 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  p2Ready_7 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  age_0_1 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  age_0_2 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  age_0_3 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  age_0_4 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  age_0_5 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  age_0_6 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  age_0_7 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  age_1_0 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  age_1_2 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  age_1_3 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  age_1_4 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  age_1_5 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  age_1_6 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  age_1_7 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  age_2_0 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  age_2_1 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  age_2_3 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  age_2_4 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  age_2_5 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  age_2_6 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  age_2_7 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  age_3_0 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  age_3_1 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  age_3_2 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  age_3_4 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  age_3_5 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  age_3_6 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  age_3_7 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  age_4_0 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  age_4_1 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  age_4_2 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  age_4_3 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  age_4_5 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  age_4_6 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  age_4_7 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  age_5_0 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  age_5_1 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  age_5_2 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  age_5_3 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  age_5_4 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  age_5_6 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  age_5_7 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  age_6_0 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  age_6_1 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  age_6_2 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  age_6_3 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  age_6_4 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  age_6_5 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  age_6_7 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  age_7_0 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  age_7_1 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  age_7_2 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  age_7_3 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  age_7_4 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  age_7_5 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  age_7_6 = _RAND_111[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
