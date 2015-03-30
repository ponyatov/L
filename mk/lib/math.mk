
CFG_PCRE = CFLAGS="$(TOPT)"
.PHONY: pcre
pcre: $(SRC)/$(PCRE)/README
	rm -rf $(TMP)/$(PCRE) && mkdir $(TMP)/$(PCRE) &&\
	cd $(TMP)/$(PCRE) &&\
	$(XPATH) $(SRC)/$(PCRE)/$(TCFG) $(CFG_PCRE) &&\
	$(MAKE) && $(INSTALL)
	mv -f $(ROOT)/bin/pcre-config $(TC)/bin/

CFG_BLAS = FORTRAN="$(TFORTRAN)" OPTS="$(TOPT)" 
# BLASLIB=$(ROOT)/lib/libblas.a
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -o $(LIB)/libblas.so *.f
#	make clean && $(XPATH) $(MAKE) $(CFG_BLAS)

CFG_LAPACK =
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README

.PHONY: atlas
atlas: $(SRC)/ATLAS/README
