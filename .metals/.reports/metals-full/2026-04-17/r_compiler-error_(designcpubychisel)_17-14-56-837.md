error id: B28AFB9EB48895666E3F1A033CEF49F9
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
### scala.ScalaReflectionException: value special is not a method

occurred in the presentation compiler.



action parameters:
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
text:
```scala
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule

class ICacheMainPipe(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // CPU接口
    val cpu_req = Decoupled(new Bundle {
      val addr  = Input(UInt(32.W))   // 虚拟地址
      val valid = Input(Bool())
      val kill  = Input(Bool())
    })
    
    val cpu_resp = new Bundle {
      val instrs = Output(Vec(fetchWidth, UInt(32.W)))
      val addr   = Output(UInt(32.W))  // 返回虚拟地址
      val valid  = Output(Bool())
      val miss   = Output(Bool())
    }
    
    // 控制信号
    val flush = Input(Bool())
    val stall = Input(Bool())
    
    // === 新增：MMU接口 ===
    val mmu = new Bundle {
      // 转换请求
      val req = Output(new Bundle {
        val vaddr = UInt(32.W)     // 虚拟地址
        val valid = Bool()         // 转换请求有效
      })
      // 转换响应
      val resp = Input(new Bundle {
        val paddr    = UInt(32.W)  // 物理地址
        val uncached = Bool()      // 是否为uncached访问
        val valid    = Bool()      // 转换结果有效
        val error    = Bool()      // 转换错误(如TLB缺失)
      })
    }
    
    // === 新增：Uncached访问接口 ===
    val uncached_req = Output(new Bundle {
      val valid = Bool()
      val vaddr = UInt(32.W)  // 虚拟地址
      val paddr = UInt(32.W)  // 物理地址
    })
    
    val uncached_resp = Input(new Bundle {
      val valid = Bool()
      val data  = UInt(32.W)  // 返回的数据
    })
    
    // SRAM接口
    val arrays_read = new Bundle {

      val req  = new Bundle { 
        val valid = Output(Bool())
        val idx   = Output(UInt(idxBits.W))
      }
      val resp  = new Bundle {
        val valid = Input(Bool())

        //读取的tag以及data最多横跨两个Cache行
        val data = Vec(2, new Bundle { 
          val has = Input(Bool())              //读取的数据的状态
          val tag   = Input(UInt(tagBits.W))
          val data = Input(UInt((blockBytes * 8).W))
        })

      }
        

    }
    
    // Miss处理接口
    val miss_req = new Bundle {
      val valid = Output(Bool())
      val ready = Input(Bool())
      val bits  = Output(new Bundle {
        val addr       = UInt(32.W)  // 物理地址
        val idx        = UInt(idxBits.W)
        val tag        = UInt(tagBits.W)
        val victim_way = UInt(wayBits.W)
      })
    }
    
    val miss_resp = Input(new Bundle {
      val valid = Bool()
      val bits  = new Bundle {
        val data = UInt((blockBytes * 8).W)
        val idx  = UInt(idxBits.W)
        val tag  = UInt(tagBits.W)
      }
    })
    
    // Replacer接口
    val replacer_touch = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
      val way   = UInt(wayBits.W)
    })
    
    // Replacer victim接口
    val replacer_victim = new Bundle {
      val req  = Output(Bool())
      val idx  = Output(UInt(idxBits.W))
      val resp = Input(UInt(wayBits.W))
    }
    
    // Flush SRAM接口
    val meta_flush = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    })
    
    val data_flush = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    })
    
    val replacer_flush = Output(new Bundle {
      val valid = Bool()
      val idx   = UInt(idxBits.W)
    })
    
    // 状态输出
    val s1_fire = Output(Bool())
    val s1_idx  = Output(UInt(idxBits.W))
  })
  
  // === 重构的4级流水线 ===
  // Stage 0: 接收请求，计算虚拟地址的索引和标签
  // Stage 1: 发出SRAM读取请求，向MMU发起地址转换
  // Stage 2: 接收MMU转换结果，判断是否为uncached访问
  // Stage 3: 使用物理地址进行标签比较，判断命中/缺失
  // Stage 4: 响应输出
  // === Stage inputoutput: 请求接收 ===
  val s1_ready = Wire(Bool())
  val s0_fire = ( s0_valid && s1_ready ) || (!s0_valid)
  io.cpu_req.ready := s0_fire || !s0_valid

  val curr_vidx = io.cpu_req.bits.addr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_vtag = io.cpu_req.bits.addr(31, blockOffBits + idxBits)

  // === Stage 0: 请求接收 ===
  val s0_valid = RegInit(false.B)
  val s0_vaddr = Reg(UInt(32.W))  // 虚拟地址
  val s0_vidx  = Reg(UInt(idxBits.W))  // 虚拟索引
  val s0_vtag  = Reg(UInt(tagBits.W))  // 虚拟标签
  
  when(io.flush || io.cpu_req.bits.kill) {
    s0_valid := false.B
  }.elsewhen(s0_fire) {
    s0_valid := io.cpu_req.valid
    s0_vaddr := io.cpu_req.bits.addr
    s0_vidx  := curr_vidx
    s0_vtag  := curr_vtag

  }.otherwise {
    //暂停阻塞的情况下
    s0_valid := s0_valid
  }

  //= Stage0时需要干的 =

  //读Tag and Data
  io.arrays_read.req.valid := s0_valid
  io.arrays_read.req.idx   := s0_vidx
  
  // 向MMU发起地址转换请求
  io.mmu.req.valid := s0_valid
  io.mmu.req.vaddr := s0_vaddr



  // === Stage 1: SRAM读取请求和MMU转换请求 ===
  val s1_valid = RegInit(false.B)
  val s1_vaddr = Reg(UInt(32.W))
  val s1_vidx  = Reg(UInt(idxBits.W))
  val s1_vtag  = Reg(UInt(tagBits.W))

  val s1_paddr = Reg(UInt(32.W))     // 物理地址
  val s1_uncached = Reg(Bool())     // 是否为uncached访问
  val s1_mmu_error = Reg(Bool())     // MMU转换错误
  val s1_pidx  = Reg(UInt(idxBits.W))  // 物理索引
  val s1_ptag  = Reg(UInt(tagBits.W))  // 物理标签

  val s1_fire  = Wire(Bool())
  val s2_ready = Wire(Bool())

  //========Warning!!Warning!!此处需要CacheArray与Mmu出数据的时序是一样的==========
  //========Warning!!Warning!!不然就会被堵住                            ==========
  val s1_cango = io.mmu.resp.valid && io.arrays_read.resp.valid

  s1_fire  := ( s1_valid && s1_cango && s2_ready ) || (!s1_valid)
  s1_ready := s1_fire || !s1_valid
  val special = s1_cango &&
    // 从物理地址计算索引和标签
  val curr_pidx = io.mmu.resp.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_ptag = io.mmu.resp.paddr(31, blockOffBits + idxBits)

  when(io.flush) {
    s1_valid := false.B
  }.elsewhen(s1_fire) {
    s1_valid := s0_valid
    s1_vaddr := s0_vaddr
    s1_vidx  := s0_vidx
    s1_vtag  := s0_vtag

    //拉一下MMU的数据
    //s1_pidx  := curr_pidx
    //s1_ptag  := curr_ptag
    //s1_paddr := io.mmu.resp.paddr
    //s1_uncached := io.mmu.resp.uncached
    //s1_mmu_error := io.mmu.resp.error



  }.otherwise {
    s1_valid := s1_valid
  }
  // Stage 1输出
  //io.s1_fire := s1_fire
  //io.s1_idx  := s1_vidx
  
  // === Stage 2: MMU转换结果处理 ===
  val s2_valid = RegInit(false.B)
  val s2_vaddr = Reg(UInt(32.W))  // 虚拟地址
  val s2_paddr = Reg(UInt(32.W))  // 物理地址
  val s2_uncached = Reg(Bool())   // 是否为uncached访问
  val s2_mmu_error = Reg(Bool())  // MMU转换错误
  val s2_vidx  = Reg(UInt(idxBits.W))
  val s2_vtag  = Reg(UInt(tagBits.W))
  val s2_pidx  = Reg(UInt(idxBits.W))  // 物理索引
  val s2_ptag  = Reg(UInt(tagBits.W))  // 物理标签
  
  val s3_ready = Wire(Bool())
  val s2_fire = ( s2_valid && s3_ready) || (!s2_valid)

  
  when(io.flush) {
    s2_valid := false.B
  }.elsewhen(s1_fire && io.mmu.resp.valid) {
    s2_valid := true.B
    s2_vaddr := s1_vaddr
    s2_paddr := io.mmu.resp.paddr
    s2_uncached := io.mmu.resp.uncached
    s2_mmu_error := io.mmu.resp.error
    s2_vidx  := s1_vidx
    s2_vtag  := s1_vtag
    s2_pidx  := curr_pidx
    s2_ptag  := curr_ptag
  }.otherwise {
    s2_valid := false.B
  }
  
  // === Stage 3: 标签比较和命中判断 ===
  val s3_valid = RegInit(false.B)
  val s3_vaddr = Reg(UInt(32.W))
  val s3_paddr = Reg(UInt(32.W))
  val s3_uncached = Reg(Bool())
  val s3_mmu_error = Reg(Bool())
  val s3_hit   = Reg(Bool())
  val s3_way   = Reg(UInt(wayBits.W))
  val s3_data  = Reg(UInt((blockBytes * 8).W))
  val s3_pidx  = Reg(UInt(idxBits.W))
  val s3_ptag  = Reg(UInt(tagBits.W))
  val s3_is_uncached_access = Reg(Bool())  // 标记是否为uncached访问
  
  // 标签比较逻辑（仅对cached访问）
  val tag_hits = Wire(Vec(nWays, Bool()))
  for (i <- 0 until nWays) {
    tag_hits(i) := io.arrays_read.resp.data(i).valid && 
                   io.arrays_read.resp.data(i).tag === s2_ptag
  }
  val s2_hit = tag_hits.asUInt.orR
  val s2_hit_way = OHToUInt(tag_hits)
  val s2_data = io.data_read.resp.data(s2_hit_way)
  
  when(io.flush) {
    s3_valid := false.B
  }.elsewhen(s2_valid) {
    s3_valid := true.B
    s3_vaddr := s2_vaddr
    s3_paddr := s2_paddr
    s3_uncached := s2_uncached
    s3_mmu_error := s2_mmu_error
    s3_pidx  := s2_pidx
    s3_ptag  := s2_ptag
    s3_is_uncached_access := s2_uncached || s2_mmu_error
    
    when (s2_uncached || s2_mmu_error) {
      // uncached访问或MMU错误，不进行缓存查找
      s3_hit := false.B
      s3_way := 0.U
      s3_data := 0.U
    } .otherwise {
      // cached访问，进行正常的命中判断
      s3_hit := s2_hit
      s3_way := s2_hit_way
      s3_data := s2_data
    }

  }.otherwise {
    s3_valid := false.B
  }
  
  // === 新增：Uncached访问处理 ===
  // 当检测到uncached访问时，直接发起内存请求
  io.uncached_req.valid := s3_valid && s3_is_uncached_access
  io.uncached_req.vaddr := s3_vaddr
  io.uncached_req.paddr := s3_paddr
  
  // === Miss处理 ===
  // 注意：uncached访问不经过缓存，所以不计入缓存缺失
  val is_cache_miss = s3_valid && !s3_is_uncached_access && !s3_hit
  io.miss_req.valid := is_cache_miss
  io.miss_req.bits.addr := s3_paddr
  io.miss_req.bits.idx  := s3_pidx
  io.miss_req.bits.tag  := s3_ptag
  io.miss_req.bits.victim_way := io.replacer_victim.resp
  
  // Replacer更新（仅对cached命中）
  val is_cache_hit = s3_valid && !s3_is_uncached_access && s3_hit
  io.replacer_touch.valid := is_cache_hit
  io.replacer_touch.idx   := s3_pidx
  io.replacer_touch.way   := s3_way
  
  // Replacer victim请求（仅对cached缺失）
  io.replacer_victim.req := is_cache_miss
  io.replacer_victim.idx := s3_pidx
  
  // === Stage 4: 响应输出 ===
  val s4_valid = RegInit(false.B)
  val s4_vaddr = Reg(UInt(32.W))
  val s4_data  = Reg(UInt((blockBytes * 8).W))
  val s4_hit   = Reg(Bool())
  val s4_is_uncached = Reg(Bool())
  val s4_mmu_error = Reg(Bool())
  
  when(io.flush) {
    s4_valid := false.B
  }.elsewhen(s3_valid) {
    s4_valid := true.B
    s4_vaddr := s3_vaddr
    s4_hit   := s3_hit || s3_is_uncached_access
    s4_is_uncached := s3_is_uncached_access
    s4_mmu_error := s3_mmu_error
    
    when (s3_is_uncached_access) {
      // uncached访问，等待内存响应
      s4_data := 0.U
    } .otherwise {
      // cached访问
      s4_data := s3_data
    }
  }.otherwise {
    s4_valid := false.B
  }
  
  // === Uncached访问响应处理 ===
  // 当uncached访问得到响应时，更新数据
  val uncached_data_buffer = Reg(UInt((blockBytes * 8).W))
  val uncached_data_valid = RegInit(false.B)
  
  when(io.uncached_resp.valid) {
    uncached_data_buffer := io.uncached_resp.data
    uncached_data_valid := true.B
  }.elsewhen(s4_valid && s4_is_uncached) {
    // 消耗uncached响应
    uncached_data_valid := false.B
  }
  
  // === 响应CPU ===
  // 对于cached命中，立即响应
  // 对于uncached访问，等待内存响应
  // 对于缓存缺失，等待缺失响应
  
  val cached_hit_resp = s4_valid && !s4_is_uncached && s4_hit
  val uncached_resp_ready = s4_valid && s4_is_uncached && uncached_data_valid
  val miss_resp_ready = io.miss_resp.valid
  
  io.cpu_resp.valid := cached_hit_resp || uncached_resp_ready || miss_resp_ready
  io.cpu_resp.miss  := s4_valid && !s4_is_uncached && !s4_hit
  
  when(io.cpu_resp.valid) {
    io.cpu_resp.addr := s4_vaddr
    
    val resp_data = WireDefault(0.U((blockBytes * 8).W))
    
    when(cached_hit_resp) {
      resp_data := s4_data
    }.elsewhen(uncached_resp_ready) {
      resp_data := uncached_data_buffer
    }.elsewhen(miss_resp_ready) {
      resp_data := io.miss_resp.bits.data
    }
    
    // 从数据中提取指令
    val byte_offset = s4_vaddr(blockOffBits-1, 2)
    
    for (i <- 0 until fetchWidth) {
      val word_offset = (byte_offset + i.U) % (blockBytes/4).U
      val bit_offset = word_offset * 32.U
      
      val shifted = resp_data >> bit_offset
      io.cpu_resp.instrs(i) := shifted(31, 0)
    }
  }.otherwise {
    io.cpu_resp.addr := 0.U
    for (i <- 0 until fetchWidth) {
      io.cpu_resp.instrs(i) := 0.U
    }
  }
  
  // === Miss响应处理 ===
  when(io.miss_resp.valid) {
    // 更新缓存行
    // 这里可以触发对缓存的更新
  }
  
  // === Flush处理 ===
  when(io.flush) {
    // 发送flush信号
    io.meta_flush.valid := s1_valid
    io.meta_flush.idx   := s1_vidx
    
    io.data_flush.valid := s1_valid
    io.data_flush.idx   := s1_vidx
    
    io.replacer_flush.valid := s1_valid
    io.replacer_flush.idx   := s1_vidx
  }.otherwise {
    io.meta_flush.valid := false.B
    io.meta_flush.idx   := 0.U
    
    io.data_flush.valid := false.B
    io.data_flush.idx   := 0.U
    
    io.replacer_flush.valid := false.B
    io.replacer_flush.idx   := 0.U
  }
  
  // === 性能计数器 ===
  val perf_hit = RegInit(0.U(32.W))
  val perf_miss = RegInit(0.U(32.W))
  val perf_uncached = RegInit(0.U(32.W))
  val perf_mmu_error = RegInit(0.U(32.W))
  
  when(s3_valid && !s3_is_uncached_access && s3_hit) {
    perf_hit := perf_hit + 1.U
  }
  when(s3_valid && !s3_is_uncached_access && !s3_hit) {
    perf_miss := perf_miss + 1.U
  }
  when(s3_valid && s3_uncached && !s3_mmu_error) {
    perf_uncached := perf_uncached + 1.U
  }
  when(s3_valid && s3_mmu_error) {
    perf_mmu_error := perf_mmu_error + 1.U
  }
  
  println("ICacheMainPipe with MMU instantiated:")
  println(s"  FetchWidth: $fetchWidth, Ways: $nWays, Sets: $nSets")
  println(s"  BlockBytes: $blockBytes, IdxBits: $idxBits, TagBits: $tagBits")
  println(s"  PipelineStages: 5 (including MMU stage and response stage)")
  println(s"  Features: MMU translation, Uncached access support")
}
```


