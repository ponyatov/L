
PHONY: alsa alsa_lib alsa_utils
alsa: alsa_lib alsa_utils

CFG_ALSA_LIB = --disable-alisp
CFG_ALSA_UTILS = --disable-alsamixer --disable-xmlto --disable-alsaconf --prefix=$(ROOT)/au

alsa_lib: $(SRC)/$(ALSA_LIB)/README
	rm -rf $(TMP)/$(ALSA_LIB) && mkdir $(TMP)/$(ALSA_LIB) &&\
	cd $(TMP)/$(ALSA_LIB) &&\
	$(XPATH) $(SRC)/$(ALSA_LIB)/$(TCFG) $(CFG_ALSA_LIB) &&\
	$(MAKE) && $(INSTALL)-strip

alsa_utils: $(SRC)/$(ALSA_UTILS)/README
	rm -rf $(TMP)/$(ALSA_UTILS) && mkdir $(TMP)/$(ALSA_UTILS) &&\
	cd $(TMP)/$(ALSA_UTILS) &&\
	$(XPATH) $(SRC)/$(ALSA_UTILS)/$(TCFG) $(CFG_ALSA_UTILS) &&\
	$(MAKE) && $(INSTALL)-strip
