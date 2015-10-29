XSERVER_CFG =

.PHONY: xserver
xserver: $(SRC)/xc/BUILD.txt $(TC)/bin/$(XSERVER)-lndir
	rm -rf $(TMP)/$(XSERVER) && mkdir $(TMP)/$(XSERVER) &&\
	cd $(TMP)/$(XSERVER) &&\
	$(TC)/bin/$(XSERVER)-lndir $(SRC)/xc
	cp app/$(APP).Xdef $(TMP)/$(XSERVER)/config/cf/host.def
#	cd $(TMP)/$(XSERVER) && $(MAKE) World
#	 UseInstalledOnCrossCompile

$(TC)/bin/$(XSERVER)-lndir: $(SRC)/xc/BUILD.txt
	cd $(SRC)/xc/config/util &&\
	ln -s ../../include X11 &&\
	$(BCC) -I. -o $@ lndir.c

$(SRC)/xc/BUILD.txt: $(GZ)/XFree86/$(XSERVER)-src-1.tgz
	cd $(SRC) &&\
	zcat $(GZ)/XFree86/$(XSERVER)-src-1.tgz | tar x &&\
	zcat $(GZ)/XFree86/$(XSERVER)-src-2.tgz | tar x &&\
	zcat $(GZ)/XFree86/$(XSERVER)-src-3.tgz | tar x &&\
	touch $@
