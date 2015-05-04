CFG_OCTAVE =--prefix=$(ROOT)/octave --disable-docs 
# F77="$(TFORTRAN)"
##"$(TFORTRAN) -L$(ROOT)/lib" \
##	--with-libdir=$(ROOT)/lib FFLAGS="-ff2c"
##--enable-lite-kernel --disable-docs --help 
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE)
