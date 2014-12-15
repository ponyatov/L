.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel
	qemu-system-$(ARCH) $(QEMU_CFG) -kernel $<
