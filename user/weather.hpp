#ifndef _H_WEATHER
#define _H_WEATHER

#define MAX_DATA_RECORDS 16

#define DAT "/tmp/weather/openweather.api"
//#define DAT "../share/weather/openweather.api"

#include <iostream>
//#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cassert>
#include <map>
#include <vector>
using namespace std;

struct object {
	string tag,value;
	object(string,string);
	vector<object*> nest;
	void join(object*);
	string pad(int);
	string head();
	string dump(int depth=0);
	object* eval();
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
void W(object*);

#endif // _H_WEATHER
