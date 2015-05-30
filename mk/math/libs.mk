
CFG_LABLA = \
	FORTRAN="$(TFORTRAN)" OPTS="$(TOPT)" \
	LOADER="$(TFORTRAN)" \
	ARCH=$(TARGET)-ar ARCHFLAGS=cr \
	RANLIB=$(TARGET)-ranlib

CFG_BLAS = $(CFG_LABLA) BLASLIB=$(LIB)/libblas.a
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) && touch make.inc &&\
	$(MAKE) clean && $(MAKE) $(CFG_BLAS)
#	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC -o $(LIB)/libblas.so *.f
#		-z muldefs -Wl,-soname,libblas.so

CFG_LAPACK = $(CFG_LABLA) LAPACKLIB=$(LIB)/liblapack.a \
	OPTS="$(TOPT) -frecursive" NOOPT="-g0 -O0 -frecursive" \
	TIMER=INT_ETIME
# TMGLIB=libtmg.a
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	git checkout src/$(LAPACK)/Makefile src/$(LAPACK)/SRC/Makefile
	cd $(SRC)/$(LAPACK) && touch make.inc &&\
	$(MAKE) clean && $(MAKE) $(CFG_LAPACK) azlin
#	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC -o $(LIB)/liblapack.so \
#		*.f ../INSTALL/?lamch.f ../INSTALL/lsame.f

#CFG_GSL = CFLAGS="$(TOPT)"
#.PHONY: gsl
#gsl: $(SRC)/$(GSL)/README
#	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
#	cd $(TMP)/$(GSL) &&\
#	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
#	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)
