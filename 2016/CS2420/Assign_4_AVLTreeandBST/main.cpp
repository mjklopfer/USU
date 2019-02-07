#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <cstring>
#include "AVLTree.h"
#include "BSTree.h"

using namespace std;


int main(){
	
	AvlTree mytree;
	BSTree bmytree;
	AvlTree dtree;
	BSTree bdtree;
	string operation;
	string input;
	ifstream fin;
	fin.open("hw4_input.txt");
	while (!fin.eof()){
		fin >> operation >> input;
		//cout << operation << " " << input << endl;
		if (operation == "insert"){

			mytree.Insert(input);
			bmytree.Insert(input);
		}
		else if (operation == "remove"){
			mytree.Delete(input);
			bmytree.Delete(input);
		}
	}
	fin.close();
	string descend;
	descend = mytree.Traverse();
	cout << endl;

	cout << "The descending traversal list is:" << endl;
	cout << descend << endl;
	cout << "The word in the root is:" << mytree.GetRoot() << endl;
	cout << "The height of the tree is:" << mytree.Height() << endl;
	cout << "The number of nodes in the tree is:" << mytree.Size() << endl;
	cout << "The number of the nodes with two children is:" << mytree.CountTwoChildren() << endl;
	cout << "The number of the nodes with one child is:" << mytree.CountOneChild() << endl;
	cout << "The number of leaf nodes is:" << mytree.CountLeaves() << endl;

	cout << "---BST---" << endl;
	descend = bmytree.Traverse();
	cout << endl;

	cout << "The descending traversal list is:" << endl;
	cout << descend << endl;
	cout << "The word in the root is:" << bmytree.GetRoot() << endl;
	cout << "The height of the tree is:" << bmytree.Height() << endl;
	cout << "The number of nodes in the tree is:" << bmytree.Size() << endl;
	cout << "The number of the nodes with two children is:" << bmytree.CountTwoChildren() << endl;
	cout << "The number of the nodes with one child is:" << bmytree.CountOneChild() << endl;
	cout << "The number of leaf nodes is:" << bmytree.CountLeaves() << endl;
	
	string dword;
	vector<string> dictionary;
	
	fin.open("dictionary.txt");
	while (!fin.eof()){

		fin >> dword;
		dictionary.push_back(dword);
	};
	fin.close();
	random_shuffle(dictionary.begin(), dictionary.end());

	for (int i = 0; i < 10; i++){
		dtree.Insert(dictionary[i]);
		bdtree.Insert(dictionary[i]);
		cout << dictionary[i] << endl;
	};
	
	AvlTree letter;
	BSTree bletter;
	for (int i = 0; i<dictionary.size(); i++){
		letter.Insert(dictionary[i]);
		bletter.Insert(dictionary[i]);

	}
	int avgavt=0;
	int avgbst=0;
	int wordtotal = 0;
	int size;
	size = letter.Size();
	cout << "Size= " << size << endl;
	cout << "max Height: " << letter.Height() << endl;
	cout << endl;
	cout << "--Misspelled words in letter --" << endl;
	string lword;
	fin.open("letter.txt");
	while (!fin.eof()){
		fin >> lword;
		for (int i = 0; lword[i]; i++){
			lword[i] = tolower(lword[i]);

		}
		if (!letter.Find(lword)){
			wordtotal++;
			int avlcomp;
			int bstcomp;
			avlcomp = letter.FindComparisons(lword);
			bstcomp = bletter.FindComparisons(lword);
			avgavt += avlcomp;
			avgbst += bstcomp;
				cout << lword << " AVLTree: " << avlcomp << " BSTree: " << bstcomp << endl;
		}


	}
	cout << "Word in root of BST: " << bdtree.GetRoot() << " AVL: " << dtree.GetRoot() << endl;
	cout << "Size of BST: " << bdtree.Size() << " AVL: " << dtree.Size() << endl;
	cout << "Height of BST: " << bdtree.Height() << " AVL: "<<dtree.Height() << endl;
	cout << "Number of nodes with two children BST: " << bdtree.CountTwoChildren() << " AVL: " << dtree.CountTwoChildren() << endl;
	cout << "Number of nodes with one child BST: " << bdtree.CountOneChild() << " AVL: " << dtree.CountOneChild() << endl;
	cout << "Number of leaf nodes BST: " << bdtree.CountLeaves() << " AVL: " << dtree.CountLeaves() << endl;
	cout << "Number of comparisons performed BST: " << avgbst << " AVL: " << avgavt << endl;
	cout << "Average number of comparisons BST: " << (avgbst / wordtotal) << " AVL: " << (avgavt / wordtotal) << endl;


	return 0;
}