//Nathan Tipton
//A01207112
// Section 601
#include <iostream>
#include <fstream>
#include <iomanip>


using namespace std;

//print top
void gameTop(int dScore, int dSave, int hSave, int hScore, int dieVal, int win, int loss, int hNum, int dNum){
	
	
	

	cout << "          Devil's Dice  " << "win/loss: " << win << "/" << loss;
	cout << "\n";
	
	cout << "   *Player*.....................*Devil*";
	cout << "\n";
	cout << "   ------------------------------------";
	cout << "\n";
	return;
}

//Player current score
void gameC1(int hScore,int hNum){
	cout << " ";
	if (hScore >= hNum&&hScore < hNum + 5){
		cout << hScore;
		cout << " >";

	}
	else{ cout << "    "; }
	return;
}

//player number line
void gameC2(int hNum){
	
	cout <<setw(3)<<right<<hNum;
	return;
}

//player saved score
void gameC3(int hSave,int hNum){
	
	if (hSave >= hNum&&hSave < hNum + 5){
		
			cout << " < ";
			cout << hSave;
			
		

	}
	else{ cout << "     "; }
	return;
}

//dice roll
void gameC4(int dieVal, int hNum){
	
	cout << "       ";
	if (hNum == 85) cout << "_____";
	else if (hNum == 80) cout << "| " << dieVal << " |";
	else if (hNum == 75) cout << "|___|";
	else cout << "     ";
		return;
}

//devil current score
void gameC5(int dScore, int dSave,int dNum){
	cout << "     ";
	if (dScore >= dNum&&dScore < dNum + 5){
		cout <<"  "<< dScore;
		cout << " > ";

	}
	else{ cout << "       "; }
	return;
}

//devil number line
void gameC6(int dNum){
	cout<<setw(3)<<left<<dNum;
}
	
//devil saved score
void gameC7(int dSave,int dNum){
	if (dSave >= dNum&&dSave < dNum + 5){
		
		cout << "< ";
		cout << dSave;
		

	}
	else{ cout << "     "; }
	return;
}
//game board
void gameScreen(int dScore, int dSave, int hSave, int hScore,int win, int loss, int hNum, int dNum,int dieVal){
	//top of game

	gameTop(dScore, dSave, hSave, hScore, dieVal, win, loss, hNum, dNum);
	// number columns
	for (hNum = 100; hNum >= 0; hNum -= 5) {
		dNum = hNum;
		gameC1(hScore, hNum);
		gameC2(hNum);
		gameC3(hSave, hNum);
		gameC4(dieVal, hNum);
		gameC5(dScore, dSave, dNum);
		gameC6(dNum);
		gameC7(dSave, dNum);


		cout << "\n";

	}
	return;

}



//player roll
int player(int dieVal,int hScore){
	hScore += dieVal;
	return hScore;

}
//player won
void won(int loss, int win){
	cout << "\nYOU BEAT THE DEVIL!!" << endl;
	++win;
	ofstream outputfile;
	outputfile.open("winlossrecord.txt");

		outputfile << win << endl;
		outputfile << loss << endl;
		outputfile.close();
	
	
}
//player lost
void lost(int loss, int win){
	cout << "\nTHE DEVIL BEAT YOU!!" << endl;
	++loss;
	ofstream outputfile;
	outputfile.open("winlossrecord.txt");

	outputfile << win<< endl;
	outputfile << loss << endl;
	outputfile.close();
	

}
//print menu
void PrintMenu(){
	cout << "Pass[p],Roll[r],Forfeit[f]";

	return;
}
//response
char GetResponse(){
	char c;
	while (true){
		
		cin >> c;
		
		if(c == 'p')break; 
		if(c == 'r')break; 
		if (c == 'f')break;
		
			
		
		cout << "Do not understand, Please try again ";
	}
	return c;
}
//devils turn
void devil(int dieVal, int &dScore, int &dSave){
	
	while (dScore <= 14){
		dieVal = rand() % 6 + 1;
		cout << "dieval= " << dieVal << "dScore="<<dScore<<"\n";
		if (dieVal > 1){

			dScore += dieVal;
			cout << "save\n";
		}
		else{
			dScore = 0;
			cout << "zero";
			break;
		}


	}

	dSave += dScore;
}
	

int main(){
	int dScore = 0;
	int dSave = 0;
	int dNum = 100;
	int hSave = 0;
	int hScore = 0;
	int hNum = 100;
	int dieVal = 1;
	int win = 0;
	int loss = 0;
	char action;
	
	while (true){
		ifstream inputfile;

		inputfile.open("winlossrecord.txt");
		inputfile >> win;
		inputfile >> loss;
		inputfile.close();
		

		gameScreen(dScore, dSave, hSave, hScore, win, loss, hNum, dNum, dieVal);
		char again;
		if (hSave >= 100){
			won(loss, win); cout << "Play again? y/n";
			cin >> again;
			if (again == 'y'){
				hSave = 0;
				hScore = 0;
				dSave = 0;
				dScore = 0;
			}
			else{
				cout << "Thanks for playing!!"<<endl;
				return 0;

			}
			
		}
		if (dSave >= 100){
			lost(loss, win); cout << "Play again? y/n";
			cin >> again;
			if (again == 'y'){
				hSave = 0;
				hScore = 0;
				dSave = 0;
				dScore = 0;
			}
			else{
				cout << "Thanks for playing!!" << endl;
				return 0;

			}
		}
				
		PrintMenu();
	
		action = GetResponse();
		
		if (action == 'f')break;
		if (action == 'r'){
			dieVal = rand() % 6 + 1;
			if (dieVal > 1){

				player(dieVal, hScore);
				hScore = player(dieVal, hScore);
			}
			else{
				hScore = 0;
				devil(dieVal, dScore, dSave);
			}



		}if (action == 'p'){
			hSave += hScore;
			hScore = 0;
			devil(dieVal, dScore, dSave);
		}

	}
	if (action == 'f'){
		cout << "\n You Forfeited!\n";
		lost(loss, win);
	}



		return 0;

}