
CFG_SDL_MAIN =
CFG_SDL_IMAGE =
CFG_SDL_TTF =
CFG_SDL_SOUND = --prefix=$(TMP)/sdl_sound

# --disable-audio joystick assembly

.PHONY: sdl sdl_main sdl_image sdl_ttf sdl_sound
sdl: sdl_main sdl_image freetype sdl_ttf

sdl_main: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL_MAIN) &&\
	$(MAKE) && $(INSTALL) &&\
	mv -f $(ROOT)/bin/sdl-config $(TC)/bin/

sdl_image: $(SRC)/$(SDL_IMAGE)/README
	rm -rf $(TMP)/$(SDL_IMAGE) && mkdir $(TMP)/$(SDL_IMAGE) &&\
	cd $(TMP)/$(SDL_IMAGE) &&\
	$(XPATH) $(SRC)/$(SDL_IMAGE)/$(TCFG) $(CFG_SDL_IMAGE) &&\
	$(MAKE) && $(INSTALL)
	
sdl_ttf: $(SRC)/$(SDL_TTF)/README
	rm -rf $(TMP)/$(SDL_TTF) && mkdir $(TMP)/$(SDL_TTF) &&\
	cd $(TMP)/$(SDL_TTF) &&\
	$(XPATH) $(SRC)/$(SDL_TTF)/$(TCFG) $(CFG_SDL_TTF) &&\
	$(MAKE) && $(INSTALL)

sdl_sound: $(SRC)/$(SDL_SOUND)/README
	rm -rf $(TMP)/$(SDL_SOUND) && mkdir $(TMP)/$(SDL_SOUND) &&\
	cd $(TMP)/$(SDL_SOUND) &&\
	$(XPATH) $(SRC)/$(SDL_SOUND)/$(TCFG) $(CFG_SDL_SOUND) &&\
	$(MAKE) && $(INSTALL)-strip
	mv $(TMP)/sdl_sound/bin/* $(ROOT)/bin/
	mv $(TMP)/sdl_sound/include/SDL/* $(ROOT)/include/SDL/
	mv $(TMP)/sdl_sound/lib/* $(ROOT)/lib/
	rm -rf $(TMP)/sdl_sound
