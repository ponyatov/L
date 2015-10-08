#ifndef _H_WEATHER
#define _H_WEATHER

#include <iostream>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cassert>
using namespace std;

extern int yylex();
extern int yylineno;
extern char *yytext;
extern void yyerror(string);
extern int yyparse();
#include "weather.tab.hpp"

void W(char);
void W(string);

#endif // _H_WEATHER
