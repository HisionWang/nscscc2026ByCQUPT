package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.axi._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.mmu._
import nscscc.config.NSModule
import nscscc.config.NSBundle
class ICacheMainPipe(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val redirect = Input(Bool())
    // CPU接口
    val cpu_req = Flipped( Decoupled(new Bundle {
      val addr  = (UInt(32.W))   // 虚拟地址
    }))

    val icache_resp = Decoupled(new IcacheResp)

    val axi         = new AXI3MasterIO

    // SRAM接口
    val arrays_read = new ICacheArrayRead
    val array_write = new ICacheArrayWrite

    val victim_read = new victimRead
    val replacer_touch = new victimChange

    //读取替换指针victim


    // === 新增：MMU接口 ===
    val mmu = new MMURead

  })

  //
  val flushFormBack = io.redirect
  val s4_flush = flushFormBack || false.B
  val s3_flush = s4_flush      || false.B
  val s2_flush = s3_flush      || false.B
  val s1_flush = s2_flush      || false.B
  val s0_flush = s1_flush      || false.B
  
   
  
  
  
  // === 重构的4级流水线 ===


  // Stage 0: 发出Cached的SRAM读取请求，向MMU发起地址转换
  // Stage 1: 接收接收双方的请求，并判断是否为uncahe
  // Stage 2: 使用物理地址进行标签比较，判断命中/缺失
  val s0_valid = RegInit(false.B)
  val s1_ready = Wire(Bool())
  val s0_cango = io.mmu.toMmu.ready //true.B// TODO：什么时候才能流向下一级
  val s0_fire = ( s0_valid  && s1_ready ) && s0_cango
  val s0_ready = s0_fire || !s0_valid
  io.cpu_req.ready := s0_ready

  val curr_vidx = io.cpu_req.bits.addr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_vtag = io.cpu_req.bits.addr(31, blockOffBits + idxBits)

  // === Stage 0: 发出Cached的SRAM读取请求，向MMU发起地址转换 ===
  
  val s0_vaddr = Reg(UInt(32.W))  // 虚拟地址
  val s0_vidx  = Reg(UInt(idxBits.W))  // 虚拟索引
  val s0_vtag  = Reg(UInt(tagBits.W))  // 虚拟标签

  val io_fire = s0_ready && io.cpu_req.valid

  when(s0_flush) {
    s0_valid  := false.B
    
  }.elsewhen(io_fire && !s0_flush){
    s0_valid := io.cpu_req.bits.addr =/=  0x1BFFFFFC.U  //true.B //或者：io.cpu_req.valid
    s0_vaddr := io.cpu_req.bits.addr
    s0_vidx  := curr_vidx
    s0_vtag  := curr_vtag
  }.elsewhen(s0_fire){
    s0_valid  := false.B
  }
  

  //= Stage0时需要干的：发送请求 =
  //读Tag and Data
  io.arrays_read.req.valid  := s0_fire && !s0_flush
  io.arrays_read.req.idx    := s0_vidx
  // 向MMU发起地址转换请求
  io.mmu.toMmu.valid := s0_fire && !s0_flush
  io.mmu.toMmu.bits.vaddr := s0_vaddr



  // === Stage 1: 接收接收双方的请求，并判断是否为uncahe ===
  val s1_valid = RegInit(false.B)
  val s1_vaddr = Reg(UInt(32.W))
  val s1_vidx  = Reg(UInt(idxBits.W))
  val s1_vtag  = Reg(UInt(tagBits.W))

  val s1_fire  = Wire(Bool())
  val s2_ready = Wire(Bool())

  val s1_cango = Wire(Bool())
  s1_fire  := ( s1_valid  && s2_ready ) && s1_cango
  s1_ready := s1_fire || !s1_valid
  

  when(s1_flush) {
    s1_valid  := false.B
  }.elsewhen(s0_fire && !s0_flush){
    s1_valid := true.B //或者：s0_valid
    s1_vaddr := s0_vaddr
    s1_vidx  := s0_vidx
    s1_vtag  := s0_vtag
  }.elsewhen(s1_fire){
    s1_valid  := false.B
  }
  io.mmu.fromMmu.ready := false.B
  val mmu_resp_fire = io.mmu.fromMmu.valid
  val array_resp_fire = io.arrays_read.resp.valid



  val s1_responses_ready = RegInit(false.B)
  val s1_mmu_received = RegInit(false.B)
  val s1_array_received = RegInit(false.B)
  s1_cango := (s1_array_received || array_resp_fire) &&
              (s1_mmu_received || mmu_resp_fire)

  val s1_array_received_data = Reg(new arrayReadData)
  val s1_mmu_received_data = Reg(new MmuToIcache)
    // 记录响应接收状态
  when(s1_fire || s1_flush) {
    s1_array_received := false.B
  }.elsewhen(array_resp_fire) {
    s1_array_received := true.B
    s1_array_received_data := io.arrays_read.resp.data
  }

  when(s1_fire || s1_flush) {
    s1_mmu_received := false.B
  }.elsewhen(mmu_resp_fire) {
    s1_mmu_received := true.B
    s1_mmu_received_data := io.mmu.fromMmu.bits
  }
  // === Stage 2: 标签比较和命中判断 ===
  val s2_valid = RegInit(false.B)
  val s2_vaddr = Reg(UInt(32.W))  // 虚拟地址
  val s2_paddr = Reg(UInt(32.W))  // 物理地址
  val s2_uncached = Reg(Bool())   // 是否为uncached访问
  val s2_mmu_error = Reg(new MmuTransError)  // MMU转换错误
  val s2_vidx  = Reg(UInt(idxBits.W))
  val s2_vtag  = Reg(UInt(tagBits.W))
  val s2_pidx  = Reg(UInt(idxBits.W))  // 物理索引
  val s2_ptag  = Reg(UInt(tagBits.W))  // 物理标签

  val s2_array_data = Reg(new arrayReadData)
  
  val s3_ready = Wire(Bool())
  val s2_fire = ( s2_valid && s3_ready)
  val s2_is_uncached_access = s2_mmu_error.getAnyError || s2_uncached
  s2_ready := s2_fire || !s2_valid
      // 从物理地址计算索引和标签

  val s1_ptag = Mux(s1_mmu_received, s1_mmu_received_data.paddr(31, blockOffBits + idxBits), io.mmu.fromMmu.bits.paddr(31, blockOffBits + idxBits))
  val s1_array_data_read = Mux(s1_array_received, s1_array_received_data, io.arrays_read.resp.data)
  val s1_paddr = Mux(s1_mmu_received, s1_mmu_received_data.paddr, io.mmu.fromMmu.bits.paddr)
  // s1_vidx has

  val s3_ptag    = Wire(UInt(tagBits.W))
  val s3_pidx    = Wire(UInt(idxBits.W))
  //val s3_array_data = Wire(new arrayReadData)

  val miss_data_valid = RegInit(false.B)
  val s3_valid = RegInit(false.B)
  val s3_vaddr = Reg(UInt(32.W))
  val s3_paddr = Reg(UInt(32.W))
  val s3_uncached = Reg(Bool())
  val s3_mmu_error = Reg(new MmuTransError)
  val s3_hit    = Reg(Bool())

  val s3_miss   = Reg(Bool())
  
  val s3_hit_way    = Reg(UInt(wayBits.W))
  val miss_data_buffer = Reg(UInt((blockBytes * 8).W))
  val s1_bypass_data = miss_data_buffer
  val s1_can_bypass = (s1_ptag === s3_ptag && s1_vidx === s3_pidx && miss_data_valid && s3_valid && s3_miss && !s3_uncached && !(s3_mmu_error.getAnyError))
  val s1_bypass_hit_way    = io.victim_read.resp

  val s2_bypass_data_from_s1 = Reg(UInt((blockBytes * 8).W))
  
  val s2_can_bypass_from_s1 = RegInit(false.B)
  val s2_hit_way_from_s1    = Reg(UInt(wayBits.W))
  
  //miss_data_buffer

  when(s2_flush) {
    s2_valid := false.B
  }.elsewhen(s1_fire && !s1_flush) {
    s2_valid := true.B
    
    //查看保存的状态以获取正确的array数据
    s2_array_data := s1_array_data_read

    s2_vaddr := s1_vaddr
    s2_vidx  := s1_vidx
    s2_vtag  := s1_vtag
    s2_paddr := s1_paddr
    s2_ptag  := s1_ptag
    s2_uncached := Mux(s1_mmu_received, !s1_mmu_received_data.cacheable, !io.mmu.fromMmu.bits.cacheable)
    s2_mmu_error := Mux(s1_mmu_received, s1_mmu_received_data.error, io.mmu.fromMmu.bits.error)

    s2_bypass_data_from_s1 := s1_bypass_data
    s2_can_bypass_from_s1 := s1_can_bypass
    s2_hit_way_from_s1 := s1_bypass_hit_way

  }.elsewhen(s2_fire) {
    s2_valid := false.B
  }
  val tag_hits = Wire(  Vec(nWays, Bool()) )


  for (i <- 0 until nWays) { 
    tag_hits(i) := s2_array_data.cacheLine(i).has &&  
                      s2_array_data.cacheLine(i).tag === s2_ptag 

  }
  val s2_hit = s2_valid && tag_hits.asUInt.orR
  val s2_hit_way = OHToUInt(tag_hits)
  val s2_cacheLine_data = s2_array_data.cacheLine(s2_hit_way).data
  val s2_cache_miss = s2_valid && !s2_is_uncached_access && !s2_hit

  
  // === Stage 3: 处理hit、miss以及uncache（mmu异常） ===

  val s3_cacheLine_data  = Reg(UInt((blockBytes * 8).W))

  //TODO：请根据写的状态机正确处理s3_ready
  //处理miss、非缓存及命中
  //三种情况满足一种即可ready
  //s3_ready := false.B //TODO

  val s_idle :: s_hit :: s_miss_req :: s_miss_wait :: s_miss_write :: s_uncache_req :: s_uncache_wait :: s_done :: s_mmu_error_state :: Nil = Enum(9)
  
  val state = RegInit(s_idle)
  val next_state = WireInit(s_idle)
  val cpu_ready = io.icache_resp.ready

  val s3_fire =((s3_valid && s3_hit) || state === s_done )&& cpu_ready


  val s2_can_bypass = (s2_ptag === s3_ptag && s2_vidx === s3_pidx && miss_data_valid && s3_valid && s3_miss && !s3_uncached && !(s3_mmu_error.getAnyError))
  val s2_bypass_data = miss_data_buffer
  when(s3_flush) {
    s3_valid := false.B
  }.elsewhen(s2_fire && !s2_flush) {
    s3_valid := true.B
    s3_vaddr := s2_vaddr
    s3_paddr := s2_paddr

    s3_uncached := s2_uncached
    s3_mmu_error := s2_mmu_error

    s3_hit := s2_hit || s2_can_bypass_from_s1 || s2_can_bypass
    s3_hit_way := Mux(s2_can_bypass_from_s1, s2_hit_way_from_s1, (

      Mux(s2_can_bypass, io.victim_read.resp ,s2_hit_way)

    )) 

    s3_miss := s2_cache_miss && ( !s2_can_bypass_from_s1 && !s2_can_bypass)
    s3_cacheLine_data := Mux(s2_can_bypass_from_s1, s2_bypass_data_from_s1, (

      Mux(s2_can_bypass, s2_bypass_data ,s2_cacheLine_data)

    )) 

  }.elsewhen(s3_fire) {
    s3_valid := false.B
  }
  s3_ptag := s3_paddr(31, blockOffBits + idxBits)
  s3_pidx := s3_paddr(blockOffBits + idxBits - 1, blockOffBits)

  // === Stuation1：Hit时 ===
  // Task1：在s3_cacheLine_data这个一整个CacheLine中提取最多fetchWidth条指令出来（如何跨Cache行了不够则能取多少取多少）
  // Task2：更新Replacer替换算法
  // 更新接口如下：
  // io.replacer_touch.valid := s3_hit
  // io.replacer_touch.idx   := s3_pidx
  // io.replacer_touch.way   := s3_hit_way
  // 
  // === Stuation2：Miss时 ===
  // Task1：向外发起AXI访问（发起大小是一个Cacha行大小，并且要处理突发传输）
  // 接口为：
  //  AXI3 Master完整IO接口
  //  class AXI3MasterIO(implicit p: Parameters) extends NSBundle {
  //    val ar = new AXI3ARChannel
  //    val aw = new AXI3AWChannel
  //    val w  = new AXI3WChannel
  //    val r  = new AXI3RChannel
  //    val b  = new AXI3BChannel
  //  }
  // Task2：通过对数据和Tag进行更新，这里不需要处理替换算法，外层自行处理
  // 接口为：
  //     val write = Flipped(new Bundle {
  //       val valid = Bool()
  //       val idx   = UInt(idxBits.W)
  //       val tag   = UInt(tagBits.W)     // 要写入的标签
  //       val data  = UInt(dataBits.W)    // 要写入的数据
  //     })
  // Task3：拿到数据后提取最多fetchWidth条指令出来（如何跨Cache行了不够则能取多少取多少）

  // === Stuation3：Uncache时 ===
  // Task1：向外发起AXI访问（发起大小是一个字大小）
  // Task2：拿到数据后结束并向后给

  // === Stuation3：mmu_error时 ===
  // Task1：暂定，暂认为不会出现此错误，保留处理的接口即可

  // === 状态机定义 ===

  // 状态转移逻辑
  switch(state) {
    is(s_idle) {
      when(s3_valid && !s3_flush && !s3_hit) {
        // 根据Stage 2的结果选择下一个状态
        when(s3_mmu_error.getAnyError) {
          next_state := s_mmu_error_state
        }.elsewhen(s3_uncached) {
          next_state := s_uncache_req
        }.elsewhen(s3_miss) {
          next_state := s_miss_req
        }.elsewhen(s3_hit) {
          next_state := s_hit
        }.otherwise {
          // 理论上不应该到这里
          next_state := s_idle
        }
      }.otherwise {
        next_state := s_idle
      }
    }
    
    is(s_hit) {
      // 命中处理在一个周期内完成
      next_state := s_done
    }
    
    is(s_miss_req) {
      // 发起AXI读请求后等待
      when(io.axi.ar.arready) {
        next_state := s_miss_wait
      }.otherwise {
        next_state := s_miss_req
      }
    }
    
    is(s_miss_wait) {
      // 等待AXI响应
      when(io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiMissId.U) {
        next_state := s_miss_write
      }.otherwise {
        next_state := s_miss_wait
      }
    }
    
    is(s_miss_write) {
      // 写入Cache阵列
      next_state := s_done
    }
    
    is(s_uncache_req) {
      // 发起非缓存读请求
      when(io.axi.ar.arready) {
        next_state := s_uncache_wait
      }.otherwise {
        next_state := s_uncache_req
      }
    }
    
    is(s_uncache_wait) {
      // 等待非缓存响应
      when(io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiNucacheId.U) {
        next_state := s_done
      }.otherwise {
        next_state := s_uncache_wait
      }
    }
    
    is(s_mmu_error_state) {
      // MMU错误，直接完成
      next_state := s_done
    }
    
    is(s_done) {
      // 完成状态，等待外层ready
      when(cpu_ready) {
        next_state := s_idle
      }.otherwise {
        next_state := s_done
      }
    }
  }
  // 处理flush信号
  when(s3_flush) {
    state := s_idle
  }.otherwise {
    state := next_state
  }

  // 1. 命中处理
  val hit_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  val hit_valids = Wire(Vec(fetchWidth, Bool()))
  val word_offset = Wire(UInt(5.W))
    
  word_offset :=  s3_vaddr(blockOffBits-1, 2)  // 摄取低两位，计算字偏移
  
  for (i <- 0 until fetchWidth) {
    val word_offset_i = (word_offset + i.U)// % (blockBytes/4).U
    val bit_offset = word_offset_i * 32.U
    hit_instrs(i) := (s3_cacheLine_data >> bit_offset)(31, 0)
    hit_valids(i) := Mux( word_offset_i < (blockBytes/4).U, true.B, false.B )
  }

  // 2. 缺失处理



  val miss_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  val miss_valids = Wire(Vec(fetchWidth, Bool()))
  //val word_offset = s3_vaddr(blockOffBits-1, 2)  // 摄取低两位，计算字偏移
  
  for (i <- 0 until fetchWidth) {
    val word_offset_i = (word_offset + i.U)// % (blockBytes/4).U
    val bit_offset = word_offset_i * 32.U
    miss_instrs(i) := (miss_data_buffer >> bit_offset)(31, 0)
    miss_valids(i) := Mux( word_offset_i < (blockBytes/4).U, true.B, false.B )
  }
  
  // 3. 非缓存处理
  val uncache_data_buffer = Reg(UInt(32.W))
  val uncache_data_valid = RegInit(false.B)
  val uncache_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  uncache_instrs(0) := uncache_data_buffer
  for (i <- 1 until fetchWidth) {
    uncache_instrs(i) := 0.U
  }
  
  // 4. 最终输出
  val output_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  val output_instvalids = Wire(Vec(fetchWidth, Bool()))
  val output_valid = Wire(Bool())
  val output_miss = Wire(Bool())
  val output_uncached = Wire(Bool())
  val output_mmu_error = Wire(new MmuTransError)

  output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
  output_instvalids := 0.U.asTypeOf(Vec(fetchWidth, Bool()))
  output_valid := false.B
  output_miss := false.B
  output_uncached := false.B
  output_mmu_error := 0.U.asTypeOf(new MmuTransError)

  io.icache_resp.bits.instrs := output_instrs
  io.icache_resp.valid := output_valid
  io.icache_resp.bits.instvalids := output_instvalids

  io.icache_resp.bits.addr := s3_vaddr

  //io.icache_resp.bits.miss := output_miss
  io.icache_resp.bits.uncached := output_uncached
  io.icache_resp.bits.mmu_error := output_mmu_error
  

  
  
  // 根据状态选择输出
  switch(state) {
    is(s_idle){
      when(s3_hit && s3_valid) {
        output_instrs := hit_instrs
        output_instvalids := hit_valids
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := 0.U.asTypeOf(new MmuTransError)
      }
    }
    is(s_done) {
      when(miss_data_valid) {
        output_instrs := miss_instrs
        output_instvalids := miss_valids
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := 0.U.asTypeOf(new MmuTransError)
      }.elsewhen(uncache_data_valid) {
        output_instrs := uncache_instrs
        output_instvalids(0) := true.B
        output_instvalids(1) := false.B
        output_instvalids(2) := false.B
        output_instvalids(3) := false.B
        output_valid := true.B
        output_miss := false.B
        output_uncached := true.B
        output_mmu_error := 0.U.asTypeOf(new MmuTransError)
      }.elsewhen(s3_mmu_error.getAnyError) {
        output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := s3_mmu_error
      }.otherwise {
        output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
        output_valid := false.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := 0.U.asTypeOf(new MmuTransError)
      }
    }
    
    is(s_mmu_error_state) {
      output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
      output_valid := true.B
      output_miss := false.B
      output_uncached := false.B
      output_mmu_error := s3_mmu_error
    }
    
    //default {
    //  output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
    //  output_valid := false.B
    //  output_miss := false.B
    //  output_uncached := false.B
    //  output_mmu_error := false.B
    //}
  }
  
  // 输出到接口
  //io.s3_valid := output_valid
  //io.s3_vaddr := s3_vaddr
  //io.s3_instrs := output_instrs
  //io.s3_miss := output_miss
  //io.s3_uncached := output_uncached
  //io.s3_mmu_error := output_mmu_error
  
  // === Stage 3 ready信号 ===
  // Stage 3准备好接收新数据的条件：空闲状态或完成状态且外层已准备好

  
  s3_ready := ((state === s_idle && s3_valid && s3_hit)) || (state === s_idle && !s3_valid) || (state === s_done && cpu_ready)//io.cpu_ready)
  
  // === 各状态的具体任务 ===
  
  // 1. 命中状态
  when(s3_hit) {
    // 更新替换算法
    io.replacer_touch.valid := true.B
    io.replacer_touch.idx   := s3_pidx
    io.replacer_touch.way   := s3_hit_way
  }.otherwise {
    io.replacer_touch.valid := false.B
    io.replacer_touch.idx   := s3_pidx
    io.replacer_touch.way   := s3_hit_way
  }


  io.axi.aw <> WireDefault(0.U.asTypeOf(new AXI3AWChannel))
  io.axi.w  <> WireDefault(0.U.asTypeOf(new AXI3WChannel))
  io.axi.b  <> WireDefault(0.U.asTypeOf(new AXI3BChannel))
  
  // 2. 缺失状态 - 发起AXI请求
  val axi_burst_length = (blockBytes / 4 - 1).U  // 突发长度，以字为单位
  
  io.axi.ar.data.arlock  := 0.U
  io.axi.ar.data.arcache := 0.U
  io.axi.ar.data.arprot  := 0.U
  when(state === s_miss_req) {
    // 发起Cache行读取
    io.axi.ar.data.arid    := icacheAxiMissId.U
    io.axi.ar.data.araddr  := Cat(s3_ptag, s3_pidx, 0.U(blockOffBits.W))
    io.axi.ar.data.arlen   := axi_burst_length
    io.axi.ar.data.arsize  := 2.U  // 4字节
    io.axi.ar.data.arburst := 1.U  // 递增突发
    io.axi.ar.data.arvalid := true.B
  }.elsewhen(state === s_uncache_req) {
    // 发起非缓存读取（单字）
    io.axi.ar.data.arid    := icacheAxiNucacheId.U
    io.axi.ar.data.araddr  := s3_paddr
    io.axi.ar.data.arlen   := 0.U
    io.axi.ar.data.arsize  := 2.U  // 4字节
    io.axi.ar.data.arburst := 1.U  // 递增突发
    io.axi.ar.data.arvalid := true.B

  }.otherwise {
    io.axi.ar.data.arid    := 0.U
    io.axi.ar.data.arvalid := false.B
    io.axi.ar.data.araddr  := 0.U
    io.axi.ar.data.arlen   := 0.U
    io.axi.ar.data.arsize  := 0.U
    io.axi.ar.data.arburst := 0.U
  }
  
  // 连接其他AXI信号（简化）
  io.axi.aw.data.awvalid := false.B
  io.axi.w.data.wvalid   := false.B
  io.axi.r.rready   := (state === s_miss_wait) || (state === s_uncache_wait)
  io.axi.b.bready   := false.B
  
  // 3. 缺失状态 - 收集数据
  when(state === s_miss_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiMissId.U) {
    // 收集突发传输的数据
    val beat_counter = RegInit(0.U(4.W))
    
    when(io.axi.r.data.rvalid) {
      // 将数据拼接到缓冲区
      val beat = beat_counter
      val data_offset = beat * 32.U
      miss_data_buffer := miss_data_buffer | (io.axi.r.data.rdata << data_offset)
      beat_counter := beat_counter + 1.U
      
      when(io.axi.r.data.rlast) {
        miss_data_valid := true.B
        beat_counter := 0.U
      }
    }
  }

  when (s3_fire){
    miss_data_buffer := 0.U
  }
  
  // 4. 缺失状态 - 写入data
  when(state === s_miss_write && miss_data_valid && cpu_ready) {
    io.array_write.valid := true.B
    io.array_write.idx   := s3_pidx
    io.array_write.tag   := s3_ptag
    io.array_write.data  := miss_data_buffer
    // way由替换算法决定，这里暂时使用s3_hit_way（实际应该从替换算法获取）
    io.victim_read.req := true.B
    io.victim_read.idx := s3_pidx
    io.array_write.way   := io.victim_read.resp

    io.replacer_touch.valid := true.B
    io.replacer_touch.idx := s3_pidx
    io.replacer_touch.way := io.victim_read.resp
    

  }.otherwise {
    io.array_write.valid := false.B
    io.array_write.idx   := 0.U
    io.array_write.tag   := 0.U
    io.array_write.data  := 0.U
    io.array_write.way   := 0.U

    io.victim_read.req := false.B
    io.victim_read.idx := s3_pidx

    io.replacer_touch.valid := false.B
    io.replacer_touch.idx := s3_pidx
    io.replacer_touch.way := io.victim_read.resp

  }


  
  // 5. 非缓存状态 - 收集数据
  when(state === s_uncache_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiNucacheId.U) {
    uncache_data_buffer := io.axi.r.data.rdata
    uncache_data_valid := true.B
  }
  
  // 6. MMU错误状态
  when(state === s_mmu_error_state) {
    // 可以记录错误信息或触发异常
    // 这里暂时不处理
  }

  // 清除缓冲区
  when(state === s_done && cpu_ready){
  
    miss_data_valid := false.B

    uncache_data_valid := false.B

  }
  
  // === 性能计数器 ===
  val perf_hit = RegInit(0.U(32.W))
  val perf_miss = RegInit(0.U(32.W))
  val perf_uncached = RegInit(0.U(32.W))
  val perf_mmu_error = RegInit(0.U(32.W))
  
  when(state === s_hit && next_state === s_done) {
    perf_hit := perf_hit + 1.U
  }
  when(state === s_miss_write) {
    perf_miss := perf_miss + 1.U
  }
  when(state === s_uncache_wait && io.axi.r.data.rid === icacheAxiNucacheId.U && io.axi.r.data.rvalid && io.axi.r.data.rlast) {
    perf_uncached := perf_uncached + 1.U
  }
  when(state === s_mmu_error_state) {
    perf_mmu_error := perf_mmu_error + 1.U
  }
  
  println("ICache Stage 3 State Machine instantiated:")
  println(s"  States: Idle, Hit, Miss_Req, Miss_Wait, Miss_Write, Uncache_Req, Uncache_Wait, Done, MMU_Error")
  println(s"  Fetch Width: $fetchWidth, Block Size: $blockBytes bytes")
  
}
