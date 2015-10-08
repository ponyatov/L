.PHONY: go
go: ./weather
	./weather Samara,RU
C = weather.cpp lex.yy.c weather.tab.cpp
H = weather.hpp weather.tab.hpp
L = weather.lpp
Y = weather.ypp
./weather: $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
lex.yy.c: $(L)
	flex $<
weather.tab.cpp: $(Y)
	bison $<
