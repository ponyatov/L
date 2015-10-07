C = pack.cpp lex.yy.c 
H = pack.hpp
L = pack.lpp hwapp.lpp
./pack: $(C) $(H) $(L) Makefile
	flex -o hwapp.cpp hwapp.lpp &&\
	$(CXX) -o hwapp hwapp.cpp &&\
	./hwapp $(HW)$(APP) < pack.lpp |flex
	$(CXX) -o $@ $(C)
