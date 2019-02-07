#include <iostream>
#include <string>
#include <fstream>
#include "MaxHeap.h"
using namespace std;

void testfunction(){
	cout << "============First Constructor============" << endl;
	Element A[35];
	for (int i = 0; i < 35; i++){
		A[i].word = "Hello";
		A[i].weight = rand();
	}
	MaxHeap queue(35);
	cout << "============Insert============" << endl;
	for (int i = 0; i < 35; i++){
		queue.Insert(A[i]);
	}
	cout << "============Print Heap============" << endl;
	queue.PrintHeap();
	cout << "============Find Top Matches============" << endl;

	Element * top;
	top = queue.FindTopMatches(5);
	cout << "Top 5" << endl;
	for (int i = 0; i < 5; i++){
		cout << top[i].word << " , " << top[i].weight << endl;
	}
	cout << "============Delete Max============" << endl;
	Element max;
	max = queue.DeleteMax();
	cout << "Max:  " << max.word << "," << max.weight << endl << endl << endl;
	cout << "============Print Heap============" << endl;
	queue.PrintHeap();
	cout << "============Delete Max============" << endl;
	max = queue.DeleteMax();
	cout << "Max:  " << max.word << "," << max.weight << endl << endl << endl;
	cout << "============Print Heap============" << endl;

	queue.PrintHeap();

	top = queue.FindTopMatches(5);
	cout << "Top 5" << endl;
	for (int i = 0; i < 5; i++){
		cout << top[i].word << " , " << top[i].weight << endl;
	}

	Element B[20];
	for (int i = 0; i < 20; i++){
		B[i].word = "Hello";
		B[i].weight = rand();
	}

	cout << "============Merge Heap 2, Second Constructor============" << endl;
	MaxHeap queue2(B, 20, 20);
	queue2.PrintHeap();


	cout << "============Merge============" << endl;

	queue.Merge(queue2);
	queue.PrintHeap();



}



int main(){

	ifstream fin;
	fin.open("SortedWords.txt");
	string input;
	getline(fin, input);
	int words;
	words = stoi(input);

	int choice;
	do{

		cout << "-------What would you like to do?-------" << endl;
		cout << "1 = Run Autocomplete" << endl;
		cout << "2 = Test functions" << endl;
		cout << "3 = Quit Autocomplete" << endl;
		cin >> choice;
		switch (choice){
		case 1:
			
			break;
		case 2:
			testfunction();
			break;
	
		
		case 3: cout << "Goodbye!\n";
			break;
		default: cout << "That is not a valid choice. Please try again.\n";
		}
	} while (choice != 3);






	return 0;
}