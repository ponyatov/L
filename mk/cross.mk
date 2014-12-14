CFG_BINUTILS = --target=$(TARGET) $(CFG_CPU) \
	--program-prefix=$(CPU)- --with-sysroot=$(ROOT) \
	--with-native-system-header-dir=/include \
	--enable-lto --disable-multilib

CFG_CCLIBS = --disable-shared \
	--with-gmp=$(TC) --with-mpfr=$(TC) --with-mpc=$(TC) 

CFG_GMP = $(CFG_CCLIBS)
CFG_MPFR = $(CFG_CCLIBS)
CFG_MPC = $(CFG_CCLIBS)

.PHONY: tc
tc: binutils cclibs gcc

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
