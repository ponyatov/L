
CFG_PYTHON = --disable-ipv6 ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no
.PHONY: python
python: $(SRC)/$(PYTHON)/README
#	rm -rf $(TMP)/$(PYTHON) && mkdir $(TMP)/$(PYTHON)
#	# apply xcompile patch
#	cd $(SRC)/$(PYTHON) && patch -N -p1 < $(GZ)/Python-$(PYTHON_VER)-xcompile.patch
#	# host-part build
#	cd $(TMP)/$(PYTHON) &&\
#	$(SRC)/$(PYTHON)/configure && make python Parser/pgen
#	cd $(TMP)/$(PYTHON) && mv python hostpython && mv Parser/pgen Parser/hostpgen
	-cd $(TMP)/$(PYTHON) && make distclean
	cd $(TMP)/$(PYTHON) && $(XPATH) \
	CC="$(TCC)" CXX="$(TCXX)" \
	AR=$(TARGET)-ar RANLIB=$(TARGET)-ranlib \
	$(SRC)/$(PYTHON)/configure --prefix=$(ROOT)/python \
	--host=$(TARGET) --build=$(shell gcc -dumpmachine) \
	$(CFG_PYTHON) 
	cd $(TMP)/$(PYTHON) && $(XPATH) \
	make HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen \
	BLDSHARED="$(TCC) -shared" CROSS_COMPILE=$(TARGET)- \
	CROSS_COMPILE_TARGET=yes HOSTARCH=$(TARGET) \
	BUILDARCH=$(shell gcc -dumpmachine)

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
