#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <cstring>
#include "BSTree.h"

using namespace std;


int main(){
	BSTree tree;
	string dword;
	vector<string> dictionary;
	ifstream fin;
	fin.open("dictionary.txt");
	while (!fin.eof()){
		
		getline(fin, dword);
		dictionary.push_back(dword);
	};
	fin.close();
	random_shuffle(dictionary.begin(), dictionary.end());

	for (int i = 0; i < 10; i++){
		tree.Insert(dictionary[i]);
		cout << dictionary[i] << endl;
	};
	
	cout << endl;
	tree.Traverse();

	tree.Delete("viruses");
	tree.Traverse();
	tree.Insert("viruses");
	tree.Traverse();
	cout << endl;
	bool search;

	search = tree.Find("viruses");
	cout << "viruses " << search << endl;
	search = tree.Find("costs");
	cout << "costs " << search << endl;
	search = tree.Find("cost's");
	cout << "cost's " << search << endl;
	search = tree.Find("lurks");
	cout << "lurks " << search << endl;
	int size;

	size = tree.Size();
	cout << "Size= " << size << endl;
	cout << "max Height: " << tree.Height() << endl;

   BSTree letter;
	for (int i=0; i<dictionary.size(); i++){
		letter.Insert(dictionary[i]);

	}
	size = letter.Size();
	cout << "Size= " << size << endl;
	cout << "max Height: " << letter.Height() << endl;
	cout << endl;
	cout << "--Misspelled words in letter--" << endl;
	string lword;
	fin.open("letter.txt");
	while (!fin.eof()){
		fin >> lword;
		for (int i = 0; lword[i]; i++){
			lword[i] = tolower(lword[i]);
			
		}
		if (!letter.Find(lword)){
			cout << lword << endl;
		}


	}
	

	





	return 0;
}