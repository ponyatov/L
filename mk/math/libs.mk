
CFG_LABLA = FORTRAN="$(TFORTRAN)" LOADER="$(TFORTRAN)" \
	ARCH=$(TARGET)-ar RANLIB=$(TARGET)-ranlib

CFG_BLAS = $(CFG_LABLA) OPTS="$(TOPT)" BLASLIB=$(LIB)/libblas.a
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) && touch make.inc &&\
	$(MAKE) $(CFG_BLAS) clean &&\
	$(MAKE) $(CFG_BLAS)
#	$(XPATH) $(TFORTRAN) -shared -fPIC \
#		-z muldefs -shared -Wl,-soname,libblas.so \
#		$(LIB)/libblas.so *.o   

CFG_LAPACK = $(CFG_LABLA) OPTS="$(TOPT) -frecursive"
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK) && touch make.inc &&\
	$(MAKE) $(CFG_LAPACK) clean &&\
	$(MAKE) $(CFG_LAPACK)

#	cd $(SRC)/$(LAPACK)/SRC &&\
#	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC \
#		-o $(LIB)/liblapack.so \
#		*.f ../INSTALL/?lamch.f ../INSTALL/lsame.f

#	OPTS="$(TOPT) -frecursive" NOOPT="$(TOPT) -frecursive"
CFG_LAPLAP = \
	FORTRAN="$(TFORTRAN)" LOADER="$(TFORTRAN)" \
	ARCH="$(TARGET)-ar" RANLIB="$(TARGET)-ranlib" \
	OPTS="-O0 -g0" NOOPT="-O0 -g0"
.PHONY: laplap
laplap: $(SRC)/$(LAPACK)/README $(SRC)/$(LAPACK)/make.inc
	cd $(SRC)/$(LAPACK) && make clean
	cd $(SRC)/$(LAPACK) && $(XPATH) $(MAKE) $(CFG_LAPLAP) blaslib
	cd $(SRC)/$(LAPACK) && $(XPATH) $(MAKE) $(CFG_LAPLAP) lapacklib
	mv $(SRC)/$(LAPACK)/librefblas.a $(LIB)/
	mv $(SRC)/$(LAPACK)/liblapack.a $(LIB)/
$(SRC)/$(LAPACK)/make.inc: $(SRC)/$(LAPACK)/INSTALL/make.inc.gfortran
	cp -f $< $@ 

CFG_GSL = CFLAGS="$(TOPT)"
.PHONY: gsl
gsl: $(SRC)/$(GSL)/README
	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
	cd $(TMP)/$(GSL) &&\
	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)
