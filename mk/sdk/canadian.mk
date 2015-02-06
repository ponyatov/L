# canadian cross


CFG_CCLIBS = --with-gmp=$(ROOT) --with-mpfr=$(ROOT) --with-mpc=$(ROOT) 

CFG_GMP = $(CFG_CCLIBS)

CFG_CAN_BIN = --prefix=$(USR)
#--enable-lto
CFG_CAN_GCC = $(CFG_CAN_BIN) $(CFG_CAN_LIBS) \
	--enable-threads --enable-libgomp \
	--enable-languages="c"
	
.PHONY: gmp
gmp: $(SRC)/$(GMP)/README
	rm -rf $(TMP)/$(GMP) && mkdir $(TMP)/$(GMP) &&\
	cd $(TMP)/$(GMP) &&\
	$(XPATH) $(SRC)/$(GMP)/$(TCFG) $(CFG_GMP) &&\
	$(XPATH) $(MAKE) && $(XPATH) $(INSTALL)

.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README $(SRC)/$(GCC)/README
#	# binutils
#	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
#	cd $(TMP)/$(BINUTILS) &&\
#	$(XPATH) $(SRC)/$(BINUTILS)/$(TCFG) \
#		$(CFG_CAN_BIN) --target=$(T) $(O) --program-prefix=$(P) &&\
#	$(MAKE) && $(INSTALL)-strip
	# gcc
	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
	cd $(TMP)/$(GCC) &&\
	$(XPATH) $(SRC)/$(GCC)/$(TCFG) \
		$(CFG_CAN_GCC) --target=$(T) $(O) --program-prefix=$(P)

.PHONY: binhost
binhost:
	make canadian T=$(TARGET) P= O="$(CFG_ARCH) $(CFG_CPU)"

.PHONY: bin486
bin486:
	make canadian T=i486-elf P=i486- O="--with-cpu=i486"

.PHONY: binavr
binavr:
	make canadian T=avr P=avr- O=

.PHONY: bincmx
bincmx:
	make canadian T=arm-none-eabi P=cmx- \
		O="--enable-interwork --disable-multilib"
