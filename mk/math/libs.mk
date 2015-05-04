
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

CFG_LAPLAP = \
	FORTRAN="$(TFORTRAN)" LOADER="$(TFORTRAN)" \
	OPTS="$(TOPT) -frecursive" \
	NOOPT="$(TOPT) -frecursive" \
	LOADOPTS="$(TOPT) -frecursive" 
.PHONY: laplap
laplap: $(SRC)/$(LAPACK)/README
	cp -f $(SRC)/$(LAPACK)/INSTALL/make.inc.gfortran $(SRC)/$(LAPACK)/make.inc  
	cd $(SRC)/$(LAPACK) && make clean
	cd $(SRC)/$(LAPACK) && $(XPATH) make $(CFG_LAPLAP)

CFG_GSL = CFLAGS="$(TOPT)"
.PHONY: gsl
gsl: $(SRC)/$(GSL)/README
	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
	cd $(TMP)/$(GSL) &&\
	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)
