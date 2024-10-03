# SPDX-License-Identifier: BSD-3-Clause
#
# Makefile
#

TOP ?= $(shell git rev-parse --show-toplevel)

BASE_DIR                   := $(abspath $(TOP))
BLACKPARROT_DIR            := $(BASE_DIR)/black-parrot
BLACKPARROT_SUBSYSTEMS_DIR := $(BASE_DIR)/black-parrot-subsystems
BLACKPARROT_SDK_DIR        := $(BASE_DIR)/black-parrot-sdk
BLACKPARROT_TOOLS_DIR      := $(BASE_DIR)/black-parrot-tools
BLACKPARROT_FPGA_DIR       := $(BASE_DIR)/fpga
DMA_IP_DRIVERS_DIR         := $(BASE_DIR)/dma_ip_drivers

checkout:
	cd $(BASE_DIR); git submodule update --init
	make -C $(BLACKPARROT_DIR) checkout
	make -C $(BLACKPARROT_SDK_DIR) checkout

# TODO: add VCU128 platform in SDK, use PLATFORM= switch on sdk/prog builds
setup: MAKE_CORES ?= 32
setup:
	make -C $(BLACKPARROT_DIR) -j $(MAKE_CORES) libs
	make -C $(BLACKPARROT_TOOLS_DIR) -j $(MAKE_CORES) tools_lite
	make -C $(BLACKPARROT_SDK_DIR) -j $(MAKE_CORES) sdk
	make -C $(BLACKPARROT_SDK_DIR) -j $(MAKE_CORES) prog

bleach_all:
	cd $(BASE_DIR); git clean -fdx; git submodule deinit -f .

