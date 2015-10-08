#include "weather.hpp"

#define DAT "weather.dat"
#define API "api.openweathermap.org/data/2.5/forecast?q="

void W(char   c)	{ cout << c ; }
void W(string s)	{ cout << s ; }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	exit(-1);
}

int main(int argc, char *argv[]) {
	assert(argc==2);
	ostringstream os; os << "wget -q -O " << DAT << " " << API << argv[1];
	system(os.str().c_str());
	//return yyparse();
	return 0;
}
