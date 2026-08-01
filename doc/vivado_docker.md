# vivado on docker
-----
HOST

> workdir:  /data/docker-work/vivado/{workspace}

## preparation
- 创建一个工作目录, 或者用test目录
    - 使用script
    运行scripts/create.sh 规范化创建，避免权限问题
    ```bash
    scripts/create.sh <directory>
    ```

    - 建议先copy一份backup为自己的username，避免混用
    进入container, 切换到/work, 然后复制
    ```bash
    cp backup -ar {username}
    ```
    !!!note!!!: 必须加上 "-a" option否则会有文件权限的问题

## start container
- basic way
    ```bash
    # 查看现有container
    docker ps
    [/data]── ─ docker ps
    CONTAINER ID   IMAGE                 COMMAND                  CREATED       STATUS       PORTS     NAMES
    54c88a2ac850   vivado:v2023.2-work   "/entrypoint.sh /opt…"   2 hours ago   Up 2 hours             vivado-work
    # 与container交互, 默认root用户
    docker exec -it vivado-work bash
    ```
- smarter way
    使用scripts/docker.sh中的vivado funcation
    自动启动装有vivado的docker
    其中使用vivado用户运行
    ```bash
    # 这里的脚本路径默认处于workdir下运行, 自行修改
    # 下文同
    # 可以把这行加入到你的配置文件中,但要修改路径
    source scripts/docker.sh
    vivado # 与container交互
    # ....
    ```

## tools
IN CONTAINER

> vivado path: /opt/Xilinx/Vivado/2023.2

### funcation
```bash
# path: /home/vivado/.bashrc

# 执行tcl脚本
# vsource example.tcl
vsource() {
    LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 \
    /opt/Xilinx/Vivado/2023.2/bin/vivado \
        -mode batch \
        -source "$1"
}

# 启动tcl CLI
# 直接运行
vtcl() {
    LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 \
    /opt/Xilinx/Vivado/2023.2/bin/vivado \
        -mode tcl
}

# 我把cp aliase成cp -a了
aliase cp="cp -a"
```

### bitstream
- 生成bitstream
    - Host
    依赖于一个已有的git repo: nscscc2026ByCQUPT
    note: 默认假设位于$HOME/nscscc2026ByCQUPT
    如果要自定义，需要设置NSCSCC_PATH全局环境变量
    ```bash
    export NSCSCC_PATH=<your repo path> # optional
    scripts/genbit.sh <directory>
    ```

    - Container
    ```bash
    vivado # start intractive container
    vsource create_project.tcl
    vsource bit.tcl
    ```
- adjust clk_pll
    - Host
    ```bash
    scripts/set_clk.sh <directory> <freqency>
    scripts/get_clk.sh <directory>
    
    ```
    - Container
    问AI vivado怎么用tcl修改IP核配置吧
    这东西还是太原始了

## create container
```bash
# 非必要不建议创建多余的container
── ─ docker run -dit \
  --name vivado-nscscc\ # container name
  --hostname vivado-nscscc \
  --restart unless-stopped \
  --init \
  --shm-size=16g \
  --ulimit nofile=1048576:1048576 \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --mount type=bind,src=/data/docker-work/vivado,dst=/work \
  -e DISPLAY="$DISPLAY" \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /dev/bus/usb:/dev/bus/usb \
  --device-cgroup-rule='c 189:* rmw' \
  vivado-2023.2-nscscc # image name
```

## 补充
### repeat chiplab
/data/docker-work/vivado/backup
此目录下单独有一个chiplab，外部的chiplab中的/IP/myCPU使用软链接连接nscscc下的chiplab myCPU,方便测试以及自行修改

