XSERVER_CFG =

.PHONY: xserver
xserver: $(SRC)/xc/README

$(SRC)/xc/README: $(GZ)/XFree86/$(XSERVER)-src-1.tgz
	cd $(SRC) &&  zcat $< | tar x && touch $@

#CFG_X_SERVER =
#
#.PHONY: xorg
#xorg: $(SRC)/$(X_SERVER)/README
#	rm -rf $(TMP)/$(X_SERVER) &&\
#	mkdir $(TMP)/$(X_SERVER) &&\
#	cd $(TMP)/$(X_SERVER) &&\
#	$(SRC)/$(X_SERVER)/$(TCFG) $(CFG_X_SERVER)
