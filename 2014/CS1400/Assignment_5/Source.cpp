//Nathan Tipton A01207112
//Section 601
#include <iostream>
using namespace std;

char userInput(){
	char input = 'y';
	cout << "\t\ts - report the machine status\n";
	cout << "\t\td - drop in a quarter\n";
	cout << "\t\t1 - pull the 1st knob\n";
	cout << "\t\t2 - pull the 2nd knob\n";
	cout << "\t\t3 - pull the 3rd knob\n";
	cout << "\t\t4 - pull the 4th knob\n";
	cout << "\t\tr - restock the machine\n";
	cout << "\t\tq - quit\n";

	while (true){
		cout << ">";
		cin >> input;
		if (input == 's') return input;
		if (input == 'd') return input;
		if (input == '1') return input;
		if (input == '2') return input;
		if (input == '3') return input;
		if (input == '4') return input;
		if (input == 'r') return input;
		if (input == 'q') return input;
		cout << "Invalid Input, Please Try Again\n";
	}
}
int main(){
	float money;
	int lucky, camel, gaul, pall;
	char input = 'x';
	lucky = 1;
	camel = 1;
	gaul = 1;
	pall = 1;
	money = 0;

	cout << "\t\t**ART-O-MAT VENDING**\n"<< endl;
	while (input != 'q'){
		input = userInput();
		switch (input){
		case 's':
			cout << "1 - " << lucky << " packs of Lucky Strikes\n";
			cout << "2 - " << camel << " packs of Camels\n";
			cout << "3 - " << gaul << " packs of Gauloises\n";
			cout << "4 - " << pall << " packs of Pall Malls\n";
			cout << "There is $" << money << " in the machine\n"<<endl;
			break;
		case 'd':
			cout << "ching\n";
			money=money+.25;
			break;
		case '1':
			if (lucky > 0){
				cout << "A package of Lucky Strikes slides into view\n"<<endl;
				lucky = lucky - 1;
			}
			else {
				cout << " ...nothing happened...\n" << endl;
			}
			break;
		case '2':
			if (camel > 0){
				cout << "A package of Camels slides into view\n" << endl;
				camel = camel - 1;
			}
			else {
				cout << " ...nothing happened...\n" << endl;
			}
			break;
		case '3':
			if (gaul > 0){
				cout << "A package of Gauloises slides into view\n" << endl;
				gaul = gaul - 1;
			}
			else {
				cout << " ...nothing happened...\n" << endl;
			}
			break;
		case '4':
			if (pall > 0){
				cout << "A package of Pall Malls slides into view\n" << endl;
				pall = pall - 1;
			}
			else {
				cout << " ...nothing happened...\n" << endl;
			}
			break;
		case 'r':
			cout << "machine has been restocked\n" << endl;
			lucky = 10;
			camel = 10;
			gaul = 10;
			pall = 10;
			money = 0;

			break;

		default:
			break;

		}






	}

	return 0;
}