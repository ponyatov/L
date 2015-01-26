CFG_KERNEL = ARCH=$(ARCH) INSTALL_HDR_PATH=$(ROOT)
	
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
	echo "CONFIG_CROSS_COMPILE=\"$(TARGET)-\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_DEFAULT_HOSTNAME=\"$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config	
	# 4
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) menuconfig
	# 5
	cd $(SRC)/$(KERNEL) && $(MAKE) $(CFG_KERNEL)
	# 6
	make kernel-$(ARCH)-fix
	cp $(SRC)/$(KERNEL)/arch/$(ARCH)/boot/zImage $(BOOT)/$(HW)$(APP).kernel
	# 7
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) headers_install
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp $(SRC)/$(KERNEL)/arch/x86/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/x86/boot/zImage

.PHONY: kernel-arm-fix
kernel-arm-fix:
