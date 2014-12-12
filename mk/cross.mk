CFG_BINUTILS = --target=$(TARGET) $(CFG_CPU) \
	--program-prefix=$(CPU)- --with-sysroot=$(ROOT) \
	--with-native-system-header-dir=/include \
	--enable-lto --disable-multilib

CFG_GMP =


.PHONY: tc
tc: binutils cclibs gcc

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) && cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) $(CFG_BINUTILS) && $(MAKE) && $(MAKE) install-strip &&\
	rm -rf $(TMP)/$(BINUTILS)

.PHONY: cclibs
cclibs: gmp mpfr mpc

.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) && cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(BCFG) $(CFG_GMP) && $(MAKE) && $(MAKE) install-strip &&\
	rm -rf $(TMP)/$(GMP)
