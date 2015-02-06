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
	$(MAKE) &&\
	$(XPATH) strace -f -e trace=file -o $(PWD)/pack/$(S).strace make install-strip

.PHONY: binhost
binhost:
	make canadian T=$(TARGET) P= O="$(CFG_ARCH) $(CFG_CPU)"

.PHONY: bin486
bin486:
	make canadian S=$@ T=i486-elf P=i486- O="--with-cpu=i486dx"

.PHONY: bin486-pack
bin486-pack:
	./pack/strace2files.py $(ROOT)/ < pack/bin486.strace > pack/bin486.files
	cd $(ROOT) && tar cmpl -T ../pack/bin486.files > ../pack/$(HW)$(APP)_bin486.tgz

.PHONY: binavr
binavr:
	make canadian T=avr P=avr- O=

.PHONY: bincm3
bincm3:
	make canadian T=arm-none-eabi P=cm3 \
		O="--with-cpu=cortex-m3 --enable-interwork"
