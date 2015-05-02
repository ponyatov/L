
CFG_BINUTILS0 = --target=$(TARGET) $(CFG_ARCH) $(CFG_CPU) \
	--with-sysroot=$(ROOT) \
	--with-native-system-header-dir=/include \
	--enable-lto \
	CFLAGS="$(BOPT)" CXXFLAGS="$(BOPT)"
#	CFLAGS_FOR_BUILD="-g0 -Ofast -march=native -mtune=native"

CFG_WITHCCLIBS = --with-gmp=$(TC) --with-mpfr=$(TC) --with-mpc=$(TC) \
	--with-isl=$(TC)  

CFG_CCLIBS0 =  $(CFG_WITHCCLIBS) --disable-shared CFLAGS="$(BOPT)"
	
CFG_GMP0 = $(CFG_CCLIBS0)
CFG_MPFR0 = $(CFG_CCLIBS0)
CFG_MPC0 = $(CFG_CCLIBS0)
CFG_ISL0 = --with-gmp-prefix=$(TC) --disable-shared CFLAGS="$(BOPT)"

CFG_GCC0 = $(CFG_BINUTILS0) $(CFG_WITHCCLIBS) --disable-bootstrap \
	--disable-shared --disable-threads \
	--without-headers --with-newlib

CFG_GCC = $(CFG_BINUTILS0) $(CFG_WITHCCLIBS) --disable-bootstrap \
	--enable-shared --enable-threads --enable-libgomp \
	--enable-libstdcxx-time \
	--enable-libstdcxx-threads \
	--enable-libstdcxx-pch

.PHONY: cross0
cross0: binutils0 cclibs0 ramclean gcc0 ramclean

.PHONY: binutils0
binutils0: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) $(CFG_BINUTILS0) &&\
	$(MAKE) && $(INSTALL)-strip

.PHONY: cclibs0
cclibs0: gmp0 mpfr0 mpc0

.PHONY: gmp0
gmp0: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(SRC)/$(GMP)/$(BCFG) $(CFG_GMP0) &&\
	$(MAKE) && $(INSTALL)-strip

.PHONY: mpfr0
mpfr0: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) &&\
	cd $(TMP)/$(MPFR) &&\
	$(SRC)/$(MPFR)/$(BCFG) $(CFG_MPFR0) &&\
	$(MAKE) && $(INSTALL)-strip

.PHONY: mpc0
mpc0: $(SRC)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) &&\
	cd $(TMP)/$(MPC) &&\
	$(SRC)/$(MPC)/$(BCFG) $(CFG_MPC0) &&\
	$(MAKE) && $(INSTALL)-strip
	
.PHONY: isl0
isl0: $(SRC)/$(ISL)/README
	rm -rf $(TMP)/$(ISL) && mkdir $(TMP)/$(ISL) &&\
	cd $(TMP)/$(ISL) &&\
	$(SRC)/$(ISL)/$(BCFG) $(CFG_ISL0) &&\
	$(MAKE) && $(INSTALL)-strip
	
.PHONY: cloog0
cloog0: $(SRC)/$(CLOOG)/README
	
.PHONY: gcc0
gcc0: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC0) --enable-languages="c"
	exit -1
	make gccall

.PHONY: gccall
gccall:
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	cd $(TMP)/$(GCC) && $(MAKE) install-gcc
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgcc
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgcc

,PHONY: gccpp
gccpp:
	make gccall
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libstdc++-v3
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libstdc++-v3
	cp -a $(TC)/$(TARGET)/lib/libgcc_s* $(LIB)/

.PHONY: gcc
gcc: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC) --enable-languages="c,c++"
	make gccpp

.PHONY: gccf
gccf: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_GCC) --enable-languages="c,c++,fortran"
	make gccpp
	cd $(TMP)/$(GCC) && $(MAKE) all-target-libgfortran
	cd $(TMP)/$(GCC) && $(MAKE) install-target-libgfortran
