#include <iostream>
#include "DFSGraph.h"


using namespace std;
DFSGraph::DFSGraph(int n_input){
	n = n_input;
	color = new colorType[n];
	d = new int[n];
	f = new int[n];
	pre = new int[n];

}
void DFSGraph::setAdjLists(int * adjM){
	adj = new Vertex *[n];
	for (int i = 0; i < n; i++)
		adj[i] = NULL;
	for (int i = 0; i < n; i++)
	{
		for (int j = n - 1; j >= 0; j--)
		{
			if (adjM[i*n + j] == 1)
			{
				Vertex * v = new Vertex(j);
				v->next = adj[i];

				adj[i] = v;
			}

		}

	}

}
void DFSGraph::PrintReachableNodes(int source){
	for (int i = 0; i < n; i++){
		color[i] = WHITE;
		d[i] = 2 * n + 1;
		f[i] = 2 * n + 1;
		pre[i] = n;
	}
	
	DFSVisit(source);
}
void DFSGraph::DFS(int id){
	
	for (int i = 0; i < n; i++){
		color[i] = WHITE;
		d[i] = 2 * n + 1;
		f[i] = 2 * n + 1;
		pre[i] = n;
	}
	time = 0;
	DFSVisit(id);
	for (int i = 0; i < n; i++){
		if (color[i] == WHITE){
			DFSVisit(i);
		}
	}
}
void DFSGraph::DFSVisit(int id){
	
	color[id] = GRAY;
	time = time + 1;
	d[id] = time;
	Vertex*v = adj[id];
	cout << id;
	while (v != NULL){
		
		if (color[v->id] == WHITE){
			pre[v->id] = id;
			DFSVisit(v->id);
		}
		
		v = v->next;
		
	}
	
	color[id] = BLACK;
	
	
	time = time + 1;
	f[id] = time;

}
void DFSGraph::printAdjLists(){
	Vertex* temp;
	for (int i = 0; i < n; i++){
		cout << i << ": ";
		temp = adj[i];
		while (temp != NULL){
			cout << temp->id << " ";
			temp = temp->next;

		}
		cout << endl;
	}

}