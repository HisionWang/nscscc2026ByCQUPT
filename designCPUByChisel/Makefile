.PHONY: all run-sbt run-make clean verilog clean_mill
.DEFAULT_GOAL := ss

SHELL := /bin/bash

MILL     ?= ./mill
MODULE   := RamOn
CORE_TOP := nscscc.CoreSimu
BUILD_MILL := ./build.mill
BUILD_FILES := $(BUILD_MILL) $(MILL)

BUILD_DIR := ./build
RTL_DIR   := ../chiplab/IP/myCPU/FPGA

SCALA_FILES := $(shell find ./src/main/scala -name "*.scala")

TOP_V     := $(RTL_DIR)/core_top.v

# verilog: $(TOP_V)
# $(TOP_V): $(SCALA_FILES) $(BUILD_FILES)
# 	@mkdir -p $(RTL_DIR)
# 	@$(MILL) -i $(MODULE).runMain $(CORE_TOP)

# 路径变量（强烈建议统一在这里管理）
ENV_SCRIPT   := ..
SBT_DIR      := .
MAKE_DIR     := chiplab/sims/verilator/run_prog/

sbt:
	cd $(SBT_DIR) && \
	sbt run

sim:
	cd $(ENV_SCRIPT) && \
	source env.sh && \
	cd $(MAKE_DIR) && $(MAKE) 
ss:
	sbt "runMain nscscc.CoreGen simu" &&\
	cd $(ENV_SCRIPT) && \
	source env.sh && \
	cd $(MAKE_DIR) && $(MAKE) 

ff: $(TOP_V)
$(TOP_V): $(SCALA_FILES) $(BUILD_FILES)
	sbt "runMain nscscc.CoreGen fpga"

clean:
	cd $(SBT_DIR) && sbt clean
	cd ../$(MAKE_DIR) && $(MAKE) clean

clean_mill:
	rm -rf $(BUILD_DIR) out
