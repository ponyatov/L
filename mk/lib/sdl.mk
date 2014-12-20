CFG_SDL = $(CFG_CPU) \
	--disable-audio \
	--disable-joystick
 
#	--disable-assembly \
#	--enable-video-fbcon

.PHONY: sdl
sdl: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL) &&\
	$(XPATH) $(MAKE) install &&\
	mv $(ROOT)/share/aclocal $(TC)/share/
	mv $(ROOT)/share/man/man3 $(TC)/share/man/
	mv $(ROOT)/bin/sdl-config $(TC)/bin/

##$(SRC)/$(SDL)/README-SDL.txt: 
##etc/README-SDL.txt:  
##	cp $< $@ && touch $@
