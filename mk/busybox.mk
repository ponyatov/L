CFG_BUSYBOX = \
	CONFIG_PREFIX=$(ROOT) \
	CROSS_COMPILE=$(TARGET)- \
	SYSROOT=$(ROOT)
	
.PHONY: busybox
busybox: $(SRC)/$(BUSYBOX)/README
	# 1
	cd $(SRC)/$(BUSYBOX) && $(MAKE) $(CFG_BUSYBOX) distclean 
	cd $(SRC)/$(BUSYBOX) && $(MAKE) $(CFG_BUSYBOX) allnoconfig
	# 2
	cp app/$(APP).bb $(SRC)/$(BUSYBOX)/.config
	cd $(SRC)/$(BUSYBOX) && $(MAKE) $(CFG_BUSYBOX) menuconfig 
	cp $(SRC)/$(BUSYBOX)/.config app/$(APP).bb
	# 3
	$(call INSTPACK,$(SRC)/$(BUSYBOX),$@,$(CFG_BUSYBOX) install)
