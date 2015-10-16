.PHONY: go
go: ./weather /tmp/weather/openweather.api weather.plot
	./weather > weather.log && gnuplot weather.plot
/tmp/weather/openweather.api:
	../etc/weather.rc	
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
