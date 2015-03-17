
CFG_PYTHON =

.PHONY: python
python: $(SRC)/$(PYTHON)/README
	cp -r patch/python/* $(SRC)/$(PYTHON)/patch/
#	cd $(SRC)/$(PYTHON) &&\
#	patch -N < patch/001-remove-host-header-path.patch
	cd $(SRC)/$(PYTHON) &&\
	patch -N < patch/002-fix-get-python-inc.patch
