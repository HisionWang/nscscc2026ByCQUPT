package nscscc.frontend.icache
 
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
    val cpu_req = Flipped(Decoupled(new Bundle {
      val addr  = UInt(32.W)   // 虚拟地址
    }))
    val icache_resp = Decoupled(new IcacheResp)
    val axi         = new AXI3MasterIO
    // SRAM接口
    val arrays_read = new ICacheArrayRead
    val array_write = new ICacheArrayWrite
    val victim_read = new victimRead
    val replacer_touch = new victimChange
    // MMU接口
    val mmu = new MMURead
  })

  // ══════════════════════════════════════════════════════════════
  // 根据配置决定是否使用 PIPT (假设 Parameters 存在 usePIPT 字段，若名字不同请自行修改)
  // 如果 p 没有定义 usePIPT，您可以将其替换为您的特定参数，例如 p.cacheConfig.usePIPT 或写死 true/false 用于测试
  // ══════════════════════════════════════════════════════════════
  
  if (usePIPT == 1) { 
    // --- S0 阶段：向 MMU 发起地址翻译 ---
    val s1_valid = RegInit(false.B)
    val s1_vaddr = RegInit(0.U(32.W))
    val s1_fire  = Wire(Bool())

    val s1_accepts = !s1_valid || s1_fire || io.redirect
    io.cpu_req.ready := s1_accepts
    
    val s0_fire = io.cpu_req.valid && s1_accepts && !io.redirect

    io.mmu.toMmu.valid := s0_fire
    io.mmu.toMmu.bits.vaddr := io.cpu_req.bits.addr
    io.mmu.fromMmu.ready := true.B

    when (s0_fire) {
      s1_valid := true.B
      s1_vaddr := io.cpu_req.bits.addr
    } .elsewhen (s1_fire || io.redirect) {
      s1_valid := false.B
    }

    // --- S1 阶段：接收 MMU，获取物理地址并向 SRAM Array 发起物理索引读 ---
    val s1_mmu_data    = RegInit(0.U.asTypeOf(new MmuToIcache))
    val s1_mmu_latched = RegInit(false.B)
    val next_mmu_latched = WireDefault(s1_mmu_latched)

    when (s1_valid && io.mmu.fromMmu.valid && !s1_mmu_latched) {
      s1_mmu_data      := io.mmu.fromMmu.bits
      next_mmu_latched := true.B
    }
    when (s1_fire || io.redirect) {
      next_mmu_latched := false.B
    }
    s1_mmu_latched := next_mmu_latched

    val cur_mmu_data = Mux(s1_valid && io.mmu.fromMmu.valid, io.mmu.fromMmu.bits, s1_mmu_data)
    val mmu_ready    = (s1_valid && io.mmu.fromMmu.valid) || s1_mmu_latched

    val s2_valid = RegInit(false.B)
    val s2_fire  = Wire(Bool())
    val s2_accepts = !s2_valid || s2_fire || io.redirect

    s1_fire := s1_valid && mmu_ready && s2_accepts && !io.redirect

    val s2_vaddr       = RegInit(0.U(32.W))
    val s2_mmu_data_reg = RegInit(0.U.asTypeOf(new MmuToIcache))

    // S1 发起 Array Read (使用物理索引 pidx)
    io.arrays_read.req.valid := s1_fire
    io.arrays_read.req.idx   := cur_mmu_data.paddr(blockOffBits + idxBits - 1, blockOffBits)

    when (s1_fire) {
      s2_valid       := true.B
      s2_vaddr       := s1_vaddr
      s2_mmu_data_reg := cur_mmu_data
    } .elsewhen (s2_fire || io.redirect) {
      s2_valid := false.B
    }

    // --- S2 阶段：接收 SRAM Array，执行 Tag 匹配判定与状态机触发 ---
    val expect_array_resp = RegNext(s1_fire, false.B)
    val s2_array_data     = RegInit(0.U.asTypeOf(new arrayReadData))
    val s2_array_latched  = RegInit(false.B)
    val next_array_latched = WireDefault(s2_array_latched)

    when (expect_array_resp) {
      s2_array_data      := io.arrays_read.resp.data
      next_array_latched := true.B
    }
    when (s2_fire || io.redirect) {
      next_array_latched := false.B
    }
    s2_array_latched := next_array_latched

    val cur_array_data = Mux(expect_array_resp, io.arrays_read.resp.data, s2_array_data)
    val array_ready    = expect_array_resp || s2_array_latched

    // 命中判定计算 (PIPT: 使用 MMU 中保留的物理地址进行判断)
    val ptag = s2_mmu_data_reg.paddr(31, blockOffBits + idxBits)
    val pidx = s2_mmu_data_reg.paddr(blockOffBits + idxBits - 1, blockOffBits)

    val hits = Wire(Vec(nWays, Bool()))
    for (i <- 0 until nWays) {
      hits(i) := cur_array_data.cacheLine(i).has && cur_array_data.cacheLine(i).tag === ptag
    }
    val array_hit = hits.asUInt.orR
    val hit_way   = OHToUInt(hits)
    val array_hit_data = cur_array_data.cacheLine(hit_way).data

    val has_mmu_error = s2_mmu_data_reg.error.getAnyError
    val is_cacheable  = s2_mmu_data_reg.cacheable
    
    val is_direct_hit = array_hit && is_cacheable && !has_mmu_error
    val s2_can_resp_direct = is_direct_hit || has_mmu_error

    // PIPT AXI FSM
    val s_idle :: s_miss_req :: s_miss_wait :: s_miss_write :: s_uncache_req :: s_uncache_wait :: s_done :: s_drain_miss :: s_drain_uncache :: s_drain_miss_req :: s_drain_uncache_req :: Nil = Enum(11)
    
    val state = RegInit(s_idle)
    
    val fsm_paddr      = RegInit(0.U(32.W))
    val fsm_ptag       = RegInit(0.U(tagBits.W))
    val fsm_idx        = RegInit(0.U(idxBits.W)) // PIPT 使用统一的 physical index
    val fsm_is_uncache = RegInit(false.B)

    val miss_data_buffer    = RegInit(0.U((blockBytes * 8).W))
    val miss_data_valid     = RegInit(false.B)
    val uncache_data_buffer = RegInit(0.U(32.W))
    val uncache_data_valid  = RegInit(false.B)
    val beat_counter        = RegInit(0.U(4.W))

    val fsm_trigger = s2_valid && array_ready && !s2_can_resp_direct && (state === s_idle) && !io.redirect

    val readAxiFire = io.axi.r.data.rvalid && io.axi.r.rready && 
                      (io.axi.r.data.rid === icacheAxiMissId.U || io.axi.r.data.rid === icacheAxiNucacheId.U) && 
                      io.axi.r.data.rlast

    when (io.redirect) {
      when(state === s_miss_wait && !readAxiFire) { state := s_drain_miss }
      .elsewhen(state === s_drain_miss && !readAxiFire) { state := s_drain_miss }
      .elsewhen(state === s_miss_req && io.axi.ar.arready) { state := s_drain_miss }
      .elsewhen(state === s_miss_req && !io.axi.ar.arready) { state := s_drain_miss_req }
      .elsewhen(state === s_drain_miss_req && io.axi.ar.arready) { state := s_drain_miss }
      .elsewhen(state === s_drain_miss_req && !io.axi.ar.arready) { state := s_drain_miss_req }
      .elsewhen(state === s_uncache_wait && !readAxiFire) { state := s_drain_uncache }
      .elsewhen(state === s_drain_uncache && !readAxiFire) { state := s_drain_uncache }
      .elsewhen(state === s_uncache_req && io.axi.ar.arready) { state := s_drain_uncache }
      .elsewhen(state === s_uncache_req && !io.axi.ar.arready) { state := s_drain_uncache_req }
      .elsewhen(state === s_drain_uncache_req && io.axi.ar.arready ) { state := s_drain_uncache }
      .elsewhen(state === s_drain_uncache_req && !io.axi.ar.arready ) { state := s_drain_uncache_req }
      .otherwise { state := s_idle }
    } .otherwise {
      switch (state) {
        is (s_idle) {
          when (fsm_trigger) {
            state := Mux(!is_cacheable, s_uncache_req, s_miss_req)
            fsm_paddr      := s2_mmu_data_reg.paddr
            fsm_ptag       := ptag
            fsm_idx        := pidx
            fsm_is_uncache := !is_cacheable
          }
        }
        is (s_miss_req) { when (io.axi.ar.arready) { state := s_miss_wait } }
        is (s_miss_wait) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiMissId.U) { state := s_miss_write }
        }
        is (s_miss_write) { state := s_done }
        is (s_uncache_req) { when (io.axi.ar.arready) { state := s_uncache_wait } }
        is (s_uncache_wait) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiNucacheId.U) { state := s_done }
        }
        is (s_done) {
          when (io.icache_resp.ready && s2_fire) { state := s_idle }
        }
        is (s_drain_miss) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiMissId.U) { state := s_idle }
        }
        is (s_drain_uncache) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiNucacheId.U) { state := s_idle }
        }
        is (s_drain_miss_req) { when (io.axi.ar.arready) { state := s_drain_miss } }
        is (s_drain_uncache_req) { when (io.axi.ar.arready) { state := s_drain_uncache } }
      }
    }

    when (state === s_miss_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiMissId.U) {
      val data_offset = beat_counter * 32.U
      miss_data_buffer := miss_data_buffer | (io.axi.r.data.rdata << data_offset)
      beat_counter := beat_counter + 1.U
      when (io.axi.r.data.rlast) {
        miss_data_valid := true.B
        beat_counter := 0.U
      }
    }

    when (state === s_drain_miss && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiMissId.U && io.axi.r.data.rlast) {
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
      beat_counter       := 0.U
    }

    when (state === s_uncache_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiNucacheId.U) {
      uncache_data_buffer := io.axi.r.data.rdata
      uncache_data_valid := true.B
    }

    when (s2_fire) { // s2_fire 替换原本的 s1_fire 用于清理数据
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
    }

    when (io.redirect) {
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
      beat_counter       := 0.U
    }

    // PIPT S2 数据装配与 CPU 输出
    val is_done_uncache = (state === s_done) && fsm_is_uncache
    val resp_data = Mux(state === s_done, 
                        Mux(is_done_uncache, uncache_data_buffer, miss_data_buffer),
                        array_hit_data)

    val word_offset = Wire(UInt(5.W))
    word_offset :=  s2_vaddr(blockOffBits-1, 2)
    val out_instrs  = Wire(Vec(fetchWidth, UInt(32.W)))
    val out_valids  = Wire(Vec(fetchWidth, Bool()))
    diffDontTouch(out_valids)

    for (i <- 0 until fetchWidth) {
      val word_off_i = word_offset + i.U
      val bit_off = word_off_i * 32.U
      out_instrs(i) := (resp_data >> bit_off)(31, 0)
      out_valids(i) := word_off_i < (blockBytes/4).U
    }

    val out_uncached = is_done_uncache || (!is_cacheable && !has_mmu_error && state === s_done)
    when (is_done_uncache || has_mmu_error) {
      out_instrs(0) := Mux(has_mmu_error, 0.U, uncache_data_buffer(31, 0))
      out_valids(0) := true.B
      for (i <- 1 until fetchWidth) {
        out_instrs(i) := 0.U
        out_valids(i) := false.B
      }
    }

    val s2_ready_to_fire = s2_valid && array_ready && (s2_can_resp_direct || state === s_done)
    s2_fire := s2_ready_to_fire && io.icache_resp.ready && !io.redirect

    io.icache_resp.valid           := s2_ready_to_fire && !io.redirect
    io.icache_resp.bits.instrs     := out_instrs
    io.icache_resp.bits.instvalids := out_valids
    diffDontTouch(io.icache_resp.bits.instvalids)
    io.icache_resp.bits.addr       := s2_vaddr
    io.icache_resp.bits.uncached   := out_uncached
    io.icache_resp.bits.mmu_error  := s2_mmu_data_reg.error

    // PIPT 周边模块控制
    val miss_touch = (state === s_miss_write) && miss_data_valid
    val hit_touch  = s2_valid && array_ready && is_direct_hit && s2_fire

    io.replacer_touch.valid := hit_touch || miss_touch
    io.replacer_touch.idx   := Mux(miss_touch, fsm_idx, pidx)
    io.replacer_touch.way   := Mux(miss_touch, io.victim_read.resp, hit_way)

    io.victim_read.req := (state === s_miss_req) || (state === s_miss_wait) || (state === s_miss_write)
    io.victim_read.idx := fsm_idx

    io.array_write.valid := (state === s_miss_write) && miss_data_valid && !io.redirect
    io.array_write.idx   := fsm_idx
    io.array_write.tag   := fsm_ptag
    io.array_write.data  := miss_data_buffer
    io.array_write.way   := io.victim_read.resp

    // AXI 总线驱动
    io.axi.aw <> WireDefault(0.U.asTypeOf(new AXI3AWChannel))
    io.axi.w  <> WireDefault(0.U.asTypeOf(new AXI3WChannel))
    io.axi.b  <> WireDefault(0.U.asTypeOf(new AXI3BChannel))

    io.axi.ar.data.arlock  := 0.U
    io.axi.ar.data.arcache := 0.U
    io.axi.ar.data.arprot  := 0.U

    when (state === s_miss_req || state === s_drain_miss_req) {
      io.axi.ar.data.arid    := icacheAxiMissId.U
      io.axi.ar.data.araddr  := Cat(fsm_ptag, fsm_idx, 0.U(blockOffBits.W)) // PIPT 的拼接与 PADDR 等价
      io.axi.ar.data.arlen   := (blockBytes / 4 - 1).U
      io.axi.ar.data.arsize  := 2.U
      io.axi.ar.data.arburst := 1.U
      io.axi.ar.data.arvalid := true.B
    } .elsewhen (state === s_uncache_req || state === s_drain_uncache_req) {
      io.axi.ar.data.arid    := icacheAxiNucacheId.U
      io.axi.ar.data.araddr  := fsm_paddr
      io.axi.ar.data.arlen   := 0.U
      io.axi.ar.data.arsize  := 2.U
      io.axi.ar.data.arburst := 1.U
      io.axi.ar.data.arvalid := true.B
    } .otherwise {
      io.axi.ar.data.arid    := 0.U
      io.axi.ar.data.araddr  := 0.U
      io.axi.ar.data.arlen   := 0.U
      io.axi.ar.data.arsize  := 0.U
      io.axi.ar.data.arburst := 0.U
      io.axi.ar.data.arvalid := false.B
    }

    io.axi.r.rready := (state === s_miss_wait) || (state === s_uncache_wait) || 
                       (state === s_drain_miss) || (state === s_drain_uncache) ||
                       (state === s_drain_miss_req) || (state === s_drain_uncache_req)

    // 性能计数器
    val perf_hit       = RegInit(0.U(32.W))
    val perf_miss      = RegInit(0.U(32.W))
    val perf_uncached  = RegInit(0.U(32.W))
    val perf_mmu_error = RegInit(0.U(32.W))
     
    when(s2_fire) {
      when(has_mmu_error) { 
        perf_mmu_error := perf_mmu_error + 1.U 
      }.elsewhen(state === s_done) {
        when(fsm_is_uncache) { perf_uncached := perf_uncached + 1.U }
      }.elsewhen(is_direct_hit) {
        perf_hit := perf_hit + 1.U
      }
    }
    when(state === s_miss_write) {
      perf_miss := perf_miss + 1.U
    }

  } else {

    // VIPT 2-Stage Pipeline (保留的原版 2 级流水，没有任何覆盖)


    val s1_valid = RegInit(false.B)
    val s1_vaddr = RegInit(0.U(32.W))
    val s1_fire  = Wire(Bool())

    // S0 能够接收新请求的条件：S1 是空的，或者 S1 即将在这拍离开，且没有发生冲刷
    val s1_accepts = !s1_valid || s1_fire || io.redirect
    io.cpu_req.ready := s1_accepts
    
    val s0_fire = io.cpu_req.valid && s1_accepts && !io.redirect

    // S0 发射请求 (向 SRAM Array 和 MMU 组合发射)
    io.arrays_read.req.valid := s0_fire
    io.arrays_read.req.idx   := io.cpu_req.bits.addr(blockOffBits + idxBits - 1, blockOffBits)

    io.mmu.toMmu.valid := s0_fire
    io.mmu.toMmu.bits.vaddr := io.cpu_req.bits.addr
    io.mmu.fromMmu.ready := true.B

    // S1 基础握手与状态更新
    when (s0_fire) {
      s1_valid := true.B
      s1_vaddr := io.cpu_req.bits.addr
    } .elsewhen (s1_fire || io.redirect) {
      s1_valid := false.B
    }

    // ══════════════════════════════════════════════════════════════
    //  S1 数据异步捕获机制 (修复了 Latch 污染 Bug)
    // ══════════════════════════════════════════════════════════════
    
    // --- Array 捕获 ---
    val expect_array_resp = RegNext(s0_fire, false.B)
    val s1_array_data     = RegInit(0.U.asTypeOf(new arrayReadData))
    val s1_array_latched  = RegInit(false.B)
    val next_array_latched = WireDefault(s1_array_latched)

    when (expect_array_resp) {
      s1_array_data      := io.arrays_read.resp.data
      next_array_latched := true.B
    }
    // 绝对最高优先级：流水线步进或冲刷时必须清空标记
    when (s1_fire || io.redirect) {
      next_array_latched := false.B
    }
    s1_array_latched := next_array_latched
    
    val cur_array_data = Mux(expect_array_resp, io.arrays_read.resp.data, s1_array_data)
    val array_ready    = expect_array_resp || s1_array_latched

    // --- MMU 捕获 ---
    val s1_mmu_data    = RegInit(0.U.asTypeOf(new MmuToIcache))
    val s1_mmu_latched = RegInit(false.B)
    val next_mmu_latched = WireDefault(s1_mmu_latched)

    when (s1_valid && io.mmu.fromMmu.valid && !s1_mmu_latched) {
      s1_mmu_data      := io.mmu.fromMmu.bits
      next_mmu_latched := true.B
    }
    // 绝对最高优先级：流水线步进或冲刷时必须清空标记
    when (s1_fire || io.redirect) {
      next_mmu_latched := false.B
    }
    s1_mmu_latched := next_mmu_latched

    val cur_mmu_data = Mux(s1_valid && io.mmu.fromMmu.valid, io.mmu.fromMmu.bits, s1_mmu_data)
    val mmu_ready    = (s1_valid && io.mmu.fromMmu.valid) || s1_mmu_latched

    // ══════════════════════════════════════════════════════════════
    //  命中判定与 FSM 触发逻辑 (S1 同级处理)
    // ══════════════════════════════════════════════════════════════

    val ptag = cur_mmu_data.paddr(31, blockOffBits + idxBits)
    val vidx = s1_vaddr(blockOffBits + idxBits - 1, blockOffBits)

    val hits = Wire(Vec(nWays, Bool()))
    for (i <- 0 until nWays) {
      hits(i) := cur_array_data.cacheLine(i).has && cur_array_data.cacheLine(i).tag === ptag
    }
    val array_hit = hits.asUInt.orR
    val hit_way   = OHToUInt(hits)
    val array_hit_data = cur_array_data.cacheLine(hit_way).data

    val has_mmu_error = cur_mmu_data.error.getAnyError
    val is_cacheable  = cur_mmu_data.cacheable
    
    // 直接命中：缓存命中 + 允许缓存 + 无MMU错误
    val is_direct_hit = array_hit && is_cacheable && !has_mmu_error
    
    // 能够直接响应 CPU 的情况：直接命中，或者 MMU 报告了错误
    val s1_can_resp_direct = is_direct_hit || has_mmu_error

    // ══════════════════════════════════════════════════════════════
    //  AXI FSM (状态机 - 仅在 Miss 或 Uncache 时介入)
    // ══════════════════════════════════════════════════════════════
    //     0           1              2               3               4                 5            6           7                8                   9                   10
    val s_idle :: s_miss_req :: s_miss_wait :: s_miss_write :: s_uncache_req :: s_uncache_wait :: s_done :: s_drain_miss :: s_drain_uncache :: s_drain_miss_req :: s_drain_uncache_req :: Nil = Enum(11)
    
    val state = RegInit(s_idle)
    
    val fsm_paddr      = RegInit(0.U(32.W))
    val fsm_ptag       = RegInit(0.U(tagBits.W))
    val fsm_vidx       = RegInit(0.U(idxBits.W))
    val fsm_is_uncache = RegInit(false.B)

    val miss_data_buffer    = RegInit(0.U((blockBytes * 8).W))
    val miss_data_valid     = RegInit(false.B)
    val uncache_data_buffer = RegInit(0.U(32.W))
    val uncache_data_valid  = RegInit(false.B)
    val beat_counter        = RegInit(0.U(4.W))

    // 触发条件：已获得Array和MMU数据，且不能直接响应CPU，且FSM空闲，且没发生冲刷
    val fsm_trigger = s1_valid && array_ready && mmu_ready && !s1_can_resp_direct && (state === s_idle) && !io.redirect

    val readAxiFire = io.axi.r.data.rvalid && io.axi.r.rready && 
                      (io.axi.r.data.rid === icacheAxiMissId.U || io.axi.r.data.rid === icacheAxiNucacheId.U) && 
                      io.axi.r.data.rlast

    when (io.redirect) {
      // AXI 排空控制
      when(state === s_miss_wait && !readAxiFire) { state := s_drain_miss }
      .elsewhen(state === s_drain_miss && !readAxiFire) { state := s_drain_miss }
      .elsewhen(state === s_miss_req && io.axi.ar.arready) { state := s_drain_miss }
      .elsewhen(state === s_miss_req && !io.axi.ar.arready) { state := s_drain_miss_req }
      .elsewhen(state === s_drain_miss_req && io.axi.ar.arready) { state := s_drain_miss }
      .elsewhen(state === s_drain_miss_req && !io.axi.ar.arready) { state := s_drain_miss_req }
      .elsewhen(state === s_uncache_wait && !readAxiFire) { state := s_drain_uncache }
      .elsewhen(state === s_drain_uncache && !readAxiFire) { state := s_drain_uncache }
      .elsewhen(state === s_uncache_req && io.axi.ar.arready) { state := s_drain_uncache }
      .elsewhen(state === s_uncache_req && !io.axi.ar.arready) { state := s_drain_uncache_req }
      .elsewhen(state === s_drain_uncache_req && io.axi.ar.arready ) { state := s_drain_uncache }
      .elsewhen(state === s_drain_uncache_req && !io.axi.ar.arready ) { state := s_drain_uncache_req }
      .otherwise { state := s_idle }

      //miss_data_valid    := false.B
      //uncache_data_valid := false.B
      //miss_data_buffer   := 0.U
      //beat_counter       := 0.U
    } .otherwise {
      switch (state) {
        is (s_idle) {
          when (fsm_trigger) {
            state := Mux(!is_cacheable, s_uncache_req, s_miss_req)
            fsm_paddr      := cur_mmu_data.paddr
            fsm_ptag       := ptag
            fsm_vidx       := vidx
            fsm_is_uncache := !is_cacheable
          }
        }
        is (s_miss_req) {
          when (io.axi.ar.arready) { state := s_miss_wait }
        }
        is (s_miss_wait) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiMissId.U) {
            state := s_miss_write
          }
        }
        is (s_miss_write) {
          state := s_done
        }
        is (s_uncache_req) {
          when (io.axi.ar.arready) { state := s_uncache_wait }
        }
        is (s_uncache_wait) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiNucacheId.U) {
            state := s_done
          }
        }
        is (s_done) {
          when (io.icache_resp.ready && s1_fire) { state := s_idle }
        }
        is (s_drain_miss) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiMissId.U) { state := s_idle }
        }
        is (s_drain_uncache) {
          when (io.axi.r.data.rvalid && io.axi.r.data.rlast && io.axi.r.data.rid === icacheAxiNucacheId.U) { state := s_idle }
        }
        is (s_drain_miss_req) {
          when (io.axi.ar.arready) { state := s_drain_miss }
        }
        is (s_drain_uncache_req) {
          when (io.axi.ar.arready) { state := s_drain_uncache }
        }
      }
    }

    // FSM 数据接收逻辑
    when (state === s_miss_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiMissId.U) {
      val data_offset = beat_counter * 32.U
      miss_data_buffer := miss_data_buffer | (io.axi.r.data.rdata << data_offset)
      beat_counter := beat_counter + 1.U
      when (io.axi.r.data.rlast) {
        miss_data_valid := true.B
        beat_counter := 0.U
      }
    }

    when (state === s_drain_miss && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiMissId.U && io.axi.r.data.rlast) {
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
      beat_counter       := 0.U
    }

    when (state === s_uncache_wait && io.axi.r.data.rvalid && io.axi.r.data.rid === icacheAxiNucacheId.U) {
      uncache_data_buffer := io.axi.r.data.rdata
      uncache_data_valid := true.B
    }

    when (s1_fire) {
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
    }

    when (io.redirect) {
      miss_data_valid    := false.B
      uncache_data_valid := false.B
      miss_data_buffer   := 0.U
      beat_counter       := 0.U
    }


    // ══════════════════════════════════════════════════════════════
    //  S1 数据装配与 CPU 输出
    // ══════════════════════════════════════════════════════════════
    
    // 选择最终数据：是 FSM 取回的，还是 Array 命中的
    val is_done_uncache = (state === s_done) && fsm_is_uncache
    val resp_data = Mux(state === s_done, 
                        Mux(is_done_uncache, uncache_data_buffer, miss_data_buffer),
                        array_hit_data)

    val word_offset = Wire(UInt(5.W))
    word_offset :=  s1_vaddr(blockOffBits-1, 2)
    val out_instrs  = Wire(Vec(fetchWidth, UInt(32.W)))
    val out_valids  = Wire(Vec(fetchWidth, Bool()))
    diffDontTouch(out_valids)

    // 常规缓存数据分解
    for (i <- 0 until fetchWidth) {
      val word_off_i = word_offset + i.U
      val bit_off = word_off_i * 32.U
      out_instrs(i) := (resp_data >> bit_off)(31, 0)
      out_valids(i) := word_off_i < (blockBytes/4).U
    }

    // MMU异常 或 Uncache 时覆盖输出
    val out_uncached = is_done_uncache || (!is_cacheable && !has_mmu_error && state === s_done)
    when (is_done_uncache || has_mmu_error) {
      out_instrs(0) := Mux(has_mmu_error, 0.U, uncache_data_buffer(31, 0))
      out_valids(0) := true.B
      for (i <- 1 until fetchWidth) {
        out_instrs(i) := 0.U
        out_valids(i) := false.B
      }
    }

    // 响应触发条件：已完整收到 Array 和 MMU 数据，且 (能直连响应 CPU 或是 FSM 刚好完成)
    val s1_ready_to_fire = s1_valid && array_ready && mmu_ready && (s1_can_resp_direct || state === s_done)
    
    s1_fire := s1_ready_to_fire && io.icache_resp.ready && !io.redirect

    io.icache_resp.valid           := s1_ready_to_fire && !io.redirect
    io.icache_resp.bits.instrs     := out_instrs
    io.icache_resp.bits.instvalids := out_valids
    diffDontTouch(io.icache_resp.bits.instvalids)
    io.icache_resp.bits.addr       := s1_vaddr
    io.icache_resp.bits.uncached   := out_uncached
    io.icache_resp.bits.mmu_error  := cur_mmu_data.error

    // ══════════════════════════════════════════════════════════════
    //  周边模块控制 (Replacer 与 Array Write)
    // ══════════════════════════════════════════════════════════════

    val miss_touch = (state === s_miss_write) && miss_data_valid
    val hit_touch  = s1_valid && array_ready && mmu_ready && is_direct_hit && s1_fire

    io.replacer_touch.valid := hit_touch || miss_touch
    io.replacer_touch.idx   := Mux(miss_touch, fsm_vidx, vidx)
    io.replacer_touch.way   := Mux(miss_touch, io.victim_read.resp, hit_way)

    io.victim_read.req := (state === s_miss_req) || (state === s_miss_wait) || (state === s_miss_write)
    io.victim_read.idx := fsm_vidx

    io.array_write.valid := (state === s_miss_write) && miss_data_valid && !io.redirect
    io.array_write.idx   := fsm_vidx
    io.array_write.tag   := fsm_ptag
    io.array_write.data  := miss_data_buffer
    io.array_write.way   := io.victim_read.resp

    // ══════════════════════════════════════════════════════════════
    //  AXI 总线驱动
    // ══════════════════════════════════════════════════════════════
    io.axi.aw <> WireDefault(0.U.asTypeOf(new AXI3AWChannel))
    io.axi.w  <> WireDefault(0.U.asTypeOf(new AXI3WChannel))
    io.axi.b  <> WireDefault(0.U.asTypeOf(new AXI3BChannel))

    io.axi.ar.data.arlock  := 0.U
    io.axi.ar.data.arcache := 0.U
    io.axi.ar.data.arprot  := 0.U

    when (state === s_miss_req || state === s_drain_miss_req) {
      io.axi.ar.data.arid    := icacheAxiMissId.U
      io.axi.ar.data.araddr  := Cat(fsm_ptag, fsm_vidx, 0.U(blockOffBits.W))
      io.axi.ar.data.arlen   := (blockBytes / 4 - 1).U
      io.axi.ar.data.arsize  := 2.U
      io.axi.ar.data.arburst := 1.U
      io.axi.ar.data.arvalid := true.B
    } .elsewhen (state === s_uncache_req || state === s_drain_uncache_req) {
      io.axi.ar.data.arid    := icacheAxiNucacheId.U
      io.axi.ar.data.araddr  := fsm_paddr
      io.axi.ar.data.arlen   := 0.U
      io.axi.ar.data.arsize  := 2.U
      io.axi.ar.data.arburst := 1.U
      io.axi.ar.data.arvalid := true.B
    } .otherwise {
      io.axi.ar.data.arid    := 0.U
      io.axi.ar.data.araddr  := 0.U
      io.axi.ar.data.arlen   := 0.U
      io.axi.ar.data.arsize  := 0.U
      io.axi.ar.data.arburst := 0.U
      io.axi.ar.data.arvalid := false.B
    }

    io.axi.r.rready := (state === s_miss_wait) || (state === s_uncache_wait) || 
                       (state === s_drain_miss) || (state === s_drain_uncache) ||
                       (state === s_drain_miss_req) || (state === s_drain_uncache_req)

    // ══════════════════════════════════════════════════════════════
    //  性能计数器
    // ══════════════════════════════════════════════════════════════
    val perf_hit       = RegInit(0.U(32.W))
    val perf_miss      = RegInit(0.U(32.W))
    val perf_uncached  = RegInit(0.U(32.W))
    val perf_mmu_error = RegInit(0.U(32.W))
     
    when(s1_fire) {
      when(has_mmu_error) { 
        perf_mmu_error := perf_mmu_error + 1.U 
      }.elsewhen(state === s_done) {
        when(fsm_is_uncache) { perf_uncached := perf_uncached + 1.U }
      }.elsewhen(is_direct_hit) {
        perf_hit := perf_hit + 1.U
      }
    }
    when(state === s_miss_write) {
      perf_miss := perf_miss + 1.U
    }
  }
}