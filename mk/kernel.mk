KERNEL_ARCH ?= $(ARCH)
CFG_KERNEL = ARCH=$(KERNEL_ARCH) \
	INSTALL_HDR_PATH=$(ROOT) INSTALL_MOD_PATH=$(ROOT)
	
.PHONY: kernel-rpi
kernel-rpi:
#	# 0
#	cd $(SRC) && git clone --depth 1 git://github.com/raspberrypi/linux.git
	# 1
	cd $(SRC)/linux && make $(CFG_KERNEL) distclean
	cd $(SRC)/linux && make $(CFG_KERNEL) bcmrpi_defconfig
	# 3
	make KERNEL=linux kernel-all

.PHONY: kernel
kernel: $(SRC)/$(KERNEL)/README
	# 1
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) distclean
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) allnoconfig
	# 2
	cat kernel/all >> $(SRC)/$(KERNEL)/.config
	cat kernel/arch/$(ARCH) >> $(SRC)/$(KERNEL)/.config
	cat kernel/cpu/$(CPU) >> $(SRC)/$(KERNEL)/.config
	cat kernel/hw/$(HW) >> $(SRC)/$(KERNEL)/.config
	cat kernel/app/$(APP) >> $(SRC)/$(KERNEL)/.config
	# 3
	make kernel-all 
	
.PHONY: kernel-all
kernel-all:	
	# 3
	echo "CONFIG_CROSS_COMPILE=\"$(TARGET)-\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_DEFAULT_HOSTNAME=\"$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config	
	# 4
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) menuconfig
	# 5
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL)
	-cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL) modules_install
	# 6
	make kernel-$(ARCH)-fix
	cp $(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/zImage $(BOOT)/$(HW)$(APP).kernel
	# 7
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) headers_install
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp \
		$(SRC)/$(KERNEL)/arch/$(ARCH)/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/$(ARCH)/boot/zImage

.PHONY: kernel-armel-fix
kernel-armel-fix:
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL) uImage
	cp $(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/uImage \
		$(BOOT)/$(HW)$(APP).kernel.uimg
.PHONY: kernel-armhf-fix
kernel-armhf-fix:
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL) uImage
	cp $(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/uImage \
		$(BOOT)/$(HW)$(APP).kernel.uimg
