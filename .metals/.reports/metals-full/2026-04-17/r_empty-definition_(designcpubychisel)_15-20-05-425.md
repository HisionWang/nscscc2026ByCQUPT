error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala:
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheMainPipe.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Decoupled#
	 -chisel3/util/Decoupled#
	 -Decoupled#
	 -scala/Predef.Decoupled#
offset: 223
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
    val cpu_req = new Decoupled@@(Bundle {
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
        val error    = Bool()      // 转换错误（如TLB缺失）
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
    val meta_read = new Bundle {
      val req  = new Bundle { 
        val valid = Output(Bool())
        val idx   = Output(UInt(idxBits.W))
      }
      val resp = new Bundle {
        val data  = Vec(nWays, new Bundle {
          val valid = Input(Bool())
          val tag   = Input(UInt(tagBits.W))
        })
      }
    }
    
    val data_read = new Bundle {
      val req  = new Bundle { 
        val valid = Output(Bool())
        val idx   = Output(UInt(idxBits.W))
      }
      val resp = new Bundle {
        val data = Input(Vec(nWays, UInt((blockBytes * 8).W)))
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
  
  // === Stage 0: 请求接收 ===
  val s0_valid = RegInit(false.B)
  val s0_vaddr = Reg(UInt(32.W))  // 虚拟地址
  val s0_vidx  = Reg(UInt(idxBits.W))  // 虚拟索引
  val s0_vtag  = Reg(UInt(tagBits.W))  // 虚拟标签
  
  // 当前请求的虚拟地址计算
  val curr_vidx = io.cpu_req.addr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_vtag = io.cpu_req.addr(31, blockOffBits + idxBits)
  
  
  val s0_fire = io.cpu_req.valid && !io.stall
  
  when(io.flush || io.cpu_req.kill) {
    s0_valid := false.B
  }.elsewhen(s0_fire) {
    s0_valid := true.B
    s0_vaddr := io.cpu_req.addr
    s0_vidx  := curr_vidx
    s0_vtag  := curr_vtag
  }.otherwise {
    s0_valid := false.B
  }
  
  // === Stage 1: SRAM读取请求和MMU转换请求 ===
  val s1_valid = RegInit(false.B)
  val s1_vaddr = Reg(UInt(32.W))
  val s1_vidx  = Reg(UInt(idxBits.W))
  val s1_vtag  = Reg(UInt(tagBits.W))
  val s1_fire  = Wire(Bool())
  
  s1_fire := s1_valid && !io.flush && !io.stall
  
  when(io.flush) {
    s1_valid := false.B
  }.elsewhen(s0_valid && !io.stall) {
    s1_valid := true.B
    s1_vaddr := s0_vaddr
    s1_vidx  := s0_vidx
    s1_vtag  := s0_vtag
  }.otherwise {
    s1_valid := false.B
  }
  
  // 发出SRAM读取请求（使用虚拟地址的索引）
  io.meta_read.req.valid := s1_valid
  io.meta_read.req.idx   := s1_vidx
  
  io.data_read.req.valid := s1_valid
  io.data_read.req.idx   := s1_vidx
  
  // 向MMU发起地址转换请求
  io.mmu.req.vaddr := s1_vaddr
  io.mmu.req.valid := s1_valid
  
  // Stage 1输出
  io.s1_fire := s1_fire
  io.s1_idx  := s1_vidx
  
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
  
  // 从物理地址计算索引和标签
  val curr_pidx = io.mmu.resp.paddr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_ptag = io.mmu.resp.paddr(31, blockOffBits + idxBits)
  
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
    tag_hits(i) := io.meta_read.resp.data(i).valid && 
                   io.meta_read.resp.data(i).tag === s2_ptag
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


#### Short summary: 

empty definition using pc, found symbol in pc: 