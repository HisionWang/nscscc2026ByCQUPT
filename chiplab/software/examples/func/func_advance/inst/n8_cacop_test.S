#include "asm.h"
#include "regdef.h"
#include "inst_test.h"
 
LEAF(n8_cacop_test)
 
    addi.w  s0, s0, 0x1 
    li.w    s2, 0x0
    //clear ti
    li.w    t0, 0x1 
    csrwr   t0, csr_ticlr 
    //make sure prl=0, DA=1, PG=0
    li.w    t0, 0x0
    li.w    t1, 0x3
    csrxchg t0, t1, csr_crmd 
 
    // ====== Test 1: cacop 0x11 (ICache Invalidate) 多地址 ======
    // 对多个指令cache行执行 invalidate
    li.w     t0, 0xd01000
    cacop   0x11, t0, 0x0
    li.w     t0, 0xd01200
    cacop   0x11, t0, 0x0
    li.w     t0, 0xd01400
    cacop   0x11, t0, 0x0
    li.w     t0, 0xd01600
    cacop   0x11, t0, 0x0
    li.w     t0, 0xd01800
    cacop   0x11, t0, 0x0
 
    // ====== Test 2: cacop 0x10 (DCache Writeback+Invalidate) ======
    // 先写入数据，再 cacop 0x10 刷回并无效，再读验证
    li.w     t0, 0xd02000
    li.w     t1, 0xabcdef01
    st.w    t1, t0, 0x0
    li.w     t1, 0x23456789
    st.w    t1, t0, 0x4
    li.w     t1, 0xfedcba98
    st.w    t1, t0, 0x8
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    cacop   0x10, t0, 0x4
    cacop   0x10, t0, 0x8
    dbar    0x0
 
    // 无效后重新写入并验证
    li.w     t1, 0x11111111
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x11111111
    bne     t2, t3, inst_error
 
    // ====== Test 3: cacop 0x8 (DCache Writeback) ======
    li.w     t0, 0xd03000
    li.w     t1, 0xaaaa5555
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x8, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xaaaa5555
    bne     t2, t3, inst_error
 
    // ====== Test 4: cacop 0x10 连续整块 cache line 无效 ======
    // 假设 cache line = 16B，覆盖连续 8 行
    li.w     t7, 0xd04000          // base addr
    li.w     t6, 0x8               // 8 cache lines
    li.w     t5, 0x0               // counter
1:
    // 先写入
    slli.w  t0, t5, 4              // offset = counter * 16
    add.w   t1, t7, t0
    li.w    t2, 0xcafe0000
    or      t2, t2, t5
    st.w    t2, t1, 0x0
    st.w    t2, t1, 0x4
    st.w    t2, t1, 0x8
    st.w    t2, t1, 0xc
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    dbar    0x0
 
    // 执行 cacop 0x10 逐行无效
    li.w     t7, 0xd04000
    li.w     t6, 0x8
    li.w     t5, 0x0
2:
    slli.w  t0, t5, 4
    add.w   t1, t7, t0
    cacop   0x10, t1, 0x0
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 2b
 
    dbar    0x0
 
    // ====== Test 5: cacop 0x11 对同一地址反复执行 ======
    li.w     t0, 0xd05000
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
    cacop   0x11, t0, 0x0
 
    // ====== Test 6: cacop 0x10 后 dbar+ibar 全屏障 ======
    li.w     t0, 0xd06000
    li.w     t1, 0x1a2b3c4d
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    ibar    0x0
    // 正常不应挂死
    li.w     t1, 0x5e6f7a8b
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x5e6f7a8b
    bne     t2, t3, inst_error
 
    // ====== Test 7: 大量 st→cacop 0x10→重新 st→ld 循环 ======
    li.w     t7, 0xd07000
    li.w     t6, 0x10              // 16轮
    li.w     t5, 0x0
1:
    slli.w  t0, t5, 2
    add.w   t1, t7, t0
    st.w    t5, t1, 0x0
    dbar    0x0
    cacop   0x10, t1, 0x0
    dbar    0x0
    // 无效后重写
    addi.w  t2, t5, 0x100
    st.w    t2, t1, 0x0
    dbar    0x0
    ld.w    t3, t1, 0x0
    bne     t2, t3, inst_error
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    // ====== Test 8: cacop 操作码边界 - 嵌入 ibar/dbar 混合 ======
    li.w     t0, 0xd08000
    li.w     t1, 0xf0e0d0c0
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x8, t0, 0x0       // writeback only
    dbar    0x0
    cacop   0x10, t0, 0x0      // writeback + invalidate
    dbar    0x0
    ibar    0x0
    cacop   0x11, t0, 0x0      // icache invalidate
    ibar    0x0
    // 确保不挂死
    li.w     t1, 0xb0a09080
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xb0a09080
    bne     t2, t3, inst_error
 
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
END(n8_cacop_test)