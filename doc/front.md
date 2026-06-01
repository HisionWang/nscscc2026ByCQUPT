# 龙芯32位迷你CPU前端详细设计文档

---

## 0. 架构长这样

```
                          ┌─────────┐
                          │ 后端     │
                          │ Redirect │
                          └────┬────┘
                               │
┌──────┐    ┌──────┐    ┌─────▼──────┐    ┌──────────┐    ┌──────┐
│ BPU  │───►│PC生成 │───►│  ICache    │───►│ 预译码    │───►│IBuffer│───►后端
│      │◄───│单元   │    │ (已设计好)  │    │          │    │      │
└──────┘    └──────┘    └────────────┘    └──────────┘    └──────┘
   ▲            │
   │            ▼
   └────── flush信号
```

**PC生成单元**是心脏——每周期从三个来源中选出一个PC送给ICache和BPU：后端redirect（最高优先级）、BPU预测目标（次优先级）、顺序递增PC+16（默认）。PC和BPU并行工作：同一拍PC同时发给ICache取指、发给BPU预测，BPU的结果影响下一拍的PC选择，实现推测式取指。
**BPU**由BTB（记住跳转目标）、PHT（2位饱和计数器猜跳不跳）、RAS（函数返回地址栈）三件套组成，轻量但覆盖了直接跳转、条件分支、间接跳转三种场景。预测信息和BPU元数据随ICache流水线逐级传递，供预译码校验和后续训练使用。

**预译码**是质检站——ICache数据出来后，纯组合逻辑识别每条指令是否为分支及其类型，然后与BPU预测对照校验：JAL必跳但预测不跳（jalFault）、非分支指令但预测跳（notCfiFault）、直接跳转目标错误（targetFault）等。发现故障立即做两件事：截断IBuffer入队范围、发起前端重定向修正PC。因为定长指令集没有变长指令的边界对齐麻烦，预译码只需要做指令字段的模式匹配即可。

**IBuffer**是16项FIFO，多入多出，解耦取指和执行速率。前端redirect时不清空IBuffer（错误指令在入队前就被截断了），后端redirect时延迟一拍清空。

核心思想是**两级纠错**：预译码发现逻辑性必然错误，2~3周期内前端自纠，IBuffer不受影响；后端执行发现条件分支误预测，冲刷整条流水线并清空IBuffer。后端redirect优先级永远高于前端redirect，两者同时出现时只听后端的。

---

## 1. PC生成单元——前端的"心脏"

### 1.1 它要做什么

每周期选出一个32位PC地址，发给ICache取指令。PC的来源有三个：

| 来源 | 什么时候用 | 可信度 |
|------|-----------|--------|
| **顺序递增** | 默认情况，PC+fetchWidth*4（取fetchWidth条指令），但是要注意如果上一个pc与Cache块边界的距离小于fetchWidth（上一次取指的条数小于fetchWidth），就不应该加 fetchWidth*4 而是应该递增到下一个Cache块的起点， | 最低（不会错） |
| **BPU预测目标** | BPU说"要跳转，去这个地址" | 中等（可能猜错） |
| **后端Redirect** | 后端发现猜错了、或者异常处理等，告诉正确地址 | 最高（绝对正确） |


**时序图**：

```
周期T:   pcReg = 0x1000
         → 发给ICache: PC=0x1000
         → 发给BPU: PC=0x1000

周期T+1: ICache正在处理0x1000的请求...
         BPU返回预测: taken=true, target=0x2000
         → pcReg = 0x2000（下周期取0x2000）

周期T+2: 发给ICache: PC=0x2000
         （同时ICache返回0x1000的数据给预译码）
```

### 1.4 流水线寄存器设计

