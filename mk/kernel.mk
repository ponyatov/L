KERNEL_ARCH ?= $(ARCH)
CFG_KERNEL = ARCH=$(KERNEL_ARCH) \
	INSTALL_HDR_PATH=$(ROOT) INSTALL_MOD_PATH=$(ROOT) $(HW_KERNEL)

.PHONY: kernel
kernel: kernel-$(VENDOR)
	touch $(PACK)/$@

.PHONY: kernel-rpi
$(SRC)/linux/README:
	cd $(SRC) && git clone --depth 1 git://github.com/raspberrypi/linux.git
	touch $@
kernel-rpi: $(SRC)/linux/README
	# 1
	cd $(SRC)/linux && make $(CFG_KERNEL) distclean
	cd $(SRC)/linux && make $(CFG_KERNEL) allnoconfig
	# cat hw/$(HW|ARCH|CPU).kcfg >> $(SRC)/linux/.config
	cd $(SRC)/linux && make $(CFG_KERNEL) $(DEFCONFIG)
	# 2
	cat kernel/all >> $(SRC)/linux/.config
	cat hw/$(HW).kcfg >> $(SRC)/linux/.config
	cat app/$(APP).kcfg >> $(SRC)/linux/.config
	# 3
	make KERNEL=linux kernel-all
	touch $(PACK)/$@

# make VENDOR=generic DEFCONFIG=bcm2835_defconfig kernel

.PHONY: kernel-generic
kernel-generic: $(SRC)/$(KERNEL)/README
	# 1
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) distclean
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) allnoconfig
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) $(DEFCONFIG)
	# 2
	cat kernel/all >> $(SRC)/$(KERNEL)/.config
	cat arch/$(ARCH).kcfg >> $(SRC)/$(KERNEL)/.config
	cat cpu/$(CPU).kcfg >> $(SRC)/$(KERNEL)/.config
	cat hw/$(HW).kcfg >> $(SRC)/$(KERNEL)/.config
	cat app/$(APP).kcfg >> $(SRC)/$(KERNEL)/.config
	# 3
	make kernel-all
	touch $(PACK)/$@
	
.PHONY: kernel-all
kernel-all:
	# 4
	echo "CONFIG_CROSS_COMPILE=\"$(TARGET)-\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_DEFAULT_HOSTNAME=\"$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config	
	# 5
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) menuconfig
	# 6
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL)
	-$(call INSTPACK,$(SRC)/$(KERNEL),kernel-modules,$(CFG_KERNEL) modules_install)
	# 7
	make kernel-$(ARCH)-fix
	cp \
		$(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/zImage \
		$(BOOT)/$(HW)$(APP).kernel
	echo $(BOOT)/$(HW)$(APP).kernel > $(PACK)/kernel-image
	# 8
	$(call INSTPACK,$(SRC)/$(KERNEL),kernel-headers,$(CFG_KERNEL) headers_install)
	# pack
	touch $(PACK)/$@
	
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
#	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL) uImage
#	cp $(SRC)/$(KERNEL)/arch/$(KERNEL_ARCH)/boot/uImage \
#		$(BOOT)/$(HW)$(APP).kernel.uimg
