# Task 1 report: parameters, grouped bundles and replacer

## Scope

- Added independent L2 parameters in `Core.scala`.
- Added grouped L1-native, controller-Bridge, maintenance and Array bundles.
- Added invalid-first, per-set 8-way Tree-PLRU replacement.
- Added elaboration/connection and behavior tests.

## TDD evidence

- Effective RED: `L2ReplacerSpec` failed with five `not found: type L2Replacer` errors before implementation.
- GREEN: `sbt 'testOnly nscscc.mem.L2cache.L2BundleConnectionSpec nscscc.mem.L2cache.L2ReplacerSpec' compile` exited successfully on 2026-08-12.
- Result: 4 tests passed, 0 failed; main-source compile also completed successfully.
- Enhanced replacement tests exercise invalid-first, all eight hand-derived PLRU victims and set isolation.

## Review and fixes

- Review found that a generic L1 ID must not be reused as a fixed-width Bridge ID.
- Bridge identity is now `L2BridgeOwner(source, slot)`: it names only an internal L2 owner slot. Cached L1 IDs remain in MSHRs; uncache/fence IDs remain in their own request slots.
- Added `l2BeatIdxBits` and a Bundle passthrough elaboration test using a 3-bit Native ID value of 7.
- Re-review: code quality approved; `git diff --check` clean.

## Self-review

- No existing L1 parameters or CACOP path were changed.
- Native interfaces are grouped by read/write transaction semantics and use ready/valid handshakes.
- `fullLine` has a real 512-bit payload; write strobe remains 4 bits.