```scala
// PC生成单元的流水线寄存器
class PCGenBundle {
  val pc          : UInt(32.W)    // 取指PC
  val fallThrough : UInt(32.W)    // 顺序下一条PC（= pc + 16）
  val taken       : Bool          // BPU是否预测跳转
  val target      : UInt(32.W)    // BPU预测的跳转目标
  val takenOffset : UInt(3.W)     // 预测跳转在块内的指令偏移(0~3)
  val bpuMeta     : BpuMeta       // BPU的元信息（用于后续更新BPU）
}

// 每级Cache流水线都要带着这些信息往下传
val s1_info = RegEnable(pcGenBundle, s0_fire)
val s2_info = RegEnable(s1_info, s1_fire)
// ... ICache有几级就传几级
```

**为什么要把预测信息带着走？** 因为预译码需要知道"BPU对这块指令预测了什么"，才能校验预测是否正确。而且BPU的元信息（meta）也要传下去，用于后续训练BPU。

### 1.5 停顿与反压

当ICache没准备好接收新请求时，PC生成单元必须停住：

```scala
val s0_fire = pcGenValid && icache.req.ready && !s0_flush
when(s0_fire) {
  pcReg := nextPC  // 只有成功发射才更新PC
}
```

当预译码或IBuffer反压时，整条流水线都要停：

```scala
icache.req.ready := s1_ready  // ICache的ready取决于后续级能否接收
```

---

## 2. BPU——分支预测单元

### 2.1 BPU在架构中的位置

```
         PC生成单元
            │
            ├──► ICache (取指请求)
            │
            └──► BPU (预测请求)
                    │
                    ▼
              BPU返回 {taken, target, takenOffset, meta}
                    │
                    ▼
              PC生成单元据此选下一拍PC
```

BPU和ICache是**并行**的：同一个PC，同时发给ICache取数据、发给BPU做预测。BPU的预测结果影响下一拍的PC，ICache的数据几拍后才出来给预译码校验。

### 2.2 迷你版BPU的三件套

需要三个组件：

```
┌─────────────────────────────────────────────┐
│                   BPU                        │
│                                              │
│  ┌──────────┐  ┌──────────┐  ┌───────────┐ │
│  │   BTB    │  │   PHT    │  │    RAS     │ │
│  │分支目标缓冲   │  │2位饱和计数器   │  │返回地址栈  │ │
│  │      │  │    │  │           │ │
│  │          │  │          │  │           │ │
│  │PC→目标   │  │PC→跳/不跳│  │压栈/弹栈  │ │
│  └────┬─────┘  └────┬─────┘  └─────┬─────┘ │
│       │              │              │       │
│       └──────────────┼──────────────┘       │
│                      ▼                      │
│              预测结果 {taken, target, meta}  │
└─────────────────────────────────────────────┘
```

### 2.3 BTB——分支目标缓冲

**功能**：记住"哪个PC处有分支指令，如果跳，去哪里"。

**结构**：用PC的低位索引的一张表，注意这个表的位宽结构应该随着fetchwidth的变换而变化，因为在BPU内部不是简单单条PC的预测跳转目标，而是检测一个整个fetchwidth条pc可能的跳转方向（但这里也需要注意当不在一个Cache块中时需要截断）：

```
索引(PC[7:4])  │  valid  │  tag(PC[31:8])  │  target(32位)  │  isJalr
───────────────┼─────────┼─────────────────┼────────────────┼────────
     0         │    1    │   0x10000       │   0x2000       │   0
     1         │    0    │   -             │   -            │   -
     2         │    1    │   0x20000       │   0x3000       │   1
    ...        │   ...   │   ...           │   ...          │  ...
```

**查询逻辑**：

```scala
val btbIdx   = pc(btbIdxBits+3, 4/*不一定为4，需要根据fetchwidth的变换而变化*/)  // 用PC的某些位做索引（跳过2位定长+2位块内偏移）
val btbEntry = btbMem(btbIdx)
val btbHit   = btbEntry.valid && btbEntry.tag === pc(31, btbIdxBits+4)

when(btbHit) {
  bpu.target := btbEntry.target
  bpu.hasBranch := true.B
}
```

**为什么需要tag？** 索引位不够多时，不同PC可能映射到同一项（别名）。tag用来确认"这一项确实是我要找的那个PC的"。

