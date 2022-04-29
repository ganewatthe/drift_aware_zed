####################################################################################
####################################################################################
## Copyright 2011(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################
####################################################################################

include quiet.mk

help:
	@echo ""
	@echo "Please specify a target."
	@echo ""
	@echo "To make all projects:"
	@echo "    make all"
	@echo ""
	@echo "To build a specific project:"
	@echo "    make proj.board"
	@echo "e.g.,"
	@echo "    make adv7511.zed"


PROJECTS := $(filter-out $(NO_PROJ), $(notdir $(wildcard projects/*)))
SUBPROJECTS := $(foreach projname,$(PROJECTS), \
	$(foreach archname,$(notdir $(subst /Makefile,,$(wildcard projects/$(projname)/*/Makefile))), \
		$(projname).$(archname)))

.PHONY: lib all clean clean-all $(SUBPROJECTS) build-driftawarezed

$(SUBPROJECTS):
	$(MAKE) -C projects/$(subst .,/,$@)

lib:
	$(MAKE) -C library/ all


all:
	$(MAKE) -C projects/ all


clean:
	$(MAKE) -C projects/ clean
	$(MAKE) -C src/sysgen clean # drift aware library clean


clean-all:clean
	$(MAKE) -C projects/ clean
	$(MAKE) -C library/ clean
	$(MAKE) -C src/sysgen clean # drift aware library clean

####################################################################################
####################################################################################

# Edited by Chanaka Ganewattha
# Added support for driftaware system build

build-driftawarezed:
	$(MAKE) -C src/sysgen # system generator IP build
	$(MAKE) -C projects/fmcomms2/zed # zed build
