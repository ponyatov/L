.PHONY: apps
apps: $(APPS)

CFG_LINKS = 

.PHONY: links
links: $(SRC)/$(LINKS)/README
	rm -rf $(TMP)/$(LINKS) && mkdir $(TMP)/$(LINKS) &&\
	cd $(TMP)/$(LINKS) &&\
	$(XPATH) CC="$(TCC)" CXX="$(TCXX)" \
	$(SRC)/$(LINKS)/configure --disable-nls --prefix=$(ROOT)/links \
	--host=$(TARGET) \
	$(CFG_LINKS)
