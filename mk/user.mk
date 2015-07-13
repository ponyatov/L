.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

.PHONY: sdlrect
sdlrect: $(USRBIN)/sdl_rect 

.PHONY: cpptest
cpptest: $(USRBIN)/cpptest 

# rules

TCFLAGS = -std=gnu99
TCXXFLAGS = 
TSDLFLAGS =  -lfreetype -lSDL -lSDL_ttf -lSDL_image
#	   -lpthread   

$(USRBIN)/sdl%: user/sdl%.c mk/user.mk
	$(XPATH) $(TCC) $(TCFLAGS) -o $@ $< $(TSDLFLAGS) 

$(USRBIN)/%: user/%.c mk/user.mk
	$(XPATH) $(TCC) $(TCFLAGS) -o $@ $<

$(USRBIN)/%: user/%.cpp mk/user.mk
	$(XPATH) $(TCXX) $(TCXXFLAGS) -o $@ $<
