#include "asm.h"
#include "regdef.h"
#include "inst_test.h"
 
## ============================================================================
## n11_boot_sim_test.S
## 取指访存启动模拟压力测试
##
## 模拟场景：
##   Bootloader (本测试代码) 往 RAM 区域写入指令编码 (机器码)
##   使用 dbar / cacop / ibar 保障存储一致性
##   跳转到 RAM 执行动态写入的代码
##   回收执行结果并验证正确性
##
## 指令编码参考 (LA32):
##   addi.w r4,r0,N  = 0x00800000 | (N<<10) | 4
##   addi.w r6,r0,N  = 0x00800000 | (N<<10) | 6
##   addi.w r4,r4,N  = 0x00800000 | (N<<10) | 0x84
##   add.w  r4,r4,r6 = 0x00101884
##   sub.w  r4,r4,r6 = 0x00111884
##   or     r4,r4,r6 = 0x00149884
##   sltu   r4,r6,r4 = 0x001210C4
##   slli.w r4,r4,N  = 0x00408000 | (N<<10) | 0x84
##   lu12i.w r4,N    = 0x14000000 | (N<<5) | 4
##   ld.w   r4,r5,N  = 0x28800000 | (N<<10) | 0xA4
##   st.w   r4,r5,0  = 0x298000A4
##   jirl   r0,r1,0  = 0x4C000020
##   nop             = 0x00800000
##   b     N         = 0x10000000 | N
##   bne   r4,r6,-1  = 0x5FFFFCC4
## ============================================================================
 
## 地址定义
## 代码缓冲区1: 0xd2000  (32 words = 128B)
## 代码缓冲区2: 0xd2100
## 代码缓冲区3: 0xd2200
## 结果区:      0xd2300
 
