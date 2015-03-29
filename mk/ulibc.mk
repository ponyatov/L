CFG_ULIBC = CROSS=$(TARGET)- ARCH=$(ARCH) PREFIX=$(ROOT)

.PHONY: ulibc
ulibc: $(SRC)/$(ULIBC)/README
	# 1
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) distclean
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) allnoconfig
	# 2
	cat ulibc/all >> $(SRC)/$(ULIBC)/.config
	cat ulibc/arch/$(ARCH) >> $(SRC)/$(ULIBC)/.config
	cat ulibc/cpu/$(CPU) >> $(SRC)/$(ULIBC)/.config
	cat ulibc/app/$(APP) >> $(SRC)/$(ULIBC)/.config
	# 3
	echo "CROSS_COMPILER_PREFIX=\"$(TARGET)-\"" >> $(SRC)/$(ULIBC)/.config
	echo "KERNEL_HEADERS=\"$(ROOT)/include\"" >> $(SRC)/$(ULIBC)/.config
	echo "UCLIBC_EXTRA_CFLAGS=\"$(TOPT)\"" >> $(SRC)/$(ULIBC)/.config
	# 4
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) menuconfig
	# 5
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC)
	# 6
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) install
	# 7
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) install_utils
	# 8
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) hostutils
	cp $(SRC)/$(ULIBC)/utils/ldd.host      $(TC)/bin/$(TARGET)-ldd
	cp $(SRC)/$(ULIBC)/utils/ldconfig.host $(TC)/bin/$(TARGET)-ldconfig
	cp $(SRC)/$(ULIBC)/utils/getconf.host  $(TC)/bin/$(TARGET)-getconf
	# 9 (in root package)
	# ldconfig in root.mk
