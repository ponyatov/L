
CFG_X_SERVER =

.PHONY: xorg
xorg: $(SRC)/$(X_SERVER)/README
	rm -rf $(TMP)/$(X_SERVER) &&\
	mkdir $(TMP)/$(X_SERVER) &&\
	cd $(TMP)/$(X_SERVER) &&\
	$(SRC)/$(X_SERVER)/$(TCFG) $(CFG_X_SERVER)
