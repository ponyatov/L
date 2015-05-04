# http://www.sandia.gov/~jhlaros/publications/light-os-WMSCI-final.pdf
CFG_MPICH = RSHCOMMAND=/usr/bin/ssh --with-device=ch_p4 \
	--without-romio --disable-sharedlib 
.PHONY: mpich
mpich: $(SRC)/$(MPICH)/README
	rm -rf $(TMP)/$(MPICH) && mkdir $(TMP)/$(MPICH) &&\
	cd $(TMP)/$(MPICH) &&\
	$(XPATH) $(SRC)/$(MPICH)/$(TCFG) &&\
	$(MAKE)
