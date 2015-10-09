#ifndef _H_WEATHER
#define _H_WEATHER

#define DAT "/tmp/weather/openweather.api"

#include <iostream>
//#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <map>
#include <vector>
using namespace std;

struct sym {
	string tag,value;
	sym(string,string);
	vector<sym*> nest;
	void join(sym*);
	virtual string dump(int depth=0);
	string tagval();
	string pad(int);
};

extern int yylex();
extern int yylineno;
extern char *yytext;
extern FILE *yyin;
extern void yyerror(string);
extern int yyparse();
#include "weather.tab.hpp"

void W(char);
void W(string);
void W(string*);
void W(sym*);

#endif // _H_WEATHER