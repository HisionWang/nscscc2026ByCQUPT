### Linux Requirements

#### 指令集架构

编译kernel使用的配置为
``CROSS_COMPILE=loongarch32r-linux-gnusf-, arch=loongarch32r, -mabi=ilp32s``
启动Linux需要实现**除浮点指令以外**的所有指令

```bash
unix% loongarch32r-linux-gnusf-gcc -march=loongarch32r -mabi=ilp32s -Q --help=target
The following options are target specific:
  -G<number>                  		0
  -mabi=BASEABI               		ilp32s
  -mabi=lp64                  		[disabled]
  -mandroid                   		[disabled]
  -march=PROCESSOR            		loongarch32r
  -mbionic                    		[disabled]
  -mbranch-cost=COST          		6
  -mcheck-zero-division       		[enabled]
  -mcmodel=                   		normal
  -mcond-move-float           		[enabled]
  -mcond-move-int             		[enabled]
  -mdouble-float              		
  -mforce-drap                		[disabled]
  -mfpu=FPU                   		none
  -mfpu=0					       # 无需FPU
  -mfused-madd                		
  -mglibc                     		[enabled]
  -mlasx                      		
  -mlsx                       		
  -mmax-inline-memcpy-size=SIZE 	1024
  -mmemcpy                    		[disabled]
  -mmemvec-cost=<1,5>         		5
  -mmusl                      		[disabled]
  -msimd=SIMD                 		none
  -msingle-float              		
  -msoft-float                		# 软件模拟浮点指令
  -mstackrealign              		[disabled]
  -mstrict-align              		[enabled]
  -mtune=PROCESSOR            		loongarch32r
  -muclibc                    		[disabled]
  -mvecarg                    		[enabled]
  -mveclibabi=                		

  Base ABI types for LoongArch:
    ilp32d ilp32f ilp32s lp64d lp64f lp64s

  The code model option names for -mcmodel:
    extreme large normal tiny tiny-static

  LoongArch CPU types:
    abi-default la264 la364 la464 loongarch32 loongarch32r
    loongarch64 native

  FPU types of LoongArch:
    32 64 none

  SIMD extension levels of LoongArch:
    lasx lsx none
```

#### 缺少的实现

目前还未实现的指令：

| 指令      | 功能简述              | 涉及的 CSR |
| --------- | --------------------- | ---------- |
| CACOP     | 维护Cache一致性       | 无         |
| IDLE      | 空转直到被中断唤醒    | 无         |
| PRELD     | 预取DCache的CacheLine | 无         |
| IBAR/DBAR | 栅栏指令              | 无         |
| LL.W/SC.W | 原子访存指令          | CSR.LLBCTL |

目前还未实现的CSR：
CSR.PGDL，CSR.PGDH，CSRPGD
CSR.LLBCTL

##### 参考实现（LA500)

###### 指令

