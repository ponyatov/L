.PHONY: gz_emul 
gz_emul:

HIGAN_VER = 097
HIGAN = higan_v$(HIGAN_VER)-source
HIGAN_ZIP = $(HIGAN).7z
.PHONY: gz_higan
gz_higan: req_X11
	$(WGET) http://download.byuu.org/$(HIGAN_ZIP)
	rm -rf $(TMP)/$(HIGAN) ; cd $(TMP) && p7zip -d $(GZ)/$(HIGAN_ZIP)
	cd $(TMP)/$(HIGAN)/higan && $(MAKE) compiler="$(TCC)"
