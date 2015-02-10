# canadian cross

CFG_CAN_BIN = --prefix=$(USR) 
#--enable-lto
CFG_CAN_GCC = $(CFG_CAN_BIN) \
	--enable-threads --enable-libgomp \
	--enable-languages="c"
	
.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README
	# binutils
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(XPATH) $(SRC)/$(BINUTILS)/$(TCFG) \
		$(CFG_CAN_BIN) --target=$(T) $(O) --program-prefix=$(P) &&\
	$(MAKE) && $(PACKINSTALL)-strip
#	# gcc
#	rm -rf $(TMP)/$(GCC) && mkdir $(TMP)/$(GCC) &&\
#	cd $(TMP)/$(GCC) &&\
#	$(XPATH) $(SRC)/$(GCC)/$(TCFG) \
#		$(CFG_CAN_GCC) --target=$(T) $(O) --program-prefix=$(P)
#	cd $(TMP)/$(GCC) &&	$(XPATH) $(MAKE) all-gcc 

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
