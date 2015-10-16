#include "currency.hpp"

void W(char    c)	{ cout << c ; }
void W(string  s)	{ cout <<  s ; }
void W(string *s)	{ cout << *s ; }
//void W(object *o)	{ cout << o->dump(); }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	exit(-1);
}

FILE *usd;
FILE *eur;

int main(int argc, char *argv[]) {
	assert( usd=fopen(USD,"w"));
	assert( eur=fopen(EUR,"w"));
	assert( yyin = fopen(DAT,"r") );
	return yyparse();
}
