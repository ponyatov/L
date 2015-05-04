CFG_GSL = CFLAGS="$(TOPT)"
.PHONY: gsl
gsl: $(SRC)/$(GSL)/README
	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
	cd $(TMP)/$(GSL) &&\
	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)

CFG_BLAS = FORTRAN="$(TFORTRAN)" OPTS="$(TOPT)" 
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -o $(LIB)/libblas.so *.f

.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK)/SRC &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -frecursive -o $(LIB)/liblapack.so *.f
