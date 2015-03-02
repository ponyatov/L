include app/$(APP).qemu

.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	-initrd $(BOOT)/$(HW)$(APP).rootfs

.PHONY: emuk
emuk: $(BOOT)/$(HW)$(APP).kernel
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-kernel $(BOOT)/$(HW)$(APP).kernel

.PHONY: emuiso
emuiso: $(BOOT)/$(HW)$(APP).iso
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-boot d -cdrom $<

.PHONY: bochs
bochs: $(BOOT)/$(HW)$(APP).iso
	bochs -f syslinux/bochs.rc
