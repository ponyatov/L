BINHOST_CFG = --target=$(TARGET) \
	--prefix=$(ROOT)/binhost --disable-werror --disable-debug
#$(CFG_ARCH) $(CFG_CPU) \

.PHONY: binhost
binhost: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(XPATH) $(SRC)/$(BINUTILS)/$(XCFG) $(BINHOST_CFG) &&\
	$(XPATH) $(MAKE) &&\
	$(XPATH) make install-strip