**容量建议**：16项直接映射。够用且简单。

### 2.4 PHT——模式历史表

**功能**：预测条件分支"这次跳不跳"。

**结构**：一组2位饱和计数器：

```
状态转移图：

         不跳(-1)        不跳(-1)
    00 ────────────► 01 ────────────► 10
     ◄────────────    ◄────────────    │
      跳(+1)           跳(+1)          │
                                      ▼
                     不跳(-1)        跳(+1)
                              11 ◄────────────
                               │─────────────►
                                不跳(-1)  ...保持11

预测规则：00/01 = 不跳(Weak/Strong NT)，10/11 = 跳(Weak/Strong T)
```

**查询逻辑**：

```scala
val phtIdx = pc(phtIdxBits+3, 4)  // 用PC的某些位做索引
val counter = phtMem(phtIdx)       // 2位计数器

bpu.taken := counter(1)            // 最高位为1则预测跳
```

**更新逻辑**（来自后端或预译码的反馈）：

```scala
when(update.valid) {
  val oldCounter = phtMem(update.idx)
  when(update.actuallyTaken && oldCounter =/= 3.U) {
    phtMem(update.idx) := oldCounter + 1.U
  }.elsewhen(!update.actuallyTaken && oldCounter =/= 0.U) {
    phtMem(update.idx) := oldCounter - 1.U
  }
}
```

**容量建议**：64项（6位索引）。极小但够用。

### 2.5 RAS——返回地址栈

**功能**：专门处理函数调用和返回。调用指令（bl）把返回地址压栈，返回指令（jirl rd=r1）把栈顶弹出作为目标。

**为什么BTB不够？** `jirl r1, ra, 0`（函数返回）的目标每次都不一样——它取决于是谁调用了这个函数。BTB只能记住一个固定目标，无法处理这种情况。RAS是一个LIFO栈，精确匹配"谁调用谁返回"的语义。

**结构**：

```scala
val rasStack = Mem(RasSize, UInt(32.W))  // 建议8~16层
val rasTop   = RegInit(0.U(log2Ceil(RasSize).W))

// 压栈：遇到函数调用(bl)
when(isCall) {
  rasStack(rasTop) := returnAddress  // 返回地址 = PC + 4
  rasTop := rasTop + 1.U
}

// 弹栈：遇到函数返回
when(isRet) {
  rasTop := rasTop - 1.U
  bpu.target := rasStack(rasTop - 1.U)  // 弹出栈顶作为预测目标
}
```

### 2.6 BPU的完整预测逻辑

```scala
// 第一步：查BTB，看这个PC处有没有分支
val btbHit   = btbEntry.valid && btbEntry.tag === pc(highBits)
val btbTarget = btbEntry.target
val btbIsJalr = btbEntry.isJalr

// 第二步：查PHT，看跳不跳
val phtTaken = phtCounter(1)

// 第三步：组合结果
val finalTaken  = btbHit && (btbIsJalr || phtTaken)  // JALR必跳，条件分支看PHT
val finalTarget = Mux(btbIsJalr, rasStack(rasTop-1.U), btbTarget)
//                              ↑ 间接跳转问RAS    ↑ 直接跳转问BTB

// 输出
bpu.io.predict.taken  := finalTaken
bpu.io.predict.target := finalTarget
bpu.io.predict.meta   := (btbHit, phtCounter, rasTop, ...)  // 保存下来给后续训练用
```

### 2.7 BPU的更新

BPU需要被"教育"。教育来源有两个：

**来源1：预译码校验（快速，发现必跳错误）**

预译码发现JAL/BL必跳但BPU说不跳 → 立即更新BTB和PHT：

```scala
when(predecode.foundJalFault) {
  btbMem(pc).valid  := true.B
  btbMem(pc).target := predecode.jumpTarget
  btbMem(pc).tag    := pc(highBits)
  phtMem(pc)        := 3.U  // 强跳
}
```

**来源2：后端执行结果（慢，但最精确）**

后端执行完条件分支后，把真实结果写回：

