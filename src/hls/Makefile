.PHONY: build clean clean-all
all: build

# invoke vivado hls
HLS := vivado_hls -f

PROJECTS = absdiff cdf hist pdist

# SCRIPTS = $(foreach prj, $(PROJECTS), $(prj)/script.tcl)

CLEAN_FILES += *.log
CLEAN_DIR += ./solution1


build : clean
	@for PRJ in $(PROJECTS); do \
		echo -e -n "Building \e[33m $${PRJ} \e[0mlibrary \e[33m[$(shell pwd)/$${PRJ}] ... \e[0m"; \
		$(HLS) $${PRJ}/script.tcl; \
		echo -e "\e[92mOK\e[0m"; \
	done

clean : 
	$(MAKE) -C absdiff clean
	$(MAKE) -C cdf clean
	$(MAKE) -C hist clean
	$(MAKE) -C pdist clean
	@rm -f  $(CLEAN_FILES)

clean-all : 
	@for PRJ in $(PROJECTS); do \
		$(MAKE) -C $${PRJ} clean ; \
	done

# @echo -e -n "Building \e[33m $${PRJ} \e[0m IP $(shell pwd)\e[33m$${PRJ} ...\e[0m \e[3emOK\e[0m" \