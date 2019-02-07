#include "Graph.h"
#include <iostream>
#include <fstream>
using namespace std;


int main(){
	int x;
	int num;
	ifstream fin;
	fin.open("Assign9TopologicalInput.txt");
	fin >> num;
	int* M1;
	M1 = new int[num*num];

	for (int i = 0; i < num; i++){
		for (int j = 0; j < num; j++){
			fin >> x;
			M1[i*num + j] = x;

		}
	}
	fin.close();
	cout << "---Assign9TopologicalInput---" << endl;
	for (int i = 0; i < num; i++){
		for (int j = 0; j < num; j++){
			cout << M1[i*num + j] << " ";
		}
		cout << endl;
	}
	Graph g1(num);
	g1.SetAdjLists(M1);
	cout << "---Print Adj List---" << endl;

	g1.PrintAdjLists();
	g1.TopologicalSort();
	cout << "---Assign9ShortestPathInput---" << endl;

	fin.open("Assign9ShortestPathInput.txt");
	fin >> num;

	int* M2;
	M2 = new int[num*num];
	for (int i = 0; i < num; i++){
		for (int j = 0; j < num; j++){
			fin >> x;
			M2[i*num + j] = x;

		}
	}
	fin.close();
	for (int i = 0; i < num; i++){
		for (int j = 0; j < num; j++){
			cout << M2[i*num + j] << " ";
		}
		cout << endl;
	}
	Graph g2(num);
	g2.SetAdjLists(M2);
	cout << "---Print Adj List With Weight---" << endl;

	g2.PrintAdjListsWeight();
	g2.Dijkstra(0);
	cout << "---Shortest Path---" << endl;
	for (int i = 1; i < num; i++){
		g2.PrintShortestPath(0, i);
		cout << endl;
	}
	cout << "---Shortest Path Distance---" << endl;
	for (int i = 0; i < num; i++){
		cout << i << ": " << g2.GetShortestPathDis(i) << endl;
	}

	return 0;
}