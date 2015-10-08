#include "weather.hpp"

void W(char   c)	{ cout << c ; }
void W(string s)	{ cout << s ; }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	exit(-1);
}

int main() { return yyparse(); }
