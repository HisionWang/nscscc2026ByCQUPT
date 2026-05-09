# 指定使用 bash（source 需要 bash）
SHELL := /bin/bash

# 路径变量（强烈建议统一在这里管理）
ENV_SCRIPT   := ./../
SBT_DIR      := .
MAKE_DIR     := ../chiplab/sims/verilator/run_prog/

MILL     ?= ./mill
MODULE   := RamOn
BUILD_MILL := ./build.mill
BUILD_FILES := $(BUILD_MILL) $(MILL)

BUILD_DIR := ./build
RTL_DIR   := $(BUILD_DIR)/rtl

SCALA_FILES := $(shell find ./src/main/scala -name "*.scala")

# EMIT_TOPS := nscscc.core_top
EMIT_TOPS := nscscc.core_top
TOP_V     := $(RTL_DIR)/$(lastword $(subst ., ,$(EMIT_TOPS))).sv

FIRTOOL_OPTS := -disable-all-randomization -strip-debug-info

.DEFAULT_GOAL := verilog

verilog: $(TOP_V)
$(TOP_V): $(SCALA_FILES) $(BUILD_FILES)
	@mkdir -p $(RTL_DIR)
	@$(MILL) -i $(MODULE).runMain nscscc.Elaborate 	\
	$(addprefix --top ,$(EMIT_TOPS)) 				\
	$(addprefix --firtool-opt ,$(FIRTOOL_OPTS)) 	\
	--target-dir $(RTL_DIR) 						\
	--split-verilog

.PHONY: all run-sbt run-make clean verilog

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
