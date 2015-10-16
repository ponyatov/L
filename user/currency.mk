.PHONY: go
go: ./currency /tmp/currency/yahooru
#	wget -t 3 -T 5 -O /tmp/currency/yahooru "https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
	./currency < /tmp/currency/yahooru > currency.log 
C = currency.cpp lex.yy.c currency.tab.cpp
H = currency.hpp currency.tab.hpp
L = currency.lpp
Y = currency.ypp
./currency: $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
lex.yy.c: $(L)
	flex $<
currency.tab.cpp: $(Y)
	bison $<
