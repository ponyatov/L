C = pack.cpp lex.yy.c 
H = pack.hpp
L = pack.lpp hwapp.lpp
.PHONY: ./pack
./pack: $(C) $(H) Makefile
	$(CXX) -o $@ $(C)
lex.yy.c: $(L)
	flex -o hwapp.cpp hwapp.lpp &&\
	$(CXX) -o hwapp hwapp.cpp &&\
	./hwapp $(HW)$(APP) < pack.lpp |flex
	