C = pack.cpp lex.yy.c 
#pack.tab.cpp
H = pack.hpp 
#pack.tab.hpp
./pack: $(C) $(H)
	$(CXX) -o $@ $(C)
pack.tab.cpp pack.tab.hpp: pack.ypp
	bison $<
lex.yy.c: pack.lpp
	flex $<
