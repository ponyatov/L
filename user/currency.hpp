#ifndef _H_CURRENCY
#define _H_CURRENCY

#define DAT "/tmp/currency/yahooru"
#define USD "/tmp/currency/USD"
#define EUR "/tmp/currency/EUR"

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
#include "currency.tab.hpp"

void W(char);
void W(string);
void W(string*);
//void W(object*);

extern FILE *usd;
extern FILE *eur;

#endif // _H_CURRENCY
