CFG_PCRE = 
.PHONY: pcre
pcre: $(SRC)/$(PCRE)/README
	rm -rf $(TMP)/$(PCRE) && mkdir $(TMP)/$(PCRE) &&\
	cd $(TMP)/$(PCRE) &&\
	$(XPATH) $(SRC)/$(PCRE)/$(TCFG) $(CFG_PCRE) &&\
	$(MAKE) && $(INSTALL)
	mv -f $(ROOT)/bin/pcre-config $(TC)/bin/

CFG_BLAS = FORTRAN="$(TFORTRAN)" BLASLIB=$(ROOT)/lib/libblas.a
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	make clean && $(XPATH) $(MAKE) $(CFG_BLAS)
#	$(XPATH) $(TARGET)-gfortran -shared -g0 -O2 *.f -o $(ROOT)/lib/libblas.so -fPIC
