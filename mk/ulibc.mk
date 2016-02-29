CFG_ULIBC = CROSS=$(TARGET)- ARCH=$(ARCH) PREFIX=$(ROOT)

.PHONY: ulibc
ulibc: $(SRC)/$(ULIBC)/README
	# 1
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) distclean
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) allnoconfig
	# 2
	cat ulibc/all >> $(SRC)/$(ULIBC)/.config
	cat arch/$(ARCH).ulibc >> $(SRC)/$(ULIBC)/.config
	cat cpu/$(CPU).ulibc >> $(SRC)/$(ULIBC)/.config
	cat app/$(APP).ulibc >> $(SRC)/$(ULIBC)/.config
	# 3
	echo "CROSS_COMPILER_PREFIX=\"$(TARGET)-\"" >> $(SRC)/$(ULIBC)/.config
	echo "KERNEL_HEADERS=\"$(ROOT)/include\"" >> $(SRC)/$(ULIBC)/.config
	# 4
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) menuconfig
	# 5
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC)
	# 6
	$(call INSTPACK,$(SRC)/$(ULIBC),$@,$(CFG_ULIBC) install)
	# 7
	$(call INSTPACK,$(SRC)/$(ULIBC),$@-utils,$(CFG_ULIBC) install_utils)
	# 8
	cd $(SRC)/$(ULIBC) && $(MAKE) $(CFG_ULIBC) hostutils
	cp $(SRC)/$(ULIBC)/utils/ldd.host      $(TC)/bin/$(TARGET)-ldd
#	echo $(TC)/bin/$(TARGET)-ldd > $(PACK)/$@-hostutils
	cp $(SRC)/$(ULIBC)/utils/ldconfig.host $(TC)/bin/$(TARGET)-ldconfig
#	echo $(TC)/bin/$(TARGET)-ldconfig >> $(PACK)/$@-hostutils
	cp $(SRC)/$(ULIBC)/utils/getconf.host  $(TC)/bin/$(TARGET)-getconf
#	echo $(TC)/bin/$(TARGET)-getconf >> $(PACK)/$@-hostutils
	touch $(PACK)/$@-hostutils
	# 9 (in root package)
	# ldconfig in root.mk
	touch $(PACK)/$@
	