### tcl changes
1. docker下vivado2023.2会有库调用不一致的问题，强制使用固定标准库
    ```bash
    # vsource vtcl
    LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1
    ```
    [https://adaptivesupport.amd.com/s/article/000034450?language=en_US](https://adaptivesupport.amd.com/s/article/000034450?language=en_US)
2. others
    ```diff
    [~/v/b/chiplab]─[f19ba95...]── ─ git diff 614c047a1961ad505cb86755115d1dc28229b22a f19ba95398a2e11d4cf179ced5578612684cd017
        diff --git a/IP/myCPU b/IP/myCPU
        deleted file mode 160000
        index aa3bde1..0000000
        --- a/IP/myCPU
        +++ /dev/null
        @@ -1 +0,0 @@
        -Subproject commit aa3bde1f3e720e71c2c78d6b81930d797b810149
        diff --git a/fpga/nscscc-team/run_vivado/bit.tcl b/fpga/nscscc-team/run_vivado/bit.tcl
        index f6b00b2..034c0d0 100644
        --- a/fpga/nscscc-team/run_vivado/bit.tcl
        +++ b/fpga/nscscc-team/run_vivado/bit.tcl
        @@ -1,5 +1,7 @@
         # bit.tcl
         open_project project/loongson.xpr
        +set_param general.maxThreads 16
        +
         launch_runs impl_1 -to_step write_bitstream
         wait_on_run impl_1
    
        diff --git a/fpga/nscscc-team/run_vivado/create_project.tcl b/fpga/nscscc-team/run_vivado/create_project.tcl
        index 48a5aa1..99888f1 100644
        --- a/fpga/nscscc-team/run_vivado/create_project.tcl
        +++ b/fpga/nscscc-team/run_vivado/create_project.tcl
        @@ -1,3 +1,5 @@
        +set mycpu_dir ../../../IP/myCPU/FPGA
        +
         # SET PROJECT NAME
         set  project_name loongson
         set  project_path ./project
        @@ -13,6 +15,10 @@ create_project -force $project_name $project_path -part $project_part
    
         # Add conventional sources
         add_files -scan_for_includes ../../../chip/soc_demo/nscscc-team
        +
        +remove_files [get_files -quiet *_sim_netlist.v]
        +remove_files [get_files -quiet *.dcp]
        +
         add_files -scan_for_includes ../../../IP/AXI_SRAM_BRIDGE
         add_files -scan_for_includes ../../../IP/APB_DEV/URT
         add_files -norecurse "../../../IP/APB_DEV/apb_dev_top_no_nand.v"
        @@ -26,7 +32,7 @@ add_files -quiet [glob -nocomplain ../../../chip/soc_demo/nscscc-team/xilinx_ip/
         add_files -fileset sim_1 ../testbench
    
         # Add myCPU
        -add_files -scan_for_includes ../../../IP/myCPU
        +add_files -scan_for_includes $mycpu_dir
    
         # Add xilinx_ip in myCPU
         add_files -quiet [glob -nocomplain ../../../IP/myCPU/xilinx_ip/*/*.xci]
        diff --git a/fpga/nscscc-team/run_vivado/get_clk.tcl b/fpga/nscscc-team/run_vivado/get_clk.tcl
        new file mode 100644
        index 0000000..fca9d0f
        --- /dev/null
        +++ b/fpga/nscscc-team/run_vivado/get_clk.tcl
        @@ -0,0 +1,9 @@
        +set_part xc7a200tfbg676-2
        +
        +read_ip ../../../chip/soc_demo/nscscc-team/xilinx_ip/clk_pll/clk_pll.xci
        +
        +set ip [get_ips clk_pll]
        +set cpu_freq [get_property CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $ip]
        +
        +puts "$cpu_freq"
        +
        diff --git a/fpga/nscscc-team/run_vivado/set_clk.tcl b/fpga/nscscc-team/run_vivado/set_clk.tcl
        new file mode 100644
        index 0000000..ceaeafd
        --- /dev/null
        +++ b/fpga/nscscc-team/run_vivado/set_clk.tcl
        @@ -0,0 +1,11 @@
        +set cpu_freq $env(CPU_FREQ)
        +set_part xc7a200tfbg676-2
        +
        +read_ip ../../../chip/soc_demo/nscscc-team/xilinx_ip/clk_pll/clk_pll.xci
        +
        +set ip [get_ips clk_pll]
        +set_property CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $cpu_freq $ip
        +
        +validate_ip -save_ip $ip
        +reset_target all $ip
        +generate_target all $ip
    ```
