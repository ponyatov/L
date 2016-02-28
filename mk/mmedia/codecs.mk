
CFG_FFMPEG = --prefix=$(ROOT) --mandir=$(TMP)/man \
	--target-os=linux --arch=$(ARCH) \
	--enable-cross-compile --cross-prefix=$(TARGET)- \
	--disable-everything --disable-network \
	--enable-zlib --enable-decoder=gsm \
	--enable-indev=alsa,fbdev,v4l2 --enable-outdev=alsa,fbdev,v4l2,sdl \
	--enable-shared $(CFG_CPU_LIBS) --enable-ffplay

#	--list-indevs --enable-yasm

.PHONY: ffmpeg
ffmpeg: $(SRC)/$(FFMPEG)/README
	rm -rf $(TMP)/$(FFMPEG) && mkdir $(TMP)/$(FFMPEG) &&\
	cd $(TMP)/$(FFMPEG) &&\
	$(XPATH) $(SRC)/$(FFMPEG)/configure $(CFG_FFMPEG) &&\
	$(MAKE) && $(INSTALL)
	rm -rf $(ROOT)/share/ffmpeg/examples

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
		