presentation compiler configuration:
Scala version: 2.13.14
Classpath:
<WORKSPACE>/designCPUByChisel/.bloop/designcpubychisel/bloop-bsp-clients-classes/classes-Metals-aWcoIt_lQk-5i3xgh7IG8w== [exists ], <HOME>/.cache/bloop/semanticdb/com.sourcegraph.semanticdb-javac.0.11.2/semanticdb-javac-0.11.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.14/scala-library-2.13.14.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3_2.13/3.6.1/chisel3_2.13-3.6.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chiseltest_2.13/0.6.2/chiseltest_2.13-0.6.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/firrtl_2.13/1.6.0/firrtl_2.13-1.6.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.14/scala-reflect-2.13.14.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/upickle_2.13/2.0.0/upickle_2.13-2.0.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/os-lib_2.13/0.8.1/os-lib_2.13-0.8.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/treadle_2.13/1.6.0/treadle_2.13-1.6.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest_2.13/3.2.15/scalatest_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/utest_2.13/0.8.1/utest_2.13-0.8.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/net/java/dev/jna/jna/5.13.0/jna-5.13.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/antlr/antlr4-runtime/4.9.3/antlr4-runtime-4.9.3.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.18.3/protobuf-java-3.18.3.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/scopt/scopt_2.13/3.7.1/scopt_2.13-3.7.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/net/jcazevedo/moultingyaml_2.13/0.4.2/moultingyaml_2.13-0.4.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-native_2.13/4.0.6/json4s-native_2.13-4.0.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-text/1.10.0/commons-text-1.10.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/io/github/alexarchambault/data-class_2.13/0.2.5/data-class_2.13-0.2.5.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-parallel-collections_2.13/1.0.4/scala-parallel-collections_2.13-1.0.4.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/ujson_2.13/2.0.0/ujson_2.13-2.0.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/upack_2.13/2.0.0/upack_2.13-2.0.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/upickle-implicits_2.13/2.0.0/upickle-implicits_2.13-2.0.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/geny_2.13/0.7.1/geny_2.13-0.7.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-jline/2.12.1/scala-jline-2.12.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-core_2.13/3.2.15/scalatest-core_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-featurespec_2.13/3.2.15/scalatest-featurespec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-flatspec_2.13/3.2.15/scalatest-flatspec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-freespec_2.13/3.2.15/scalatest-freespec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-funsuite_2.13/3.2.15/scalatest-funsuite_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-funspec_2.13/3.2.15/scalatest-funspec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-propspec_2.13/3.2.15/scalatest-propspec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-refspec_2.13/3.2.15/scalatest-refspec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-wordspec_2.13/3.2.15/scalatest-wordspec_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-diagrams_2.13/3.2.15/scalatest-diagrams_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-matchers-core_2.13/3.2.15/scalatest-matchers-core_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-shouldmatchers_2.13/3.2.15/scalatest-shouldmatchers_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-mustmatchers_2.13/3.2.15/scalatest-mustmatchers_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-sbt/test-interface/1.0/test-interface-1.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/portable-scala/portable-scala-reflect_2.13/1.1.2/portable-scala-reflect_2.13-1.1.2.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/nscala-time/nscala-time_2.13/2.22.0/nscala-time_2.13-2.22.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/yaml/snakeyaml/1.26/snakeyaml-1.26.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-core_2.13/4.0.6/json4s-core_2.13-4.0.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-native-core_2.13/4.0.6/json4s-native-core_2.13-4.0.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/upickle-core_2.13/2.0.0/upickle-core_2.13-2.0.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/fusesource/jansi/jansi/1.11/jansi-1.11.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalatest/scalatest-compatible/3.2.15/scalatest-compatible-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scalactic/scalactic_2.13/3.2.15/scalactic_2.13-3.2.15.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-xml_2.13/2.1.0/scala-xml_2.13-2.1.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/joda-time/joda-time/2.10.1/joda-time-2.10.1.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/joda/joda-convert/2.2.0/joda-convert-2.2.0.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-ast_2.13/4.0.6/json4s-ast_2.13-4.0.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-scalap_2.13/4.0.6/json4s-scalap_2.13-4.0.6.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8.jar [exists ]
Options:
-deprecation -feature -unchecked -language:reflectiveCalls -Yrangepos -Xplugin-require:semanticdb




