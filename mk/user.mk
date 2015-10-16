.PHONY: user
user:

# apps

.PHONY: hello
hello: $(USRBIN)/hello 

.PHONY: sdlrect
sdlrect: $(USRBIN)/sdl_rect 

.PHONY: cpptest
cpptest: $(USRBIN)/cpptest 

.PHONY: currency
currency: $(USRBIN)/currency 

# rules

TCFLAGS = -std=gnu99
TCXXFLAGS = 
TSDLFLAGS =  -lfreetype -lSDL -lSDL_ttf -lSDL_image -lSDL_gfx
# -lpthread   

$(USRBIN)/sdl%: user/sdl%.c mk/user.mk
	$(XPATH) $(TCC) $(TCFLAGS) -o $@ $< $(TSDLFLAGS) 

$(USRBIN)/%: user/%.c mk/user.mk
	$(XPATH) $(TCC) $(TCFLAGS) -o $@ $<

$(USRBIN)/%: user/%.cpp mk/user.mk
	$(XPATH) $(TCXX) $(TCXXFLAGS) -o $@ $<

$(USRBIN)/currency: \
	user/currency.ypp user/currency.lpp \
	user/currency.hpp user/currency.cpp
	cd user &&\
	flex currency.lpp && bison currency.ypp &&\
	$(XPATH) $(TCXX) $(TCXXFLAGS) -o $@ currency.cpp lex.yy.c currency.tab.cpp
