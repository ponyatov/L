include app/$(APP).qemu

.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-append "vga=0x312" \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	-initrd $(BOOT)/$(HW)$(APP).rootfs

.PHONY: emuiso
emuiso: $(BOOT)/$(HW)$(APP).iso
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-boot d -cdrom $<
