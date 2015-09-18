#include "pack.hpp"

int main(){
	yylex();
	map<string,int>::iterator it;
	// ========== DIRS ==============
	for (it=dirs.begin();it!=dirs.end();it++)
		cout<<it->first<<"\n";
	// ========== FILES =============
	for (it=files.begin();it!=files.end();it++)
		cout<<it->first<<"\n";
	return 0;
}
