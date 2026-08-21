.PHONY: all run-sbt run-make clean verilog clean_mill ss sim
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

s:
	sbt "runMain nscscc.CoreGen simu"


# 路径变量（强烈建议统一在这里管理）
ENV_SCRIPT   := ..
SBT_DIR      := .
MAKE_DIR     := chiplab/sims/verilator/run_prog/
CONFIGURE_SH := ./configure.sh

define SELECT_SOFTWARE_CMD
	program_paths=( \
		"func/func_lab3" \
		"func/func_lab9" \
		"func/func_lab14" \
		"func/func_lab15" \
		"func/func_lab19" \
		"func/func_advance" \
		"fireye/A0" \
		"fireye/B2" \
		"fireye/C0" \
		"fireye/D1" \
		"fireye/I2" \
		"my_program" \
		"memset" \
		"dhrystone" \
		"coremark" \
		"linux" \
		"rtthread" \
		"c_prg/memcmp" \
		"c_prg/inner_product" \
		"c_prg/lookup_table" \
		"c_prg/loop_induction" \
		"c_prg/minmax_sequence" \
		"c_prg/product_sequence" \
	); \
	program_labels=( \
		"func/func_lab3" \
		"func/func_lab9" \
		"func/func_lab14" \
		"func/func_lab15" \
		"func/func_lab19" \
		"func/func_advance" \
		"fireye/A0" \
		"fireye/B2  Pass1" \
		"fireye/C0  Pass1" \
		"fireye/D1  Pass1" \
		"fireye/I2  Pass1" \
		"my_program" \
		"memset" \
		"dhrystone" \
		"coremark" \
		"linux" \
		"rtthread" \
		"c_prg/memcmp" \
		"c_prg/inner_product" \
		"c_prg/lookup_table" \
		"c_prg/loop_induction" \
		"c_prg/minmax_sequence" \
		"c_prg/product_sequence" \
	); \
	echo "Select simulation program:"; \
	for i in "$${!program_paths[@]}"; do \
		printf "  %2d) %s\n" "$$((i + 1))" "$${program_labels[i]}"; \
	done; \
	while true; do \
		read -r -p "Enter program number [1-$${#program_paths[@]}]: " choice; \
		if [[ "$$choice" =~ ^[0-9]+$$ ]] && (( choice >= 1 && choice <= $${#program_paths[@]} )); then \
			selected_program="$${program_paths[choice-1]}"; \
			echo "Using program: $$selected_program"; \
			$(CONFIGURE_SH) --run "$$selected_program"; \
			break; \
		fi; \
		echo "Invalid selection: $$choice"; \
	done
endef

sim:
	cd $(ENV_SCRIPT) && \
	source env.sh && \
	cd $(MAKE_DIR) && \
	$(SELECT_SOFTWARE_CMD) && \
	$(MAKE)
ss:
	sbt "runMain nscscc.CoreGen simu" &&\
	cd $(ENV_SCRIPT) && \
	source env.sh && \
	cd $(MAKE_DIR) && \
	$(SELECT_SOFTWARE_CMD) && \
	$(MAKE)

ff: $(TOP_V)
$(TOP_V): $(SCALA_FILES) $(BUILD_FILES)
	sbt "runMain nscscc.CoreGen fpga"

func:
	cd $(ENV_SCRIPT) && \
	cd $(MAKE_DIR) && ./configure.sh --run func/func_lab9

perf0:
	cd $(ENV_SCRIPT) && \
	cd $(MAKE_DIR) && ./configure.sh --run coremark

perf1:
	cd $(ENV_SCRIPT) && \
	cd $(MAKE_DIR) && ./configure.sh --run dhrystone

clean:
	cd $(SBT_DIR) && sbt clean
	cd ../$(MAKE_DIR) && $(MAKE) clean

clean_mill:
	rm -rf $(BUILD_DIR) out
