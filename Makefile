######################################################################
#
# DESCRIPTION: Verilator Example: Small Makefile
#
# Use Verilator open source.
# Compile the example code of hdlbits-exam.
#
######################################################################

######################################################################
# Set basic env
######################################################################

ifneq ($(words $(CURDIR)),1)
 $(error Unsupported: GNU Make cannot build in directories containing spaces, build elsewhere: '$(CURDIR)')
endif
FDIR = $(abspath $(dir $(MAKEFILE_LIST)))

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

######################################################################
# simulation TARGET
# Enter based on CURDIR
######################################################################
TARGET ?= $(FDIR)/.default_sim
TARGET_ABS := $(abspath $(TARGET))
CHECK_T = top.sv sim_main.cpp

.PHONY: default check clean

default: clean check
	@echo "-- FULL-TARGET_ABS = $(TARGET_ABS)"
	@echo "-- TARGET_ABS = $(notdir $(TARGET_ABS))"
	@echo "-- VERILATE & BUILD --------"
	cd $(FDIR)/build/$(notdir $(TARGET_ABS)); \
	$(VERILATOR) -cc --exe --build -j +incdir+$(TARGET_ABS) $(TARGET_ABS)/top.sv $(TARGET_ABS)/sim_main.cpp
	@echo "-- RUN ---------------------"
	@echo "-- RUN ---------------------"
	@echo "-- RUN ---------------------"
	@echo "-- RUN ---------------------"
	cd $(FDIR)/build/$(notdir $(TARGET_ABS)); \
	obj_dir/Vtop 2>&1 | tee sim.log
	@echo "-- DONE --------------------"



check:
	@if [ -d $(FDIR)/build/$(notdir $(TARGET_ABS)) ]; then \
		rm -rf $(FDIR)/build/$(notdir $(TARGET_ABS)); \
	fi
	@for each in $(CHECK_T); do \
		echo "$${each}"; \
		if [ ! -e $(TARGET_ABS)/$${each} ];then \
			echo "-- File not exist --";	\
			echo "-- TARGET_ABS = $(TARGET_ABS)/$${each} --"; \
			exit 1; \
		fi; \
		done
	@if [ ! -d $(FDIR)/build/$(notdir $(TARGET_ABS)) ];then \
		mkdir -p $(FDIR)/build/$(notdir $(TARGET_ABS)); \
		fi

clean:
	rm -rf $(FDIR)/build