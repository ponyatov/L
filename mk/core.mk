CFG_KERNEL = ARCH=$(ARCH) INSTALL_HDR_PATH=$(ROOT)
	
CFG_ULIBC = CROSS=$(CPU)- ARCH=$(ARCH) PREFIX=$(ROOT)
#	UCLIBC_EXTRA_CFLAGS=""	

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
	cd $(SRC)/$(KERNEL) && make $(CFG_KERNEL) headers_install
	
.PHONY: kernel-i386-fix
kernel-i386-fix:
	cp $(SRC)/$(KERNEL)/arch/x86/boot/bzImage \
		$(SRC)/$(KERNEL)/arch/x86/boot/zImage
	
.PHONY: ulibc
ulibc: $(SRC)/$(ULIBC)/README
	# 1
	cd $(SRC)/$(ULIBC) && $(XPATH) make $(CFG_ULIBC) distclean
	cd $(SRC)/$(ULIBC) && $(XPATH) make $(CFG_ULIBC) allnoconfig
	# 2
	cat ulibc/all >> $(SRC)/$(ULIBC)/.config
	cat ulibc/arch/$(ARCH) >> $(SRC)/$(ULIBC)/.config
	cat ulibc/cpu/$(CPU) >> $(SRC)/$(ULIBC)/.config
	cat ulibc/hw/$(HW) >> $(SRC)/$(ULIBC)/.config
	cat ulibc/app/$(APP) >> $(SRC)/$(ULIBC)/.config
	# 3
	echo "KERNEL_HEADERS=\"$(ROOT)/include\"" >> $(SRC)/$(ULIBC)/.config
	echo "CROSS_COMPILER_PREFIX=\"$(CPU)-\"" >> $(SRC)/$(ULIBC)/.config
	# 4
	cd $(SRC)/$(ULIBC) && make $(CFG_ULIBC) menuconfig
	# 5
	cd $(SRC)/$(ULIBC) && $(XPATH) $(MAKE) $(CFG_ULIBC)
	# 6
	cd $(SRC)/$(ULIBC) && $(XPATH) $(MAKE) $(CFG_ULIBC) install

#	$(MAKE) $(CFG_LIBC) install_utils && \
#	$(MAKE) $(CFG_LIBC) hostutils
#	cp $(SRC)/$(LIBC)/utils/ldd.host      $(TC)/bin/$(HW)-ldd
#	cp $(SRC)/$(LIBC)/utils/ldconfig.host $(TC)/bin/$(HW)-ldconfig
#	cp $(SRC)/$(LIBC)/utils/getconf.host  $(TC)/bin/$(HW)-getconf

.PHONY: bb
bb: $(SRC)/$(BB)/README
