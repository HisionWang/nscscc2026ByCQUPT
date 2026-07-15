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

