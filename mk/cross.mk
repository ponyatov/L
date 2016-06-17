
CFG_WITHCCLIBS = --with-gmp=$(TC) --with-mpfr=$(TC) --with-mpc=$(TC) \
	--with-isl=$(TC) --with-cloog=$(TC)

CFG_CCLIBS00 = --disable-shared
CFG_CCLIBS0  =  $(CFG_WITHCCLIBS) $(CFG_CCLIBS00)

CFG_GMP0 = $(CFG_CCLIBS0)
CFG_MPFR0 = $(CFG_CCLIBS0)
CFG_MPC0 = $(CFG_CCLIBS0)
CFG_ISL0   = --with-gmp-prefix=$(TC) $(CFG_CCLIBS00)
CFG_CLOOG0 = --with-gmp-prefix=$(TC) $(CFG_CCLIBS00)

CFG_BINUTILS0 = --target=$(TARGET) $(CFG_ARCH) $(CFG_CPU) \
	--with-sysroot=$(ROOT) --with-native-system-header-dir=/include \
	--enable-lto --disable-multilib $(CFG_WITHCCLIBS)

CFG_GCC0 = $(CFG_BINUTILS0) --disable-bootstrap \
	--disable-shared --disable-threads \
	--without-headers --with-newlib

CFG_GCC = $(CFG_BINUTILS0) $(CFG_WITHCCLIBS) --disable-bootstrap \
	--enable-shared --enable-threads --enable-libgomp

.PHONY: cross0
cross0: $(PACK)/cross0
$(PACK)/cross0:
	make cclibs0
	make binutils0
	make ramclean
	make gcc0
	make ramclean
	touch $@

.PHONY: cclibs0
cclibs0: $(PACK)/cclibs0
$(PACK)/cclibs0: gmp0 mpfr0 mpc0 cloog0 isl0
		touch $@

.PHONY: gmp0
gmp0: $(SRC)/$(GMP)/README $(PACK)/gmp0
$(PACK)/gmp0:
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) && cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(BCFG) $(CFG_GMP0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(GMP),gmp0,install-strip)

.PHONY: mpfr0
mpfr0: $(SRC)/$(MPFR)/README $(PACK)/mpfr0
$(PACK)/mpfr0:
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) && cd $(TMP)/$(MPFR) &&\
	$(SRC)/$(MPFR)/$(BCFG) $(CFG_MPFR0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(MPFR),mpfr0,install-strip)

.PHONY: mpc0
mpc0: $(SRC)/$(MPC)/README $(PACK)/mpc0
$(PACK)/mpc0:
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) && cd $(TMP)/$(MPC) &&\
	$(SRC)/$(MPC)/$(BCFG) $(CFG_MPC0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(MPC),mpc0,install-strip)
	
.PHONY: cloog0
cloog0: $(SRC)/$(CLOOG)/README $(PACK)/cloog0
$(PACK)/cloog0:
	rm -rf $(TMP)/$(CLOOG) && mkdir $(TMP)/$(CLOOG) && cd $(TMP)/$(CLOOG) &&\
	$(SRC)/$(CLOOG)/$(BCFG) $(CFG_CLOOG0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(CLOOG),cloog0,install-strip)
	
.PHONY: isl0
isl0: $(SRC)/$(ISL)/README $(PACK)/isl0
$(PACK)/isl0:
	rm -rf $(TMP)/$(ISL) && mkdir $(TMP)/$(ISL) && cd $(TMP)/$(ISL) &&\
	$(SRC)/$(ISL)/$(BCFG) $(CFG_ISL0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(ISL),isl0,install-strip)
	
.PHONY: binutils0
binutils0: $(PACK)/binutils0
$(PACK)/binutils0:
	make $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) $(CFG_BINUTILS0) && $(MAKE) &&\
	$(call INSTPACK,$(TMP)/$(BINUTILS),binutils0,install-strip)

.PHONY: gcc0
gcc0: $(PACK)/gcc0 
$(PACK)/gcc0: $(PACK)/gcc0-lib 
	touch $@
.PHONY: gcc0-cfg gcc0-bin gcc0-lib
gcc0-cfg: $(PACK)/gcc0-cfg
$(PACK)/gcc0-cfg: $(PACK)/cclibs0 $(PACK)/binutils0
	make $(SRC)/$(GCC)/README 
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) && cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0) --enable-languages="c" && touch $@
gcc0-bin: $(PACK)/gcc0-bin 
$(PACK)/gcc0-bin: $(PACK)/gcc0-cfg
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	$(call INSTPACK,$(TMP)/$(GCC),gcc0-bin,install-gcc)
gcc0-lib: $(PACK)/gcc0-lib	
$(PACK)/gcc0-lib: $(PACK)/gcc0-bin 
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgcc
	$(call INSTPACK,$(TMP)/$(GCC),gcc0-lib,install-target-libgcc)

.PHONY: gccpp
gccpp:
	make gcc0-bin gcc0-lib
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libstdc++-v3
	$(call INSTPACK,$(TMP)/$(GCC),$@-libstdc++,install-target-libstdc++-v3)

.PHONY: gcc
gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC) --enable-languages="c,c++"
	make gccpp
#	make gcclibsinst

.PHONY: gcclibsinst
gcclibsinst:
	cp -a $(TC)/$(TARGET)/lib/lib* $(LIB)/ && rm $(LIB)/libstdc++*.py

.PHONY: gccf
gccf: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC) --enable-languages="c,c++,fortran"
	make gccpp
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgfortran
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgfortran
#	make gcclibsinst
