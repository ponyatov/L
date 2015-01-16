CFG_FREETYPE = --without-png

.PHONY: freetype
freetype: $(SRC)/$(FREETYPE)/README
	rm -rf $(TMP)/$(FREETYPE) && mkdir $(TMP)/$(FREETYPE) &&\
	cd $(TMP)/$(FREETYPE) &&\
	$(XPATH) $(SRC)/$(FREETYPE)/$(TCFG) $(CFG_FREETYPE) &&\
	$(XPATH) $(MAKE) &&\ 
	$(XPATH) $(MAKE) install
