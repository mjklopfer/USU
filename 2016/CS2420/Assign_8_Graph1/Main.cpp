#include <iostream>
#include<fstream>
#include "BFSGraph.h"
#include "DFSGraph.h"
using namespace std;


int main()
{
	int x;
	int num;
	ifstream fin;
	fin.open("Assign8BFSInput.txt");
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
	for (int i = 0; i < num; i++){
		for (int j = 0; j < num; j++){
			cout<< M1[i*num + j]<<" ";
		}
		cout << endl;
	}
	BFSGraph bfs(num);
	bfs.SetAdjLists(M1);
	cout << "---Adjacent Lists---" << endl;
	bfs.PrintAdjLists();
	cout << "---BFS Traversal---" << endl;
	bfs.BFS();
	cout << endl;
	cout << "---Shortest Path and Distance---" << endl;
	for (int i = 1; i < num; i++){
		bfs.PrintSP(0, i);
		cout << endl;
	}

	cout << "-----DFS GRAPH-----" << endl;
	
	fin.open("Assign8DFSInput.txt");
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
	DFSGraph dfs(num);
	dfs.setAdjLists(M2);

	cout << "---Adjacent Lists---" << endl;
	dfs.printAdjLists();
	cout << "---DFS Traversal---" << endl;
	dfs.DFS();
	cout << endl;
	cout << "---Nodes Reached from vertex 0---" << endl;
	dfs.PrintReachableNodes(0);
	cout << endl;











	return 0;
}