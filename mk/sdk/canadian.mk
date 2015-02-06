# canadian cross

CFG_CANADIAN = --prefix=$(USR)
#--libdir=$(ROOT)/lib --bindir=$(ROOT)/bin

.PHONY: canadian
canadian: $(SRC)/$(BINUTILS)/README
	rm -rf $(TMP)/$(BINUTILS) && mkdir $(TMP)/$(BINUTILS) &&\
	cd $(TMP)/$(BINUTILS) &&\
	$(XPATH) $(SRC)/$(BINUTILS)/$(TCFG) \
		$(CFG_CANADIAN) $(O) \
		--target=$(T) --program-prefix=$(P) &&\
	$(MAKE) && $(INSTALL)-strip

.PHONY: binhost
binhost:
	make canadian PN=$@ T=$(TARGET) P= O="$(CFG_ARCH) $(CFG_CPU)"

.PHONY: bin486
bin486:
	make canadian PN=$@ T=i486-elf P=i486- O="--with-cpu=i486dx"

.PHONY: bin486-pack
bin486-pack:
	./pack/strace2files.py $(ROOT)/ < $(PACK)/bin486.strace > $(PACK)/bin486.files &&\
	cd $(ROOT) && tar cmpl -T $(PACK)/bin486.files > $(PACK)/bin486.tgz 

.PHONY: binavr
binavr:
	make canadian PN=$@ T=avr P=avr- O=

.PHONY: bincm3
bincm3:
	make canadian PN=$@ T=arm-none-eabi P=cm3 \
		O="--with-cpu=cortex-m3 --enable-interwork"
