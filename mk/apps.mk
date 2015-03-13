.PHONY: apps
apps: $(APPS)

CFG_ELINKS = --disable-ipv6 --without-spidermonkey 

.PHONY: elinks
elinks: $(SRC)/$(ELINKS)/README
	rm -rf $(TMP)/$(ELINKS) && mkdir $(TMP)/$(ELINKS) &&\
	cd $(TMP)/$(ELINKS) &&\
	$(XPATH) $(SRC)/$(ELINKS)/configure --disable-nls \
	CC="$(TCC)" CXX="$(TCXX)" --host=$(TARGET) \
	--prefix=$(ROOT)/elinks \
	$(CFG_ELINKS) &&\
	$(XPATH) make
