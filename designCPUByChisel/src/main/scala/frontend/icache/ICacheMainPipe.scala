package nscscc.frontend.icache
 
import chisel3._
import chisel3.util._
import nscscc.mem.L2cache.L2NativeReadIO
import nscscc.config.Parameters
import nscscc.config._
import nscscc.mmu._
import nscscc.config.NSModule
import nscscc.config.NSBundle
 
class ICacheMainPipe(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val redirect = Input(Bool())
    // CPU接口
    val cpu_req = Flipped(Decoupled(new Bundle {
      val addr  = (UInt(32.W))   // 虚拟地址
    }))
 
    val icache_resp = Decoupled(new IcacheResp)
 
    val l2_read = new L2NativeReadIO(1)
 
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
  val s0_cango = io.mmu.toMmu.ready
  val s0_fire = ( s0_valid  && s1_ready ) && s0_cango
  val s0_ready = s0_fire || !s0_valid
  io.cpu_req.ready := s0_ready
 
  val curr_vidx = io.cpu_req.bits.addr(blockOffBits + idxBits - 1, blockOffBits)
  val curr_vtag = io.cpu_req.bits.addr(31, blockOffBits + idxBits)
 
  // === Stage 0: 发出Cached的SRAM读取请求，向MMU发起地址转换 ===
   
  val s0_vaddr = RegInit(0.U(32.W))
  val s0_vidx  = RegInit(0.U(idxBits.W))
  val s0_vtag  = RegInit(0.U(tagBits.W))
 
  val io_fire = s0_ready && io.cpu_req.valid
 
  when(s0_flush) {
    s0_valid  := false.B
    
  }.elsewhen(io_fire && !s0_flush){
    s0_valid := io.cpu_req.bits.addr =/=  0x1BFFFFFC.U
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
  val s1_vaddr = RegInit(0.U(32.W))
  val s1_vidx  = RegInit(0.U(idxBits.W))
  val s1_vtag  = RegInit(0.U(tagBits.W))
 
  val s1_fire  = Wire(Bool())
  val s2_ready = Wire(Bool())
 
  val s1_cango = Wire(Bool())
  s1_fire  := ( s1_valid  && s2_ready ) && s1_cango
  s1_ready := s1_fire || !s1_valid
  
  when(s1_flush) {
    s1_valid  := false.B
  }.elsewhen(s0_fire && !s0_flush){
    s1_valid := true.B
    s1_vaddr := s0_vaddr
    s1_vidx  := s0_vidx
    s1_vtag  := s0_vtag
  }.elsewhen(s1_fire){
    s1_valid  := false.B
  }
  io.mmu.fromMmu.ready := true.B
  val mmu_resp_fire = io.mmu.fromMmu.valid
  val array_resp_fire = io.arrays_read.resp.valid
 
  val s1_responses_ready = RegInit(false.B)
  val s1_mmu_received = RegInit(false.B)
  val s1_array_received = RegInit(false.B)
  s1_cango := (s1_array_received || array_resp_fire) &&
              (s1_mmu_received || mmu_resp_fire)
 
  val s1_array_received_data = RegInit(0.U.asTypeOf(new arrayReadData))
  val s1_mmu_received_data   = RegInit(0.U.asTypeOf(new MmuToIcache))
    // 记录响应接收状态
  when(s0_fire || s1_flush) {
    s1_array_received := false.B
  }.elsewhen(array_resp_fire) {
    s1_array_received := true.B
    s1_array_received_data := io.arrays_read.resp.data
  }
 
  when(s0_fire || s1_flush) {
    s1_mmu_received := false.B
  }.elsewhen(mmu_resp_fire) {
    s1_mmu_received := true.B
    s1_mmu_received_data := io.mmu.fromMmu.bits
  }
  // === Stage 2: 标签比较和命中判断 ===
  val s2_valid = RegInit(false.B)
  val s2_vaddr     = RegInit(0.U(32.W))
  val s2_paddr     = RegInit(0.U(32.W))
  val s2_uncached  = RegInit(false.B)
  val s2_mmu_error = RegInit(0.U.asTypeOf(new MmuTransError))
  val s2_vidx      = RegInit(0.U(idxBits.W))
  val s2_vtag      = RegInit(0.U(tagBits.W))
  val s2_pidx      = RegInit(0.U(idxBits.W))
  val s2_ptag      = RegInit(0.U(tagBits.W))
  val s2_array_data = RegInit(0.U.asTypeOf(new arrayReadData))
   
  val s3_ready = Wire(Bool())
  val s2_fire = ( s2_valid && s3_ready)
  val s2_is_uncached_access = s2_mmu_error.getAnyError || s2_uncached
  s2_ready := s2_fire || !s2_valid
 
  val s1_ptag = Mux(s1_mmu_received, s1_mmu_received_data.paddr(31, blockOffBits + idxBits), io.mmu.fromMmu.bits.paddr(31, blockOffBits + idxBits))
  val s1_array_data_read = Mux(s1_array_received, s1_array_received_data, io.arrays_read.resp.data)
  val s1_paddr = Mux(s1_mmu_received, s1_mmu_received_data.paddr, io.mmu.fromMmu.bits.paddr)
 
  val s3_ptag    = Wire(UInt(tagBits.W))
  val s3_pidx    = Wire(UInt(idxBits.W))
  val s3_vidx    = Wire(UInt(idxBits.W))
 
  val miss_data_valid = RegInit(false.B)
  val s3_valid = RegInit(false.B)
  val s3_vaddr         = RegInit(0.U(32.W))
  val s3_paddr         = RegInit(0.U(32.W))
  val s3_uncached      = RegInit(false.B)
  val s3_mmu_error     = RegInit(0.U.asTypeOf(new MmuTransError))
  val s3_hit           = RegInit(false.B)
  val s3_miss          = RegInit(false.B)
  val s3_hit_way       = RegInit(0.U(wayBits.W))
  val miss_data_words = RegInit(VecInit(Seq.fill(blockBytes / (XLEN / 8))(0.U(XLEN.W))))
  val miss_data_buffer = miss_data_words.asUInt
  val s1_bypass_data = miss_data_buffer
  val s1_can_bypass = (s1_ptag === s3_ptag && s1_vidx === s3_vidx && miss_data_valid && s3_valid && s3_miss && !s3_uncached && !(s3_mmu_error.getAnyError))
  val s1_bypass_hit_way    = io.victim_read.resp
 
  val s2_bypass_data_from_s1 = RegInit(0.U((blockBytes * 8).W))
  val s2_can_bypass_from_s1  = RegInit(false.B)
  val s2_hit_way_from_s1     = RegInit(0.U(wayBits.W))
 
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
    s2_can_bypass_from_s1 := s1_can_bypass && !Mux(s1_mmu_received, !s1_mmu_received_data.cacheable, !io.mmu.fromMmu.bits.cacheable)
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
 
  val s3_cacheLine_data = RegInit(0.U((blockBytes * 8).W))
 
  val cpu_ready = io.icache_resp.ready
  //      0       1         2                 3              4                5               6            7              8                  9                10               11                    12                                       
  val s_idle :: s_hit :: s_miss_req :: s_miss_wait :: s_miss_write :: s_uncache_req :: s_uncache_wait :: s_done :: s_mmu_error_state :: s_drain_miss :: s_drain_uncache :: s_drain_miss_req :: s_drain_uncache_req :: Nil = Enum(13)
  
  val state = RegInit(s_idle)
  val next_state = WireInit(s_idle)

 
  val s3_fire =((s3_valid && s3_hit) || state === s_done )&& cpu_ready
 
 
  val s2_can_bypass = (s2_ptag === s3_ptag && s2_vidx === s3_vidx && miss_data_valid && s3_valid && s3_miss && !s3_uncached && !s2_uncached && !(s3_mmu_error.getAnyError))
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

  
  s3_vidx := s3_vaddr(blockOffBits + idxBits - 1, blockOffBits)
 
 
  // ══════════════════════════════════════════════════════════════
  //  状态机：13 状态
  //
  //  新增 s_drain_miss_req / s_drain_uncache_req：
  //    当 flush 来袭时，如果 ARVALID 已拉高但 ARREADY 尚未到来，
  //    不能撤 ARVALID（AXI 协规要求），必须进入这两个状态
  //    继续保持 ARVALID，等 ARREADY 到后才转入 drain_wait 排空响应。
  // ══════════════════════════════════════════════════════════════

  
  // 状态转移逻辑
  switch(state) {
    is(s_idle) {
      when(s3_valid && !s3_flush && !s3_hit) {

        when(s3_mmu_error.getAnyError) {
          next_state := s_mmu_error_state
        }.elsewhen(s3_uncached) {
          next_state := s_uncache_req
        }.elsewhen(s3_miss) {
          next_state := s_miss_req
        }.elsewhen(s3_hit) {
          next_state := s_hit
        }.otherwise {
          next_state := s_idle
        }


      }.otherwise {
        next_state := s_idle
      }
    }
    
//    is(s_hit) {
//      next_state := s_done
//    }
    
    is(s_miss_req) {
      next_state := Mux(io.l2_read.req.fire, s_miss_wait, s_miss_req)
    }
    
    is(s_miss_wait) {
      next_state := Mux(io.l2_read.resp.fire && io.l2_read.resp.bits.last,
        s_miss_write, s_miss_wait)
    }
    
    is(s_miss_write) {
      next_state := s_done
    }
    
    is(s_uncache_req) {
      next_state := Mux(io.l2_read.req.fire, s_uncache_wait, s_uncache_req)
    }
    
    is(s_uncache_wait) {
      next_state := Mux(io.l2_read.resp.fire && io.l2_read.resp.bits.last,
        s_done, s_uncache_wait)
    }
    
    is(s_mmu_error_state) {
      next_state := s_done
    }
    
    is(s_done) {
      when(cpu_ready) {
        next_state := s_idle
      }.otherwise {
        next_state := s_done
      }
    }
    
    is(s_drain_miss) {
      next_state := Mux(io.l2_read.resp.fire && io.l2_read.resp.bits.last,
        s_idle, s_drain_miss)
    }
    
    is(s_drain_uncache) {
      next_state := Mux(io.l2_read.resp.fire && io.l2_read.resp.bits.last,
        s_idle, s_drain_uncache)
    }
    
    // ── 新增：flush 时 ARVALID 已拉高但 ARREADY 未到的守卫状态 ──
    // 保持 ARVALID 不撤，等 ARREADY 到后转入 drain 排空响应
    is(s_drain_miss_req) {
      next_state := Mux(io.l2_read.req.fire, s_drain_miss, s_drain_miss_req)
    }
    
    is(s_drain_uncache_req) {
      next_state := Mux(io.l2_read.req.fire, s_drain_uncache, s_drain_uncache_req)
    }
  }
  
  // ══════════════════════════════════════════════════════════════
  //  flush 时状态覆盖逻辑（修正版）
  //
  //  核心原则：ARVALID 一旦拉高，在 ARREADY 到来之前绝不能撤！
  //
  //  分类处理：
  //    1. AR 已握手完成（s_miss_wait / s_uncache_wait / drain）：
  //       响应必然到来 → 进入 drain 排空
  //    2. AR 已握手完成（本拍 arready 刚到）：
  //       响应必然到来 → 进入 drain 排空
  //    3. ARVALID 已拉高但 ARREADY 还没到（s_miss_req / s_uncache_req）：
  //       **不能撤 ARVALID** → 进入 s_drain_miss_req / s_drain_uncache_req
  //       继续保持 ARVALID，等 ARREADY 到后转入 drain 排空
  //    4. 其他状态（idle / hit / done / mmu_error / miss_write）：
  //       无 AXI 事务在途 → 安全回到 idle
  // ══════════════════════════════════════════════════════════════
  val readNativeLastFire = io.l2_read.resp.fire && io.l2_read.resp.bits.last
 
  when(s3_flush) {
    // ── miss 路径 ──
    when(state === s_miss_wait && !readNativeLastFire) {
      // AR 已完成，R 响应还在路上 → 排空
      state := s_drain_miss
    }.elsewhen(state === s_drain_miss && !readNativeLastFire) {
      // 已在排空，继续
      state := s_drain_miss
    }.elsewhen(state === s_miss_req && io.l2_read.req.fire) {
      // AR 握手本拍刚好完成，响应必然到来 → 排空
      state := s_drain_miss
    }.elsewhen(state === s_miss_req && !io.l2_read.req.fire) {
      // native请求尚未握手，redirect可以直接取消。
      state := s_idle
    }
    // ── uncache 路径 ──
    .elsewhen(state === s_uncache_wait && !readNativeLastFire) {
      state := s_drain_uncache
    }.elsewhen(state === s_drain_uncache && !readNativeLastFire) {
      state := s_drain_uncache
    }.elsewhen(state === s_uncache_req && io.l2_read.req.fire) {
      state := s_drain_uncache
    }.elsewhen(state === s_uncache_req && !io.l2_read.req.fire) {
      // native请求尚未握手，redirect可以直接取消。
      state := s_idle
    }
 
    // ── 其他状态：无 AXI 事务在途 → 安全回到 idle ──
    .otherwise {
      state := s_idle
    }
  }.otherwise {
    state := next_state
  }
 
  // 1. 命中处理
  val hit_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  val hit_valids = Wire(Vec(fetchWidth, Bool()))
  val word_offset = Wire(UInt(5.W))
    
  word_offset :=  s3_vaddr(blockOffBits-1, 2)
  
  for (i <- 0 until fetchWidth) {
    val word_offset_i = (word_offset + i.U)
    val bit_offset = word_offset_i * 32.U
    hit_instrs(i) := (s3_cacheLine_data >> bit_offset)(31, 0)
    hit_valids(i) := Mux( word_offset_i < (blockBytes/4).U, true.B, false.B )
  }
 
  // 2. 缺失处理
  val miss_instrs = Wire(Vec(fetchWidth, UInt(32.W)))
  val miss_valids = Wire(Vec(fetchWidth, Bool()))
  
  for (i <- 0 until fetchWidth) {
    val word_offset_i = (word_offset + i.U)
    val bit_offset = word_offset_i * 32.U
    miss_instrs(i) := (miss_data_buffer >> bit_offset)(31, 0)
    miss_valids(i) := Mux( word_offset_i < (blockBytes/4).U, true.B, false.B )
  }
  
  // 3. 非缓存处理
  val uncache_data_buffer = RegInit(0.U(32.W))
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
  output_mmu_error := s3_mmu_error
 

  
  // 根据状态选择输出
  // 对外的输出，包括output_valid和output_instvalids
  // 只允许在s_idle && hit （包括异常时的hit） 的时候
  //      在s_done的时候输出
  // 其他状态坚决不允许输出
  //  s3_hit的时候状态机是不会变化的
  //  hit 和mmu err是可能同时发生的
  io.icache_resp.bits.instrs      :=   output_instrs
  io.icache_resp.valid            :=   output_valid
  io.icache_resp.bits.instvalids  :=   output_instvalids
  io.icache_resp.bits.addr        :=   s3_vaddr
  io.icache_resp.bits.uncached    :=   output_uncached
  io.icache_resp.bits.mmu_error   :=   output_mmu_error
  switch(state) {
    is(s_idle){
      when(s3_hit && s3_valid ) { //&& !s3_mmu_error.getAnyError) {
      //包括mmu err的时候，这里也是会用hit响应
      //但只要正确传出s3_mmu_error就没啥问题
        output_instrs := hit_instrs
        output_instvalids := hit_valids
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := s3_mmu_error
      }
    }
    
    is(s_done) {
      when(miss_data_valid) {
        output_instrs := miss_instrs
        output_instvalids := miss_valids
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := s3_mmu_error
      }.elsewhen(uncache_data_valid) {
        output_instrs := uncache_instrs
        output_instvalids(0) := true.B
        output_instvalids(1) := false.B
        output_instvalids(2) := false.B
        output_instvalids(3) := false.B
        output_valid := true.B
        output_miss := false.B
        output_uncached := true.B
        output_mmu_error := s3_mmu_error
      }.elsewhen(s3_mmu_error.getAnyError) {
        output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
        //这里就是mmu_error + 没有取到任何的指令的情况
        // mmuerr也可能同时伴随着hit的情况
        //这种情况也是需要再传出一个有效值出去的！！！！
        output_instvalids(0) := true.B
        output_instvalids(1) := false.B
        output_instvalids(2) := false.B
        output_instvalids(3) := false.B
        
        output_valid := true.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := s3_mmu_error
      }.otherwise {
        output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
        output_valid := false.B
        output_miss := false.B
        output_uncached := false.B
        output_mmu_error := s3_mmu_error
      }
    }
// 不允许在此状态进行输出
//    is(s_mmu_error_state) {
//      output_instrs := 0.U.asTypeOf(Vec(fetchWidth, UInt(32.W)))
//      output_valid := false.B
//      output_instvalids(0) := false.B
//      output_instvalids(1) := false.B
//      output_instvalids(2) := false.B
//      output_instvalids(3) := false.B
//      
//      output_miss := false.B
//      output_uncached := false.B
//      output_mmu_error := s3_mmu_error
//    }
  }
  
  // === Stage 3 ready信号 ===
  s3_ready := ((state === s_idle && s3_valid && s3_hit && cpu_ready)) || (state === s_idle && !s3_valid) || (state === s_done && cpu_ready)
  
  // === 各状态的具体任务 ===
  
  // 1. 命中状态
  when(s3_hit) {
    io.replacer_touch.valid := true.B
    io.replacer_touch.idx   := s3_vidx
    io.replacer_touch.way   := s3_hit_way
  }.otherwise {
    io.replacer_touch.valid := false.B
    io.replacer_touch.idx   := s3_vidx
    io.replacer_touch.way   := s3_hit_way
  }
 
 
  // miss与uncache共用一个分组native读端口。
  val nativeReqPending = state === s_miss_req || state === s_uncache_req
  io.l2_read.req.valid := nativeReqPending && !s3_flush
  io.l2_read.req.bits.id := 0.U
  io.l2_read.req.bits.addr := s3_paddr
  io.l2_read.req.bits.size := 2.U
  io.l2_read.req.bits.uncache := state === s_uncache_req ||
    state === s_drain_uncache_req
  when(state === s_miss_req || state === s_drain_miss_req) {
    io.l2_read.req.bits.addr := Cat(s3_ptag, s3_pidx, 0.U(blockOffBits.W))
  }
 
  val nativeRespExpected = state === s_miss_wait || state === s_uncache_wait ||
    state === s_drain_miss || state === s_drain_uncache
  // ICache V1只发出ID=0，不接收不属于当前事务的返回。
  io.l2_read.resp.ready := nativeRespExpected && io.l2_read.resp.bits.id === 0.U
  
  val beat_counter = RegInit(0.U(4.W))
  
  // L2 hit一次返回整行；L2 miss则逐beat提前旁路。
  when(state === s_miss_wait && io.l2_read.resp.fire) {
    when(io.l2_read.resp.bits.fullLine) {
      miss_data_words := io.l2_read.resp.bits.data.asTypeOf(
        Vec(blockBytes / (XLEN / 8), UInt(XLEN.W)))
    }.otherwise {
      miss_data_words(beat_counter) := io.l2_read.resp.bits.data(XLEN - 1, 0)
      beat_counter := beat_counter + 1.U
    }
    when(io.l2_read.resp.bits.last) {
      miss_data_valid := true.B
      beat_counter := 0.U
    }
  }
 
  // drain_miss 状态排空时重置 beat_counter
  when(state === s_drain_miss && io.l2_read.resp.fire && io.l2_read.resp.bits.last) {
    beat_counter := 0.U
  }
 
  when (s3_fire){
    miss_data_words := VecInit(Seq.fill(blockBytes / (XLEN / 8))(0.U(XLEN.W)))
  }
   
  // 4. 缺失状态 - 写入data
  io.victim_read.req := (state === s_miss_req) || (state === s_miss_wait) || (state === s_miss_write)
  io.victim_read.idx := s3_vidx

  when(state === s_miss_write && miss_data_valid ){ //&& cpu_ready) {
    io.array_write.valid := true.B
    io.array_write.idx   := s3_vidx
    io.array_write.tag   := s3_ptag
    io.array_write.data  := miss_data_buffer
    //io.victim_read.req := true.B
    //io.victim_read.idx := s3_vidx
    io.array_write.way   := io.victim_read.resp
 
    io.replacer_touch.valid := true.B
    io.replacer_touch.idx := s3_vidx
    io.replacer_touch.way := io.victim_read.resp
    
  }.otherwise {
    io.array_write.valid := false.B
    io.array_write.idx   := 0.U
    io.array_write.tag   := 0.U
    io.array_write.data  := 0.U
    io.array_write.way   := 0.U
 
    //io.victim_read.req := false.B
    //io.victim_read.idx := s3_vidx
 
    io.replacer_touch.valid := false.B
    io.replacer_touch.idx := s3_vidx
    io.replacer_touch.way := io.victim_read.resp
  }
  
  // 5. 非缓存状态 - 收集数据
  when(state === s_uncache_wait && io.l2_read.resp.fire) {
    uncache_data_buffer := io.l2_read.resp.bits.data(XLEN - 1, 0)
    uncache_data_valid := true.B
  }
   
  // 6. MMU错误状态
  when(state === s_mmu_error_state) {
    // 不处理
  }
 
  // 清除缓冲区
  when(state === s_done && cpu_ready){
    miss_data_valid := false.B
    uncache_data_valid := false.B
  }
   
  // flush 时清除缓冲区有效信号（最高优先级）
  when(s3_flush) {
    miss_data_valid   := false.B
    uncache_data_valid := false.B
    miss_data_words := VecInit(Seq.fill(blockBytes / (XLEN / 8))(0.U(XLEN.W)))
    beat_counter      := 0.U
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
  when(state === s_uncache_wait && io.l2_read.resp.fire && io.l2_read.resp.bits.last) {
    perf_uncached := perf_uncached + 1.U
  }
  when(state === s_mmu_error_state) {
    perf_mmu_error := perf_mmu_error + 1.U
  }
}