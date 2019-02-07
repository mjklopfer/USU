//Nathan Tipton
//A01207112
// Section 601
#include <iostream>
using namespace std;
int main(){
	char x;
	int legs, option;
	cout << "Should you squish the bug?\n";


	cout << "Is it freaking you out?\n";
	cin >> x;

	if (x == 'y' || x == 'Y'){
		cout << "Does it bite or suck blood?\n";
		cin >> x;

		if (x == 'y' || x == 'Y'){
			cout << "Will it make an unfortunate noise or mess if squished?\n";
			cin >> x;
			if (x == 'y' || x == 'Y'){
				cout << "Put it in a cup or flush it down the toilet.\n";
			}
			else{
				cout << "Will you feel bad if you squish it?\n";
				cin >> x;
				if (x == 'y' || x == 'Y'){
					cout << "Put it in a cup or flush it down the toilet.\n";
				}
				else{
					cout << "Squish!\n";
				}

			}
		}else{

			cout << "How many legs?\n";
			cin >> legs;
			if (legs == 0){
				cout << "Leave the poor thing alone\n";
			}else{
				if (legs <= 7){
					cout << "Does it hiss?\n";
					cin >> x;
					if (x == 'y' || x == 'Y'){
						cout << "Squish!\n";
					}
					else{
						cout << "Is it a ladybug or a praying mantis?\n";
							cin >> x;
							if (x == 'y' || x == 'Y'){
								cout << "Put it in a cup and take it outside\n";
							}
							else{
								cout << "Do you believe in reincarnation?\n";
								cin >> x;
								if (x == 'y' || x == 'Y'){
									cout << "Put it in a cup and take it outside\n";
								}
								else{
									cout << "Squish!\n";
								}


							}

					}

				}
				else{
					cout << "Is it a caterpillar?\n";
					cin >> x;
					if (x == 'y' || x == 'Y'){
						cout << "Make a nice home for it in a shoebox?\n";
					}
					else{
						cout << "Has it spelled out words in a web?\n";
						cin >> x;
						if (x == 'y' || x == 'Y'){
							cout << "Some bug!\n";
						}
						else{
							cout << "Squish!\n";
						}
					}


				}
			}
		}
			
	}
	else{
		cout << "Why not? 1 or 2?\n";
		cout << "1. I'm an entomologist.\n";
		cout << "2. I'm nine.\n";
		cin >> option;
		if (option == 1){
			cout << "Cool. Don't look over there. <---\n";
		}
		else{
			cout << "Put it in a cup and freak someone out with it.\n";
		}

		


	}
	return 0;
}