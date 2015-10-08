#ifndef _H_WEATHER
#define _H_WEATHER

#define DAT "weather.dat"
#define API "api.openweathermap.org/data/2.5/forecast?q="

#include <iostream>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cassert>
using namespace std;

struct sym {
	string tag,value;
	sym(string,string);
	virtual string dump();
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
