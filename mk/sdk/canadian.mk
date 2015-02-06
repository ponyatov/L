# canadian cross

CFG_CANADIAN = --prefix=$(USR)

.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(XPATH) $(SRC)/$(BINUTILS)/$(TCFG) \
		$(CFG_CANADIAN) --target=$(T) $(O) --program-prefix=$(P) &&\
	$(MAKE) && $(INSTALL)-strip

.PHONY: binhost
binhost:
	make canadian T=$(TARGET) P= O="$(CFG_ARCH) $(CFG_CPU)"

.PHONY: bin486
bin486:
	make canadian T=i486-elf P=i486- O="--with-cpu=i486"

.PHONY: binavr
binavr:
	make canadian T=avr P=avr- O=

.PHONY: bincm3
bincm3:
	make canadian T=arm-none-eabi P=cm3- \
		O="--with-cpu=cortex-m3 --enable-interwork"
