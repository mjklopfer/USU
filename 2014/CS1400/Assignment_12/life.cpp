

#include <iostream>
#include "life.h"


using namespace std;


int neighbors(const bool, int, int);

int neighbors(const bool current[ROWS][COLS], int i, int j){

	int numneighbors=0;
	if (i == 0 && j == 0){
		if (current[i][j + 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;
		if (current[i + 1][j + 1] == true)numneighbors += 1;
	}
	else if (i == 0 && j == COLS-1){
		if (current[i][j - 1] == true)numneighbors += 1;
		if (current[i + 1][j - 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;

	}
	else if (i == ROWS-1 && j == 0){
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i - 1][j + 1] == true)numneighbors += 1;
		if (current[i][j + 1] == true)numneighbors += 1;
	}
	else if (i == ROWS-1 && j == COLS-1){
		if (current[i - 1][j - 1] == true)numneighbors += 1;
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i][j - 1] == true)numneighbors += 1;

	}
	else if (i == 0){
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i - 1][j + 1] == true)numneighbors += 1;
		if (current[i][j + 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;
		if (current[i + 1][j + 1] == true)numneighbors += 1;

	}
	else if (j == 0){

		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i - 1][j + 1] == true)numneighbors += 1;
		if (current[i][j + 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;
		if (current[i + 1][j + 1] == true)numneighbors += 1;
	}
	else if (j == COLS-1){
		if (current[i - 1][j - 1] == true)numneighbors += 1;
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i][j - 1] == true)numneighbors += 1;
		if (current[i + 1][j - 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;

	}

	else if (i == ROWS-1){
		if (current[i - 1][j - 1] == true)numneighbors += 1;
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i - 1][j + 1] == true)numneighbors += 1;
		if (current[i][j - 1] == true)numneighbors += 1;
		if (current[i][j + 1] == true)numneighbors += 1;
	}
	else {
		if (current[i - 1][j - 1] == true)numneighbors += 1;
		if (current[i - 1][j] == true)numneighbors += 1;
		if (current[i - 1][j + 1] == true)numneighbors += 1;
		if (current[i][j - 1] == true)numneighbors += 1;
		if (current[i][j + 1] == true)numneighbors += 1;
		if (current[i + 1][j - 1] == true)numneighbors += 1;
		if (current[i + 1][j] == true)numneighbors += 1;
		if (current[i + 1][j + 1] == true)numneighbors += 1;

	}
	return numneighbors;

}
void life(const bool current[ROWS][COLS], bool next[ROWS][COLS]){
	int numneighbors=0;
	
	for (int i = 0; i < ROWS; ++i){
		for (int j = 0; j < COLS; ++j){
			numneighbors=neighbors(current, i, j);
			if (current[i][j] == true && numneighbors < 2)next[i][j] = false;
			else if ((current[i][j] == true && numneighbors == 3) ||( current[i][j] == true && numneighbors == 2))next[i][j] =true;
			else if (current[i][j] == true && numneighbors > 3)next[i][j] = false;
			else if (current[i][j] == false && numneighbors == 3)next[i][j] = true;
			else next[i][j] = false;
		}
	}
	return;
}