1. **CACOP**

   code为操作码（RJ），code[2:0]=0 表示操作&**一级私有指令 Cache**，code[2:0]=1 表示操作**一级私有数据 Cache**，*code[2:0]=2 表示操作二级共享混合 Cache*
   code[4:3]指示操作类型（后称op），详见[LA32R_reference](https://soc.ustc.edu.cn/COD/lab1/src/LA32R_ref.pdf)

   EXE （访存前）对code进行译码

   - 若为dcache cacop，则等待MEM空闲后，进入MEM阶段执行，将op，PA（默认计算得到VA，需经过地址翻译）传入到DCache，然后DCache根据op执行特殊模式，详细实现参考LA500
   - 若为icache cacop，则等待ICache空闲后（后面流水线中的所有指令执行完，且prefetch不在取指），将icache cacop传递到最后一级流水级后同dcache cacop一样执行，并刷新流水线

2. IDLE

   IDLE在执行到WB阶段产生idle_flush信号，清空流水线，将prefetch阶段的idle_lock置高，阻塞prefetch

3. PRELD
   仅在cache_enable的状态下有效。PRELD使用计算得到的地址访问cache（无副作用），并填充所访问的CacheLine，执行方式类似于dcache cacop
   LA500的实现在uncache的状态下，依然正常运行preld命令，好像不这么做哪里会有bug

   ```verilog
   assign preld_inst = es_preld && ((preld_hint == 5'd0) || (preld_hint == 5'd8))/* && !data_uncache_en*/; //preld must have bug
   ```

   有load和store两种模式，[reference](https://soc.ustc.edu.cn/COD/lab1/src/LA32R_ref.pdf)没说有什么区别

4. IBAR/DBAR

   > DBAR: 只有等到之前所有 load/store 访存操作彻底执行完毕后，“DBAR 0”指令才能开始执行；且只有“DBAR 0”执行完成执后，其后所有 load/store访存操作才能开始执行。
   > IBAR: 够确保“IBAR 0”指令之后的取指一定能够观察到“IBAR 0”指令之前所有 store 操作的执行效果。

   阻塞decode stage，直到后面所有流水级中的所有指令完全执行（这里不知道要不要维护Cache一致性，但按照[reference](https://soc.ustc.edu.cn/COD/lab1/src/LA32R_ref.pdf)的描述应该是要的）

5. LL.W/SC.W

   cache_enable状态下有效
   LL.W的实现需要CSR.LLBCTL和LLADDR(存储LL.W的访存地址，LA500将其放置于CSR模块)的支持，LL.W每次执行都需要覆盖LLADDR并将LLbit置1
   SC.W在MEM阶段比较PADDR 和 LLADDR，若相等且LLbit则取消访存，且向rd写0
   反之正常访存且写1
   执行后均刷新流水线并从wb_pc + 4开始重新取值

###### CSR

1. CSR.PGDL，CSR.PGDH，CSRPGD
   通过csr读写指令访问，无相关特殊指令，CSR.PGD的值与CSR.BADV有关
2. CSR.LLBCTL
   与原子访问存指令有关，详见[reference](https://soc.ustc.edu.cn/COD/lab1/src/LA32R_ref.pdf)

#### Linux配置

仓库地址https://gitee.com/loongson-edu/la32r-Linux

可用配置有``la32_defconfig``，``la32_bx_defconfig``
``arch/loongarch/configs/*_defconfig``

##### 基本配置q

此配置下使用**CONFIG_32BIT**配置（只有loongarch32r)

```bash
unix% cat configs/la32_defconfig | grep -iE "32BIT|64BIT"
CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
CONFIG_32BIT=y
CONFIG_COMPAT_32BIT_TIME=y
```

##### CROSS_COMPILE

CROSS_COMPILE可手动指定
```bash
export PATH=$(toolchain_path):$PATH
export CROSS_COMPILE=loongarch32r-linux-gnusf-
export ARCH=loongarch
```

默认情况下：

```makefile
# linux/arch/loongarch/Makefile
32bit-tool-archpref     = loongarch32r
64bit-tool-archpref	= loongarch64

ifdef CONFIG_32BIT
tool-archpref           =$(32bit-tool-archpref)
UTS_MACHINE             := loongarch32r
endif

#SUBARCH为host的指令集架构，详见linux/scripts/subarch.include和linux/Makefile
ifneq ($(SUBARCH),$(ARCH))
# 如果未指定CROSS_COMPILE
  ifeq ($(CROSS_COMPILE),)
    CROSS_COMPILE := $(call cc-cross-prefix, $(tool-archpref)-linux-  $(tool-archpref)-linux-gnu-  $(tool-archpref)-unknown-linux-gnu-)
  endif
endif
```

> 如果未手动指定指令集架构，侧CROSS_COMPILE尝试使用
> loongarch32r-linux-
> loongarch32r-linux-gnu-
> loongarch32r-unknown-linux-gnu-

##### ABI

使用-mabi=ilp32s，具体内容参考[文档](https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.02-CN.pdf)

```makefile
# linux/arch/loongarch/Makefile
ifdef CONFIG_32BIT
ld-emul                 = $(32bit-emul)
vmlinux-32              = vmlinux.32

cflags-y                += -mabi=ilp32s
endif
```

#### SoC

**不知道啊**