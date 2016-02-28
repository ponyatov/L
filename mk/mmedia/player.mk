CFG_MPLAYER = --enable-cross-compile --cc="$(TCC)" --target=$(TARGET) \
--mandir=$(TMP)/man \
--prefix=$(TMP)/mplayer --disable-inet6 
#--with-system-ffmpeg

.PHONY: mplayer
mplayer: $(SRC)/$(MPLAYER)/README
	rm -rf $(TMP)/$(MPLAYER) && mkdir $(TMP)/$(MPLAYER) &&\
	cd $(TMP)/$(MPLAYER) &&\
	$(XPATH) $(SRC)/$(MPLAYER)/configure $(CFG_MPLAYER) && $(MAKE)
