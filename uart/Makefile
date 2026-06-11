TOP      = uart
TB       = tb_uart
SOURCES  = uart_tx.v uart_rx.v $(TOP).v $(TB).v
SIMFILE  = $(TB).vvp
WAVFILE  = $(TB).vcd
LINT_LOG = verilator_lint.log

.PHONY: all sim lint view clean

all: sim

sim: $(SIMFILE)
	vvp $(SIMFILE)

$(SIMFILE): $(SOURCES)
	iverilog -g2012 -Wall -o $@ $^

lint:
	verilator --lint-only -Wall -Wno-WIDTHTRUNC uart_tx.v uart_rx.v uart.v 2>&1 | tee $(LINT_LOG)

lint-tb:
	verilator --timing --lint-only -Wall $(SOURCES) 2>&1 | tee $(LINT_LOG)

view:
	gtkwave $(WAVFILE)

clean:
	rm -f $(SIMFILE) $(WAVFILE) $(LINT_LOG)
	rm -rf obj_dir
