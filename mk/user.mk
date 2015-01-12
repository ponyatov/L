.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

.PHONY: sdlrect
sdlrect: $(USRBIN)/sdlrect 

# rules

$(USRBIN)/sdl%: user/sdl%.c mk/user.mk
	$(XPATH) $(TCC) -o $@ $< -lpthread
#	-lSDL
#	-lpthread 
$(USRBIN)/%: user/%.c mk/user.mk
	$(XPATH) $(TCC) -O2 -o $@ $<
#	&& $(STRIP) $@