#### Error stacktrace:

```
scala.reflect.api.Symbols$SymbolApi.asMethod(Symbols.scala:240)
	scala.reflect.api.Symbols$SymbolApi.asMethod$(Symbols.scala:234)
	scala.reflect.internal.Symbols$SymbolContextApiImpl.asMethod(Symbols.scala:99)
	scala.tools.nsc.typechecker.ContextErrors$TyperContextErrors$TyperErrorGen$.MissingArgsForMethodTpeError(ContextErrors.scala:810)
	scala.tools.nsc.typechecker.Typers$Typer.adaptMethodTypeToExpr$1(Typers.scala:999)
	scala.tools.nsc.typechecker.Typers$Typer.adapt(Typers.scala:1353)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6276)
	scala.tools.nsc.typechecker.Typers$Typer.typedDefDef(Typers.scala:6525)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6167)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4(Typers.scala:3488)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4$adapted(Typers.scala:3483)
	scala.reflect.internal.Scopes$Scope.foreach(Scopes.scala:455)
	scala.tools.nsc.typechecker.Typers$Typer.addSynthetics$1(Typers.scala:3483)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3551)
	scala.tools.nsc.typechecker.Typers$Typer.typedTemplate(Typers.scala:2144)
	scala.tools.nsc.typechecker.Typers$Typer.typedClassDef(Typers.scala:1982)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6168)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$9(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedPackageDef$1(Typers.scala:5844)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6171)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Analyzer$typerFactory$TyperPhase.apply(Analyzer.scala:125)
	scala.tools.nsc.Global$GlobalPhase.applyPhase(Global.scala:481)
	scala.tools.nsc.interactive.Global$TyperRun.applyPhase(Global.scala:1369)
	scala.tools.nsc.interactive.Global$TyperRun.typeCheck(Global.scala:1362)
	scala.tools.nsc.interactive.Global.typeCheck(Global.scala:680)
	scala.meta.internal.pc.WithCompilationUnit.<init>(WithCompilationUnit.scala:24)
	scala.meta.internal.pc.SimpleCollector.<init>(PcCollector.scala:348)
	scala.meta.internal.pc.PcSemanticTokensProvider$Collector$.<init>(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector$lzycompute$1(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.provide(PcSemanticTokensProvider.scala:73)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticTokens$1(ScalaPresentationCompiler.scala:207)
	scala.meta.internal.pc.CompilerAccess.retryWithCleanCompiler(CompilerAccess.scala:182)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withSharedCompiler$1(CompilerAccess.scala:155)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.pc.CompilerAccess.withSharedCompiler(CompilerAccess.scala:154)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withInterruptableCompiler$1(CompilerAccess.scala:92)
	scala.meta.internal.pc.CompilerAccess.$anonfun$onCompilerJobQueue$1(CompilerAccess.scala:209)
	scala.meta.internal.pc.CompilerJobQueue$Job.run(CompilerJobQueue.scala:152)
	java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
	java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	java.base/java.lang.Thread.run(Thread.java:1583)
```
#### Short summary: 

scala.ScalaReflectionException: value special is not a method