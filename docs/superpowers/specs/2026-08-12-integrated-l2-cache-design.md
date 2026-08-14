# L1-L2-AXI3 集成设计

## 范围

`ICache/DCache -> native -> L2Cache -> L2Bridge -> DDR AXI3`。
保持 CPU 到 L1、MMU、LSQ、IFU 接口不变；保留现有 ICache invalidate 和
DCache fence/CACOP 路径。L2 V1 不解释 CACOP。顶层不再例化
`AXI3Crossbar2to1`，但保留源文件。

## 固定参数

- 统一 non-inclusive/non-exclusive L2，256 KiB。
- 64 B line、8 ways、512 sets；每个 data RAM 的 512 个地址全部使用。
- SDP BRAM、REGOUT=1、总查询延迟 2 拍。
- I/D 合计一个查询端口，理想命中 aggregate II=1。
- I-LRB 1、D-LRB 1、D-STB 2、预留 I-STB 1、MSHR/LFB 4、EB 1。
- L2Bridge 同时最多一个 DDR AXI3 事务。
- invalid-first 加 8-way Tree-PLRU。

## Bundle 接口

`L2NativeMasterIO`按事务打包成 `read.req/read.resp/write.req/write.done`。
读请求含 `id,addr,size,uncache`；读响应含
`id,data[511:0],fullLine,last`。`fullLine=1`一次传完整 64 B 且
`last=1`；否则只有低 32 位有效，逐 beat 握手。

写请求含 `id,addr,kind,size,data[511:0],strb[3:0]`。`putLine`在 STB
接收后完成所有权转移；`uncache`等待 DDR B 后返回 `write.done`；
`cleanLine`供 DCache fence 使用，也等待 DDR B，以保持原 fence 时序。
`strb`仅 uncache 使用，不新增 L1 可见 error。

`L2CacheIO`分别打包 `icache,dcache,maintenance,axi`。maintenance 在
V1 中保持未就绪、无完成，不改变现有 CACOP 行为。

## 查询、缺失与反压

S0 仲裁并发起 BRAM 读，S1 为 BRAM 内部拍，S2 比较 Tag。source、id、
address 随 token 延迟。返回槽无容量时不接受查询；固定两拍流水采用冻结
或 skid 槽避免覆盖，I/D 公平仲裁。

请求先 CAM 检查 STB/MSHR/EB。活动同 block miss 暂不合并，新请求反压
后重试；同 set 最多一个 MSHR，不同 set 最多四个 miss。

DDR R beat 在 Bridge 握手时写入所属 LFB 和 16 位 beat-valid；LFB 再经
LRB 向 L1 发送。L1 反压不阻塞 DDR 填充。整行收齐后才安装 Array；
安装及原响应完成后释放 MSHR。L2 hit 直接返回 512-bit fullLine。

Array 写某 set 前阻止该 set 新查询，并排空在途同 set token；不同 set
查询继续。单写口固定仲裁，LFB 安装优先 D-STB，并提供防饥饿。

## STB、EB与Bridge

D-STB 保存 L1 已交付但未安装的牺牲行并参与同 block 转发；I-STB 仅预留。
脏 victim 完整复制到 EB 后才能覆盖 Array，EB 等待 AXI B 后释放。脏替换
先写回 EB，再进行对应 DDR refill。

L2Bridge 只负责内部命令到 AXI3：line 为 64 B 对齐、16 个 32-bit beat、
LEN=15、SIZE=2、INCR；uncache 为 LEN=0。VALID/payload 在 READY 前稳定，
计数器仅在握手时推进；AW/W 独立握手，B 后写完成，RLAST 后读完成。
Uncache 不分配 L2，V1 排空 cacheable 事务后串行访问 DDR。

## L1与顶层

ICache 保留命中/MMU/CPU 流水。fullLine 或逐 beat 都进入同一 512-bit
refill buffer，最后只写一次现有 ICacheArray。redirect 后，已握手请求继续
排空，但不写 Array、不返回 CPU。

DCache 保留命中流水和 Array，仅替换 MSHR、牺牲、uncache、fence 的 AXI
后端。普通牺牲由 STB 接收即完成；uncache/fence 等待 write.done。
vaddr 保留但不参与 L2。接口不依赖当前全局 store 阻塞，方便未来弹性流水。

Frontend/MemoryBlock 只透传 native Bundle；core_top 例化 L2，其 AXI 端口
原位连接现有 DDR 顶层引脚。

## 验收

依次验证 Bundle、Replacer、Array 两拍、Bridge、独立 L2、I/D 接入和顶层；
