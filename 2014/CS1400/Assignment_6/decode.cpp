//Nathan Tipton
//A01207112
//section 601
#include <iostream>
#include <fstream>
using namespace std;
int main(){
	ifstream fin;
	ofstream fout;
	char c;
	int x;

	fin.open("secretMessage.txt");
	fout.open("decodedMessage.txt");

	while (!fin.eof()){
		c = fin.get();
		x = c;
		if (x >= 97 && x <= 122){x += 13;
			if (x > 122) x = x - 26;
		}
		if (x >= 65 && x <= 90){x += 13;
			if (x > 90) x = x - 26;
		}
		c = x;

			if (!fin.eof())fout << c;
		
	
	}
	fin.close();
	fout.close(); 




	return 0;
}