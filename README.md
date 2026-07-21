# 做测试前请确保你的分支是我指定的分支
## 1\. 切换到指定分支（核心操作）

### 1\.1 本地已存在目标分支，直接切换

```shell
git checkout 目标分支名
```

示例：切换到 Test_721 分支

```shell
git checkout Test_721
```

### 1\.2 本地无目标分支，从远程分支拉取并切换

```shell
git checkout -b 目标分支名 origin/目标分支名
```

## 2\. 校验当前分支是否为指定分支（必做）

切换分支后，必须校验分支是否切换成功，避免操作失误：

```shell
git status
```

输出中会明确显示 `On branch xxx`，确认分支无误。





# Chisel 代码转 Verilog \+ FPGA 上板验证实操教程（仅上板验证，无difftest仿真）

## 一、安装 sbt 环境

### 1\. 安装地址

官方下载地址：[https://www\.scala\-sbt\.org/download/](https://www.scala-sbt.org/download/)

参考文档：`doc/自用教程/chisel安装与初探索wh.md`

### 2\. 环境验证

终端输入以下命令，有正常版本输出即为安装成功：

```shell
sbt -v
```

## 二、Chisel 代码转换为 Verilog 代码

### 1\. 进入工程目录

```shell
cd nscscc2026ByCQUPT/designCPUByChisel
```

### 2\. 执行转换命令

```shell
make ff
```

### 3\. 生成文件路径

转换成功后，生成的 Verilog 代码存放路径：`chiplab/IP/myCPU/FPGA`，可进入目录核对文件。

## 三、项目创建、比特流与 LTX 文件生成（简略）

详细流程参考项目配套文档，此处仅标注**关键避坑要点**：

**生成bit前-重要检查事项**：每次重新生成 bit 流前，必须在 Vivado TCL 终端执行以下命令，或**删除项目重新创建**，避免缓存问题导致编译、上板异常： 

```tcl
reset_project
```
**生成bit前-重要检查事项**：一定要确保生成bit流的模式是对的！！功能测试要用功能测试的、性能测试要用性能测试的，不得混用，以免引起不必要的错误
## 四、FPGA 上板自动测试（VIO 自动测试）

新版 ChipLab 支持 VIO 自动上板测试，无需手动拨码记录（官方 README 未标注用法），直接通过 `vio.tcl` 脚本完成自动测试、结果输出。

### 1\. 前置准备

无需提前连接开发板、无需打开HardWare连接工具，直接在 Vivado TCL 控制台执行脚本即可。

### 2\. TCL 执行脚本

```tcl
# 切换到当前工程目录
cd [get_property DIRECTORY [current_project]]

# 传入参数：bit文件、ltx文件、测试模式（func功能测试/perf性能测试）
# 如果用服务器跑bit，你的电脑连板子，一定要确认bit流不要传错了！！！！！！下面的bit地址一定要对，以免引起不必要的测试错误
set argv [list \
  ./loongson.runs/impl_1/soc_top.bit \
  ./loongson.runs/impl_1/soc_top.ltx \
  perf \ 
]
set argc 3

# 执行自动测试脚本
source ../vio.tcl
```

### 3\. 关键参数说明

第三个参数为测试模式，二选一：

- `func`：功能测试模式

- `perf`：性能测试模式

详细规则参考脚本：`chiplab/fpga/nscscc-team/run_vivado/vio.tcl`

### 4\. 测试结果校验

脚本执行完成后，终端会打印测试日志，同时自动生成 CSV 测试报表，需核对报表数据与日志结果正常、无报错。



# 学校服务器端 Vivado 运行方案（解决本地电脑编译卡顿问题）

本项目工程体量较大，个人电脑生成 bit 流速度缓慢，推荐使用服务器 Docker 环境运行 Vivado 2023\.2。  
以下是我个人的启动命令，我也不是很熟悉docker，详细问思贤，我这下面仅供参考。  

### 1\. 远程连接服务器
首先要配置好传图像界面的X11等等玩意儿,问AI,推荐用MobaXterm这软件  
带图形界面加速连接（优化远程界面卡顿问题）：  
连接服务器：  
```shell
ssh -YC -c aes128-gcm@openssh.com,chacha20-poly1305@openssh.com -o CompressionLevel=1 你的用户名@10.147.17.133
```

### 2\. 启动 Docker 容器

核心说明：tcl中，你的项目在 `/workspace` 下，home 中找不到

```shell
docker run -it --rm \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e QT_GRAPHICSSYSTEM=raster \
  -e QT_AUTO_SCREEN_SCALE_FACTOR=0 \
  -e QT_SCALE_FACT=1 \
  -e _JAVA_OPTIONS="-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false -Dswing.aatext=false" \
  -e XLIB_SKIP_ARGB_VISUALS=1 \
  -v $HOME/.Xauthority:/root/.Xauthority:ro \
  -v $HOME:/workspace \
  vivado:v2023.2 \
bash
```

### 3\. 修复 Docker 环境 Bug（必做）

那个Docker 镜像默认缺失 GCC 环境，每次进入容器需手动安装：

```shell
apt-get update && apt-get install -y build-essential
```

### 4\. 启动 Vivado 软件

```shell
/opt/Xilinx/Vivado/2023.2/bin/vivado
```

