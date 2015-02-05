# canadian cross

CFG_CANADIAN = 
#--libdir=$(ROOT)/lib --bindir=$(ROOT)/bin

.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(XPATH) $(SRC)/$(BINUTILS)/$(TCFG) $(CFG_CANADIAN) $(P) $(T) &&\
	$(MAKE) && $(XPATH) make install-strip

.PHONY: binhost
binhost:
	make canadian \
		P="--prefix=$(USR)" \
		T="--target=$(TARGET) $(CFG_ARCH) $(CFG_CPU)"

#BINHOST_CFG = --target=$(TARGET) $(CFG_ARCH) $(CFG_CPU) \
#	--prefix=$(USR) --disable-werror
#
#.PHONY: binhost
#binhost: $(SRC)/$(BINUTILS)/README
#	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
#	cd $(TMP)/$(BINUTILS) &&\
#	$(XPATH) $(SRC)/$(BINUTILS)/$(XCFG) $(BINHOST_CFG) &&\
#	$(XPATH) $(MAKE) &&\
#	$(XPATH) make install-strip
