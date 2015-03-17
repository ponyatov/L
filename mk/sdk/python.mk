
CFG_PYTHON = \
	--disable-pyc-build \
	--disable-pyo-build

.PHONY: python
python: $(SRC)/$(PYTHON)/README
	cp -r patch/python/* $(SRC)/$(PYTHON)/patch/
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/001-remove-host-header-path.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/002-fix-get-python-inc.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/004-sysconfigdata-install-location.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/005-pyc-pyo-conditional.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/006-cross-compile-getaddrinfo.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/007-disable-extensions.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/008-distutils-use-python-sysroot.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/009-no-termcap-host-path.patch
#	-cd $(SRC)/$(PYTHON) &&\
#	patch -N -p1 < patch/010-fix-python-config.patch
	-cd $(SRC)/$(PYTHON) &&\
	patch -N -p1 < patch/011-remove-python-symlink.patch
