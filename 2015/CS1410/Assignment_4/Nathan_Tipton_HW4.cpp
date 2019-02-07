#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <sstream>
#include <istream>
using namespace std;
ifstream nMap;
char* ToUpper(char *str) {
	int length = strlen(str);
	char *newstr = new char[length + 1];
	for (int i = 0; i < length; i++) {
		if (str[i] >= 'a' && str[i] <= 'z')
			newstr[i] = str[i] - 32;
		else
			newstr[i] = str[i];
	}
	newstr[length] = 0;
	return newstr;
}
int moveRobot(int spaces){

	return spaces;
}
class RobotGame{
	char**Board;
	int nRow, nCol;
	int rRow, rCol;
	int direction;
	int goldscore, diamondscore;

public:
	RobotGame(){};
	RobotGame(char* map){
		ifstream nMap(map);
		if (nMap.is_open()) {
			cout << "file open." << endl;
			char* file;
			file = new char[50];

			nMap >> file;
			nMap >> nRow;
			nMap >> nCol;
			cout << file << endl;
			cout << nRow <<" "<<nCol<<endl;
			
			Board = new char*[nRow];
			for (int i = 0; i < nRow; i++){
				Board[i] = new char[nCol];
				nMap >> file;
				loadRow(i, file);
			}
			nMap >> file;
			nMap >> rRow;
			nMap >> rCol;
			nMap >> file;
			cout << "The Robot is facing " << file << " at " << rRow << "," << rCol << endl;
			
			delete file;
		};
		
	}
	~RobotGame(){
		for (int i = 0; i < nRow; i++)
			delete[]Board[i];
		delete[] Board;

	}
	int direct(char* str){
		int compass;
		char* direction = ToUpper(str);
		if (direction == "NORTH"){ compass = 0; }
		else if (direction == "SOUTH"){ compass = 4; }
		else if (direction == "EAST"){ compass = 2; }
		else if (direction == "WEST"){ compass = 6; }
		else if (direction == "NORTH-WEST"){ compass = 7; }
		else if (direction == "NORTH-EAST"){ compass = 1; }
		else if (direction == "SOUTH-WEST"){ compass = 5; }
		else if (direction == "SOUTH-EAST"){ compass = 3; }
		delete direction;
		return compass;
	}
	void loadRow(int row, char*str){
		for (int i = 0; i < nCol; i++){
			Board[row][i] = str[i];
		}
	}
	
	void rotateRobot(float degrees){
		
		int change;
		if (fmod(degrees, 45) == 0){
			if (degrees < 0){degrees = fmod(degrees, 360) + 360; }
			change=degrees / 45;
			direction += change;
			direction = direction % 8;
			
		}
		else cout << "Error: Not divisible by 45";
	
	}

	void pickup(){
		int i = nRow;
		int j = nCol;
		if (Board[i][j] == 'D'){ diamondscore++; Board[i][j] = '_'; }
		else if (Board[i][j] == 'G'){ goldscore++; Board[i][j] = '_'; }
		else cout << "Error: Nothing at this location to pickup" << endl;
			
				
	}
	void execute(){
		char* file;
		file = new char[50];
		nMap >> file;  
		char* command;
		for (;;){
			command = ToUpper(file);
			if (command == "MOVE"){
				int move;
				int amove;
				nMap >> move;
				amove = moveRobot(move);
				cout << "Command: Move " << move << "space to the" << "direction"<<endl;
				if (amove < move){ cout << "Robot hit a wall." << endl; }
			}
			else if (command == "ROTATE"){
				float angle;
				nMap >> angle;
				rotateRobot(angle);
				cout << "Command: Rotate robot " << angle << " degrees"<<endl;
			}
			else if (command == "PICKUP"){
				pickup();
				cout << "Command: Pickup" << endl;
			}
			else if (command == "QUIT"){
				cout << "Thanks for playing" << endl;
				break; }
			else cout << "INVALID COMMAND" << endl;
			displaymap();
			nMap >> file;
			command = ToUpper(file);

		}
		delete file;
		
		
	}

	void displaymap(){
		int goldcount=0;
		int diamondcount=0;
		cout << "Board is:" << endl;
		cout << " ";
		for (int i = 0; i < nRow; i++){ cout << " " << i; }
		cout << endl;
		
		for (int i = 0; i < nRow; i++){
			cout << i << "|";
			for (int j = 0; j < nCol; j++){
				if (Board[i][j] == 'G'){ goldcount++; }
				if (Board[i][j] == 'D'){ diamondcount++; }
				if (i == rRow&&j == rCol){ cout << 'R' << " "; }
				else cout << Board[i][j] << " ";

			}
			cout << endl;
			
		}
		cout << "Gold Left: " << goldcount << " " << "Diamonds Left: " << diamondcount << " " << "Gold Picked Up: " << goldscore <<" "<< "Diamonds Picked Up: " << diamondscore << endl;
		/* This method is to output the gameboard and results to the screen. The game board should be 2 dimensional. */
	
	};
};


int main(int argc, char* args[]){

	if (argc == 0){ cout << "No arguments were given"; }

	RobotGame robot("Text.txt");
	robot.displaymap();
	robot.execute();


return 0;
}




