
CFG_BLAS = 
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -o $(LIB)/libblas.so *.f

CFG_LAPACK = 
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK)/SRC &&\
	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC \
		-o $(LIB)/liblapack.so \
		*.f ../INSTALL/?lamch.f ../INSTALL/lsame.f

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
