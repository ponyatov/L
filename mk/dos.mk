
# errors
DOSEMU_CFG = --disable-plugin_commands
.PHONY: dosemu
dosemu: $(SRC)/$(DOSEMU)/README
	rm -rf $(TMP)/$(DOSEMU) && mkdir $(TMP)/$(DOSEMU) &&\
	cd $(TMP)/$(DOSEMU) &&\
	$(XPATH) $(SRC)/$(DOSEMU)/$(TCFG) $(DOSEMU_CFG) &&\
	$(XPATH) $(MAKE)

# errors
DOSBOX_CFG = 
.PHONY: dosbox
dosbox: $(SRC)/$(DOSBOX)/README
	rm -rf $(TMP)/$(DOSBOX) && mkdir $(TMP)/$(DOSBOX) &&\
	cd $(TMP)/$(DOSBOX) &&\
	$(XPATH) $(SRC)/$(DOSBOX)/$(TCFG) $(DOSBOX_CFG) &&\
	$(XPATH) $(MAKE)

BOCHS_CFG = --without-x11 --with-sdl \
	--enable-debugger --disable-debugger-gui --enable-disasm \
	--disable-docbook --disable-readline \
	--enable-cpu-level=3 --disable-smp \
	--disable-large-ramfile --disable-pci
#.PHONY: bochs
#bochs: $(SRC)/$(BOCHS)/README
#	rm -rf $(TMP)/$(BOCHS) && mkdir $(TMP)/$(BOCHS) &&\
#	cd $(TMP)/$(BOCHS) &&\
#	$(XPATH) $(SRC)/$(BOCHS)/$(TCFG) $(BOCHS_CFG) &&\
#	$(XPATH) $(MAKE) && $(INSTALL)
#	cp $(GZ)/fdboot.img $(ROOT)/
