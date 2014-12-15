CFG_KERNEL = \
	ARCH=$(ARCH) \
	INSTALL_HDR_PATH=$(ROOT)
	
.PHONY: core
core: kernel ulibc bb

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
	echo "CONFIG_CROSS_COMPILE=\"$(CPU)-\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_DEFAULT_HOSTNAME=\"$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config	
	# 4
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) menuconfig
	# 5
	cd $(SRC)/$(KERNEL) && $(XPATH) $(MAKE) $(CFG_KERNEL)
	# 6
	make kernel-$(ARCH)-fix
	cp $(SRC)/$(KERNEL)/arch/x86/boot/zImage $(BOOT)/$(HW)$(APP).kernel
	# 7
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp $(SRC)/$(KERNEL)/arch/x86/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/x86/boot/zImage
	
.PHONY: ulibc
ulibc: $(SRC)/$(ULIBC)/README

.PHONY: bb
bb: $(SRC)/$(BB)/README
