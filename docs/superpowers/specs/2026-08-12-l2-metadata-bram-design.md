# L2 Metadata BRAM 迁移设计

## 目标与范围

把 L2 每路分离的 `tag SyncReadMem`、`validBits` 和 `dirtyBits` 合并为一个
`512 x 19 bit` metadata RAM，格式固定为 `{valid, dirty, tag[16:0]}`。八路各
实例化一个 metadata RAM；data RAM、L1 接口与现有 CACOP 行为保持不变。

该改造删除 8192 个 valid/dirty 状态寄存器及其动态索引网络，使 tag、valid、
dirty 原子读写，并保持 L2 Array 对外总读延迟为两拍。

## RAM 实现

- 仿真：每路 `SyncReadMem(512, UInt(19.W))`，之后增加一级输出寄存器。
- FPGA：BlackBox 模块名固定为 `L2_meta_512x19`，同一模块定义实例化八次。
- FPGA IP：Native、SDP、A 口写、B 口读、宽 19、深 512、无 byte-enable、无
  ECC；只启用 B 口 primitive output register，使总读延迟为两拍。
- metadata 编码：bit 18 为 valid，bit 17 为 dirty，bit 16:0 为 tag。
- metadata 写入始终写完整 19 bit；安装、脏位置位、失效均读取或构造完整新值
  后原子写回，不保留独立 valid/dirty 镜像。

读请求在第 N 拍接收，第 N+1 拍取得同步 RAM 输出，第 N+2 拍由输出寄存器
返回。metadata 与 `L2_bram_512x512` data 同拍有效。现有同 set 读写阻塞规则
继续生效，避免依赖 SDP 同址读写模式。

## 复位初始化

BRAM 复位不能清空存储内容，因此 L2 在 reset 释放后进入 scrub 状态：计数器
从 set 0 到 set 511，每拍同时向八路 metadata RAM 写入全零。共 512 拍完成；
期间 ICache、DCache 的所有 native 请求 `ready=0`，L2 不接受 cacheable、
uncache 或维护事务。完成后进入正常工作状态。data RAM 无需初始化，因为
`valid=0` 保证旧数据不会命中；正确性不依赖 COE。

## 不变项与验收

- 256 KiB、8-way、512 sets、64 B line 参数不变。
- LRB、STB、MSHR/LFB、EB、L2Bridge 及替换策略不变。
- L1 refill、uncache、fence 及现有 I/D CACOP 处理逻辑不变。
- 定向测试必须证明：reset 后连续 512 拍所有 native ready 为 0，第 513 拍才
  可接收请求；随后首次访问不能命中未初始化 metadata。
- FPGA 生成结果必须出现八个 `L2_meta_512x19` 实例，且仿真和 FPGA 两条实现
  都保持 Array 总读延迟恰好两拍。

