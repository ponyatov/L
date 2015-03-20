
CFG_LIBCPP = UCLIBCXX_RUNTIME_PREFIX=$(ROOT)/libcpp

.PHONY: libcpp
libcpp: $(SRC)/$(LIBCPP)/README
	cd $(SRC)/$(LIBCPP) &&\
	make distclean &&\
	make defconfig &&\
	echo "UCLIBCXX_RUNTIME_PREFIX=\"$(ROOT)/libcpp\"" >> .config &&\
	make menuconfig &&\
	$(XPATH) make CC="$(TCC)" CXX="$(TCXX)"
