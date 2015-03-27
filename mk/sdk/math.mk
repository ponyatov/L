
.PHONY: fortran
fortran:
	make LANGS="c,c++,fortran" gcc
	
CFG_ECL =

.PHONY: ecl
ecl: $(SRC)/$(ECL)/README
	cd $(SRC)/$(ECL) && $(XPATH) ./$(BCFG) $(CFG_ECL) && $(MAKE)
	
CFG_PCRE = 
.PHONY: pcre
pcre: $(SRC)/$(PCRE)/README
	rm -rf $(TMP)/$(PCRE) && mkdir $(TMP)/$(PCRE) &&\
	cd $(TMP)/$(PCRE) &&\
	$(XPATH) $(SRC)/$(PCRE)/$(TCFG) $(CFG_PCRE) &&\
	$(MAKE) && $(INSTALL)
		
CFG_OCTAVE = --prefix=$(ROOT)/octave --disable-docs 
#--enable-lite-kernel
# --disable-docs --help
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE)

CFG_MAXIMA =
.PHONY: maxima
maxima: $(SRC)/$(MAXIMA)/README
