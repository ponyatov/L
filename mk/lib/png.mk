CFG_PNG = 

.PHONY: png
png: $(PACK)/png
$(PACK)/png: $(SRC)/$(PNG)/README
	rm -rf $(TMP)/$(PNG) && mkdir $(TMP)/$(PNG) &&\
	cd $(TMP)/$(PNG) &&\
	$(XPATH) $(SRC)/$(PNG)/$(TCFG) $(CFG_PNG) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(PNG),png,install)
	mv $(ROOT)/bin/libpng*config $(TC)/bin/
