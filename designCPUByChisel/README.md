# DesignCPUByChiselByCQUPT！项目

目前只搭建好了一个简单的框架，代码都是AI写的（顶层框架，转接桥，miniIcache）
代码逻辑应该是写得一坨，后面再搞，但可以正常转成v，项目框架现在也有个雏形了，至少证明chisel写CPU还是有可行性的

## sbt
-----
转成verilog：

```
sbt run
```

结果放在chiplab的IP文件夹里面的

另外你们如果不习惯用chisel写的话，后续可以用v写，我这边chisel里面可以留黑盒，到时候你们写好了就可以直接加进来了，现目前AI写的的chisel代码里面，dcahe和俩uncache都是黑盒，可以去看一下他的实现，这样你就比较清楚你那边的verilog怎么对接
但建议还是看一下chisel代码，至少读到我这边的chisel大概知道什么意思

如果要学chisel：

sbt安装见doc，其实就是下个发行版然后设置环境变量就行，网上搜一下教程吧
chisel大致教程看
[https://www.bilibili.com/video/BV1m44y1c7DZ](https://www.bilibili.com/video/BV1m44y1c7DZ)
基本上把这一套是极品

## mill
-----
build with mill
### version

- mill-version: 0.12.5
- chisel-version: 7.0.0
- scala-version: 2.13.16

### Makefile

branch mmu_dev
此分支下Mafefile默认构架方式修改为项目中给定的mill
EMIT_TOPS指定顶层构建对象(转换为verilog的module), verilog生成到以下路径
`BUILD_DIR := ./build
RTL_DIR   := $(BUILD_DIR)/rtl`
对应顶层为main/scala/Elaborate.scala

### TODO
#### bugs

相对于sbt构建会出现编译错误，主要为chisel版本差异导致的
1. IO <> 0.asTypeOf(...)
较新chisel不允许0UInt作为左值(assign对象), 添加WireDefault封装即可
2. DontCare
不允许存在无驱动IO, 否则产生编译错误, 可使用io <> DontCare 或者 io.seg := DontCare避免此编译错误

#### symbol link

使用符号链接将build/rtl链接到chiplab中，更符合人体工学
Windows环境下可能存在bug, 可以参考doc/git.md解决
