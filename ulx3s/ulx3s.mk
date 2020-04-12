PIN_DEF ?= ulx3s_v20.lpf

FPGA_SIZE ?= 85

DEVICE ?= $(FPGA_SIZE)k

ifeq ($(FPGA_SIZE), 12)
        CHIP_ID=0x21111043
        FPGA_KS = 25k
endif
ifeq ($(FPGA_SIZE), 25)
        CHIP_ID=0x41111043
endif
ifeq ($(FPGA_SIZE), 45)
        CHIP_ID=0x41112043
endif
ifeq ($(FPGA_SIZE), 85)
        CHIP_ID=0x41113043
endif

IDCODE = $(CHIP_ID)

BUILDDIR = bin

compile: $(BUILDDIR)/toplevel.bit

prog: $(BUILDDIR)/toplevel.bit
	ujprog $^

$(BUILDDIR)/toplevel.json: $(VERILOG)
	mkdir -p $(BUILDDIR)
	yosys -p "synth_ecp5 -json $@" $^

$(BUILDDIR)/%.config: $(PIN_DEF) $(BUILDDIR)/toplevel.json
	 nextpnr-ecp5 --${DEVICE} --package CABGA381 --freq 25 --textcfg  $@ --json $(filter-out $<,$^) --lpf $< 

$(BUILDDIR)/toplevel.bit: $(BUILDDIR)/toplevel.config
	ecppack --compress --idcode ${IDCODE} $^ $@

clean:
	rm -rf ${BUILDDIR}

.SECONDARY:
.PHONY: compile clean prog
