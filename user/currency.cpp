#include "currency.hpp"

void W(char    c)	{ cout << c ; }
void W(string  s)	{ cout <<  s ; }
void W(string *s)	{ cout << *s ; }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	exit(-1);
}

int main(int argc, char *argv[]) {
	assert(usd); assert(eur);			// check out files opened ok
	assert( yyin = fopen(DAT,"r") );	// process input data file
	return yyparse();
}
