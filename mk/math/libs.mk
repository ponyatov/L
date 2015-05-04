
CFG_BLAS = 
.PHONY: blas
blas: $(SRC)/$(BLAS)/README
	cd $(SRC)/$(BLAS) &&\
	$(XPATH) $(TFORTRAN) -shared -fPIC $(TOPT) -o $(LIB)/libblas.so *.f

LAPACK_REQ = 
#csteqr.f clansy.f slascl.f slasrt.f chetrd.f ssterf.f \
#	slae2.f slaev2.f clasr.f slartg.f chetd2.f \
#	claset.f clascl.f slanst.f classq.f \
#	slassq.f sisnan.f slapy2.f cungtr.f ilaenv.f \
#	clarfg.f ../INSTALL/slamch.f clanhe.f clatrd.f \
#	cungql.f slaisnan.f iparmq.f clacgv.f cungqr.f \
#	cladiv.f ieeeck.f slapy3.f \
#	clarfb.f sladiv.f cung2l.f clarft.f cung2r.f clarf.f \
#	ilaclc.f ilaclr.f
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
