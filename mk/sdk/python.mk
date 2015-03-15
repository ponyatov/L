
CFG_PYMITE = CC="$(TCC)" 
.PHONY: pymite
pymite: $(SRC)/$(PYMITE)/README
	cd $(SRC)/$(PYMITE) &&\
	$(MAKE) $(CFG_PYMITE) clean &&\
	$(MAKE) $(CFG_PYMITE)

CFG_PYTHON3 =
.PHONY: python3
python3: $(SRC)/$(PYTHON3)/README
	rm -rf $(TMP)/$(PYTHON3) && mkdir $(TMP)/$(PYTHON3) &&\
	cd $(TMP)/$(PYTHON3) &&\
	$(SRC)/$(PYTHON3)/$(TCFG) $(CFG_PYTHON3)
