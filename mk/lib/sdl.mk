CFG_SDL_MAIN = $(CFG_CPU) \
	--disable-audio \
	--disable-joystick
 
#	--disable-assembly \
#	--enable-video-fbcon

CFG_SDL_IMAGE = 

.PHONY: sdl
sdl: sdl_main

.PHONY: sdl_main
sdl_main: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL_MAIN) &&\
	$(XPATH) $(MAKE) install &&\
	mv -f $(ROOT)/bin/sdl-config $(TC)/bin/
#	mv -f $(ROOT)/share/aclocal $(TC)/share/
#	mv -f $(ROOT)/share/man/man3 $(TC)/share/man/

.PHONY: sdl_image
sdl_image: $(SRC)/$(SDL_IMAGE)/README
	rm -rf $(TMP)/$(SDL_IMAGE) && mkdir $(TMP)/$(SDL_IMAGE) &&\
	cd $(TMP)/$(SDL_IMAGE) &&\
	$(XPATH) $(SRC)/$(SDL_IMAGE)/$(TCFG) $(CFG_SDL_IMAGE)
	
##$(SRC)/$(SDL)/README-SDL.txt: 
##etc/README-SDL.txt:  
##	cp $< $@ && touch $@