```scala
when(backend.brResult.valid) {
  // 更新PHT
  updatePHT(backend.brResult.pc, backend.brResult.actuallyTaken)
  // 更新BTB
  when(backend.brResult.actuallyTaken) {
    updateBTB(backend.brResult.pc, backend.brResult.target)
  }
}
```
---

## 3. 预译码单元——前端的"质检站"

### 3.1 它在架构中的位置

```
ICache数据出来 ──► 预译码 ──► IBuffer
                     │
                     ├──► 校验BPU预测（发现错误→发起前端flush+重定向）
                     ├──► 更新BPU（快速反馈）
                     └──► 标记指令属性（给后端用）
```

### 3.2 预译码做什么

预译码**不是完整译码**。它只关心一件事：**这条指令会不会改变控制流？**

对龙芯32位指令集，你需要识别的指令类型：

| 类型 | 龙芯指令 | 特征 | 预译码需要做什么 |
|------|---------|------|-----------------|
| 条件分支 | beq, bne, blt, bge, bltu, bgeu | 可能跳，可能不跳 | 标记isBr，提取16位偏移 |
| 无条件直接跳转 | b, bl | 一定跳，目标固定 | 标记isJal，提取26位偏移，**计算目标** |
| 间接跳转 | jirl | 一定跳，目标来自寄存器 | 标记isJalr，无法知道目标 |
| 函数调用 | bl | 跳转+保存返回地址 | 标记isCall（RAS压栈） |
| 函数返回 | jirl r1, ra, 0 | 跳到返回地址 | 标记isRet（RAS弹栈） |
| 普通指令 | 其他所有 | 不跳 | 标记notCFI |

### 3.3 预译码的数据结构

```scala
class PreDecodeInfo extends Bundle {
  val valid      : Bool     // 这条指令是否有效（取指块内可能不满4条）
  val isBr       : Bool     // 条件分支
  val isJal      : Bool     // 无条件直接跳转（b/bl）
  val isJalr     : Bool     // 间接跳转
  val isCall     : Bool     // 函数调用
  val isRet      : Bool     // 函数返回
  val jumpOffset : UInt(32.W)  // 跳转偏移（符号扩展后的完整偏移）
}
```

### 3.4 预译码的实现——指令字段的模式匹配

龙芯指令编码规则，以MIPS-like结构为例（你需要对照龙芯手册调整opcode）：

```scala
// 伪代码，展示设计思路
for (i <- 0 until 4) {  // 4条指令/*不一定为4，需要根据fetchwidth的变换而变化*/
  val inst = alignedInstrs(i)
  val opcode = inst(31, 26)  // 操作码在最高6位
  
  // 条件分支: opcode匹配beq/bne/blt/bge/bltu/bgeu
  pd(i).isBr := (opcode === OPC_BEQ) || (opcode === OPC_BNE) || 
                (opcode === OPC_BLT) || (opcode === OPC_BGE) ||
                (opcode === OPC_BLTU) || (opcode === OPC_BGEU)
  
  // 无条件跳转: opcode匹配b/bl
  pd(i).isJal := (opcode === OPC_B) || (opcode === OPC_BL)
  
  // 间接跳转: opcode匹配jirl
  pd(i).isJalr := (opcode === OPC_JIRL)
  
  // 函数调用: bl指令
  pd(i).isCall := (opcode === OPC_BL)
  
  // 函数返回: jirl且目标寄存器是r1（返回地址寄存器）
  pd(i).isRet := (opcode === OPC_JIRL) && (inst(4,0) === 1.U)  // rd=r1
  
  // 跳转偏移提取
  pd(i).jumpOffset := Mux(pd(i).isBr, 
                           signExtend(inst(15,0) << 2, 32),   // 条件分支: 16位偏移左移2
                           signExtend(inst(25,0) << 2, 32))   // 无条件跳转: 26位偏移左移2
}
```

**这是纯组合逻辑**，不需要寄存器，延迟就是一个比较器+选择器链。

### 3.5 预译码的核心作用：校验BPU预测

