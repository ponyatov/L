KERNEL_ARCH ?= $(ARCH)
CFG_KERNEL = ARCH=$(KERNEL_ARCH) \
	INSTALL_HDR_PATH=$(ROOT) INSTALL_MOD_PATH=$(ROOT)
	
.PHONY: kernel-rpi
kernel-rpi:
#	# 0
#	cd $(SRC) && git clone --depth 1 git://github.com/raspberrypi/linux.git
#	exit -1
	# 1 bcmrpi_defconfig -> /kernel/hw/rpiB
	cd $(SRC)/linux && make $(CFG_KERNEL) distclean
	cd $(SRC)/linux && make $(CFG_KERNEL) allnoconfig
	# 2
#	cat kernel/all >> $(SRC)/linux/.config
	cat arch/$(ARCH).kcfg >> $(SRC)/linux/.config
#	cat cpu/$(CPU).kcfg >> $(SRC)/linux/.config
	cat hw/$(HW).kcfg >> $(SRC)/linux/.config
	cat app/$(APP).kcfg >> $(SRC)/linux/.config
	# 3
	make KERNEL=linux kernel-all

.PHONY: kernel
kernel: $(SRC)/$(KERNEL)/README
	# 1
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) distclean
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) allnoconfig
	# 2
	cat kernel/all >> $(SRC)/$(KERNEL)/.config
	cat arch/$(ARCH).kcfg >> $(SRC)/$(KERNEL)/.config
	cat cpu/$(CPU).kcfg >> $(SRC)/$(KERNEL)/.config
	cat hw/$(HW).kcfg >> $(SRC)/$(KERNEL)/.config
	cat app/$(APP).kcfg >> $(SRC)/$(KERNEL)/.config
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
	cp \
		$(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/zImage \
		$(BOOT)/$(HW)$(APP).kernel
	# 7
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) headers_install
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp \
		$(SRC)/$(KERNEL)/arch/$(ARCH)/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/$(ARCH)/boot/zImage

.PHONY: kernel-armel-fix
kernel-armel-fix:
	make kernel-arm-fix
.PHONY: kernel-armhf-fix
kernel-armhf-fix:
	make kernel-arm-fix
.PHONY: kernel-arm-fix
kernel-arm-fix:
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL) uImage
	cp $(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/uImage \
		$(BOOT)/$(HW)$(APP).kernel.uimg
