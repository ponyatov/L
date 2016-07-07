CFG_LIBGD = --prefix=$(ROOT)/$(LIBGD)
.PHONY: libgd
libgd: $(SRC)/libgd-$(LIBGD)/README
	rm -rf $(TMP)/$(LIBGD) && mkdir $(TMP)/$(LIBGD)
	cd $(SRC)/libgd-$(LIBGD) && autoreconf -fi -I m4
#	cd $(TMP)/$(LIBGD) &&\
#	$(XPATH) $(SRC)/libgd-$(LIBGD)/$(TCFG) $(CFG_LIBGD)
