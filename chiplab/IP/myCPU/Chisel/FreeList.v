module FreeList(
  input        clock,
  input        reset,
  input        io_allocReqs_0, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_allocReqs_1, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_allocReqs_2, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  output [5:0] io_allocPdest_0_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  output [5:0] io_allocPdest_1_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  output [5:0] io_allocPdest_2_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  output       io_canAlloc, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_doAlloc, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_deallocReqs_0_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [5:0] io_deallocReqs_0_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_deallocReqs_1_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [5:0] io_deallocReqs_1_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_deallocReqs_2_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [5:0] io_deallocReqs_2_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_renBrTags_0_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [2:0] io_renBrTags_0_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_renBrTags_1_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [2:0] io_renBrTags_1_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_renBrTags_2_valid, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [2:0] io_renBrTags_2_bits, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input        io_brMispredict, // @[src/main/scala/backend/rename/FreeList.scala 32:14]
  input  [2:0] io_brMispredTag // @[src/main/scala/backend/rename/FreeList.scala 32:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] freeList; // @[src/main/scala/backend/rename/FreeList.scala 38:25]
  reg [63:0] allocsAfterBr_0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_1; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_2; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_3; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_4; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_5; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_6; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  reg [63:0] allocsAfterBr_7; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
  wire [63:0] _selPregs_0_T_64 = freeList[63] ? 64'h8000000000000000 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_65 = freeList[62] ? 64'h4000000000000000 : _selPregs_0_T_64; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_66 = freeList[61] ? 64'h2000000000000000 : _selPregs_0_T_65; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_67 = freeList[60] ? 64'h1000000000000000 : _selPregs_0_T_66; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_68 = freeList[59] ? 64'h800000000000000 : _selPregs_0_T_67; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_69 = freeList[58] ? 64'h400000000000000 : _selPregs_0_T_68; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_70 = freeList[57] ? 64'h200000000000000 : _selPregs_0_T_69; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_71 = freeList[56] ? 64'h100000000000000 : _selPregs_0_T_70; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_72 = freeList[55] ? 64'h80000000000000 : _selPregs_0_T_71; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_73 = freeList[54] ? 64'h40000000000000 : _selPregs_0_T_72; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_74 = freeList[53] ? 64'h20000000000000 : _selPregs_0_T_73; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_75 = freeList[52] ? 64'h10000000000000 : _selPregs_0_T_74; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_76 = freeList[51] ? 64'h8000000000000 : _selPregs_0_T_75; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_77 = freeList[50] ? 64'h4000000000000 : _selPregs_0_T_76; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_78 = freeList[49] ? 64'h2000000000000 : _selPregs_0_T_77; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_79 = freeList[48] ? 64'h1000000000000 : _selPregs_0_T_78; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_80 = freeList[47] ? 64'h800000000000 : _selPregs_0_T_79; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_81 = freeList[46] ? 64'h400000000000 : _selPregs_0_T_80; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_82 = freeList[45] ? 64'h200000000000 : _selPregs_0_T_81; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_83 = freeList[44] ? 64'h100000000000 : _selPregs_0_T_82; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_84 = freeList[43] ? 64'h80000000000 : _selPregs_0_T_83; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_85 = freeList[42] ? 64'h40000000000 : _selPregs_0_T_84; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_86 = freeList[41] ? 64'h20000000000 : _selPregs_0_T_85; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_87 = freeList[40] ? 64'h10000000000 : _selPregs_0_T_86; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_88 = freeList[39] ? 64'h8000000000 : _selPregs_0_T_87; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_89 = freeList[38] ? 64'h4000000000 : _selPregs_0_T_88; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_90 = freeList[37] ? 64'h2000000000 : _selPregs_0_T_89; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_91 = freeList[36] ? 64'h1000000000 : _selPregs_0_T_90; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_92 = freeList[35] ? 64'h800000000 : _selPregs_0_T_91; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_93 = freeList[34] ? 64'h400000000 : _selPregs_0_T_92; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_94 = freeList[33] ? 64'h200000000 : _selPregs_0_T_93; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_95 = freeList[32] ? 64'h100000000 : _selPregs_0_T_94; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_96 = freeList[31] ? 64'h80000000 : _selPregs_0_T_95; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_97 = freeList[30] ? 64'h40000000 : _selPregs_0_T_96; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_98 = freeList[29] ? 64'h20000000 : _selPregs_0_T_97; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_99 = freeList[28] ? 64'h10000000 : _selPregs_0_T_98; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_100 = freeList[27] ? 64'h8000000 : _selPregs_0_T_99; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_101 = freeList[26] ? 64'h4000000 : _selPregs_0_T_100; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_102 = freeList[25] ? 64'h2000000 : _selPregs_0_T_101; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_103 = freeList[24] ? 64'h1000000 : _selPregs_0_T_102; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_104 = freeList[23] ? 64'h800000 : _selPregs_0_T_103; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_105 = freeList[22] ? 64'h400000 : _selPregs_0_T_104; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_106 = freeList[21] ? 64'h200000 : _selPregs_0_T_105; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_107 = freeList[20] ? 64'h100000 : _selPregs_0_T_106; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_108 = freeList[19] ? 64'h80000 : _selPregs_0_T_107; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_109 = freeList[18] ? 64'h40000 : _selPregs_0_T_108; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_110 = freeList[17] ? 64'h20000 : _selPregs_0_T_109; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_111 = freeList[16] ? 64'h10000 : _selPregs_0_T_110; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_112 = freeList[15] ? 64'h8000 : _selPregs_0_T_111; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_113 = freeList[14] ? 64'h4000 : _selPregs_0_T_112; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_114 = freeList[13] ? 64'h2000 : _selPregs_0_T_113; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_115 = freeList[12] ? 64'h1000 : _selPregs_0_T_114; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_116 = freeList[11] ? 64'h800 : _selPregs_0_T_115; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_117 = freeList[10] ? 64'h400 : _selPregs_0_T_116; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_118 = freeList[9] ? 64'h200 : _selPregs_0_T_117; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_119 = freeList[8] ? 64'h100 : _selPregs_0_T_118; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_120 = freeList[7] ? 64'h80 : _selPregs_0_T_119; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_121 = freeList[6] ? 64'h40 : _selPregs_0_T_120; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_122 = freeList[5] ? 64'h20 : _selPregs_0_T_121; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_123 = freeList[4] ? 64'h10 : _selPregs_0_T_122; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_124 = freeList[3] ? 64'h8 : _selPregs_0_T_123; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_125 = freeList[2] ? 64'h4 : _selPregs_0_T_124; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_0_T_126 = freeList[1] ? 64'h2 : _selPregs_0_T_125; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] selPregs_0 = freeList[0] ? 64'h1 : _selPregs_0_T_126; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  selPregsValid_0 = |selPregs_0; // @[src/main/scala/backend/rename/FreeList.scala 52:46]
  wire [63:0] _T = ~selPregs_0; // @[src/main/scala/backend/rename/FreeList.scala 57:28]
  wire [63:0] _T_1 = freeList & _T; // @[src/main/scala/backend/rename/FreeList.scala 57:25]
  wire [63:0] _selPregs_1_T_64 = _T_1[63] ? 64'h8000000000000000 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_65 = _T_1[62] ? 64'h4000000000000000 : _selPregs_1_T_64; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_66 = _T_1[61] ? 64'h2000000000000000 : _selPregs_1_T_65; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_67 = _T_1[60] ? 64'h1000000000000000 : _selPregs_1_T_66; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_68 = _T_1[59] ? 64'h800000000000000 : _selPregs_1_T_67; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_69 = _T_1[58] ? 64'h400000000000000 : _selPregs_1_T_68; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_70 = _T_1[57] ? 64'h200000000000000 : _selPregs_1_T_69; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_71 = _T_1[56] ? 64'h100000000000000 : _selPregs_1_T_70; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_72 = _T_1[55] ? 64'h80000000000000 : _selPregs_1_T_71; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_73 = _T_1[54] ? 64'h40000000000000 : _selPregs_1_T_72; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_74 = _T_1[53] ? 64'h20000000000000 : _selPregs_1_T_73; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_75 = _T_1[52] ? 64'h10000000000000 : _selPregs_1_T_74; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_76 = _T_1[51] ? 64'h8000000000000 : _selPregs_1_T_75; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_77 = _T_1[50] ? 64'h4000000000000 : _selPregs_1_T_76; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_78 = _T_1[49] ? 64'h2000000000000 : _selPregs_1_T_77; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_79 = _T_1[48] ? 64'h1000000000000 : _selPregs_1_T_78; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_80 = _T_1[47] ? 64'h800000000000 : _selPregs_1_T_79; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_81 = _T_1[46] ? 64'h400000000000 : _selPregs_1_T_80; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_82 = _T_1[45] ? 64'h200000000000 : _selPregs_1_T_81; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_83 = _T_1[44] ? 64'h100000000000 : _selPregs_1_T_82; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_84 = _T_1[43] ? 64'h80000000000 : _selPregs_1_T_83; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_85 = _T_1[42] ? 64'h40000000000 : _selPregs_1_T_84; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_86 = _T_1[41] ? 64'h20000000000 : _selPregs_1_T_85; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_87 = _T_1[40] ? 64'h10000000000 : _selPregs_1_T_86; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_88 = _T_1[39] ? 64'h8000000000 : _selPregs_1_T_87; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_89 = _T_1[38] ? 64'h4000000000 : _selPregs_1_T_88; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_90 = _T_1[37] ? 64'h2000000000 : _selPregs_1_T_89; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_91 = _T_1[36] ? 64'h1000000000 : _selPregs_1_T_90; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_92 = _T_1[35] ? 64'h800000000 : _selPregs_1_T_91; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_93 = _T_1[34] ? 64'h400000000 : _selPregs_1_T_92; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_94 = _T_1[33] ? 64'h200000000 : _selPregs_1_T_93; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_95 = _T_1[32] ? 64'h100000000 : _selPregs_1_T_94; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_96 = _T_1[31] ? 64'h80000000 : _selPregs_1_T_95; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_97 = _T_1[30] ? 64'h40000000 : _selPregs_1_T_96; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_98 = _T_1[29] ? 64'h20000000 : _selPregs_1_T_97; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_99 = _T_1[28] ? 64'h10000000 : _selPregs_1_T_98; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_100 = _T_1[27] ? 64'h8000000 : _selPregs_1_T_99; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_101 = _T_1[26] ? 64'h4000000 : _selPregs_1_T_100; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_102 = _T_1[25] ? 64'h2000000 : _selPregs_1_T_101; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_103 = _T_1[24] ? 64'h1000000 : _selPregs_1_T_102; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_104 = _T_1[23] ? 64'h800000 : _selPregs_1_T_103; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_105 = _T_1[22] ? 64'h400000 : _selPregs_1_T_104; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_106 = _T_1[21] ? 64'h200000 : _selPregs_1_T_105; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_107 = _T_1[20] ? 64'h100000 : _selPregs_1_T_106; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_108 = _T_1[19] ? 64'h80000 : _selPregs_1_T_107; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_109 = _T_1[18] ? 64'h40000 : _selPregs_1_T_108; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_110 = _T_1[17] ? 64'h20000 : _selPregs_1_T_109; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_111 = _T_1[16] ? 64'h10000 : _selPregs_1_T_110; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_112 = _T_1[15] ? 64'h8000 : _selPregs_1_T_111; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_113 = _T_1[14] ? 64'h4000 : _selPregs_1_T_112; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_114 = _T_1[13] ? 64'h2000 : _selPregs_1_T_113; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_115 = _T_1[12] ? 64'h1000 : _selPregs_1_T_114; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_116 = _T_1[11] ? 64'h800 : _selPregs_1_T_115; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_117 = _T_1[10] ? 64'h400 : _selPregs_1_T_116; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_118 = _T_1[9] ? 64'h200 : _selPregs_1_T_117; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_119 = _T_1[8] ? 64'h100 : _selPregs_1_T_118; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_120 = _T_1[7] ? 64'h80 : _selPregs_1_T_119; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_121 = _T_1[6] ? 64'h40 : _selPregs_1_T_120; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_122 = _T_1[5] ? 64'h20 : _selPregs_1_T_121; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_123 = _T_1[4] ? 64'h10 : _selPregs_1_T_122; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_124 = _T_1[3] ? 64'h8 : _selPregs_1_T_123; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_125 = _T_1[2] ? 64'h4 : _selPregs_1_T_124; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_1_T_126 = _T_1[1] ? 64'h2 : _selPregs_1_T_125; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] selPregs_1 = _T_1[0] ? 64'h1 : _selPregs_1_T_126; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  selPregsValid_1 = |selPregs_1; // @[src/main/scala/backend/rename/FreeList.scala 52:46]
  wire [63:0] _T_2 = ~selPregs_1; // @[src/main/scala/backend/rename/FreeList.scala 57:28]
  wire [63:0] _T_3 = _T_1 & _T_2; // @[src/main/scala/backend/rename/FreeList.scala 57:25]
  wire [63:0] _selPregs_2_T_64 = _T_3[63] ? 64'h8000000000000000 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_65 = _T_3[62] ? 64'h4000000000000000 : _selPregs_2_T_64; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_66 = _T_3[61] ? 64'h2000000000000000 : _selPregs_2_T_65; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_67 = _T_3[60] ? 64'h1000000000000000 : _selPregs_2_T_66; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_68 = _T_3[59] ? 64'h800000000000000 : _selPregs_2_T_67; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_69 = _T_3[58] ? 64'h400000000000000 : _selPregs_2_T_68; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_70 = _T_3[57] ? 64'h200000000000000 : _selPregs_2_T_69; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_71 = _T_3[56] ? 64'h100000000000000 : _selPregs_2_T_70; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_72 = _T_3[55] ? 64'h80000000000000 : _selPregs_2_T_71; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_73 = _T_3[54] ? 64'h40000000000000 : _selPregs_2_T_72; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_74 = _T_3[53] ? 64'h20000000000000 : _selPregs_2_T_73; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_75 = _T_3[52] ? 64'h10000000000000 : _selPregs_2_T_74; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_76 = _T_3[51] ? 64'h8000000000000 : _selPregs_2_T_75; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_77 = _T_3[50] ? 64'h4000000000000 : _selPregs_2_T_76; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_78 = _T_3[49] ? 64'h2000000000000 : _selPregs_2_T_77; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_79 = _T_3[48] ? 64'h1000000000000 : _selPregs_2_T_78; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_80 = _T_3[47] ? 64'h800000000000 : _selPregs_2_T_79; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_81 = _T_3[46] ? 64'h400000000000 : _selPregs_2_T_80; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_82 = _T_3[45] ? 64'h200000000000 : _selPregs_2_T_81; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_83 = _T_3[44] ? 64'h100000000000 : _selPregs_2_T_82; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_84 = _T_3[43] ? 64'h80000000000 : _selPregs_2_T_83; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_85 = _T_3[42] ? 64'h40000000000 : _selPregs_2_T_84; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_86 = _T_3[41] ? 64'h20000000000 : _selPregs_2_T_85; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_87 = _T_3[40] ? 64'h10000000000 : _selPregs_2_T_86; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_88 = _T_3[39] ? 64'h8000000000 : _selPregs_2_T_87; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_89 = _T_3[38] ? 64'h4000000000 : _selPregs_2_T_88; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_90 = _T_3[37] ? 64'h2000000000 : _selPregs_2_T_89; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_91 = _T_3[36] ? 64'h1000000000 : _selPregs_2_T_90; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_92 = _T_3[35] ? 64'h800000000 : _selPregs_2_T_91; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_93 = _T_3[34] ? 64'h400000000 : _selPregs_2_T_92; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_94 = _T_3[33] ? 64'h200000000 : _selPregs_2_T_93; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_95 = _T_3[32] ? 64'h100000000 : _selPregs_2_T_94; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_96 = _T_3[31] ? 64'h80000000 : _selPregs_2_T_95; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_97 = _T_3[30] ? 64'h40000000 : _selPregs_2_T_96; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_98 = _T_3[29] ? 64'h20000000 : _selPregs_2_T_97; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_99 = _T_3[28] ? 64'h10000000 : _selPregs_2_T_98; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_100 = _T_3[27] ? 64'h8000000 : _selPregs_2_T_99; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_101 = _T_3[26] ? 64'h4000000 : _selPregs_2_T_100; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_102 = _T_3[25] ? 64'h2000000 : _selPregs_2_T_101; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_103 = _T_3[24] ? 64'h1000000 : _selPregs_2_T_102; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_104 = _T_3[23] ? 64'h800000 : _selPregs_2_T_103; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_105 = _T_3[22] ? 64'h400000 : _selPregs_2_T_104; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_106 = _T_3[21] ? 64'h200000 : _selPregs_2_T_105; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_107 = _T_3[20] ? 64'h100000 : _selPregs_2_T_106; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_108 = _T_3[19] ? 64'h80000 : _selPregs_2_T_107; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_109 = _T_3[18] ? 64'h40000 : _selPregs_2_T_108; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_110 = _T_3[17] ? 64'h20000 : _selPregs_2_T_109; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_111 = _T_3[16] ? 64'h10000 : _selPregs_2_T_110; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_112 = _T_3[15] ? 64'h8000 : _selPregs_2_T_111; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_113 = _T_3[14] ? 64'h4000 : _selPregs_2_T_112; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_114 = _T_3[13] ? 64'h2000 : _selPregs_2_T_113; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_115 = _T_3[12] ? 64'h1000 : _selPregs_2_T_114; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_116 = _T_3[11] ? 64'h800 : _selPregs_2_T_115; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_117 = _T_3[10] ? 64'h400 : _selPregs_2_T_116; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_118 = _T_3[9] ? 64'h200 : _selPregs_2_T_117; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_119 = _T_3[8] ? 64'h100 : _selPregs_2_T_118; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_120 = _T_3[7] ? 64'h80 : _selPregs_2_T_119; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_121 = _T_3[6] ? 64'h40 : _selPregs_2_T_120; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_122 = _T_3[5] ? 64'h20 : _selPregs_2_T_121; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_123 = _T_3[4] ? 64'h10 : _selPregs_2_T_122; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_124 = _T_3[3] ? 64'h8 : _selPregs_2_T_123; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_125 = _T_3[2] ? 64'h4 : _selPregs_2_T_124; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] _selPregs_2_T_126 = _T_3[1] ? 64'h2 : _selPregs_2_T_125; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [63:0] selPregs_2 = _T_3[0] ? 64'h1 : _selPregs_2_T_126; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire  selPregsValid_2 = |selPregs_2; // @[src/main/scala/backend/rename/FreeList.scala 52:46]
  reg  regValids_0; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
  reg  regValids_1; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
  reg  regValids_2; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
  reg [5:0] regIndices_0; // @[src/main/scala/backend/rename/FreeList.scala 64:48]
  reg [5:0] regIndices_1; // @[src/main/scala/backend/rename/FreeList.scala 64:48]
  reg [5:0] regIndices_2; // @[src/main/scala/backend/rename/FreeList.scala 64:48]
  wire  selPregFire_0 = (~regValids_0 | io_allocReqs_0) & selPregsValid_0; // @[src/main/scala/backend/rename/FreeList.scala 70:28]
  wire  selPregFire_1 = (~regValids_1 | io_allocReqs_1) & selPregsValid_1; // @[src/main/scala/backend/rename/FreeList.scala 70:28]
  wire  selPregFire_2 = (~regValids_2 | io_allocReqs_2) & selPregsValid_2; // @[src/main/scala/backend/rename/FreeList.scala 70:28]
  wire  _regValids_0_T = ~io_allocReqs_0; // @[src/main/scala/backend/rename/FreeList.scala 77:44]
  wire  _regValids_1_T = ~io_allocReqs_1; // @[src/main/scala/backend/rename/FreeList.scala 77:44]
  wire  _regValids_2_T = ~io_allocReqs_2; // @[src/main/scala/backend/rename/FreeList.scala 77:44]
  wire [31:0] regIndices_0_hi = selPregs_0[63:32]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [31:0] regIndices_0_lo = selPregs_0[31:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [31:0] _regIndices_0_T_1 = regIndices_0_hi | regIndices_0_lo; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [15:0] regIndices_0_hi_1 = _regIndices_0_T_1[31:16]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [15:0] regIndices_0_lo_1 = _regIndices_0_T_1[15:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [15:0] _regIndices_0_T_3 = regIndices_0_hi_1 | regIndices_0_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [7:0] regIndices_0_hi_2 = _regIndices_0_T_3[15:8]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [7:0] regIndices_0_lo_2 = _regIndices_0_T_3[7:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [7:0] _regIndices_0_T_5 = regIndices_0_hi_2 | regIndices_0_lo_2; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [3:0] regIndices_0_hi_3 = _regIndices_0_T_5[7:4]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [3:0] regIndices_0_lo_3 = _regIndices_0_T_5[3:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [3:0] _regIndices_0_T_7 = regIndices_0_hi_3 | regIndices_0_lo_3; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] regIndices_0_hi_4 = _regIndices_0_T_7[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] regIndices_0_lo_4 = _regIndices_0_T_7[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _regIndices_0_T_9 = regIndices_0_hi_4 | regIndices_0_lo_4; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [5:0] _regIndices_0_T_15 = {|regIndices_0_hi,|regIndices_0_hi_1,|regIndices_0_hi_2,|regIndices_0_hi_3,|
    regIndices_0_hi_4,_regIndices_0_T_9[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire [31:0] regIndices_1_hi = selPregs_1[63:32]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [31:0] regIndices_1_lo = selPregs_1[31:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [31:0] _regIndices_1_T_1 = regIndices_1_hi | regIndices_1_lo; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [15:0] regIndices_1_hi_1 = _regIndices_1_T_1[31:16]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [15:0] regIndices_1_lo_1 = _regIndices_1_T_1[15:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [15:0] _regIndices_1_T_3 = regIndices_1_hi_1 | regIndices_1_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [7:0] regIndices_1_hi_2 = _regIndices_1_T_3[15:8]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [7:0] regIndices_1_lo_2 = _regIndices_1_T_3[7:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [7:0] _regIndices_1_T_5 = regIndices_1_hi_2 | regIndices_1_lo_2; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [3:0] regIndices_1_hi_3 = _regIndices_1_T_5[7:4]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [3:0] regIndices_1_lo_3 = _regIndices_1_T_5[3:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [3:0] _regIndices_1_T_7 = regIndices_1_hi_3 | regIndices_1_lo_3; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] regIndices_1_hi_4 = _regIndices_1_T_7[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] regIndices_1_lo_4 = _regIndices_1_T_7[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _regIndices_1_T_9 = regIndices_1_hi_4 | regIndices_1_lo_4; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [5:0] _regIndices_1_T_15 = {|regIndices_1_hi,|regIndices_1_hi_1,|regIndices_1_hi_2,|regIndices_1_hi_3,|
    regIndices_1_hi_4,_regIndices_1_T_9[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire [31:0] regIndices_2_hi = selPregs_2[63:32]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [31:0] regIndices_2_lo = selPregs_2[31:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [31:0] _regIndices_2_T_1 = regIndices_2_hi | regIndices_2_lo; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [15:0] regIndices_2_hi_1 = _regIndices_2_T_1[31:16]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [15:0] regIndices_2_lo_1 = _regIndices_2_T_1[15:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [15:0] _regIndices_2_T_3 = regIndices_2_hi_1 | regIndices_2_lo_1; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [7:0] regIndices_2_hi_2 = _regIndices_2_T_3[15:8]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [7:0] regIndices_2_lo_2 = _regIndices_2_T_3[7:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [7:0] _regIndices_2_T_5 = regIndices_2_hi_2 | regIndices_2_lo_2; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [3:0] regIndices_2_hi_3 = _regIndices_2_T_5[7:4]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [3:0] regIndices_2_lo_3 = _regIndices_2_T_5[3:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [3:0] _regIndices_2_T_7 = regIndices_2_hi_3 | regIndices_2_lo_3; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [1:0] regIndices_2_hi_4 = _regIndices_2_T_7[3:2]; // @[src/main/scala/chisel3/util/OneHot.scala 30:18]
  wire [1:0] regIndices_2_lo_4 = _regIndices_2_T_7[1:0]; // @[src/main/scala/chisel3/util/OneHot.scala 31:18]
  wire [1:0] _regIndices_2_T_9 = regIndices_2_hi_4 | regIndices_2_lo_4; // @[src/main/scala/chisel3/util/OneHot.scala 32:28]
  wire [5:0] _regIndices_2_T_15 = {|regIndices_2_hi,|regIndices_2_hi_1,|regIndices_2_hi_2,|regIndices_2_hi_3,|
    regIndices_2_hi_4,_regIndices_2_T_9[1]}; // @[src/main/scala/chisel3/util/OneHot.scala 32:10]
  wire  _io_canAlloc_T_1 = _regValids_0_T | regValids_0; // @[src/main/scala/backend/rename/FreeList.scala 91:66]
  wire  _io_canAlloc_T_3 = _regValids_1_T | regValids_1; // @[src/main/scala/backend/rename/FreeList.scala 91:66]
  wire  _io_canAlloc_T_5 = _regValids_2_T | regValids_2; // @[src/main/scala/backend/rename/FreeList.scala 91:66]
  wire [2:0] _io_canAlloc_T_6 = {_io_canAlloc_T_5,_io_canAlloc_T_3,_io_canAlloc_T_1}; // @[src/main/scala/backend/rename/FreeList.scala 92:5]
  wire [63:0] allocOHs_0 = 64'h1 << regIndices_0; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] allocOHs_1 = 64'h1 << regIndices_1; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] allocOHs_2 = 64'h1 << regIndices_2; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] allocMasks_2 = io_allocReqs_2 & io_doAlloc ? allocOHs_2 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 112:10]
  wire [63:0] _allocMasks_T_3 = allocOHs_1 | allocMasks_2; // @[src/main/scala/backend/rename/FreeList.scala 112:33]
  wire [63:0] allocMasks_1 = io_allocReqs_1 & io_doAlloc ? _allocMasks_T_3 : allocMasks_2; // @[src/main/scala/backend/rename/FreeList.scala 112:10]
  wire [63:0] _allocMasks_T_5 = allocOHs_0 | allocMasks_1; // @[src/main/scala/backend/rename/FreeList.scala 112:33]
  wire [63:0] allocMasks_0 = io_allocReqs_0 & io_doAlloc ? _allocMasks_T_5 : allocMasks_1; // @[src/main/scala/backend/rename/FreeList.scala 112:10]
  wire [63:0] _GEN_4 = 3'h1 == io_brMispredTag ? allocsAfterBr_1 : allocsAfterBr_0; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_5 = 3'h2 == io_brMispredTag ? allocsAfterBr_2 : _GEN_4; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_6 = 3'h3 == io_brMispredTag ? allocsAfterBr_3 : _GEN_5; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_7 = 3'h4 == io_brMispredTag ? allocsAfterBr_4 : _GEN_6; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_8 = 3'h5 == io_brMispredTag ? allocsAfterBr_5 : _GEN_7; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_9 = 3'h6 == io_brMispredTag ? allocsAfterBr_6 : _GEN_8; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] _GEN_10 = 3'h7 == io_brMispredTag ? allocsAfterBr_7 : _GEN_9; // @[src/main/scala/backend/rename/FreeList.scala 116:{23,23}]
  wire [63:0] brDeallocs = io_brMispredict ? _GEN_10 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 116:23]
  wire [63:0] _commitDeallocMask_T = 64'h1 << io_deallocReqs_0_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _commitDeallocMask_T_2 = io_deallocReqs_0_valid ? _commitDeallocMask_T : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 124:8]
  wire [63:0] _commitDeallocMask_T_3 = 64'h1 << io_deallocReqs_1_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _commitDeallocMask_T_5 = io_deallocReqs_1_valid ? _commitDeallocMask_T_3 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 124:8]
  wire [63:0] _commitDeallocMask_T_6 = 64'h1 << io_deallocReqs_2_bits; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _commitDeallocMask_T_8 = io_deallocReqs_2_valid ? _commitDeallocMask_T_6 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 124:8]
  wire [63:0] _commitDeallocMask_T_9 = _commitDeallocMask_T_2 | _commitDeallocMask_T_5; // @[src/main/scala/backend/rename/FreeList.scala 125:14]
  wire [63:0] commitDeallocMask = _commitDeallocMask_T_9 | _commitDeallocMask_T_8; // @[src/main/scala/backend/rename/FreeList.scala 125:14]
  wire [63:0] deallocMask = commitDeallocMask | brDeallocs; // @[src/main/scala/backend/rename/FreeList.scala 127:39]
  wire [63:0] _selMask_T = selPregFire_0 ? selPregs_0 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 131:29]
  wire [63:0] _selMask_T_1 = selPregFire_1 ? selPregs_1 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 131:29]
  wire [63:0] _selMask_T_2 = selPregFire_2 ? selPregs_2 : 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 131:29]
  wire [63:0] _selMask_T_3 = _selMask_T | _selMask_T_1; // @[src/main/scala/backend/rename/FreeList.scala 132:14]
  wire [63:0] selMask = _selMask_T_3 | _selMask_T_2; // @[src/main/scala/backend/rename/FreeList.scala 132:14]
  wire  _matchVec_T_1 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h0; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_3 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h0; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_5 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h0; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec = {_matchVec_T_5,_matchVec_T_3,_matchVec_T_1}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_0_T = |matchVec; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_0_T_4 = matchVec[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_0_T_5 = matchVec[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_0_T_7 = _allocsAfterBr_0_T_4 | _allocsAfterBr_0_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_0_T_9 = ~brDeallocs; // @[src/main/scala/backend/rename/FreeList.scala 143:28]
  wire [63:0] _allocsAfterBr_0_T_10 = allocsAfterBr_0 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_0_T_11 = _allocsAfterBr_0_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_7 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h1; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_9 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h1; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_11 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h1; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_1 = {_matchVec_T_11,_matchVec_T_9,_matchVec_T_7}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_1_T = |matchVec_1; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_1_T_4 = matchVec_1[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_1_T_5 = matchVec_1[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_1_T_7 = _allocsAfterBr_1_T_4 | _allocsAfterBr_1_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_1_T_10 = allocsAfterBr_1 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_1_T_11 = _allocsAfterBr_1_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_13 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h2; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_15 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h2; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_17 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h2; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_2 = {_matchVec_T_17,_matchVec_T_15,_matchVec_T_13}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_2_T = |matchVec_2; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_2_T_4 = matchVec_2[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_2_T_5 = matchVec_2[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_2_T_7 = _allocsAfterBr_2_T_4 | _allocsAfterBr_2_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_2_T_10 = allocsAfterBr_2 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_2_T_11 = _allocsAfterBr_2_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_19 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h3; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_21 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h3; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_23 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h3; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_3 = {_matchVec_T_23,_matchVec_T_21,_matchVec_T_19}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_3_T = |matchVec_3; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_3_T_4 = matchVec_3[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_3_T_5 = matchVec_3[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_3_T_7 = _allocsAfterBr_3_T_4 | _allocsAfterBr_3_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_3_T_10 = allocsAfterBr_3 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_3_T_11 = _allocsAfterBr_3_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_25 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h4; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_27 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h4; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_29 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h4; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_4 = {_matchVec_T_29,_matchVec_T_27,_matchVec_T_25}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_4_T = |matchVec_4; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_4_T_4 = matchVec_4[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_4_T_5 = matchVec_4[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_4_T_7 = _allocsAfterBr_4_T_4 | _allocsAfterBr_4_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_4_T_10 = allocsAfterBr_4 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_4_T_11 = _allocsAfterBr_4_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_31 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h5; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_33 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h5; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_35 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h5; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_5 = {_matchVec_T_35,_matchVec_T_33,_matchVec_T_31}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_5_T = |matchVec_5; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_5_T_4 = matchVec_5[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_5_T_5 = matchVec_5[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_5_T_7 = _allocsAfterBr_5_T_4 | _allocsAfterBr_5_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_5_T_10 = allocsAfterBr_5 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_5_T_11 = _allocsAfterBr_5_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_37 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h6; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_39 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h6; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_41 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h6; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_6 = {_matchVec_T_41,_matchVec_T_39,_matchVec_T_37}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_6_T = |matchVec_6; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_6_T_4 = matchVec_6[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_6_T_5 = matchVec_6[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_6_T_7 = _allocsAfterBr_6_T_4 | _allocsAfterBr_6_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_6_T_10 = allocsAfterBr_6 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_6_T_11 = _allocsAfterBr_6_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire  _matchVec_T_43 = io_renBrTags_0_valid & io_renBrTags_0_bits == 3'h7; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_45 = io_renBrTags_1_valid & io_renBrTags_1_bits == 3'h7; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire  _matchVec_T_47 = io_renBrTags_2_valid & io_renBrTags_2_bits == 3'h7; // @[src/main/scala/backend/rename/FreeList.scala 136:58]
  wire [2:0] matchVec_7 = {_matchVec_T_47,_matchVec_T_45,_matchVec_T_43}; // @[src/main/scala/backend/rename/FreeList.scala 136:78]
  wire  _allocsAfterBr_7_T = |matchVec_7; // @[src/main/scala/backend/rename/FreeList.scala 138:16]
  wire [63:0] _allocsAfterBr_7_T_4 = matchVec_7[0] ? allocMasks_1 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_7_T_5 = matchVec_7[1] ? allocMasks_2 : 64'h0; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_7_T_7 = _allocsAfterBr_7_T_4 | _allocsAfterBr_7_T_5; // @[src/main/scala/chisel3/util/Mux.scala 30:73]
  wire [63:0] _allocsAfterBr_7_T_10 = allocsAfterBr_7 & _allocsAfterBr_0_T_9; // @[src/main/scala/backend/rename/FreeList.scala 143:25]
  wire [63:0] _allocsAfterBr_7_T_11 = _allocsAfterBr_7_T_10 | allocMasks_0; // @[src/main/scala/backend/rename/FreeList.scala 143:49]
  wire [63:0] _freeList_T_1 = ~selMask; // @[src/main/scala/backend/rename/FreeList.scala 160:31]
  wire [63:0] _freeList_T_2 = freeList & _freeList_T_1; // @[src/main/scala/backend/rename/FreeList.scala 160:28]
  wire [63:0] _freeList_T_3 = _freeList_T_2 | deallocMask; // @[src/main/scala/backend/rename/FreeList.scala 160:49]
  wire [63:0] _freeList_T_5 = _freeList_T_3 & 64'hfffffffffffffffe; // @[src/main/scala/backend/rename/FreeList.scala 160:64]
  assign io_allocPdest_0_bits = regIndices_0; // @[src/main/scala/backend/rename/FreeList.scala 97:18]
  assign io_allocPdest_1_bits = regIndices_1; // @[src/main/scala/backend/rename/FreeList.scala 97:18]
  assign io_allocPdest_2_bits = regIndices_2; // @[src/main/scala/backend/rename/FreeList.scala 97:18]
  assign io_canAlloc = &_io_canAlloc_T_6; // @[src/main/scala/backend/rename/FreeList.scala 92:12]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 38:25]
      freeList <= 64'hfffffffffffffffe; // @[src/main/scala/backend/rename/FreeList.scala 38:25]
    end else begin
      freeList <= _freeList_T_5;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_0 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_0_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_0 <= _allocsAfterBr_0_T_7;
    end else begin
      allocsAfterBr_0 <= _allocsAfterBr_0_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_1 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_1_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_1 <= _allocsAfterBr_1_T_7;
    end else begin
      allocsAfterBr_1 <= _allocsAfterBr_1_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_2 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_2_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_2 <= _allocsAfterBr_2_T_7;
    end else begin
      allocsAfterBr_2 <= _allocsAfterBr_2_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_3 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_3_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_3 <= _allocsAfterBr_3_T_7;
    end else begin
      allocsAfterBr_3 <= _allocsAfterBr_3_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_4 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_4_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_4 <= _allocsAfterBr_4_T_7;
    end else begin
      allocsAfterBr_4 <= _allocsAfterBr_4_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_5 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_5_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_5 <= _allocsAfterBr_5_T_7;
    end else begin
      allocsAfterBr_5 <= _allocsAfterBr_5_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_6 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_6_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_6 <= _allocsAfterBr_6_T_7;
    end else begin
      allocsAfterBr_6 <= _allocsAfterBr_6_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 44:30]
      allocsAfterBr_7 <= 64'h0; // @[src/main/scala/backend/rename/FreeList.scala 44:30]
    end else if (_allocsAfterBr_7_T) begin // @[src/main/scala/backend/rename/FreeList.scala 137:28]
      allocsAfterBr_7 <= _allocsAfterBr_7_T_7;
    end else begin
      allocsAfterBr_7 <= _allocsAfterBr_7_T_11;
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 63:52]
      regValids_0 <= 1'h0; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
    end else begin
      regValids_0 <= selPregsValid_0 | regValids_0 & ~io_allocReqs_0; // @[src/main/scala/backend/rename/FreeList.scala 77:16]
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 63:52]
      regValids_1 <= 1'h0; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
    end else begin
      regValids_1 <= selPregsValid_1 | regValids_1 & ~io_allocReqs_1; // @[src/main/scala/backend/rename/FreeList.scala 77:16]
    end
    if (reset) begin // @[src/main/scala/backend/rename/FreeList.scala 63:52]
      regValids_2 <= 1'h0; // @[src/main/scala/backend/rename/FreeList.scala 63:52]
    end else begin
      regValids_2 <= selPregsValid_2 | regValids_2 & ~io_allocReqs_2; // @[src/main/scala/backend/rename/FreeList.scala 77:16]
    end
    if (selPregFire_0) begin // @[src/main/scala/backend/rename/FreeList.scala 83:18]
      regIndices_0 <= _regIndices_0_T_15; // @[src/main/scala/backend/rename/FreeList.scala 83:27]
    end
    if (selPregFire_1) begin // @[src/main/scala/backend/rename/FreeList.scala 83:18]
      regIndices_1 <= _regIndices_1_T_15; // @[src/main/scala/backend/rename/FreeList.scala 83:27]
    end
    if (selPregFire_2) begin // @[src/main/scala/backend/rename/FreeList.scala 83:18]
      regIndices_2 <= _regIndices_2_T_15; // @[src/main/scala/backend/rename/FreeList.scala 83:27]
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
  _RAND_0 = {2{`RANDOM}};
  freeList = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  allocsAfterBr_0 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  allocsAfterBr_1 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  allocsAfterBr_2 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  allocsAfterBr_3 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  allocsAfterBr_4 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  allocsAfterBr_5 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  allocsAfterBr_6 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  allocsAfterBr_7 = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  regValids_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regValids_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regValids_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regIndices_0 = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  regIndices_1 = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  regIndices_2 = _RAND_14[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