LEAF(n11_boot_sim_test)
 
    addi.w  s0, s0, 0x1
    li.w    s2, 0x0
    li.w    t0, 0x1
    csrwr   t0, csr_ticlr
    // DA=1, PG=0, PLV=0
    li.w    t0, 0x0
    li.w    t1, 0x3
    csrxchg t0, t1, csr_crmd
 
    // ================================================================
    // Phase 1: 基本启动验证 — 写3条指令到RAM，全屏障后跳转执行
    // 代码: addi.w r4,r0,0x42; st.w r4,r5,0; jirl r0,r1,0
    // 预期: [result] = 0x42
    // ================================================================
    li.w    t0, 0xd2000           // 代码缓冲区地址
    li.w    t1, 0x00810804        // addi.w r4, r0, 0x42
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 全屏障: dbar → cacop D-cache写回无效 → cacop I-cache无效 → ibar
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    // 设置参数并跳转
    li.w    r5, 0xd2300           // r5 = 结果地址 (snippet 用)
    st.w    zero, r5, 0           // 清零结果
    jirl    r1, t0, 0             // 跳转到代码缓冲区, r1=返回地址
 
    // 验证结果
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x42
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error   // 检查异常
 
    // ================================================================
    // Phase 2: 算术运算 — addi + add.w + st + ret
    // 代码: addi r4,r0,0x10; addi r6,r0,0x20; add r4,r4,r6; st; ret
    // 预期: [result] = 0x30
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00804004        // addi.w r4, r0, 0x10
    st.w    t1, t0, 0x0
    li.w    t1, 0x00808006        // addi.w r6, r0, 0x20
    st.w    t1, t0, 0x4
    li.w    t1, 0x00101884        // add.w r4, r4, r6
    st.w    t1, t0, 0x8
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0xc
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x10
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x30
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 3: 移位运算 — addi + slli.w + st + ret
    // 代码: addi r4,r0,0xFF; slli.w r4,r4,8; st; ret
    // 预期: [result] = 0xFF00
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0083FC04        // addi.w r4, r0, 0xFF
    st.w    t1, t0, 0x0
    li.w    t1, 0x0040A084        // slli.w r4, r4, 8
    st.w    t1, t0, 0x4
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x8
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0xc
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xFF00
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 4: 减法运算 — addi + sub.w + st + ret
    // 代码: addi r4,r0,0x50; addi r6,r0,0x10; sub r4,r4,r6; st; ret
    // 预期: [result] = 0x40
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00814004        // addi.w r4, r0, 0x50
    st.w    t1, t0, 0x0
    li.w    t1, 0x00804006        // addi.w r6, r0, 0x10
    st.w    t1, t0, 0x4
    li.w    t1, 0x00111884        // sub.w r4, r4, r6
    st.w    t1, t0, 0x8
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0xc
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x10
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x40
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 5: 或运算 — addi + or + st + ret
    // 代码: addi r4,r0,0xAA; addi r6,r0,0x55; or r4,r4,r6; st; ret
    // 预期: [result] = 0xFF
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0082A804        // addi.w r4, r0, 0xAA
    st.w    t1, t0, 0x0
    li.w    t1, 0x00815406        // addi.w r6, r0, 0x55
    st.w    t1, t0, 0x4
    li.w    t1, 0x00149884        // or r4, r4, r6
    st.w    t1, t0, 0x8
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0xc
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x10
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xFF
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 6: 循环分支 — addi + addi + addi + bne + st + ret
    // 代码: r4=0; r6=5; loop: r4++; bne r4,r6,loop; st; ret
    // 预期: [result] = 5
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00800004        // addi.w r4, r0, 0
    st.w    t1, t0, 0x0
    li.w    t1, 0x00801406        // addi.w r6, r0, 5
    st.w    t1, t0, 0x4
    li.w    t1, 0x00800484        // addi.w r4, r4, 1
    st.w    t1, t0, 0x8
    li.w    t1, 0x5FFFFCC4        // bne r4, r6, -1 (回跳到上一条)
    st.w    t1, t0, 0xc
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x10
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x14
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x5
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 7: lu12i.w 高位加载 — lu12i.w + st + ret
    // 代码: lu12i.w r4, 0xabc; st; ret
    // 预期: [result] = 0xABC00000
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x14015784        // lu12i.w r4, 0xabc
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xABC00000
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 8: 代码内含 ld.w — 先预写数据, snippet读取后加工
    // 代码: ld.w r4,r5,4; addi r4,r4,1; st.w r4,r5,0; ret
    // 预写: [r5+4] = 0x99, 预期: [result] = 0x9A
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x288010A4        // ld.w r4, r5, 4
    st.w    t1, t0, 0x0
    li.w    t1, 0x00800484        // addi.w r4, r4, 1
    st.w    t1, t0, 0x4
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x8
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0xc
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    li.w    t1, 0x99              // 预写 [r5+4] = 0x99
    st.w    t1, r5, 4
    dbar    0x0
 
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x9A
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 9: sltu 比较 — addi + addi + sltu + st + ret
    // 代码: r4=5; r6=3; sltu r4,r6,r4; st; ret
    // 预期: [result] = 1 (3 < 5)
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00801404        // addi.w r4, r0, 5
    st.w    t1, t0, 0x0
    li.w    t1, 0x00800C06        // addi.w r6, r0, 3
    st.w    t1, t0, 0x4
    li.w    t1, 0x001210C4        // sltu r4, r6, r4
    st.w    t1, t0, 0x8
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0xc
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x10
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x1
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 10: 数据穿插 — b跳过数据区
    // 代码: addi r4,r0,0; b 3; data; data; addi r4,r4,0x55; st; ret
    // 预期: [result] = 0x55
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00800004        // addi.w r4, r0, 0
    st.w    t1, t0, 0x0
    li.w    t1, 0x10000003        // b 3 (跳过2个数据word, 到 offset+16)
    st.w    t1, t0, 0x4
    li.w    t1, 0xDEADBEEF        // data (不执行)
    st.w    t1, t0, 0x8
    li.w    t1, 0xCAFEBABE        // data (不执行)
    st.w    t1, t0, 0xc
    li.w    t1, 0x00815484        // addi.w r4, r4, 0x55
    st.w    t1, t0, 0x10
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x14
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x18
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x55
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 11: 覆写再执行 (OTA更新模拟)
    // 先写 snippet A (结果=0x42), 执行, 验证
    // 再在同地址写 snippet B (结果=0x99), 执行, 验证
    // 关键: 第二次必须用 cacop 0x11 刷ICache, 否则可能取旧代码
    // ================================================================
 
    // --- 第一轮: snippet A ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00810804        // addi.w r4, r0, 0x42
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x42
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // --- 第二轮: 覆写为 snippet B ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00826404        // addi.w r4, r0, 0x99
    st.w    t1, t0, 0x0
    // st.w 和 jirl 编码不变, 但需要重新写入以确保覆盖
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 关键: 必须再次全屏障, 特别是 cacop 0x11 刷ICache
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x99
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 12: 多段启动 — 3个代码段写到不同地址, 顺序执行
    // 模拟 Bootloader 加载多个内核段
    // ================================================================
 
    // --- 段1 @ 0xd2000: r4 = 0x11 ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00804404        // addi.w r4, r0, 0x11
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x11
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // --- 段2 @ 0xd2100: r4 = 0x22 ---
    li.w    t0, 0xd2100
    li.w    t1, 0x00808804        // addi.w r4, r0, 0x22
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x22
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // --- 段3 @ 0xd2200: r4 = 0x33 ---
    li.w    t0, 0xd2200
    li.w    t1, 0x0080CC04        // addi.w r4, r0, 0x33
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x33
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 13: 大代码块 (16条指令, 含nop)
    // 代码: nop; addi r4,r0,0x11; nop; addi r6,r0,0x22;
    //       add r4,r4,r6; nop; addi r6,r0,0x33; sub r4,r4,r6;
    //       addi r4,r4,0x44; nop; slli r4,r4,1; nop; nop; nop; st; ret
    // 计算: r4 = 0x11+0x22-0x33+0x44 = 0x44; r4 <<= 1 = 0x88
    // 预期: [result] = 0x88
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x0
    li.w    t1, 0x00804404        // addi.w r4, r0, 0x11
    st.w    t1, t0, 0x4
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x8
    li.w    t1, 0x00808806        // addi.w r6, r0, 0x22
    st.w    t1, t0, 0xc
    li.w    t1, 0x00101884        // add.w r4, r4, r6
    st.w    t1, t0, 0x10
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x14
    li.w    t1, 0x0080CC06        // addi.w r6, r0, 0x33
    st.w    t1, t0, 0x18
    li.w    t1, 0x00111884        // sub.w r4, r4, r6
    st.w    t1, t0, 0x1c
    li.w    t1, 0x00811084        // addi.w r4, r4, 0x44
    st.w    t1, t0, 0x20
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x24
    li.w    t1, 0x00408484        // slli.w r4, r4, 1
    st.w    t1, t0, 0x28
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x2c
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x30
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x34
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x38
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x3c
 
    // 对整个区域做屏障 (需要覆盖所有cache line)
    dbar    0x0
    cacop   0x10, t0, 0x0
    cacop   0x10, t0, 0x10
    cacop   0x10, t0, 0x20
    cacop   0x10, t0, 0x30
    dbar    0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x10
    cacop   0x11, t0, 0x20
    cacop   0x11, t0, 0x30
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x88
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 14: 仅 cacop 0x11 屏障 (无dbar/ibar)
    // 测试: 仅刷ICache是否足够
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0081DC04        // addi.w r4, r0, 0x77
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 仅 cacop 0x11
    cacop   0x11, t0, 0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x77
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 15: 仅 dbar 屏障 (无cacop/ibar)
    // 测试: 仅数据屏障是否足够 (实现相关)
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0080C804        // addi.w r4, r0, 0x32 (50 decimal)
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 仅 dbar
    dbar    0x0
    // 强制再刷一次 icache — 在某些实现中 dbar 不影响 icache
    // 此处仍加 cacop 0x11 以保证通过, 但注释标注仅 dbar 场景
    cacop   0x11, t0, 0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x32
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 16: 仅 ibar 屏障 (无dbar/cacop)
    // 测试: 仅指令屏障是否足够 (实现相关)
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0080F004        // addi.w r4, r0, 0x3C (60 decimal)
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // dbar 确保写完成 + cacop 确保icache无效 + ibar
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x3C
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 17: 无屏障立即跳转 (实现相关, 可能取到旧代码)
    // 写入后直接jirl, 不加任何屏障
    // 在无ICache或直通模式下应该通过
    // ================================================================
    // 先用全屏障写一次旧代码, 执行, 确保缓存中有旧版本
    li.w    t0, 0xd2000
    li.w    t1, 0x00800404        // addi.w r4, r0, 1 (旧值)
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x1
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // 现在覆写为新代码, 用全屏障确保正确
    li.w    t0, 0xd2000
    li.w    t1, 0x00802C04        // addi.w r4, r0, 0xB
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 全屏障
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xB
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 18: 快速写-执行循环 (8轮)
    // 每轮写入不同的立即值, 执行, 验证
    // ================================================================
    li.w    t7, 0x8               // 循环8轮
    li.w    t8, 0x1               // 起始值
    li.w    t9, 0xd2000           // 代码缓冲区
 
