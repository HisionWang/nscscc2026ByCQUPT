# 项目进度

此文件就那啥，记录一下你们各自在这个项目里都干了啥，日期名字那种信息写好让其他俩人清楚你干了什么
也可以写好点的格式，后面记录的人就抄那个人的格式

Chiplab的环境变量：

```
source env.sh
```

有什么笔记的话写好放在doc里面

## 4月5日 王豪：

我这边chiplab那些工具链（toolchains）应该都是搭建好了的，应该可以正常用

现目前的阶段就是搭建好了一个大致的项目框架，我们还还是用git来操作开发
然后，我打算还是用chisel来写代码，建议你们也用，chisel对写代码的人效率是真的高
但如果你们还是不习惯的话，就还是用v嘛，我chisel里面可以留黑盒，接口对的上就行

目前我的chisel框架大致搭建好了，就在designCPUbyChisel里面，现在是一坨AI生成的代码
但是可以成功转换成v，有可行性，里面也有黑盒，你们可以去看一下

## 4月7日 王豪：

把chisel中的difftest模块加上了

## 4月13日 王豪：

1. 把香山/Rocket的传参的方法加进去了（nscscc2026ByCQUPT/designCPUByChisel/src/main/scala/config）
    后面参数的传递应该就很方便了，直接可以在designCPUByChisel/src/main/scala/config/NSCore.scala或者designCPUByChisel/src/main/scala/config/Arch.scala  
    中可以直接写入相关的宏定义，然后实例化带这些参数的模块，在具体的模块里就能直接用这些参数  
2. 生成v时可以支持拆分成多个文件了，问了ai问了半天怎么拆分都不对，后面琢磨着直接一个help命令让他打印出直接哪些参数就行，哎哟真服了  
    然后稍微把生成verilog那边的逻辑整得稍微感觉一点了  

**修改之后sbt、仿真未见错误**

## 4月15日 王豪：
注意写代码的时候，各种变量名不要和Parameters里面的定义的东西一样！！这个报错很难找到是这样，这样搞不会很明显得报错  
然后把Icache的流水架构稍微用AI仿照香山的Icache架构写了一下，虽然逻辑是依托  
但代码里应该还存在问题，非语法错误，但属于Verilog中的连线错误。  
（verilog的连线错误只有在编译时才看得出来，但是对于语法错误：写chisel的时候一定要配metals，百分之99.99的语法错误可以在写的时候解决，不像verilog编译的时候才检测得出语法错误）  
并且还把AXI的AXI3MasterIO和AXI3SlaveIO整理清晰了

## 4月16日 王豪：
解决了目前模块中所有的连线错误，稍微跑出来的一点波形，Icache的逻辑还没看，不过AXI桥的逻辑应该对的（也没对完）  
学到了：
1. Chisel库中自带的Arbiter使用方法
2. Decoupled方法可以自带valid和ready握手信号，然后传输的数据用bits分割开（我就说香山中怎么信号都是囊括在bits里的）

> 为了方便Chisel在IP/myCPU生成新代码同时不影响其他verilog写出的代码
> 在Chisel生成的代码将保存在myCPU/Chisel文件夹中
> 但这样的话，用VERILATOR仿真的话，就得在makefile里面的VERILATOR_INCLUDE和VERILATOR_SRC加上/Chisel文件夹了

