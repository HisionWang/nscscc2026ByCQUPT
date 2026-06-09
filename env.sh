SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"
export PROJECT_ROOT=$(dirname $(realpath ${SCRIPT_PATH}))

export CHIPLAB_HOME=$PROJECT_ROOT/chiplab

# 临时添加到PATH
export PATH=$CHIPLAB_HOME/toolchains/loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0/bin:$PATH
# 给工具链目录中的所有可执行文件添加执行权限
chmod -R +x $CHIPLAB_HOME/toolchains/loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0/bin/
# chmod -R +x "$CHIPLAB_HOME/toolchains/loongson-gnu-toolchain-8.3-x86_64-loongarch32r-linux-gnusf-v2.0/libexec/gcc/loongarch32r-linux-gnusf/8.3.0/" 2>/dev/null
# 测试是否找到
which loongarch32r-linux-gnusf-gcc