这是预译码存在的最大意义。校验逻辑：

```scala
for (i <- 0 until 4) {  // 遍历取指块内4条指令 /*不一定为4，需要根据fetchwidth的变换而变化*/
  val predTakenThisInst = bpuTakenOffset === i.U && bpuTaken  // BPU说这条指令跳
  
  // 故障1: JAL/BL必跳，但BPU说不跳
  val jalFault = (pd(i).isJal || pd(i).isCall) && !predTakenThisInst && pd(i).valid
  
  // 故障2: JIRL必跳，但BPU说不跳
  val jalrFault = (pd(i).isJalr || pd(i).isRet) && !predTakenThisInst && pd(i).valid
  
  // 故障3: 不是分支指令，但BPU说跳
  val notCfiFault = !pd(i).isBr && !pd(i).isJal && !pd(i).isJalr && 
                    predTakenThisInst && pd(i).valid
  
  // 故障4: 直接跳转目标不对
  val targetFault = (pd(i).isJal || pd(i).isCall) && predTakenThisInst && 
                    pd(i).valid && (bpuTarget =/= (pc(i) + pd(i).jumpOffset))
}
```

**发现故障后做什么？** 两件事：
1. **截断入队**：故障位置之后的指令不进IBuffer
2. **发起前端重定向**：告诉PC生成单元从正确地址重新取指

### 3.6 校验结果的时序

```
周期T:   ICache数据到达 → 预译码组合逻辑 → 校验结果在同一周期出来！

周期T:   校验发现有jalFault:
         ├── 立即修改IBuffer入队使能（截断故障后的指令）
         └── 生成frontendRedirect，下周期生效：
              → PC生成单元在下周期用正确地址取指
              → ICache流水线中的错误请求需要flush
```

**关键点**：预译码校验是**当拍**出结果的（组合逻辑），所以可以在同一个周期内修正IBuffer的入队。这比等后端发现要快得多。

### 3.7 校验不能发现什么？

条件分支（beq/bne）的"跳不跳"取决于运行时寄存器的值，预译码无法判断——这只能等后端执行后才知道。所以预译码只能发现**逻辑上的必然错误**，不能解决条件分支的误预测。

---

## 4. IBuffer——指令缓冲

### 4.1 为什么需要IBuffer

ICache出指令的速率不均匀（命中时快，缺失时停），后端消费指令的速率也不均匀（依赖停顿时慢）。IBuffer就是中间的弹性缓冲区。

```
ICache命中时: ━━━━━━━━━━━━━► IBuffer ━━━━━━► 后端
ICache缺失时: ▬▬▬▬▬▬▬▬▬▬▬► IBuffer ━━━━━━► 后端
                           ↑
                     IBuffer里还存着几条，
                     后端不至于饿死
```

### 4.2 IBuffer的结构

```
┌────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┬────┐
│ 0  │ 1  │ 2  │ 3  │ 4  │ 5  │ 6  │ 7  │ 8  │ 9  │10  │11  │12  │13  │14  │15  │
└────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┴────┘
  ▲                                                                     ▲
headPtr                                                               tailPtr
(后端读)                                                              (预译码写)
```

每项存储：

```scala
class IBufEntry extends Bundle {
  val instr     : UInt(32.W)     // 32位指令
  val pc        : UInt(32.W)     // 这条指令的PC
  val ftqPtr    : UInt           // 对应预测信息索引（用于BPU更新）
  val exception : ExceptionType  // 异常标记
  val isBr      : Bool           // 预译码结果（传给后端可以加速译码）
  val isJal     : Bool
  val isJalr    : Bool
}
```

### 4.3 端口设计

