CFG_PNG = 

.PHONY: png
png: $(SRC)/$(PNG)/README
	rm -rf $(TMP)/$(PNG) && mkdir $(TMP)/$(PNG) &&\
	cd $(TMP)/$(PNG) &&\
	$(XPATH) $(SRC)/$(PNG)/$(TCFG) $(CFG_PNG) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(MAKE) install &&\
	mv $(ROOT)/bin/libpng*config $(TC)/bin/
