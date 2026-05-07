# 指定使用 bash（source 需要 bash）
SHELL := /bin/bash

# 路径变量（强烈建议统一在这里管理）
ENV_SCRIPT   := ./../
SBT_DIR      := .
MAKE_DIR     := ../chiplab/sims/verilator/run_prog/

.PHONY: all run-sbt run-make clean

# 默认目标
all: sbt sim

sbt:
	cd $(SBT_DIR) && \
	sbt run

sim:
	cd $(ENV_SCRIPT) && \
	source env.sh && \
	@echo "==> Running make in $(MAKE_DIR)"
	cd $(MAKE_DIR) && $(MAKE)

clean:
	cd $(SBT_DIR) && sbt clean
	cd $(MAKE_DIR) && $(MAKE) clean