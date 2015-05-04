
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
LAPACK_OCTAVE = \
	zgetri.f zgesdd.f sgebak.f zgetrs.f zgeqrf.f cgeesx.f \
	dptsv.f dggev.f dgeqrf.f dgehrd.f zgehrd.f zgetrf.f \
	zpbtrs.f zggev.f zgeev.f dgbcon.f cgehrd.f dlag2.f \
	sgesdd.f zpotrf.f sgeqrf.f cunghr.f dsygv.f sgebal.f \
	sorghr.f sgeqp3.f cgebak.f chegv.f dgghrd.f cgelsd.f \
	ssyev.f cgesdd.f dpbtrf.f sgesvd.f sggbak.f zgesvd.f \
	cpotrs.f dsyev.f zptsv.f dorghr.f ctrtri.f ztrtrs.f \
	zggbak.f ssygv.f dggbal.f dorgqr.f sgehrd.f ztrtri.f \
	zheev.f strtrs.f cggbal.f dgelsd.f dpotri.f dpocon.f \
	ctrcon.f zggbal.f zungqr.f dtrcon.f zlassq.f dpotrs.f \
	sgbtrs.f dgtsv.f dtrsyl.f zgbcon.f dgeqp3.f dhgeqz.f \
	cgecon.f zpotrs.f cgebal.f ztrsyl.f sggbal.f dlange.f \
	zpotri.f zgecon.f cgesvd.f zgelsd.f zpocon.f cgetri.f \
	cpocon.f dgetrf.f strsyl.f cgeqrf.f cgetrs.f dgeev.f \
	sgetrf.f ztgevc.f dgbtrf.f dpbtrs.f cpotrf.f ctrtrs.f \
	zgttrf.f sgelsd.f dgesvd.f spotrf.f zgebak.f strtri.f \
	dgeesx.f dgetrs.f clartg.f dgecon.f zhgeqz.f dtrtrs.f \
	dgesdd.f spotri.f sorgqr.f sgeev.f strcon.f dtrtri.f \
	zgeesx.f spocon.f cggev.f spotrs.f sgetri.f zgeqp3.f \
	cpotri.f zlartg.f zpbcon.f zgtsv.f dgebal.f sgetrs.f \
	sgecon.f dpotrf.f cgeqp3.f zgbtrs.f zpbtrf.f \
	zgttrs.f ztrcon.f dgttrs.f cgeev.f dlartg.f zgghrd.f \
	dgetri.f zhegv.f dgebak.f sggev.f sgbtrf.f cgetrf.f \
	zunghr.f dgttrf.f slange.f dgbtrs.f dpbcon.f zgebal.f \
	ctrsyl.f dtgevc.f sgeesx.f zgbtrf.f dggbak.f
	
#dlamch.f 	
    
CFG_LAPACK = 
.PHONY: lapack
lapack: $(SRC)/$(LAPACK)/README
	cd $(SRC)/$(LAPACK)/SRC &&\
	$(XPATH) $(TFORTRAN) $(TOPT) -shared -fPIC -o $(LIB)/liblapack.so \
		$(LAPACK_REQ) $(LAPACK_CHEEV) $(LAPACK_OCTAVE)

CFG_GSL = CFLAGS="$(TOPT)"
.PHONY: gsl
gsl: $(SRC)/$(GSL)/README
	rm -rf $(TMP)/$(GSL) && mkdir $(TMP)/$(GSL) &&\
	cd $(TMP)/$(GSL) &&\
	$(XPATH) $(SRC)/$(GSL)/$(TCFG) $(CFG_GSL) &&\
	$(MAKE) && $(INSTALL)-strip && $(MVCONFIG)
