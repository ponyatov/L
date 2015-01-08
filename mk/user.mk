.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

.PHONY: sdlrect
sdlrect: $(USRBIN)/sdlrect 

# rules

$(USRBIN)/sdl%: user/sdl%.c mk/user.mk
	$(XPATH) $(TCC) -O2 -o $@ $< -lSDL -lSDLmain 
$(USRBIN)/%: user/%.c mk/user.mk
	$(XPATH) $(TCC) -O2 -o $@ $<
#	&& $(STRIP) $@