```
         预译码侧(写入)                   后端侧(读出)
    ┌────────────────┐             ┌────────────────┐
    │  in.valid      │             │  out[0].valid  │
    │  in.ready      │             │  out[1].valid  │
    │  in.bits       │             │  out[2].valid  │
    │  .instrs[0..3] │             │  out[3].valid  │
    │  .pcs[0..3]    │             │  out[0..3].bits│
    │  .valids[0..3] │             │  .instr        │
    │  .enqEnable    │             │  .pc           │
    └────────────────┘             └────────────────┘

    控制信号:
    ┌────────────────┐
    │  flush         │  ◄── 后端重定向 / 前端重定向时清空
    │  full          │  ──→ 反压到预译码→ICache整条流水线
    │  empty         │  ──→ 告诉后端没指令了
    └────────────────┘
```

### 4.4 关键操作

**入队（每周期最多4条）**：/*不一定为4，需要根据fetchwidth的变换而变化*/

```scala
// 预译码决定哪些指令可以入队
// enqEnable = 预译码校验修正后的范围
val numEnq = PopCount(enqEnable)

when(in.fire) {
  for (i <- 0 until 4) {
    when(enqEnable(i)) {
      ibuf(tailPtr + enqOffset(i)) := entry(i)
    }
  }
  tailPtr := tailPtr + numEnq
}
```

**出队（每周期最多4条）**：

```scala
val numDeq = PopCount(out.map(_.fire))

when(out(0).fire) {  // 后端接受指令
  headPtr := headPtr + numDeq
}
```

**反压**：

```scala
in.ready := !full  // 满了就不收

// full的判断
full := (tailPtr - headPtr) >= (Size - 4).U  // 留4个空位才能保证下次入队不溢出
```

**清空（flush）**：

```scala
when(flush) {
  headPtr := 0.U
  tailPtr := 0.U
  // 所有entry标记为无效
}
```

### 4.5 容量选择

| 容量 | 优缺点 |
|------|--------|
| 8项 | 最小，省面积，但ICache miss时后端很快就饿死 |
| 16项 | **推荐**，平衡面积和缓冲能力 |
| 32项 | 充裕，但面积翻倍 |

16项对于4-wide入队、4-wide出队，能缓冲ICache一次miss的时间。

---

## 5. 前端Flush逻辑——最关键的设计

### 5.1 前端是否要发起清理操作？

**必须会。** 这是前端"自纠错"的核心能力。有两种场景前端需要发起flush：

| 场景 | 触发者 | 延迟 | 严重程度 |
|------|--------|------|---------|
| 预译码发现BPU预测错误 | 前端自己 | 2~3周期 | 轻微（只浪费了几拍取指） |
| 后端执行发现误预测 | 后端 | 10+周期 | 严重（大量错误路径指令已入队） |

### 5.2 前端发起flush的完整流程

当预译码校验发现预测错误时：

```
周期T:   预译码校验发现jalFault
         │
         ├── 立即修正IBuffer入队范围（组合逻辑，当拍生效）
         │   enqEnable截断到故障位置
         │
         ├── 生成frontendRedirect信号
         │   frontendRedirect.valid := true
         │   frontendRedirect.target := 正确的跳转目标
         │
         └── 刷新ICache流水线中正在处理的错误请求

周期T+1: frontendRedirect生效
         │
         ├── PC生成单元：pcReg := redirect.target
         │   （不再取错误路径的指令）
         │
         ├── ICache流水线：S1/S2中属于错误路径的请求标记为无效
         │   （ICache流水线中的每个寄存器都要有flush位）
         │
         └── IBuffer：不需要清空！
             （因为故障位置之后的指令在周期T就被截断了，没入队）
```

### 5.3 后端发起flush的完整流程

当后端执行条件分支后发现预测错误时：

```
周期T:   后端发出redirect
         redirect.valid = true
         redirect.target = 正确地址
         redirect.ftqPtr = 出错的预测信息索引

周期T:   redirect到达前端
         │
         ├── PC生成单元：pcReg := redirect.target（最高优先级）
         │
         ├── ICache流水线：所有级flush
         │   s1_flush := true
         │   s2_flush := true  (如果有)
         │   s3_flush := true  (如果有)
         │   → ICache流水线中所有寄存器的valid位清零
         │
         ├── 预译码：当前有效数据标记为无效
         │
         └── IBuffer：延迟一拍清空
             ibuffer.flush := RegNext(redirect.valid)
```

