# remote debugging tools

CFG_GDB = --enable-tui

# remote host/embedded
.PHONY: gdb0
gdb0: $(SRC)/$(GDB)/README

# standalone selfhosted
.PHONY: gdb
gdb: $(SRC)/$(GDB)/README
