
.PHONY: fortran
fortran:
	make LANGS="c,c++,fortran" gcc
	
CFG_ECL =

.PHONY: ecl
ecl: $(SRC)/$(ECL)/README
	cd $(SRC)/$(ECL) && $(XPATH) ./$(BCFG) $(CFG_ECL) && $(MAKE)
	
CFG_OCTAVE = --prefix=$(ROOT)/octave --disable-docs F77=$(TARGET)-gfortran
#"$(TFORTRAN) -L$(ROOT)/lib" \
#	--with-libdir=$(ROOT)/lib FFLAGS="-ff2c"
#--enable-lite-kernel
# --disable-docs --help
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) FFLAGS="-ff2c" $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE)

CFG_MAXIMA =
.PHONY: maxima
maxima: $(SRC)/$(MAXIMA)/README
