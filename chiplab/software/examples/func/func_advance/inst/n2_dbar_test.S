#include "asm.h"
#include "regdef.h"
#include "inst_test.h"
 
LEAF(n2_dbar_test)
 
    addi.w  s0, s0, 0x1 
    li.w    s2, 0x0
    //clear ti
    li.w    t0, 0x1 
    csrwr   t0, csr_ticlr 
    //make sure prl=0, DA=1, PG=0
    li.w    t0, 0x0
    li.w    t1, 0x3
    csrxchg t0, t1, csr_crmd 
 
    // ====== Test 1: 连续密集 st.w + dbar + ld.w 顺序验证 ======
    // 向连续8个字写入不同模式，dbar后读回验证
    li.w     t0, 0xd01000
    li.w     t1, 0xaaaaaaaa
    st.w    t1, t0, 0x0
    li.w     t1, 0x55555555
    st.w    t1, t0, 0x4
    li.w     t1, 0xffffffff
    st.w    t1, t0, 0x8
    li.w     t1, 0x00000000
    st.w    t1, t0, 0xc
    li.w     t1, 0x12345678
    st.w    t1, t0, 0x10
    li.w     t1, 0x87654321
    st.w    t1, t0, 0x14
    li.w     t1, 0xdeadbeef
    st.w    t1, t0, 0x18
    li.w     t1, 0xfeedface
    st.w    t1, t0, 0x1c
 
    dbar    0x0
 
    // 读回并逐一验证
    li.w     t0, 0xd01000
    ld.w    t1, t0, 0x0
    li.w     t2, 0xaaaaaaaa
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x4
    li.w     t2, 0x55555555
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x8
    li.w     t2, 0xffffffff
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0xc
    li.w     t2, 0x00000000
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x10
    li.w     t2, 0x12345678
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x14
    li.w     t2, 0x87654321
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x18
    li.w     t2, 0xdeadbeef
    bne     t1, t2, inst_error
 
    ld.w    t1, t0, 0x1c
    li.w     t2, 0xfeedface
    bne     t1, t2, inst_error
 
    // ====== Test 2: 多次交替 st/ld + dbar 边界压力 ======
    // 极端：st→dbar→ld→st→dbar→ld 循环8轮
    li.w     t6, 0x8               // loop count
    li.w     t7, 0xd01080          // base addr
    li.w     t8, 0x0               // offset counter
1:
    slli.w  t0, t8, 2              // offset * 4
    add.w   t1, t7, t0             // addr = base + offset*4
    li.w    t2, 0xcafe0000
    or      t2, t2, t8             // unique data per iteration
    st.w    t2, t1, 0x0
    dbar    0x0
    ld.w    t3, t1, 0x0
    bne     t2, t3, inst_error
    addi.w  t8, t8, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    // ====== Test 3: st.h/st.b 混合宽度 + dbar ======
    li.w     t0, 0xd01100
    li.w     t1, 0xbabe
    st.h    t1, t0, 0x0
    li.w     t1, 0xface
    st.h    t1, t0, 0x2
    dbar    0x0
    ld.h    t1, t0, 0x0
    li.w     t2, 0xbabe
    bne     t1, t2, inst_error
    ld.h    t1, t0, 0x2
    li.w     t2, 0xface
    bne     t1, t2, inst_error
 
    li.w     t0, 0xd01108
    li.w     t1, 0xab
    st.b    t1, t0, 0x0
    li.w     t1, 0xcd
    st.b    t1, t0, 0x1
    li.w     t1, 0xef
    st.b    t1, t0, 0x2
    dbar    0x0
    ld.b    t1, t0, 0x0
    li.w     t2, 0xab
    bne     t1, t2, inst_error
    ld.b    t1, t0, 0x1
    li.w     t2, 0xcd
    bne     t1, t2, inst_error
    ld.b    t1, t0, 0x2
    li.w     t2, 0xef
    bne     t1, t2, inst_error
 
    // ====== Test 4: 连续密集 dbar 屏障风暴 ======
    // 16次连续 dbar，确保不会死锁/卡死
    li.w     t0, 0xd01180
    li.w     t1, 0x42424242
    st.w    t1, t0, 0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x42424242
    bne     t2, t3, inst_error
 
    // ====== Test 5: dbar 后覆写验证 ======
    // 写A→dbar→读A→写B→dbar→读B，确认覆写正确
    li.w     t0, 0xd01200
    li.w     t1, 0xaaaa1111
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xaaaa1111
    bne     t2, t3, inst_error
 
    li.w     t1, 0xbbbb2222
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xbbbb2222
    bne     t2, t3, inst_error
 
    // ====== Test 6: 大量写后单次 dbar + 全部回读 ======
    // 32个字写入，单次dbar，逐个读回
    li.w     t7, 0xd01300          // base
    li.w     t6, 0x20              // 32 words
    li.w     t5, 0x0               // counter
1:
    slli.w  t0, t5, 2
    add.w   t1, t7, t0
    // data = counter * 0x01010101
    li.w    t2, 0x01010101
    mul.w  t2, t5, t2
    st.w    t2, t1, 0x0
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    dbar    0x0
 
    // 回读验证
    li.w     t7, 0xd01300
    li.w     t6, 0x20
    li.w     t5, 0x0
2:
    slli.w  t0, t5, 2
    add.w   t1, t7, t0
    ld.w    t2, t1, 0x0
    li.w    t3, 0x01010101
    mul.w  t3, t5, t3
    bne     t2, t3, inst_error
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 2b
 
    // ====== Test 7: 同地址反复 st→dbar→ld 极端压力 ======
    li.w     t0, 0xd01400
    li.w     t6, 0x10              // 16轮
    li.w     t5, 0x1               // 初始值
1:
    st.w    t5, t0, 0x0
    dbar    0x0
    ld.w    t1, t0, 0x0
    bne     t1, t5, inst_error
    slli.w  t5, t5, 1             // 每轮左移1位
    andi    t5, t5, 0xffff        // 限制16位
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
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
END(n2_dbar_test)