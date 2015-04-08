
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

#CFG_LAPACK = \
#	FORTRAN="$(TFORTRAN)" LOADER="$(TFORTRAN)" \
#	OPTS="$(TOPT) -frecursive"

.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK)/SRC &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -frecursive -o $(LIB)/liblapack.so *.f

#	for ff in *.f; do \
#	$(XPATH) $(TFORTRAN) $(TOPT) -c $$ff; \
#	done
#	echo "$(LAPACK_FILES)"
#	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -c *.f
#lapack: $(SRC)/$(LAPACK)/make.inc
#	cd $(SRC)/$(LAPACK) &&\
#	$(XPATH) $(TFORTRAN) -shared -fPIC -g0 -O0 -o $(LIB)/liblapack.so SRC/*.f
##	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -frecursive -o $(LIB)/liblapack.so SRC/*.f
##	make clean &&\
##	$(XPATH) $(MAKE) $(CFG_LAPACK) lapack_install
#$(SRC)/$(LAPACK)/make.inc: 
#	make $(SRC)/$(LAPACK)/README
#	cd $(SRC)/$(LAPACK) && cp make.inc.example make.inc

#.PHONY: atlas
#atlas: $(SRC)/ATLAS/README