### 5.4 ICache流水线的flush机制

你的ICache是流水线化的，每一级都需要一个flush信号：

```scala
// ICache流水线中每一级都要带一个flush位
class CachePipelineReg extends Bundle {
  val valid   : Bool
  val pc      : UInt(32.W)
  val data    : UInt(128.W)  // 4条指令
  // ... 其他信息
}

// S1级
val s1_reg = Reg(new CachePipelineReg)
val s1_flush = redirect.valid || frontendRedirect.valid

when(s1_flush) {
  s1_reg.valid := false.B
}

// S2级
val s2_reg = RegEnable(s1_reg, s1_fire)
val s2_flush = redirect.valid || frontendRedirect.valid

when(s2_flush) {
  s2_reg.valid := false.B
}

// ... 以此类推
```

**时序图**：

```
           T周期        T+1周期       T+2周期       T+3周期
S0(PC)   [错误PC]  ──flush──► [正确PC]    [正确PC+16]   ...
S1(Cache) [错误数据] ──flush──► [无效]      [正确数据]    ...
S2(Cache) [错误数据] ──flush──► [无效]      [无效]       [正确数据]
预译码     [错误校验] ──flush──► [无效]      [无效]       [正确校验]
IBuffer   [可能有错]  不清空     不清空       RegNext清空   [正确指令]
```

### 5.5 前端Redirect vs 后端Redirect的处理差异

这是初学者最容易搞混的，必须讲清楚：

| | 前端Redirect（预译码发现） | 后端Redirect（执行发现） |
|--|--------------------------|------------------------|
| **发现时间** | 取指后2~3周期 | 取指后10+周期 |
| **IBuffer行为** | 不清空（错误指令没入队） | 必须清空（错误指令已入队） |
| **ICache流水线** | flush当前及之后 | flush全部 |
| **BPU更新** | 更新BTB/PHT（快速反馈） | 更新BTB/PHT（精确反馈） |
| **PC选择** | 用预译码计算的正确目标 | 用后端提供的正确目标 |
| **优先级** | 低（可被后端redirect覆盖） | 高（不可覆盖） |

**为什么前端Redirect不清空IBuffer？** 因为预译码校验是**在入队前**完成的。发现jalFault时，截断了enqEnable，错误路径的指令根本没有进入IBuffer。IBuffer里已有的指令都是之前正确入队的，不应该受影响。

**为什么后端Redirect必须清空IBuffer？** 因为后端发现误预测时，已经有很多条错误路径的指令通过了预译码（预译码对条件分支无能为力），进入了IBuffer甚至后端。这些必须全部清除。

### 5.6 两个Redirect同时出现的优先级处理

```scala
// 最终的PC选择，优先级从高到低
val nextPC = Mux(backendRedirect.valid,  backendRedirect.bits.target,
              Mux(frontendRedirect.valid, frontendRedirect.bits.target,
              Mux(bpuPredict.taken,       bpuPredict.target,
                                       seqPC)))

// IBuffer的flush信号
ibuffer.flush := RegNext(backendRedirect.valid)  // 只有后端redirect才清空IBuffer
                                              // 前端redirect不清空！
```

### 5.7 BPU在flush时的行为

```
后端Redirect到达时：
├── BTB: 不需要清空（BTB的记忆是对的，只是PC选错了路径）
├── PHT: 不需要清空（计数器的值有历史价值）
├── RAS: 需要恢复到redirect点的状态！
│        → 因为错误路径上可能经过了函数调用/返回，破坏了RAS
│        → 解决方案：保存RAS的快照，或者在后端redirect时修正RAS top指针
└── BPU流水线: flush（正在预测的错误路径结果作废）
```

**RAS恢复的简化方案**：

```scala
// 方案1：保存RAS top指针的推测值
// 每次预测时，把当时的rasTop存进meta里
// 后端redirect时，恢复到redirect点的rasTop
when(backendRedirect.valid) {
  rasTop := backendRedirect.bits.bpuMeta.rasTop  // 恢复RAS指针
}
```

