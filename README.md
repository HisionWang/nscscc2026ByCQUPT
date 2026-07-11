# 项目进度

此文件就那啥，记录一下你们各自在这个项目里都干了啥，日期名字那种信息写好让其他俩人清楚你干了什么
也可以写好点的格式，后面记录的人就抄那个人的格式

Chiplab的环境变量：

```
source env.sh
```

有什么笔记的话写好放在doc里面

## 4月5日

我这边chiplab那些工具链（toolchains）应该都是搭建好了的，应该可以正常用

现目前的阶段就是搭建好了一个大致的项目框架，我们还还是用git来操作开发
然后，我打算还是用chisel来写代码，建议你们也用，chisel对写代码的人效率是真的高
但如果你们还是不习惯的话，就还是用v嘛，我chisel里面可以留黑盒，接口对的上就行

目前我的chisel框架大致搭建好了，就在designCPUbyChisel里面，现在是一坨AI生成的代码
但是可以成功转换成v，有可行性，里面也有黑盒，你们可以去看一下

## 4月7日

把chisel中的difftest模块加上了

## 4月13日

1. 把香山/Rocket的传参的方法加进去了（nscscc2026ByCQUPT/designCPUByChisel/src/main/scala/config）
    后面参数的传递应该就很方便了，直接可以在designCPUByChisel/src/main/scala/config/NSCore.scala或者designCPUByChisel/src/main/scala/config/Arch.scala  
    中可以直接写入相关的宏定义，然后实例化带这些参数的模块，在具体的模块里就能直接用这些参数  
2. 生成v时可以支持拆分成多个文件了，问了ai问了半天怎么拆分都不对，后面琢磨着直接一个help命令让他打印出直接哪些参数就行，哎哟真服了  
    然后稍微把生成verilog那边的逻辑整得稍微感觉一点了  

**修改之后sbt、仿真未见错误**

## 4月15日
注意写代码的时候，各种变量名不要和Parameters里面的定义的东西一样！！这个报错很难找到是这样，这样搞不会很明显得报错  
然后把Icache的流水架构稍微用AI仿照香山的Icache架构写了一下，虽然逻辑是依托  
但代码里应该还存在问题，非语法错误，但属于Verilog中的连线错误。  
（verilog的连线错误只有在编译时才看得出来，但是对于语法错误：写chisel的时候一定要配metals，百分之99.99的语法错误可以在写的时候解决，不像verilog编译的时候才检测得出语法错误）  
并且还把AXI的AXI3MasterIO和AXI3SlaveIO整理清晰了

## 4月16日
解决了目前模块中所有的连线错误，稍微跑出来的一点波形，Icache的逻辑还没看，不过AXI桥的逻辑应该对的（也没对完）  
学到了：
1. Chisel库中自带的Arbiter使用方法
2. Decoupled方法可以自带valid和ready握手信号，然后传输的数据用bits分割开（我就说香山中怎么信号都是囊括在bits里的）

> 为了方便Chisel在IP/myCPU生成新代码同时不影响其他verilog写出的代码
> 在Chisel生成的代码将保存在myCPU/Chisel文件夹中
> 但这样的话，用VERILATOR仿真的话，就得在makefile里面的VERILATOR_INCLUDE和VERILATOR_SRC加上/Chisel文件夹了

## 4月底
Icache的大致流水线都做好了
核心代码在CachePipe流水线中
分成了很多级的流水线，每一级干不同的事情，并且还有bypass路径，每一级干不同的事情
在Icache中uncahe访问和miss访问用同一个通道，用同一个状态机控制
在目前的开发阶段而言效果已经已经达到了理想状态
## 5月
？玩了一个月？
不是玩，没空

## 6月1日这周：
这周最大的成就就是
创建好了环形队列~

## 截至6月中旬（6月15日）
6月前两周的进度还是挺快
### 1.前端（第一周）
- 整体流水线通路顺利打通，包括BPU-IFU-ICache & bpuQ-predecode-IBF，功能正确
- BPU的读数据换成了BlockMemory式的读（下一周期出数据）
- 初步的mmu接入，有小性能问题但功能完好
### 2.后端顺序部分ctrlBlock（第二周）
- 整体流水线打通 decode-rename-dispatch
- 重要组件包括 freelist、Rat、Rob等
- 发射队列有五个，目前只接好了接口
- 重点优化了dispatch的分发到各个端口的逻辑

## 6月16日
加上了IQ，未检查逻辑，目前看能正常运行
> TODO:访存相关的源操作数等等需要设置好
> RAT的bypass路径应该还是问题，待解决

## 6月17日
1. 访存的源操作数相关梳理一下，初步解决：在译码的时候就做好rs1和rs2，不传rk，rj
2. 粗略加上了读寄存器BY AI
3. RAT的读Bypass路径梳理好了，更新了hold信号保持
4. FreeList的分配逻辑梳理了一下代码，解决了连续重复分配的问题
> TODO：oldpest的读取删了，在提交时由架构表读就行 
>
## 6月21日
1. 整个ALU流水线差不多可以顺利运行了，ALU的指令可以跑通整个流水线不出错
2. oldpdst逻辑已改、BusyTable逻辑已改

## 6月23日
1. 加上了执行模块里访存相关的内容
2. 初步加上了LSQ,dispatch入队和更新地址数据暂时正常

## 6月24日
1. LSQ初步功能写好了，接收新入队的、接收地址数据的功能基本没问题
2. LSQ与WB的连接弄好了，SQ与Rob的交互OK了

> TODO:有些连线太乱了，整体大致弄好后需要大扫除一下

## 6月25日
- LQ和SQ分开读mmu的形式太抓马了，后面Cache流水线也不太好对齐
1. 于是：访存读mmu的时间点放在了执行的addr之后马上读
> TODO:
> 访存读mmu的流水级
> Dcache中庞大的逻辑……

## 6月29日
1. axi桥的仲裁逻辑丑陋地改了，因为要支持乱序访存，那么id的情况将是复杂多变的
2. axi桥改了之后，AI写的Dcache编译成功了，但运行下来还是有问题
> TODO:
> 一点一点检查Dcache的逻辑
> axi桥中关于id的仲裁改漂亮点

## 7月2日
1. Dcache改了一些眼睛看出来的问题
2. difftest用起来了，一直到使用bru需要跳转的地方都没问题
> TODO:bru和整个核的刷新网络

## 7月5日
1. 跳转的刷新写了；快照的保存改了
2. 连上了difftest，整个核能跑起来了，并且还改了difftest里面的一丢丢东西
3. BPU相关的东西还暂时有点问题。打开BPU只能过三四个功能测试；关闭BPU前面的ALU指令基本都过了（13个测试），最后倒在了一条ld上（测试第一条）
> TODO: Dcache的访存逻辑还得优化

## 7月6日
1. freelist的bug改了
2. SQ加上了重定向清理
> TODO: Dcache的访存逻辑还得优化,Dcache有大bug
> TODO: BPU有大Bug
## 7月8日
1. Dcache用状态机了
2. 通过46项功能测试
> TODO: BPU
## 7月10日
### 回滚的时候需要释放快照