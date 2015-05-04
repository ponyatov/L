
CFG_BLAS = 
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -o $(LIB)/libblas.so *.f

LAPACK_REQ = \
	csteqr.f chetrd.f ssterf.f clascl.f cungtr.f \
	ilaenv.f ../INSTALL/slamch.f clanhe.f \
	cungql.f slascl.f iparmq.f slasrt.f slae2.f slaev2.f clasr.f slartg.f \
	chetd2.f cungqr.f claset.f slanst.f classq.f sisnan.f slapy2.f \
	ieeeck.f clatrd.f clarfb.f slaisnan.f clacgv.f cung2l.f clarft.f \
	clarf.f slassq.f clarfg.f cung2r.f \
	ilaclc.f ilaclr.f cladiv.f slapy3.f sladiv.f 
LAPACK_CHEEV = cheev.f    
    
CFG_LAPACK = 
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK)/SRC &&\
	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC -o $(LIB)/liblapack.so \
		$(LAPACK_REQ) $(LAPACK_CHEEV)

CFG_GSL = CFLAGS="$(TOPT)"
.PHONY: gsl
gsl: $(SRC)/$(GSL)/README
	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
	cd $(TMP)/$(GSL) &&\
	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)