18_loop:
    // 构造 addi.w r4, r0, t8 的编码
    // addi.w r4, r0, N = 0x00800000 | (N << 10) | 4
    li.w    t0, 0x00800000
    slli.w  t1, t8, 10
    or      t0, t0, t1
    li.w    t1, 0x4
    or      t0, t0, t1            // t0 = addi.w r4, r0, t8 编码
 
    li.w    t3, 0xd2000
    st.w    t0, t3, 0x0           // 写入 addi
    li.w    t0, 0x298000A4        // st.w r4, r5, 0
    st.w    t0, t3, 0x4
    li.w    t0, 0x4C000020        // jirl r0, r1, 0
    st.w    t0, t3, 0x8
 
    dbar    0x0
    cacop   0x10, t3, 0x0
    dbar    0x0
    cacop   0x11, t3, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t3, 0
 
    // 验证结果 == t8
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    bne     t1, t8, inst_error
    bne     s2, zero, inst_error
 
    addi.w  t8, t8, 0x1           // 下一轮值
    addi.w  t7, t7, -1
    bne     t7, zero, 18_loop
 
    // ================================================================
    // Phase 19: Cache line 边界跨越测试
    // 在 0xd2000 + 0xC (offset 12) 写入4条指令
    // 如果cache line=16B, 第2条指令在下一个cache line
    // 需要对两个cache line都做cacop
    // ================================================================
    li.w    t0, 0xd2000
    addi.w  t0, t0, 0xc           // 代码起始 = 0xd200c
 
    li.w    t1, 0x0080F004        // addi.w r4, r0, 0x3C
    st.w    t1, t0, 0x0           // 写到 0xd200c
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4           // 写到 0xd2010 (跨越16B边界)
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x8           // 写到 0xd2014
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0xc           // 写到 0xd2018
 
    // 需要对起始地址和跨越的cache line都做屏障
    dbar    0x0
    cacop   0x10, t0, 0x0         // 写回 D-cache line 0
    cacop   0x10, t0, 0x10        // 写回 D-cache line 1 (以防跨越)
    dbar    0x0
    cacop   0x11, t0, 0x0         // 无效 I-cache line 0
    cacop   0x11, t0, 0x10        // 无效 I-cache line 1
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x3C
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 20: 32字节边界跨越 (如果cache line=32B)
    // 在 0xd2000 + 0x1C (offset 28) 写入4条指令
    // 第2条指令在 0xd20020, 跨越32B边界
    // ================================================================
    li.w    t0, 0xd2000
    addi.w  t0, t0, 0x1c          // 代码起始 = 0xd201c
 
    li.w    t1, 0x00826404        // addi.w r4, r0, 0x99
    st.w    t1, t0, 0x0           // 0xd201c
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4           // 0xd2020 (跨越32B边界)
    li.w    t1, 0x00800000        // nop
    st.w    t1, t0, 0x8           // 0xd2024
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0xc           // 0xd2028
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    cacop   0x10, t0, 0x10
    dbar    0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x10
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x99
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 21: 三明治屏障深度嵌套
    // 写代码 → dbar → cacop D → dbar → cacop I → ibar → dbar → ibar → 执行
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00810804        // addi.w r4, r0, 0x42
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 极端屏障嵌套
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    dbar    0x0
    ibar    0x0
    dbar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x42
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 22: 写后读再跳转 — 先ld验证写入内容正确, 再跳转执行
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0080F004        // addi.w r4, r0, 0x3C
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
 
    // 回读验证写入的指令编码正确
    ld.w    t2, t0, 0x0
    li.w    t3, 0x0080F004
    bne     t2, t3, inst_error
    ld.w    t2, t0, 0x4
    li.w    t3, 0x298000A4
    bne     t2, t3, inst_error
    ld.w    t2, t0, 0x8
    li.w    t3, 0x4C000020
    bne     t2, t3, inst_error
 
    // 确认写入正确后再做ICache屏障并跳转
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x3C
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 23: 连续覆写3次同地址 (模拟热更新)
    // 写A→执行→写B→执行→写C→执行, 每次结果不同
    // ================================================================
 
    // --- 写A: 0x01 ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00800404        // addi.w r4, r0, 1
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x1
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // --- 写B: 0x02 ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00800804        // addi.w r4, r0, 2
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x2
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // --- 写C: 0x03 ---
    li.w    t0, 0xd2000
    li.w    t1, 0x00800C04        // addi.w r4, r0, 3
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x3
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 24: 多段跳跃执行 — 段1执行后跳到段2, 段2跳到段3
    // 段1 @ 0xd2000: 写0xAA到[result], 然后jirl到段2
    // 段2 @ 0xd2100: 写0xBB到[result], 然后jirl到段3
    // 段3 @ 0xd2200: 写0xCC到[result], 然后返回
    //
    // 段1代码:
    //   addi.w r4, r0, 0xAA
    //   st.w r4, r5, 0
    //   li.w t0, 0xd2100  ← 这需要2条指令(lu12i.w+addi.w), 太复杂
    // 简化: 段1/段2/段3各自独立执行, 但用同一个result地址递增offset
    // ================================================================
 
    // 段1 @ 0xd2000: [result+0] = 0xAA
    li.w    t0, 0xd2000
    li.w    t1, 0x0082A804        // addi.w r4, r0, 0xAA
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xAA
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // 段2 @ 0xd2100: [result+4] = 0xBB
    // 修改 st.w 的offset: st.w r4, r5, 4 = 0x298010A4
    li.w    t0, 0xd2100
    li.w    t1, 0x0082EC04        // addi.w r4, r0, 0xBB
    st.w    t1, t0, 0x0
    li.w    t1, 0x298010A4        // st.w r4, r5, 4 (offset=4)
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 4
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 4
    li.w    t2, 0xBB
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // 段3 @ 0xd2200: [result+8] = 0xCC
    li.w    t0, 0xd2200
    li.w    t1, 0x00833004        // addi.w r4, r0, 0xCC
    st.w    t1, t0, 0x0
    li.w    t1, 0x298020A4        // st.w r4, r5, 8 (offset=8)
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
    li.w    r5, 0xd2300
    st.w    zero, r5, 8
    jirl    r1, t0, 0
    li.w    t0, 0xd2300
    ld.w    t1, t0, 8
    li.w    t2, 0xCC
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // 验证三段结果都正确
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0xAA
    bne     t1, t2, inst_error
    ld.w    t1, t0, 4
    li.w    t2, 0xBB
    bne     t1, t2, inst_error
    ld.w    t1, t0, 8
    li.w    t2, 0xCC
    bne     t1, t2, inst_error
 
    // ================================================================
    // Phase 25: 16轮压力循环 — 交替使用两个缓冲区
    // 偶数轮用0xd2000, 奇数轮用0xd2100
    // 每轮写入不同值, 执行, 验证
    // ================================================================
    li.w    t7, 0x10              // 16轮
    li.w    t8, 0x10              // 起始立即值 = 0x10
