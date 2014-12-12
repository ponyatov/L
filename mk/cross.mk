.PHONY: tc
tc: binutils cclibs gcc

.PHONY: binutils
binutils: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) && cd $(TMP)/$(BINUTILS) &&\
	$(SRC)/$(BINUTILS)/$(BCFG) && $(MAKE) && $(MAKE) install-strip &&\
	rm -rf $(TMP)/$(BINUTILS)
