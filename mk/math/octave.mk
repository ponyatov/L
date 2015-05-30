CFG_OCTAVE = --prefix=$(ROOT)/octave \
	--with-blas="-lblas" --with-lapack="-llapack" \
	--disable-docs --disable-readline --disable-java \
	CFLAGS="$(TOPT)" CXXFLAGS="$(TOPT)" FFLAGS="$(TOPT)" \
	gl_cv_func_gettimeofday_clobber=no
#	--includedir=$(USR)/include
#	--bindir=$(USRBIN) --libdir=$(USRLIB)
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE) &&\
	$(MAKE) && $(INSTALL)

.PHONY: octave-links
octave-links:
	ln -fs /octave/bin/octave $(USRBIN)/octave
	ln -fs /octave/lib/octave/$(OCTAVE_VER)/liboctave.so.2 $(USRLIB)/liboctave.so.2
	ln -fs /octave/lib/octave/$(OCTAVE_VER)/liboctinterp.so.2 $(USRLIB)/liboctinterp.so.2
