#include <iostream>
#include "Set.h"

using namespace std;

int main() {
	Set L_List;
	Set L_List2;
	Set L_List3;
	Set L_List4;
	Set L_List5;
	Set L_List6;
	
	L_List.Insert(1);
	L_List.Insert(2);
	L_List.Insert(3);
	L_List.Insert(4);
	L_List.Insert(5);
	L_List.Insert(6);
	L_List2.Insert(1);
	L_List2.Insert(7);
	L_List2.Insert(8);
	L_List2.Insert(9);
	L_List2.Insert(2);
	L_List2.Insert(10);
	L_List2.Insert(11);
	L_List4.Insert(7);
	L_List4.Insert(8);
	L_List4.Insert(9);
	
	cout << "Set1" << endl;
	L_List.Print();
	cout << "Set2" << endl;
	L_List2.Print();
	cout << "Set1+Set2" << endl;
	L_List3 = L_List + L_List2;
	L_List3.Print();
	cout << "Set1<Set2" << endl;
	bool subset;
	subset = L_List < L_List2;
	cout << "Subset= "<<subset << endl;
	cout << "Set4<Set2" << endl;
	subset = L_List4 < L_List2;
	cout << "Subset= " << subset << endl;
	cout << "Set1^Set2" << endl;
	L_List5 = L_List^L_List2;
	L_List5.Print();
	cout << "Set1-Set2" << endl;
	L_List6 = L_List - L_List2;
	L_List6.Print();
	cout << "Index of Set[]" << endl;
	cout << "Set1[1]= " << L_List[1] << endl;
	cout << "Set2[1]= " << L_List2[1] << endl;
	cout << "Set3[1]= " << L_List3[1] << endl;
	cout << "Set4[1]= " << L_List4[1] << endl;
	cout << "Set5[1]= " << L_List5[1] << endl;
	L_List.Delete(1);
	L_List.Print();
	Set L_List7(L_List2);
	
	subset = L_List7 < L_List2;
	cout << "Subset= " << subset << endl;
	L_List7.Delete(2);
	L_List7.Print();
	L_List2.Print();
	subset = L_List7 < L_List2;
	cout << "Subset= " << subset << endl;


	

	
	
	

	














	return 0;
}