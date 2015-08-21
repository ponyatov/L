
CFG_FFMPEG = --prefix=$(ROOT) --mandir=$(TMP)/man \
	--target-os=linux --arch=$(ARCH) \
	--enable-cross-compile --cross-prefix=$(TARGET)- \
	--disable-everything --disable-network \
	--enable-zlib --enable-decoder=gsm \
	--enable-indev=alsa,fbdev,v4l2 --enable-outdev=alsa,fbdev,v4l2,sdl \
	--enable-shared $(CPU_FFMPEG)

#	--list-indevs --enable-yasm

.PHONY: ffmpeg
ffmpeg: $(SRC)/$(FFMPEG)/README
	rm -rf $(TMP)/$(FFMPEG) && mkdir $(TMP)/$(FFMPEG) &&\
	cd $(TMP)/$(FFMPEG) &&\
	$(XPATH) $(SRC)/$(FFMPEG)/configure $(CFG_FFMPEG) &&\
	$(MAKE) && $(INSTALL)
	rm -rf $(ROOT)/share/ffmpeg/examples
