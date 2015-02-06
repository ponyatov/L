
CFG_GMP = 
#$(CFG_CCLIBS)
CFG_MPFR =

.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(XPATH) $(SRC)/$(GMP)/$(TCFG) $(CFG_GMP) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(INSTALL)

.PHONY: mpfr
mpfr: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) &&\
	cd $(TMP)/$(MPFR) &&\
	$(XPATH) $(SRC)/$(MPFR)/$(TCFG) $(CFG_MPFR) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(INSTALL)
