#include "weather.hpp"

object::object(string T, string V) { tag=T; value=V; }
string object::head()	{ return "<"+tag+":"+value+">"; }
string object::pad(int n) { string S; for (int i=0;i<n;i++) S+="\t"; return S; }
string object::dump(int depth) {
	string S;
	S+="\n"+pad(depth)+head();
	for (vector<object*>::iterator it=nest.begin(); it != nest.end(); it++)
		S += (*it)->dump(depth+1);
	return S;
}
void object::join(object* o)	{ nest.push_back(o); }

int data_records=0;
string temper,humidity,pressure;

object* object::eval() {
	for (vector<object*>::iterator it=nest.begin(); it != nest.end(); it++)
		(*it)=(*it)->eval();
	if (tag=="pair" && nest[0]->tag=="sym") {
//		nest[0]->tag=nest[0]->value;
//		nest[0]->value=nest[1]->value;
		nest[0]->join(nest[1]);
		if (data_records<MAX_DATA_RECORDS) {
			if (nest[0]->value=="dt_txt") {
				cout << nest[1]->value;
				cout << "\t" << temper;
				cout << "\t" << humidity;
				cout << "\t" << pressure;
				cout << "\n";
				data_records++;
			}
			if (nest[0]->value=="temp")		temper=nest[1]->value;
			if (nest[0]->value=="humidity")	humidity=nest[1]->value;
			if (nest[0]->value=="pressure")	pressure=nest[1]->value;
		}
		nest.erase(nest.begin()+1);
		return nest[0];
	}
	return this;
}

void W(char    c)	{ cout << c ; }
void W(string  s)	{ cout <<  s ; }
void W(string *s)	{ cout << *s ; }
void W(object *o)	{ cout << o->dump(); }

void yyerror ( string msg ) {
	cerr << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	cout << "\n\n" << msg << " # " << yylineno << " : '" << yytext << "'\n\n";
	exit(-1);
}

int main(int argc, char *argv[]) {
	assert( yyin = fopen(DAT,"r") );
	return yyparse();
}
