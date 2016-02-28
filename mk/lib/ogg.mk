CFG_OGG =
CFG_VORBIS =
CFG_FLAC =
CFG_SPEEX =

.PHONY: mp3
mp3: ogg vorbis flac speex
	touch $(PACK)/$@ 

.PHONY: ogg
ogg: $(SRC)/$(OGG)/README
	rm -rf $(TMP)/$(OGG) && mkdir $(TMP)/$(OGG) &&\
	cd $(TMP)/$(OGG) &&\
	$(XPATH) $(SRC)/$(OGG)/$(TCFG) $(CFG_OGG) && $(MAKE)
	$(call INSTPACK,$(TMP)/$(OGG),$@,install-strip)
	
.PHONY: vorbis
vorbis: $(SRC)/$(VORBIS)/README
	rm -rf $(TMP)/$(VORBIS) && mkdir $(TMP)/$(VORBIS) &&\
	cd $(TMP)/$(VORBIS) &&\
	$(XPATH) $(SRC)/$(VORBIS)/$(TCFG) $(CFG_VORBIS) && $(MAKE)
	$(call INSTPACK,$(TMP)/$(VORBIS),$@,install-strip)
#	mv $(ROOT)/bin/libpng*config $(TC)/bin/

.PHONY: flac
flac: $(SRC)/$(FLAC)/README
	rm -rf $(TMP)/$(FLAC) && mkdir $(TMP)/$(FLAC) &&\
	cd $(TMP)/$(FLAC) &&\
	$(XPATH) $(SRC)/$(FLAC)/$(TCFG) $(CFG_FLAC) && $(MAKE)
	$(call INSTPACK,$(TMP)/$(FLAC),$@,install-strip)

.PHONY: speex
speex: $(SRC)/$(SPEEX)/README
	rm -rf $(TMP)/$(SPEEX) && mkdir $(TMP)/$(SPEEX) &&\
	cd $(TMP)/$(SPEEX) &&\
	$(XPATH) $(SRC)/$(SPEEX)/$(TCFG) $(CFG_SPEEX) && $(MAKE)
	$(call INSTPACK,$(TMP)/$(SPEEX),$@,install-strip)
	