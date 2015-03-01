include app/$(APP).qemu

.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(ARCH) -localtime $(QEMU_CFG) \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	-initrd $(BOOT)/$(HW)$(APP).rootfs
