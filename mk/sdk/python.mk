
CFG_PYMITE = CC="$(TCC)" 
.PHONY: pymite
pymite: $(SRC)/$(PYMITE)/README
	cd $(SRC)/$(PYMITE) &&\
	$(MAKE) $(CFG_PYMITE) clean &&\
	$(MAKE) $(CFG_PYMITE)
