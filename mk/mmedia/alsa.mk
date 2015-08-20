
PHONY: alsa alsa_lib alsa_utils
alsa: alsa_lib alsa_utils

CFG_ALSA_LIB = --disable-alisp

alsa_lib: $(SRC)/$(ALSA_LIB)/README
	rm -rf $(TMP)/$(ALSA_LIB) && mkdir $(TMP)/$(ALSA_LIB) &&\
	cd $(TMP)/$(ALSA_LIB) &&\
	$(XPATH) $(SRC)/$(ALSA_LIB)/$(TCFG) $(CFG_ALSA_LIB) &&\
	$(MAKE) && $(INSTALL)-strip

alsa_utils:
	echo $@
