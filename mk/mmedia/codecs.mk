
CFG_FFMPEG = --prefix=$(ROOT)/ffmpeg \
	--target-os=linux --arch=$(ARCH) \
	--enable-cross-compile --cross-prefix=$(TARGET)- \
	--disable-everything --disable-network \
	--enable-yasm --enable-zlib --enable-decoder=gsm \
	--enable-indev=alsa \
	--list-indevs \
	--enable-shared $(CPU_FFMPEG)

.PHONY: ffmpeg
ffmpeg: $(SRC)/$(FFMPEG)/README
	rm -rf $(TMP)/$(FFMPEG) && mkdir $(TMP)/$(FFMPEG) &&\
	cd $(TMP)/$(FFMPEG) &&\
	$(XPATH) $(SRC)/$(FFMPEG)/configure $(CFG_FFMPEG)
#	 &&\
#	$(MAKE)
#	 && $(INSTALL)-strip
