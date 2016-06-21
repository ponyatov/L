CFG_FREETYPE = 

.PHONY: freetype
freetype: $(SRC)/$(FREETYPE)/README
	rm -rf $(TMP)/$(FREETYPE) && mkdir $(TMP)/$(FREETYPE) &&\
	cd $(TMP)/$(FREETYPE) &&\
	$(XPATH) $(SRC)/$(FREETYPE)/$(TCFG) $(CFG_FREETYPE) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(FREETYPE),$@,install) &&\
	mv -f $(ROOT)/bin/$@-config $(TC)/bin/
