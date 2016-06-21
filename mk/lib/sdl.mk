
CFG_SDL_MAIN = --disable-joystick $(CFG_CPU_LIBS)
CFG_SDL_IMAGE =
CFG_SDL_TTF =
CFG_SDL_GFX = $(CFG_CPU_LIBS)
CFG_SDL_SOUND = --prefix=$(TMP)/sdl_sound

# --disable-audio joystick assembly

.PHONY: sdl sdl_main sdl_image sdl_ttf sdl_sound
sdl: sdl_main sdl_image freetype sdl_ttf sdl_gfx

sdl_main: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL_MAIN) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(SDL),$@,install) &&\
	mv -f $(ROOT)/bin/sdl-config $(TC)/bin/

sdl_image: $(SRC)/$(SDL_IMAGE)/README
	rm -rf $(TMP)/$(SDL_IMAGE) && mkdir $(TMP)/$(SDL_IMAGE) &&\
	cd $(TMP)/$(SDL_IMAGE) &&\
	$(XPATH) $(SRC)/$(SDL_IMAGE)/$(TCFG) $(CFG_SDL_IMAGE) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(SDL_IMAGE),$@,install)
	
sdl_ttf: $(SRC)/$(SDL_TTF)/README
	rm -rf $(TMP)/$(SDL_TTF) && mkdir $(TMP)/$(SDL_TTF) &&\
	cd $(TMP)/$(SDL_TTF) &&\
	$(XPATH) $(SRC)/$(SDL_TTF)/$(TCFG) $(CFG_SDL_TTF) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(SDL_TTF),$@,install)

sdl_gfx: $(SRC)/$(SDL_GFX)/README
	rm -rf $(TMP)/$(SDL_GFX) && mkdir $(TMP)/$(SDL_GFX) &&\
	cd $(TMP)/$(SDL_GFX) &&\
	$(XPATH) $(SRC)/$(SDL_GFX)/$(TCFG) $(CFG_SDL_GFX) &&\
	$(MAKE) && $(call INSTPACK,$(TMP)/$(SDL_GFX),$@,install)

WGETWAVS = $(WGET) -P $(ROOT)/share/sounds 
sdl_sound: $(SRC)/$(SDL_SOUND)/README
	rm -rf $(TMP)/$(SDL_SOUND) && mkdir $(TMP)/$(SDL_SOUND) &&\
	cd $(TMP)/$(SDL_SOUND) &&\
	$(XPATH) $(SRC)/$(SDL_SOUND)/$(TCFG) $(CFG_SDL_SOUND) &&\
	$(MAKE) && $(INSTALL)-strip
	mv $(TMP)/sdl_sound/bin/* $(ROOT)/bin/
	mv $(TMP)/sdl_sound/include/SDL/* $(ROOT)/include/SDL/
	mv $(TMP)/sdl_sound/lib/* $(ROOT)/lib/
	rm -rf $(TMP)/sdl_sound
	mkdir -p $(ROOT)/share/sounds
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/12345adpcm.wav
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/12345gsm.wav
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/choko.mod
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/grateful-dead-02281969-intro.shn
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/leak.aiff
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/piratespenzmodmajgenral.mid
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/psychoex_01.mp3
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/psychoex_02.mp3
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/samp.ogg
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/trainwht.au
	$(WGETWAVS) https://www.icculus.org/SDL_sound/downloads/example_sounds/zakk-interview.spx
