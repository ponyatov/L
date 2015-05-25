#include <iostream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

int main(int argc, char *argv[]) {
	printf("\n[%s]\n",argv[0]);
	cout << endl << "argv[0]" << endl;
	cout << endl << argv[0] << endl;
	cout.flush();
	return 0;
}
