#include "asm.h"
#include "regdef.h"
#include "inst_test.h"
 
LEAF(n3_ibar_test)
 
    addi.w  s0, s0, 0x1 
    li.w    s2, 0x0
    //clear ti
    li.w    t0, 0x1 
    csrwr   t0, csr_ticlr 
    //make sure prl=0, DA=1, PG=0
    li.w    t0, 0x0
    li.w    t1, 0x3
    csrxchg t0, t1, csr_crmd 
 
    // ====== Test 1: 基本 ibar 屏障后读取 ======
    li.w     t0, 0xd01000
    li.w     t1, 0xffffffff
    st.w    t1, t0, 0x0
    li.w     t0, 0xd01004
    li.w     t1, 0xaaaaaaaa
    st.w    t1, t0, 0x0
    li.w     t0, 0xd01008
    li.w     t1, 0x55555555
    st.w    t1, t0, 0x0
 
    ibar    0x0
 
    li.w     t0, 0xd01000
    ld.w    t1, t0, 0x0
    li.w     t2, 0xffffffff
    bne     t1, t2, inst_error
 
    li.w     t0, 0xd01004
    ld.w    t1, t0, 0x0
    li.w     t2, 0xaaaaaaaa
    bne     t1, t2, inst_error
 
    li.w     t0, 0xd01008
    ld.w    t1, t0, 0x0
    li.w     t2, 0x55555555
    bne     t1, t2, inst_error
 
    // ====== Test 2: ibar + dbar 交替组合屏障 ======
    li.w     t0, 0xd01080
    li.w     t1, 0x12345678
    st.w    t1, t0, 0x0
    ibar    0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x12345678
    bne     t2, t3, inst_error
 
    li.w     t1, 0x87654321
    st.w    t1, t0, 0x0
    dbar    0x0
    ibar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x87654321
    bne     t2, t3, inst_error
 
    // ====== Test 3: 连续 ibar 屏障风暴（16次） ======
    li.w     t0, 0xd01100
    li.w     t1, 0xdeadbeef
    st.w    t1, t0, 0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ibar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xdeadbeef
    bne     t2, t3, inst_error
 
    // ====== Test 4: ibar-dbar-ibar 三明治屏障 ======
    li.w     t0, 0xd01180
    li.w     t1, 0xfeedface
    st.w    t1, t0, 0x0
    ibar    0x0
    dbar    0x0
    ibar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xfeedface
    bne     t2, t3, inst_error
 
    // ====== Test 5: 多地址 st + ibar + 交叉 ld 验证 ======
    li.w     t0, 0xd01200
    li.w     t1, 0x11111111
    st.w    t1, t0, 0x0
    li.w     t0, 0xd02000
    li.w     t1, 0x22222222
    st.w    t1, t0, 0x0
    li.w     t0, 0xd02800
    li.w     t1, 0x33333333
    st.w    t1, t0, 0x0
 
    ibar    0x0
 
    li.w     t0, 0xd01200
    ld.w    t1, t0, 0x0
    li.w     t2, 0x11111111
    bne     t1, t2, inst_error
    li.w     t0, 0xd02000
    ld.w    t1, t0, 0x0
    li.w     t2, 0x22222222
    bne     t1, t2, inst_error
    li.w     t0, 0xd02800
    ld.w    t1, t0, 0x0
    li.w     t2, 0x33333333
    bne     t1, t2, inst_error
 
    // ====== Test 6: st→ibar→覆写→ibar→验证覆写 ======
    li.w     t0, 0xd03000
    li.w     t1, 0xaaaa0000
    st.w    t1, t0, 0x0
    ibar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xaaaa0000
    bne     t2, t3, inst_error
 
    li.w     t1, 0xbbbb1111
    st.w    t1, t0, 0x0
    ibar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0xbbbb1111
    bne     t2, t3, inst_error
 
    // ====== Test 7: ibar 后立即分支跳转验证 ======
    li.w     t0, 0xd03100
    li.w     t1, 0xccccdddd
    st.w    t1, t0, 0x0
    ibar    0x0
    b       1f
    addi.w  zero, zero, zero       // nop
1:
    ld.w    t2, t0, 0x0
    li.w     t3, 0xccccdddd
    bne     t2, t3, inst_error
 
    // ====== Test 8: 循环中反复 ibar 极端压力 ======
    li.w     t0, 0xd03200
    li.w     t6, 0x10              // 16轮
    li.w     t5, 0x0
1:
    st.w    t5, t0, 0x0
    ibar    0x0
    ld.w    t1, t0, 0x0
    bne     t1, t5, inst_error
    addi.w  t5, t5, 0x1
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
END(n3_ibar_test)