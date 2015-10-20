CFG_LIBGD = --prefix=$(ROOT)/$(LIBGD)
.PHONY: libgd
libgd: $(SRC)/libgd-$(LIBGD)/README
	cd $(SRC)/libgd-$(LIBGD) &&\
	$(XPATH) LIBPNG=yes autoreconf -fi 
#	rm -rf $(TMP)/$(LIBGD) && mkdir $(TMP)/$(LIBGD) &&\
#	cd $(TMP)/$(LIBGD) &&\
#	$(XPATH) $(SRC)/libgd-$(LIBGD)/src/configure $(CFG_LIBGD)
#	$(TCFG) 
