#ifndef _H_WEATHER
#define _H_WEATHER

#define MAX_DATA_RECORDS 17

#define DAT "/tmp/weather/openweather.api"
//#define DAT "openweather.api"

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <map>
#include <vector>
using namespace std;

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

#endif // _H_WEATHER
