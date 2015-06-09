
QEMU_ALL =  -m 64M -net nic -net user -localtime -append "$(QEMU_APPEND)"
QEMU_SERIAL_LOG = -serial file:ttyS0.log -append "console=ttyS0,115200"

QEMU_CFG = $(QEMU_ALL) $(QEMU_HW) $(QEMU_ARCH) $(QEMU_CPU) $(QEMU_APP)

.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	-initrd $(BOOT)/$(HW)$(APP).rootfs

.PHONY: emucluster
emucluster: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	make emu &
	make emu &
#	make emu &
#	make emu &

.PHONY: emuk
emuk: $(BOOT)/$(HW)$(APP).kernel
	qemu-system-$(ARCH) $(QEMU_CFG) $(QEMU_ALL) \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	$(QEMU_SERIAL_LOG)

.PHONY: emuiso
emuiso: $(BOOT)/$(HW)$(APP).iso
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-boot d -cdrom $<

.PHONY: bochs
bochs: $(BOOT)/$(HW)$(APP).iso
	bochs -f syslinux/bochs.rc
