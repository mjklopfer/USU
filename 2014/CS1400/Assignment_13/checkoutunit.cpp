#include "unit.h"
#include "dww.h"
#include <iostream>
using namespace std;

bool testR(){
	dww w(5, 12, 4, up, knight, false, "npt");
	int r = w.getR();
	if (r>0&&r<ROWS-1){
		return true;
	}
	else{
		return false;
	}
}
bool testC(){
	dww w(5, 12, 4, up, knight, false, "npt");
	int c = w.getC();
	if (c >= 0 && c<COLS-1){
		return true;

	}
	else{
		return false;
	}
}
bool testHP(){
	dww w(5, 12, 4, up, knight, false, "npt");
	int h = w.getHp();
	if (h >=0){
		return true;
	}else{
	 return false;
}
 
 }
bool testDIR(){
	dww w(5, 12, 4, up, knight, false, "npt");
	Dir d = w.getDir();
	if (d == up || d == dn || d == lt || d == rt){ return true; }
	else{ return false; }
		
}
bool testRANK(){
	dww w(5, 12, 4, up, knight, false, "npt");
	Rank k = w.getRank();
	if (k == knight||k==archer||k==infantry||k==crown){
		return true;

	}
	else{ return false; }
}
bool testDEAD(){
	dww w(5, 12, 4, up, knight, false, "npt");
	int h = w.getHp();
	bool l = w.getDead();
	if (h == 0){
			if (l == true){ return true; }
			else{ return false; }
		}
		else if (h > 0){
			if (l = false){ return true; }
			else{
				return false;
			}
		}
		
	}
bool testPLACE(){
	dww w(5, 12, 4, up, knight, false, "npt");
	SitRep s;
	int i, j;
	for (i = 0; i<ROWS; ++i){
		for (j = 0; j<COLS; ++j){
			s.thing[i][j].what = rock;
		}
	}
	s.thing[12][12].what = space;
	s.nearestEnemyCrown.r = 25;
	s.nearestEnemyCrown.c = 25;
	s.nearestEnemyCrown.dirFor = up;
	s.nearestEnemy.r = 22;
	s.nearestEnemy.c = 22;
	s.nearestEnemy.dirFor = lt;
	s.anyOpenSpace = up;


	w.Place(9, 15, 9, 15, s);
	int r = w.getR();
	int c = w.getC();

	if (r == 12 && c == 12){
		return true;
	}
	else{
		return false;
	}
}
int main(){
	if (!testR()){ cout << "failed testR.\n"; exit(1); }
	if (!testC()){ cout << "failed testC.\n"; exit(1); }
	if (!testHP()){ cout << "failed testHP.\n"; exit(1); }
	if (!testDIR()){ cout << "failed testDIR.\n"; exit(1); }
	if (!testRANK()){ cout << "failed testRANK.\n"; exit(1); }
	if (!testDEAD()){ cout << "failed testDEAD.\n"; exit(1); }
	if (!testPLACE()){ cout << "failed testPLACE.\n"; exit(1); }
}