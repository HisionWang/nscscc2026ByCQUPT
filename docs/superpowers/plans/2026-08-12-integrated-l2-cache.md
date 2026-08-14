# Integrated L2 Cache Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace direct I/D AXI with native L1 ports, a unified 256 KiB L2, and one AXI3 DDR engine.

**Architecture:** Keep L1 hit pipelines intact and replace their memory engines. The finite-nonblocking L2 owns four MSHR/LFB pairs, grouped buffers, one EB, and a separate single-transaction AXI3 bridge.

**Tech Stack:** Scala 2.13, Chisel 3.6.1, chiseltest 0.6.2, sbt, Verilator, AXI3.

## Global Constraints

- Work only in the original server repository on `local/L2-cache-v1`; no worktree and no deletion of untracked Vivado output.
- L2 is 256 KiB, 8-way, 512-set, fixed 64-byte lines.
- SDP RAM is 512x512 per way, REGOUT=1, exactly two-cycle lookup.
- Aggregate lookup II=1; I/D LRB one each; D-STB two; reserved I-STB one; MSHR/LFB four; EB one.
- Preserve existing ICache invalidate and DCache fence/CACOP semantics; L2 maintenance stays inactive.
- Use straightforward Chisel, light Chinese comments, no unnecessary RTL assertions.
- Group interfaces by semantic Bundle; keep L2Bridge independent of cache policy.
- Do not change existing L1 BRAM IP names.

---

### Task 1: Parameters, Bundles, Replacer

**Files:** modify `config/Core.scala`; create `memory/L2cache/L2CacheBundles.scala`, `L2Replacer.scala`, and `src/test/scala/memory/L2cache/L2ReplacerSpec.scala`.

- [ ] Write invalid-first and all-touch-path PLRU tests; run and confirm RED.
- [ ] Add independent `l2*` parameters and grouped passive Bundles.
- [ ] Implement 8-way invalid-first Tree-PLRU; run focused test and `sbt compile`; commit.

### Task 2: Two-Cycle Array

**Files:** create `L2CacheArray.scala` and `L2CacheArraySpec.scala`.

- [ ] Test consecutive reads and require responses exactly two clocks later; confirm RED.
- [ ] Implement eight data ways, aligned metadata, resettable valid/dirty, and FPGA BlackBox `L2_bram_512x512`.
- [ ] Run focused test and compile; commit.

### Task 3: AXI3 Bridge

**Files:** create `L2Bridge.scala` and `L2BridgeSpec.scala`.

- [ ] Test delayed channel ready, 16-beat line transfers, response backpressure, uncache fields, and B-gated completion; confirm RED.
- [ ] Implement stable commands and simple read/write FSMs with independent AXI handshakes.
- [ ] Run focused tests and compile; commit.

### Task 4: Unified L2 Controller

**Files:** create `L2Cache.scala` and `L2CacheSpec.scala`.

- [ ] Test I/D fairness, hit response backpressure, four different-set misses, same-set rejection, LFB, STB, EB, and uncache; confirm RED.
- [ ] Implement lookup credits, LRBs, MSHR/LFBs, STBs, EB and deterministic arbitration.
- [ ] Run all L2 tests and compile; commit.

### Task 5: L1 Native Integration

**Files:** modify `ICacheMainPipe.scala`, `Icache.scala`, `Frontend.scala`, `DCacheMSHR.scala`, `DCache.scala`, and `MemoryBlock.scala`.

- [ ] Add harness tests for ICache fullLine/beat and DCache fullLine/beat/uncache; confirm RED.
- [ ] Replace ICache AXI states while preserving redirect drain and invalidate.
- [ ] Replace DCache MSHR/fence AXI states while preserving fence and uncache completion.
- [ ] Run tests and compile; commit ICache and DCache separately.

### Task 6: Top Integration and CPU Verification

**Files:** modify `myCPU_top.scala`, `Frontend.scala`, and `MemoryBlock.scala`.

- [ ] Replace Crossbar with L2 and preserve external AXI pins.
- [ ] Run `sbt "runMain nscscc.CoreGen simu"` and resolve elaboration errors.
