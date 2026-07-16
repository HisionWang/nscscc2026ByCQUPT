**---**
# **Version 1.0**   
---
**日期：** 7-12
**版本号：** 926d6706706aab12086993a8fce0b01aac517eee


## 🧠 一、CPU 此时是什么样子 / 架构？


```
基础过了功能测试

BPU未启用
```


## 🔬 二、跑了什么测试？


```
用例：func_lab9 全部功能测试

环境：difftest仿真性能
```


## 📊 三、运行结果如何？

**total clock: 517339**

```
==============================================================
total clock             is 517339
total instruction       is 122497
instruction per cycle   is 0.236783
simulation time         is 98.771952 s
difftest time           is 4.546549 s
nemu_step time          is 0.059365 s
verilator eval time     is 21.905228 s
==============================================================




```




---
---
---
# **Version 2.0** 
日期： 7-15
## 🧠 一、CPU 此时是什么样子 / 架构？


```
基础过了功能测试
BPU修改了，
1. 修改了重定向时阻碍BPU读的错误
1. 修改了跨Cache行的pc用BPUmem1的错误

但只支持强跳转的预测，更新BPU数据的操作仅由预译码

```


## 🔬 二、跑了什么测试？


```
用例：func_lab9 全部功能测试

环境：difftest仿真性能
```


## 📊 三、运行结果如何？

**total clock: 516096**
```
==============================================================
total clock             is 516096
total instruction       is 163795
instruction per cycle   is 0.317373
simulation time         is 129.878172 s
difftest time           is 6.202721 s
nemu_step time          is 0.188568 s
verilator eval time     is 28.249667 s
==============================================================
```

---
---
---
# **Version 2.1** 
日期： 7-15
## 🧠 一、CPU 此时是什么样子 / 架构？


```
基础过了功能测试
BPU修改了，
1. 修改了预译码的逻辑
2. 修改了BRU，错误预测再重定向

BPU功能全部完善

```


## 🔬 二、跑了什么测试？


```
用例：func_lab9 全部功能测试

环境：difftest仿真性能
```


## 📊 三、运行结果如何？

**total clock: 505182**
```
==============================================================
total clock             is 505182
total instruction       is 163859
instruction per cycle   is 0.324356
simulation time         is 127.687406 s
difftest time           is 6.947528 s
nemu_step time          is 0.200904 s
verilator eval time     is 28.709057 s
==============================================================

```



# **Version 3.0** 
日期： 7-16
## 🧠 一、CPU 此时是什么样子 / 架构？


```
第一个通过coremark性能测试的版本
加上了取指和访存的地址翻译、缓存一致性
```


## 🔬 二、跑了什么测试？


```
用例：coremark（cache=0）

环境：difftest仿真性能
```


## 📊 三、运行结果如何？

**iFuCore Total ticks : 269219**
**My Total ticks : 716919**
```

2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 716919
Total time (secs): 0.007169
Iterations/Sec   : 139.485772
Iterations       : 1
Compiler version : GCC8.3.0
Compiler flags   : -O3 -funroll-all-loops -finline-limit=200 -ftree-dominator-opts -fno-if-conversion2 -fselective-scheduling -fno-code-hoisting -fno-common -falign-functions=4 -falign-jumps=4 -falign-loops=4
Memory location  : STACK
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0xe714
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 139.485772 / GCC8.3.0 -O3 -funroll-all-loops -finline-limit=200 -ftree-dominator-opts -fno-if-conversion2 -fselective-scheduling -fno-code-hoisting -fno-common -falign-functions=4 -falign-jumps=4 -falign-loops=4 / STACK


Print Personal Added Addtional Info to Easy Visual Analysis

 (*) Assume the core running at 33 MHz
     So the CoreMark/MHz can be caculated by: 
     (Iterations*1000000/total_ticks) = 1.394858 CoreMark/MHz

```
