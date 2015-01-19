
CFG_BINUTILS = --target=$(TARGET) $(CFG_ARCH) $(CFG_CPU) \
	--with-sysroot=$(ROOT) \
	--with-native-system-header-dir=/include \
	--enable-lto \
	--disable-docs

CFG_CCLIBS = --disable-shared \
	--with-gmp=$(TC) --with-mpfr=$(TC) --with-mpc=$(TC)
	
CFG_GMP = $(CFG_CCLIBS)
CFG_MPFR = $(CFG_CCLIBS)
CFG_MPC = $(CFG_CCLIBS)

CFG_GCC0 = $(CFG_BINUTILS) $(CFG_CCLIBS) \
	--disable-shared --disable-threads \
	--without-headers --with-newlib \
	--enable-languages="c"

CFG_GCC = $(CFG_BINUTILS) $(CFG_CCLIBS) \
	--enable-threads --enable-libgomp \
	--enable-languages="c,c++"

.PHONY: cross
cross: binutils cclibs gcc0

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) $(CFG_BINUTILS) &&\
	$(MAKE) && make install-strip

.PHONY: cclibs
cclibs: gmp mpfr mpc

.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(BCFG) $(CFG_GMP) &&\
	$(MAKE) && make install-strip

.PHONY: mpfr
mpfr: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) &&\
	cd $(TMP)/$(MPFR) &&\
	$(SRC)/$(MPFR)/$(BCFG) $(CFG_MPFR) &&\
	$(MAKE) && make install-strip

.PHONY: mpc
mpc: $(SRC)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) &&\
	cd $(TMP)/$(MPC) &&\
	$(SRC)/$(MPC)/$(BCFG) $(CFG_MPC) &&\
	$(MAKE) && make install-strip

.PHONY: gcc0
gcc0: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0)
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	cd $(TMP)/$(GCC) && $(MAKE) install-gcc
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgcc
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgcc

.PHONY: gcc
gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC)
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	cd $(TMP)/$(GCC) && $(MAKE) install-gcc
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgcc
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgcc
