#include "asm.h"
#include "regdef.h"
#include "inst_test.h"
 
LEAF(n10_barrier_combo_test)
 
    addi.w  s0, s0, 0x1 
    li.w    s2, 0x0
    li.w    t0, 0x1 
    csrwr   t0, csr_ticlr 
    li.w    t0, 0x0
    li.w    t1, 0x3
    csrxchg t0, t1, csr_crmd 
 
    // ====== Test 1: dbar→ibar→cacop→dbar→ibar 深度嵌套屏障 ======
    li.w     t0, 0xd01000
    li.w     t1, 0xffffffff
    st.w    t1, t0, 0x0
 
    dbar    0x0
    ibar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    ibar    0x0
 
    li.w     t1, 0x12345678
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x12345678
    bne     t2, t3, inst_error
 
    // ====== Test 2: 循环中 st→dbar→cacop→dbar→ld 全流程 ======
    li.w     t7, 0xd02000
    li.w     t6, 0x10
    li.w     t5, 0x0
1:
    slli.w  t0, t5, 4
    add.w   t1, t7, t0
    li.w    t2, 0xbeef0000
    or      t2, t2, t5
    st.w    t2, t1, 0x0
    dbar    0x0
    cacop   0x10, t1, 0x0
    dbar    0x0
    li.w    t2, 0xcafe0000
    or      t2, t2, t5
    st.w    t2, t1, 0x0
    dbar    0x0
    ld.w    t3, t1, 0x0
    bne     t2, t3, inst_error
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    // ====== Test 3: ibar+dbar 交替32次屏障风暴 ======
    li.w     t6, 0x10
1:
    ibar    0x0
    dbar    0x0
    ibar    0x0
    dbar    0x0
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    // ====== Test 4: cacop 对不同操作码逐一测试 ======
    // 0x8: DCache WriteBack
    li.w     t0, 0xd03000
    li.w     t1, 0x11111111
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x8, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x11111111
    bne     t2, t3, inst_error
 
    // 0x10: DCache WriteBack+Invalidate
    li.w     t1, 0x22222222
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    li.w     t1, 0x33333333
    st.w    t1, t0, 0x0
    dbar    0x0
    ld.w    t2, t0, 0x0
    li.w     t3, 0x33333333
    bne     t2, t3, inst_error
 
    // 0x11: ICache Invalidate
    cacop   0x11, t0, 0x0
    ibar    0x0
 
    // ====== Test 5: ll/sc + cacop 组合 ======
    li.w     t0, 0xd04000
    li.w     t1, 0x0
    st.w    t1, t0, 0x0
    dbar    0x0
 
    ll.w    t2, t0, 0x0
    addi.w  t2, t2, 0x1
    sc.w    t2, t0, 0x0
    bne     t2, zero, inst_error
 
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
 
    li.w     t1, 0x0
    st.w    t1, t0, 0x0
    dbar    0x0
 
    ll.w    t2, t0, 0x0
    addi.w  t2, t2, 0x2
    sc.w    t2, t0, 0x0
    bne     t2, zero, inst_error
 
    dbar    0x0
    ld.w    t1, t0, 0x0
    li.w     t2, 0x2
    bne     t1, t2, inst_error
 
    // ====== Test 6: 多地址 cacop 全覆盖 ======
    li.w     t7, 0xd05000
    li.w     t6, 0x10             // 16个cache line
    li.w     t5, 0x0
1:
    slli.w  t0, t5, 4
    add.w   t1, t7, t0
    li.w    t2, 0xaa550000
    or      t2, t2, t5
    st.w    t2, t1, 0x0
    dbar    0x0
    cacop   0x10, t1, 0x0
    dbar    0x0
    ibar    0x0
    addi.w  t5, t5, 0x1
    addi.w  t6, t6, -1
    bne     t6, zero, 1b
 
    // ====== Test 7: 极端混合: st→dbar→cacop→ibar→ll→sc→dbar→ld ======
    li.w     t0, 0xd06000
    li.w     t1, 0xf0f0f0f0
    st.w    t1, t0, 0x0
    dbar    0x0
    cacop   0x10, t0, 0x0
    dbar    0x0
    ibar    0x0
    li.w     t1, 0x0
    st.w    t1, t0, 0x0
    dbar    0x0
    ll.w    t2, t0, 0x0
    addi.w  t2, t2, 0x7
    sc.w    t2, t0, 0x0
    bne     t2, zero, inst_error
    dbar    0x0
    ld.w    t1, t0, 0x0
    li.w     t2, 0x7
    bne     t1, t2, inst_error
 
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
END(n10_barrier_combo_test)