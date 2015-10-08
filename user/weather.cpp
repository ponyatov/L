#include "weather.hpp"

sym::sym(string T, string V)	{ tag=T; value=V; }
void sym::join(sym* o)			{ nest.push_back(o); }
string sym::tagval()			{ return "<"+tag+":"+value+">"; }
string sym::pad(int n)			{ string S; for (int i=0;i<n;i++) S+="\t"; return S; }
string sym::dump(int depth)		{
	string S = "\n"+pad(depth)+tagval();
	for (vector<sym*>::iterator it=nest.begin(); it!=nest.end(); it++)
		S+=(*it)->dump(depth+1);
	return S;
}

void W(char    c)	{ cout << c ; }
void W(string  s)	{ cout <<  s ; }
void W(string *s)	{ cout << *s ; }
void W(sym    *o)	{ cout << o->dump(); }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : " << yytext << "\n\n";
	exit(-1);
}

int main(int argc, char *argv[]) {
	if (argc==2) {
		ostringstream os; os << "wget -O " << DAT << " " << API << argv[1];
		assert( system(os.str().c_str()) ==0);
	}
	assert( yyin = fopen(DAT,"r") );
	//		cerr<<"set terminal png size 320,240\n";
	//		cerr<<"set output 'weather.png'\n";
	cerr << "set xdata time\n";
	cerr << "set timefmt '\"%Y-%m-%d %H:%M:%S\"'\n";
	cerr << "set format x \"%d/%H\"\n";
	yyparse();
	cerr << "pause -1\n";
	return 0;
}