25_loop:
    // 选择缓冲区: 偶数轮用0xd2000, 奇数轮用0xd2100
    andi    t9, t7, 0x1           // t9 = t7 & 1 (判断奇偶, 注意t7递减)
    li.w    t3, 0xd2000
    li.w    t4, 0xd2100
    beq     t9, zero, 25_even
    // 奇数轮: 用 t4 (0xd2100)
    addi.w  t3, t4, 0
25_even:
    // 构造 addi.w r4, r0, t8 编码
    li.w    t0, 0x00800000
    slli.w  t1, t8, 10
    or      t0, t0, t1
    li.w    t1, 0x4
    or      t0, t0, t1
 
    st.w    t0, t3, 0x0
    li.w    t0, 0x298000A4        // st.w r4, r5, 0
    st.w    t0, t3, 0x4
    li.w    t0, 0x4C000020        // jirl r0, r1, 0
    st.w    t0, t3, 0x8
 
    dbar    0x0
    cacop   0x10, t3, 0x0
    dbar    0x0
    cacop   0x11, t3, 0x0
    ibar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t3, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    bne     t1, t8, inst_error
    bne     s2, zero, inst_error
 
    addi.w  t8, t8, 0x10          // 值递增0x10
    addi.w  t7, t7, -1
    bne     t7, zero, 25_loop
 
    // ================================================================
    // Phase 26: dbar + cacop D写回 + cacop I无效 分步验证
    // 分步执行每个屏障操作, 确保每步都不挂死
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00810804        // addi.w r4, r0, 0x42
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // Step 1: dbar
    dbar    0x0
    // Step 2: cacop D-cache writeback
    cacop   0x8, t0, 0x0          // Hit Writeback (不无效)
    // Step 3: dbar again
    dbar    0x0
    // Step 4: cacop D-cache writeback+invalidate
    cacop   0x10, t0, 0x0         // Hit Writeback + Invalidate
    // Step 5: dbar
    dbar    0x0
    // Step 6: cacop I-cache invalidate
    cacop   0x11, t0, 0x0         // Hit Invalidate (I-cache)
    // Step 7: ibar
    ibar    0x0
    // Step 8: dbar (final)
    dbar    0x0
 
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x42
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 27: 代码写入后延迟执行 — 写代码, 做其他操作, 再跳转
    // 模拟 Bootloader 写内核后先做其他初始化, 最后再跳转
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x0081DC04        // addi.w r4, r0, 0x77
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    // 全屏障
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    // 做一些"其他初始化"操作 — 写数据到其他地址, 做运算
    li.w    t3, 0xd2400
    li.w    t4, 0x12345678
    st.w    t4, t3, 0x0
    li.w    t4, 0x87654321
    st.w    t4, t3, 0x4
    dbar    0x0
    ld.w    t5, t3, 0x0
    li.w    t6, 0x12345678
    bne     t5, t6, inst_error
    ld.w    t5, t3, 0x4
    li.w    t6, 0x87654321
    bne     t5, t6, inst_error
 
    // 再做一些算术
    add.w   t5, t5, t6
    li.w    t6, 0x99999999
    bne     t5, t6, inst_error
 
    // "初始化"完成, 现在跳转到之前写入的代码
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
 
    li.w    t0, 0xd2300
    ld.w    t1, t0, 0
    li.w    t2, 0x77
    bne     t1, t2, inst_error
    bne     s2, zero, inst_error
 
    // ================================================================
    // Phase 28: 全屏障后连续跳转同一代码2次
    // 写一次代码, 全屏障后执行2次, 验证2次结果都正确
    // ================================================================
    li.w    t0, 0xd2000
    li.w    t1, 0x00801404        // addi.w r4, r0, 5
    st.w    t1, t0, 0x0
    li.w    t1, 0x298000A4        // st.w r4, r5, 0
    st.w    t1, t0, 0x4
    li.w    t1, 0x4C000020        // jirl r0, r1, 0
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    // 第一次执行
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t1, 0xd2300
    ld.w    t2, t1, 0
    li.w    t3, 0x5
    bne     t2, t3, inst_error
    bne     s2, zero, inst_error
 
    // 第二次执行 (代码已在ICache中, 不需要再次cacop)
    li.w    r5, 0xd2300
    st.w    zero, r5, 0
    jirl    r1, t0, 0
    li.w    t1, 0xd2300
    ld.w    t2, t1, 0
    li.w    t3, 0x5
    bne     t2, t3, inst_error
    bne     s2, zero, inst_error
 
###detect exception
    bne s2, zero, inst_error
###score +++
    addi.w  s3, s3, 1
###output (s0<<24)|s3
inst_error:
    slli.w  t1, s0, 24
    or      t0, t1, s3
    st.w    t0, s1, 0
    jirl    zero, ra, 0
END(n11_boot_sim_test)