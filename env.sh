SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"
export PROJECT_ROOT=$(dirname $(realpath ${SCRIPT_PATH}))

export CHIPLAB_HOME=$PROJECT_ROOT/chiplab

# RISC-V 交叉工具链（rv32i/rv32im）
RISCV_TOOLCHAIN=$CHIPLAB_HOME/toolchains/riscv-toolchain/bin

if [ -d "$RISCV_TOOLCHAIN" ]; then
  export PATH=$RISCV_TOOLCHAIN:$PATH
  chmod -R +x "$RISCV_TOOLCHAIN" 2>/dev/null
  which riscv32-unknown-elf-gcc || which riscv64-unknown-elf-gcc
else
  echo "[env.sh] 未找到 RISC-V 工具链目录: $RISCV_TOOLCHAIN"
  echo "[env.sh] 请将 rv32im 工具链安装到该目录后重新 source env.sh"
fi
