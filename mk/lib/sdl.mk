CFG_SDL = 

.PHONY: sdl
sdl: $(SRC)/$(SDL)/README
	rm -rf $(TMP)/$(SDL) && mkdir $(TMP)/$(SDL) &&\
	cd $(TMP)/$(SDL) &&\
	$(XPATH) $(SRC)/$(SDL)/$(TCFG) $(CFG_SDL)

#--disable-nls --disable-shared \
#	--build=$(BUILD) --host=$(TARGET) --prefix=$(ROOT)/sdl \
#	CC="$(CPU)-gcc" \
#	CROSS_COMPILE=$(TARGET)-

##	$(XPATH) $(SRC)/$(SDL)/configure $(CFG_SDL) 
##		 --host=$(TARGET) --target=$(TARGET) \
##		 -static"
##	$(SRC)/$(SDL)/$(TCFG) $(CFG_SDL)
#	
#
##$(SRC)/$(SDL)/README-SDL.txt: 
##etc/README-SDL.txt:  
##	cp $< $@ && touch $@
