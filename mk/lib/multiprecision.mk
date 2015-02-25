
CFG_CCLIBS =
CFG_GMP = $(CFG_CCLIBS) 
CFG_MPFR = $(CFG_CCLIBS)
CFG_MPC = $(CFG_CCLIBS)

.PHONY: cclibs
cclibs: gmp mpfr mpc

.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(XPATH) $(SRC)/$(GMP)/$(TCFG) $(CFG_GMP) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(PINSTALL) &&\
	grep $(ROOT) $(PACK)/.strace > $(PACK)/$@.strace && rm $(PACK)/.strace 

.PHONY: mpfr
mpfr: $(SRC)/$(MPFR)/README
	rm -rf $(TMP)/$(MPFR) && mkdir $(TMP)/$(MPFR) &&\
	cd $(TMP)/$(MPFR) &&\
	$(XPATH) $(SRC)/$(MPFR)/$(TCFG) $(CFG_MPFR) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(PINSTALL) &&\
	grep $(ROOT) $(PACK)/.strace > $(PACK)/$@.strace && rm $(PACK)/.strace 

.PHONY: mpc
mpc: $(SRC)/$(MPC)/README
	rm -rf $(TMP)/$(MPC) && mkdir $(TMP)/$(MPC) &&\
	cd $(TMP)/$(MPC) &&\
	$(XPATH) $(SRC)/$(MPC)/$(TCFG) $(CFG_MPC) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(PINSTALL) &&\
	grep $(ROOT) $(PACK)/.strace > $(PACK)/$@.strace && rm $(PACK)/.strace 
