# canadian cross

CFG_CAN_BIN = \
	--with-native-system-header-dir=/include \
	--enable-lto --disable-multilib
CFG_CAN_GCC = $(CFG_CAN_BIN) \
	--enable-threads --enable-libgomp \
	--enable-languages="c,c++"
#--program-prefix=$(P) 
	
.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README $(SRC)/$(GCC)/README
#	# binutils
#	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
#	cd $(TMP)/$(BINUTILS) &&\
#	$(XPATH) $(SRC)/$(BINUTILS)/$(CACFG) \
#		$(CFG_CAN_BIN) --target=$(T) $(O) --prefix=$(PFX) --with-sysroot=$(SR) &&\
#	$(MAKE) && $(PINSTALL)-strip &&\
#	grep $(ROOT) $(PACK)/.strace > $(PACK)/binutils.$(PK).strace && rm $(PACK)/.strace
	# gcc
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(XPATH) $(SRC)/$(GCC)/$(CACFG) \
		$(CFG_CAN_GCC) --target=$(T) $(O) --prefix=$(PFX) --with-sysroot=$(SR)
	cd $(TMP)/$(GCC) && $(XPATH) $(MAKE) all-gcc
#	cd $(TMP)/$(GCC) && $(XPATH) $(MAKE) install-gcc
#	cd $(TMP)/$(GCC) && $(XPATH) $(MAKE) all-target-libgcc
#	cd $(TMP)/$(GCC) && $(XPATH) $(MAKE) install-target-libgcc
	
.PHONY: binhost
binhost:
	make canadian T=$(TARGET) PFX=$(USR) SR=/ PK=host O=
#	 O="$(CFG_ARCH) $(CFG_CPU)"

.PHONY: bin486
bin486:
	make canadian T=i486-elf O=
#	 O="--with-cpu=i486"

.PHONY: binavr
binavr:
	make canadian T=avr O=
#	 O=

.PHONY: bincmx
bincmx:
	make canadian T=arm-none-eabi O=
#	P=cmx- \
#		O="--enable-interwork --disable-multilib"
