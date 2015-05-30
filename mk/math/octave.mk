CFG_OCTAVE = --prefix=$(ROOT)/octave \
	--bindir=$(USRBIN) --libdir=$(USRLIB) \
	--includedir=$(USR)/include \
	--with-blas="-lblas" --with-lapack="-llapack" \
	--disable-docs --disable-readline --disable-java \
	CFLAGS="$(TOPT)" CXXFLAGS="$(TOPT)" FFLAGS="$(TOPT)" \
	gl_cv_func_gettimeofday_clobber=no
.PHONY: octave
octave: $(SRC)/$(OCTAVE)/README
	rm -rf $(TMP)/$(OCTAVE) && mkdir $(TMP)/$(OCTAVE) &&\
	cd $(TMP)/$(OCTAVE) &&\
	$(XPATH) $(SRC)/$(OCTAVE)/$(TCFG) $(CFG_OCTAVE) &&\
	$(MAKE) pkglibdir=$(USRLIB)/pkglibdir &&\
	$(INSTALL) pkglibdir=$(USRLIB)/pkglibdir