---

## 6. 整体时序总结——一个完整的故事

假设程序在0x1000处有一条`bl 0x2000`（函数调用），BPU第一次没见过这个分支，预测not taken。

```
周期1: PC=0x1000 → ICache取指请求
       BPU查询0x1000 → BTB miss → 预测not taken
       → nextPC = 0x1010 (顺序)

周期2: PC=0x1010 → ICache取指请求（错误路径！）
       ICache返回0x1000的数据给预译码

周期3: 预译码识别0x1004处（块内第1条）是bl指令
       校验：bl必跳，但BPU说不跳 → jalFault!
       
       立即执行:
       ├── IBuffer: 只入队0x1000~0x1004的两条指令
       ├── frontendRedirect: target=0x2000
       ├── 更新BTB: 写入{pc=0x1004, target=0x2000, isJalr=false}
       ├── 更新PHT: 写入taken
       └── 更新RAS: 压栈返回地址0x1008

周期4: PC=0x2000（从redirect恢复）
       ICache流水线中0x1010的请求被flush
       BPU下次再遇到0x1000 → BTB命中 → 预测taken, target=0x2000 ✓

周期5: ICache返回0x2000的数据
       → 预译码校验通过 → IBuffer入队 → 后端开始执行正确路径的指令
```

**浪费了2个周期**（周期2取了错误路径，周期3发现错误，周期4才取到正确路径）。但如果没有预译码校验，这个错误要等到后端执行才发现，可能浪费10+个周期。**这就是前端自纠错的价值。**

---

## 7. 各模块端口清单

### PC生成单元

| 方向 | 信号 | 位宽 | 说明 |
|------|------|------|------|
| → ICache | fetchReq.pc | 32 | 取指PC |
| → ICache | fetchReq.valid | 1 | 请求有效 |
| ← ICache | fetchReq.ready | 1 | ICache可接收 |
| → BPU | predictReq.pc | 32 | 预测请求PC |
| ← BPU | predictResp.taken | 1 | 预测跳转 |
| ← BPU | predictResp.target | 32 | 预测目标 |
| ← BPU | predictResp.takenOffset | 2 | 预测跳转在块内偏移 |
| ← BPU | predictResp.meta | - | BPU元信息 |
| ← 后端 | redirect.valid | 1 | 后端重定向有效 |
| ← 后端 | redirect.target | 32 | 重定向目标 |
| ← 预译码 | frontendRedirect.valid | 1 | 前端重定向有效 |
| ← 预译码 | frontendRedirect.target | 32 | 前端重定向目标 |
| → ICache流水线 | flush | 1 | 冲刷ICache流水线 |

### BPU

| 方向 | 信号 | 说明 |
|------|------|------|
| ← PC生成单元 | pc | 当前取指PC |
| → PC生成单元 | taken / target / takenOffset / meta | 预测结果 |
| ← 预译码 | update_pd | 预译码快速反馈（JAL/JALR故障） |
| ← 后端 | update_br | 后端分支执行结果（精确训练） |

### 预译码

| 方向 | 信号 | 说明 |
|------|------|------|
| ← ICache最后一级 | instrs[4] / pcs[4] | 取回的4条指令及其PC |
| ← PC生成单元(流水线寄存器) | bpuTaken / bpuTarget / bpuTakenOffset | BPU预测信息 |
| → IBuffer | instrs / pcs / valids / enqEnable | 校验修正后的入队数据 |
| → PC生成单元 | frontendRedirect | 前端重定向 |
| → BPU | update_pd | 快速BPU更新 |
| → IBuffer | flush | 前端redirect时的flush |

### IBuffer

| 方向 | 信号 | 说明 |
|------|------|------|
| ← 预译码 | in.valid / in.ready / in.bits | 入队 |
| → 后端 | out[4].valid / out[4].ready / out[4].bits | 出队 |
| ← 后端 | flush | 后端redirect时清空 |
| → PC生成单元 | full | 反压信号 |
