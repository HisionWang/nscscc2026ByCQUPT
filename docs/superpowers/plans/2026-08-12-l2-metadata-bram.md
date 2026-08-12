# L2 Metadata BRAM Migration Implementation Plan

> 实施时使用测试驱动方式；每一步都在服务器原仓库 `local/L2-cache-v1` 上完成，
> 保留既有未跟踪 Vivado 产物，不推送远程。

**目标：** 将每路 tag/valid/dirty 合并到两拍 `512x19` metadata RAM，并用
512 拍 scrub 保证 cold/warm reset 后均不会命中旧内容。

## Task 1：先写失败测试

**文件：** `src/test/scala/memory/L2cache/L2CacheArraySpec.scala`，必要时增加一个
只检查 FPGA elaboration 的测试文件。

- [ ] 增加初始化测试：reset 释放后前 512 拍 I/D native `ready` 必须为 0，
  scrub 完成后的下一拍才允许请求。
- [ ] 增加 scrub 后首次 lookup miss 测试，证明不依赖 data/tag 初值。
- [ ] 增加 FPGA 结构测试，检查生成 RTL 引用模块名 `L2_meta_512x19`，并有八个实例。
- [ ] 在旧实现上运行上述测试并确认失败，记录失败原因。

## Task 2：实现 Metadata RAM

**文件：** `src/main/scala/memory/L2cache/L2CacheArray.scala`。

- [ ] 定义 19-bit metadata 编解码，格式固定 `{valid, dirty, tag[16:0]}`。
- [ ] 仿真路径使用八个 `SyncReadMem(512, UInt(19.W))` 加一级输出寄存器。
- [ ] FPGA 路径增加 `L2_meta_512x19` BlackBox，并按 way 实例化八次。
- [ ] 删除独立 `tagRams`、`validBits`、`dirtyBits`；所有 metadata 更新改为完整
  19-bit 原子写。
- [ ] 保持 data RAM、不区分 I/D 的查询通路及同 set 读写阻塞规则不变。
- [ ] 运行 Array 测试，确认连续请求仍在恰好两拍后依序返回。

## Task 3：实现 Reset Scrub

**文件：** `L2CacheArray.scala`、`L2Cache.scala`，若 Bundle 需要公开初始化状态则仅
增加一个语义清晰的状态信号。

- [ ] reset 释放后启动 9-bit set 计数与完成状态，每拍清除当前 set 的八路 metadata。
- [ ] 计数到 511 后结束 scrub，正常 metadata 写仲裁才开始工作。
- [ ] scrub 期间强制 I/D 所有 native request ready 为 0，且不接收 uncache/maintenance。
- [ ] 重跑初始化、首次 miss、同 set 冲突和两拍延迟测试。

## Task 4：回归与生成验证

- [ ] 运行全部 `L2CacheArraySpec` 与 `L2CacheSpec`。
- [ ] 运行全部 L2、ICache native、DCache native 聚焦测试。
- [ ] 运行 `sbt compile` 和 `sbt "runMain nscscc.CoreGen simu"`。
- [ ] 运行 CoreMark，要求 `Correct operation validated`，记录 ticks 与当前基线比较。
- [ ] 检查生成 RTL：仿真路径无未解析 BlackBox；FPGA 路径模块名固定为
  `L2_meta_512x19`，实例数为八。

## Task 5：用户配置 IP 后的 FPGA 验证

- [ ] 用户创建 `L2_meta_512x19` XCI：Native SDP、19x512、A写/B读、REGOUT=1、
  无 ECC/byte-enable，端口与 BlackBox 完全一致。
- [ ] 运行 FPGA elaboration、Vivado synthesis、implementation。
- [ ] 检查 metadata RAM 映射、BRAM/FF/LUT 用量及 100 MHz post-route timing。
- [ ] 完成全部测试后提交代码到本地分支；不推送远程。
