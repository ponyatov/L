CFG_KERNEL = \
	ARCH=$(ARCH) \
	INSTALL_HDR_PATH=$(ROOT)
	
.PHONY: core
core: kernel libc bb

.PHONY: kernel
kernel: $(SRC)/$(KERNEL)/README

	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) distclean
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) allnoconfig

	cat kernel/all >> $(SRC)/$(KERNEL)/.config
	cat kernel/arch/$(ARCH) >> $(SRC)/$(KERNEL)/.config
	cat kernel/cpu/$(CPU) >> $(SRC)/$(KERNEL)/.config
	cat kernel/hw/$(HW) >> $(SRC)/$(KERNEL)/.config
	cat kernel/app/$(APP) >> $(SRC)/$(KERNEL)/.config
	
	echo "CONFIG_CROSS_COMPILE=\"$(CPU)-\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_LOCALVERSION=\"-$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config
	echo "CONFIG_DEFAULT_HOSTNAME=\"$(HW)$(APP)\"" >> $(SRC)/$(KERNEL)/.config	

	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) menuconfig
	cd $(SRC)/$(KERNEL) && $(XPATH) $(MAKE) $(CFG_KERNEL)
	
	make kernel-$(ARCH)-fix
	cp $(SRC)/$(KERNEL)/arch/x86/boot/zImage $(BOOT)/$(HW)$(APP).kernel
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp $(SRC)/$(KERNEL)/arch/x86/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/x86/boot/zImage
	
.PHONY: ulibc
ulibc: $(SRC)/$(ULIBC)/README

.PHONY: bb
bb: $(SRC)/$(BB)/README
