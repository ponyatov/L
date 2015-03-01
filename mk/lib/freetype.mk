CFG_FREETYPE = 

.PHONY: freetype
freetype: $(SRC)/$(FREETYPE)/README
	rm -rf $(TMP)/$(FREETYPE) && mkdir $(TMP)/$(FREETYPE) &&\
	cd $(TMP)/$(FREETYPE) &&\
	$(XPATH) $(SRC)/$(FREETYPE)/$(TCFG) $(CFG_FREETYPE) &&\
	$(MAKE) && $(INSTALL) &&\
	mv -f $(ROOT)/bin/$@-config $(TC)/bin/
