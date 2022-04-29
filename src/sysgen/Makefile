.PHONY: build clean


SYSGEN := sysgen.bat -nodesktop -nosplash -noFigureWindows -softwareopengl -r # for sysgen model
VIVADO := vivado -mode batch -source # for tcl file

CLEAN_FILES += *.log *.slxc sysgen_done.log

CLEAN_DIR += ./netlist
CLEAN_DIR += ./slprj
CLEAN_DIR += ./.Xil

HLS_DIR := ../hls

all: build

build : clean
	$(MAKE) -C $(HLS_DIR)
	$(SYSGEN) script_runme
	$(VIVADO) sysgen_wait.tcl

clean:
	$(MAKE) -C $(HLS_DIR) clean
	@rm -rf $(CLEAN_DIR) \
	@rm -f $(CLEAN_FILES)
