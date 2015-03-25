
CFG_PYTHON = 
#	--disable-pyc-build \
#	--disable-pyo-build

.PHONY: python	
python: $(SRC)/$(PYTHON)/patch/done
	rm -rf $(TMP)/$(PYTHON) && mkdir $(TMP)/$(PYTHON) &&\
	cd $(TMP)/$(PYTHON) &&\
	$(SRC)/$(PYTHON)/$(TCFG) $(CFG_PYTHON)

.PHONY: python-src
python-src: $(SRC)/$(PYTHON)/README
	mkdir -p $(SRC)/$(PYTHON)/patch &&\
	cp -r patch/python/* $(SRC)/$(PYTHON)/patch/
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/001-remove-host-header-path.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/002-fix-get-python-inc.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/004-sysconfigdata-install-location.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/005-pyc-pyo-conditional.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/006-cross-compile-getaddrinfo.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/007-disable-extensions.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/008-distutils-use-python-sysroot.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/009-no-termcap-host-path.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/010-fix-python-config.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/011-remove-python-symlink.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/013-dont-add-multiarch-path.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/014-abort-on-failed-modules.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/015-fix-sqlite-without-threads.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/016-serial-ioctl-workaround.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/017-distutils-scripts-dont-adjust-shebang.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/100-optional-test-modules.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/101-optional-pydoc.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/102-optional-2to3.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/103-optional-sqlite.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/104-optional-tk.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/105-optional-curses.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/106-optional-expat.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/107-optional-codecs-cjk.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/108-optional-nis.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/109-optional-unicodedata.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/110-optional-db.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/111-optional-ssl.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/112-optional-bzip2.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/113-optional-zlib.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/114-remove-idle-editor.patch
	-cd $(SRC)/$(PYTHON) && patch -N -p1 < patch/115-optional-ossaudiodev.patch
	-cd $(SRC)/$(PYTHON) && touch patch/done
