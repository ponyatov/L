#include "pack.hpp"

int main(){
	yylex();
	map<string,int>::iterator it;
//	cout<<"==============================\n";
//	cout<<"========== DIRS ==============\n";
//	cout<<"==============================\n";
	for (it=dirs.begin();it!=dirs.end();it++)
		cout<<it->first<<"\n";
//	cout<<"==============================\n";
//	cout<<"========= FILES ==============\n";
//	cout<<"==============================\n";
	for (it=files.begin();it!=files.end();it++)
		cout<<it->first<<"\n";
	return 0;
}
