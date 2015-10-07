
QEMU_APPEND += ntpsrv=pool.ntp.org
QEMU_TAP ?= tap0
QEMU_NET = -net nic -net tap,ifname=$(QEMU_TAP),script=no,downscript=no
QEMU_NET = -net nic -net user
QEMU_SOUND = -soundhw es1370
QEMU_ALL =  -m 64M $(QEMU_NET) $(QEMU_SOUND)
# -localtime
QEMU_SERIAL_LOG = -serial file:ttyS0.log -append "console=ttyS0,115200"

QEMU_CFG = $(QEMU_ALL) $(QEMU_HW) $(QEMU_ARCH) $(QEMU_CPU) $(QEMU_APP)

.PHONY: emu
emu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(KERNEL_ARCH) $(QEMU_CFG) \
	-kernel $(BOOT)/$(HW)$(APP).kernel \
	-append "$(QEMU_APPEND)" \
	-initrd $(BOOT)/$(HW)$(APP).rootfs
	
.PHONY: pxemu
pxemu: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	qemu-system-$(ARCH) $(QEMU_CFG) -boot n

.PHONY: emucluster
emucluster: $(BOOT)/$(HW)$(APP).kernel $(BOOT)/$(HW)$(APP).rootfs
	make pxemu QEMU_TAP=tap0
	make pxemu QEMU_TAP=tap1
#	make pxemu QEMU_TAP=tap2 &
#	make pxemu QEMU_TAP=tap3 &
#	make pxemu QEMU_TAP=tap4 &

.PHONY: emuk
emuk: $(BOOT)/$(HW)$(APP).kernel
	qemu-system-$(ARCH) $(QEMU_CFG) $(QEMU_ALL) \
	-kernel $(BOOT)/$(HW)$(APP).kernel -append "$(QEMU_APPEND)" \
	$(QEMU_SERIAL_LOG)

.PHONY: emuiso
emuiso: $(BOOT)/$(HW)$(APP).iso
	qemu-system-$(ARCH) $(QEMU_CFG) \
	-boot d -cdrom $<

.PHONY: bochs
bochs: $(BOOT)/$(HW)$(APP).iso
	bochs -f syslinux/bochs.rc
