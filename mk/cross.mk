
CFG_WITHCCLIBS = --with-gmp=$(TC) --with-mpfr=$(TC) --with-mpc=$(TC) \
	--with-isl=$(TC) --with-cloog=$(TC)

CFG_CCLIBS00	= --disable-shared
CFG_CCLIBS0		=  $(CFG_WITHCCLIBS) $(CFG_CCLIBS00)

CFG_GMP0	= $(CFG_CCLIBS0)
CFG_MPFR0	= $(CFG_CCLIBS0)
CFG_MPC0	= $(CFG_CCLIBS0)
CFG_ISL0	= --with-gmp-prefix=$(TC) $(CFG_CCLIBS00)
CFG_CLOOG0	= --with-gmp-prefix=$(TC) $(CFG_CCLIBS00)

CFG_BINUTILS0 = --target=$(TARGET) $(CFG_ARCH) $(CFG_CPU) \
	--with-sysroot=$(ROOT) --with-native-system-header-dir=/include \
	--enable-lto --disable-multilib $(CFG_WITHCCLIBS)

CFG_GCC0 = $(CFG_BINUTILS0) --disable-bootstrap \
	--disable-shared --disable-threads --without-headers --with-newlib

CFG_GCC = $(CFG_BINUTILS0) $(CFG_WITHCCLIBS) --disable-bootstrap \
	--enable-shared --enable-threads --enable-libgomp

.PHONY: cross0
cross0:
	make cclibs0
	make binutils0
	make ramclean
	make gcc0
	make ramclean

.PHONY: cclibs0
cclibs0: gmp0 mpfr0 mpc0 cloog0 isl0

.PHONY: gmp0
gmp0: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) && cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(BCFG) $(CFG_GMP0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip 

.PHONY: mpfr0
mpfr0: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) && cd $(TMP)/$(MPFR) &&\
	$(SRC)/$(MPFR)/$(BCFG) $(CFG_MPFR0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip

.PHONY: mpc0
mpc0: $(SRC)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) && cd $(TMP)/$(MPC) &&\
	$(SRC)/$(MPC)/$(BCFG) $(CFG_MPC0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip
	
.PHONY: cloog0
cloog0: $(SRC)/$(CLOOG)/README
	rm -rf $(TMP)/$(CLOOG) && mkdir $(TMP)/$(CLOOG) && cd $(TMP)/$(CLOOG) &&\
	$(SRC)/$(CLOOG)/$(BCFG) $(CFG_CLOOG0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip
	
.PHONY: isl0
isl0: $(SRC)/$(ISL)/README
	rm -rf $(TMP)/$(ISL) && mkdir $(TMP)/$(ISL) && cd $(TMP)/$(ISL) &&\
	$(SRC)/$(ISL)/$(BCFG) $(CFG_ISL0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip
	
.PHONY: binutils0
binutils0: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) && cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) $(CFG_BINUTILS0) && $(MAKE) -j$(CPU_CORES) && $(MAKE) install-strip

.PHONY: gcc0 gcc
gcc0: gcc0-cfg gcc-bin gcc-lib
gcc: gcc-cfg gcc-bin gcc-lib gcc-cpp gcc-inst
gccf: gccf-cfg gcc-bin gcc-lib gcc-cpp gcc-fortran gcc-inst

gcc0-cfg: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) && cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0) --enable-languages="c"
gcc-cfg: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) && cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0) --enable-languages="c,c++"
gccf-cfg: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) && cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0) --enable-languages="c,c++,fortran"

gcc-bin:
	cd $(TMP)/$(GCC) && $(MAKE) -j$(CPU_CORES) all-gcc &&\
	$(MAKE) install-gcc
gcc-lib:
	cd $(TMP)/$(GCC) && $(MAKE) -j$(CPU_CORES) all-target-libgcc &&\
	$(MAKE) install-target-libgcc
gcc-cpp:	
	cd $(TMP)/$(GCC) && $(MAKE) -j$(CPU_CORES) all-target-libstdc++-v3 &&\
	$(MAKE) install-target-libstdc++-v3
gcc-fortran:
	cd $(TMP)/$(GCC) && $(MAKE) -j$(CPU_CORES) all-target-libgfortran &&\
	$(MAKE) install-target-libgfortran
gcc-inst:
	cp -a $(TC)/$(TARGET)/lib/lib* $(LIB)/ && rm $(LIB)/libstdc++*.py
