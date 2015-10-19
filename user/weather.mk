GETAPI = wget -t 3 -T 5 -O /tmp/weather/openweather.api "api.openweathermap.org/data/2.5/forecast?q=Samara,RU&units=metric&appid=bd82977b86bf27fb59a04b61b657fb6f" 
.PHONY: go
go: ./weather /tmp/weather/openweather.api weather.plot
	./weather > weather.dat && gnuplot weather.plot
.PHONY: cronhost
cronhost: ./weather weather.plot
	mkdir -p /tmp/weather ; $(GETAPI)		
	./weather > weather.dat && gnuplot weather.plot
/tmp/weather/openweather.api:
	mkdir -p /tmp/weather ; $(GETAPI)		

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
