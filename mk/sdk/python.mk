
CFG_PYTHON =
.PHONY: python
python: $(SRC)/$(PYTHON)/README
#	# apply xcompile patch
#	cd $(SRC)/$(PYTHON) && patch -N -p1 < $(GZ)/Python-$(PYTHON_VER)-xcompile.patch
	# hot-part build
	rm -rf $(TMP)/$(PYTHON) && mkdir $(TMP)/$(PYTHON) &&\
	cd $(TMP)/$(PYTHON) &&\
	$(SRC)/$(PYTHON)/configure && make python Parser/pgen

CFG_PYMITE = CC="$(TCC)" 
.PHONY: pymite
pymite: $(SRC)/$(PYMITE)/README
	cd $(SRC)/$(PYMITE) &&\
	$(MAKE) $(CFG_PYMITE) clean &&\
	$(MAKE) $(CFG_PYMITE)

CFG_PYTHON3_HOST =
CFG_PYTHON3 = --host=$(TARGET) --build=$(shell gcc -dumpmachine) --prefix=$(ROOT)/py3
.PHONY: python3
python3: $(SRC)/$(PYTHON3)/README
	# host-part build
	rm -rf $(TMP)/$(PYTHON3) && mkdir $(TMP)/$(PYTHON3) &&\
	cd $(TMP)/$(PYTHON3) &&\
	$(SRC)/$(PYTHON3)/configure $(CFG_PYTHON3_HOST) &&\
	$(MAKE) python && $(MAKE) Parser/pgen &&\
	mv python hostpython &&\
	mv Parser/pgen Parser/hostpgen &&\
	$(MAKE) distclean
