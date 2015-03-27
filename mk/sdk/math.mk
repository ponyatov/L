
CFG_FORTRAN = $(CFG_BINUTILS0) $(CFG_CCLIBS0) \
	--enable-languages="fortran" --prefix=$(TC)/fortran
#--enable-threads --enable-libgomp	
.PHONY: fortran
fortran: $(SRC)/$(GCC)/README
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(SRC)/$(GCC)/$(BCFG) $(CFG_FORTRAN)
	cd $(TMP)/$(GCC) && $(MAKE) all-gcc
	cd $(TMP)/$(GCC) && $(MAKE) install-gcc
#	cd $(TMP)/$(GCC) && $(MAKE)
	
CFG_ECL =

.PHONY: ecl
ecl: $(SRC)/$(ECL)/README
	cd $(SRC)/$(ECL) && $(XPATH) ./$(BCFG) $(CFG_ECL) && $(MAKE)
	
CFG_OCTAVE = --prefix=$(ROOT)/octave --enable-lite-kernel --with-f2c
# --disable-docs --help
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE)

CFG_MAXIMA =
.PHONY: maxima
maxima: $(SRC)/$(MAXIMA)/README
