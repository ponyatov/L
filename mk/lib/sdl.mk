CFG_SDL_MAIN = $(CFG_CPU) \
	--disable-audio \
	--disable-joystick
 
#	--disable-assembly \
#	--enable-video-fbcon

CFG_SDL_IMAGE =

CFG_SDL_TTF = 

.PHONY: sdl
sdl: sdl_main sdl_image freetype sdl_ttf

.PHONY: sdl_main
sdl_main: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL_MAIN) &&\
	$(MAKE) && $(INSTALL) &&\
	mv -f $(ROOT)/bin/sdl-config $(TC)/bin/

.PHONY: sdl_image
sdl_image: $(SRC)/$(SDL_IMAGE)/README
	rm -rf $(TMP)/$(SDL_IMAGE) && mkdir $(TMP)/$(SDL_IMAGE) &&\
	cd $(TMP)/$(SDL_IMAGE) &&\
	$(XPATH) $(SRC)/$(SDL_IMAGE)/$(TCFG) $(CFG_SDL_IMAGE) &&\
	$(MAKE) && $(INSTALL)
	
.PHONY: sdl_ttf
sdl_ttf: $(SRC)/$(SDL_TTF)/README
	rm -rf $(TMP)/$(SDL_TTF) && mkdir $(TMP)/$(SDL_TTF) &&\
	cd $(TMP)/$(SDL_TTF) &&\
	$(XPATH) $(SRC)/$(SDL_TTF)/$(TCFG) $(CFG_SDL_TTF) &&\
	$(MAKE) && $(INSTALL)
