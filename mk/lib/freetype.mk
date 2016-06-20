CFG_FREETYPE = 

.PHONY: freetype
freetype: $(PACK)/freetype
$(PACK)/freetype: $(SRC)/$(FREETYPE)/README
	rm -rf $(TMP)/$(FREETYPE) && mkdir $(TMP)/$(FREETYPE) &&\
	cd $(TMP)/$(FREETYPE) &&\
	$(XPATH) $(SRC)/$(FREETYPE)/$(TCFG) $(CFG_FREETYPE) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(FREETYPE),freetype,install)
	mv -f $(ROOT)/bin/freetype-config $(TC)/bin/
