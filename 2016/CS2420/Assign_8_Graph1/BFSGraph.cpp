#include <iostream>
#include "BFSGraph.h"

using namespace std;

Queue::Queue(int n){
	Q = new int[n];
	front = -1;
	rear = -1;
}
Queue::~Queue(){

}
bool Queue::Empty(){
	if (front == -1 && rear == -1||front==rear){
		return true;
	}
	else return false;
}
void Queue::Enqueue(int x){
	if (Empty()){
		front = 0;
		rear = 0;
	}
	
	Q[rear] = x;
	rear += 1;
		
		
}
int Queue::Dequeue(){
	int x=-1;
	if (front == rear){

		x = Q[front];
		front = -1;
		rear = -1;
	}
	else if (Empty()){
		return -1;
	}
	
	else x=Q[front];
	front += 1;
		 
		return x; 

}
BFSGraph::BFSGraph(int n_input){
	n = n_input;
	color = new colorType[n];
	dis = new int[n];
	pre = new int[n];

}
void BFSGraph::SetAdjLists(int * adjM){
	adj = new Vertex *[n];
	for (int i = 0; i < n; i++)
		adj[i] = NULL;
	for (int i = 0; i < n; i++)
	{
		for (int j = n-1; j>=0; j--)
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
void BFSGraph::PrintAdjLists(){
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
void BFSGraph::BFS(int id){
	for (int i = 0; i < n; i++){
		color[i] = WHITE;
		dis[i] = n;
		pre[i] = n;
	}
	BFSVisit(id);
	for (int i = 0; i < n; i++){
		if (color[i] = WHITE){
			BFSVisit(i);
		}
	}
}
void BFSGraph::BFSVisit(int id){
	int u;
	color[id] = GRAY;
	dis[id] = 0;
	Queue Q(n);
	Q.Enqueue(id);
	

	while (!Q.Empty()){
		u = Q.Dequeue();
		cout << u;
		Vertex* v = adj[u];

		while (v != NULL){
			if (color[v->id] == WHITE){
				color[v->id] = GRAY;
				dis[v->id] = dis[u] + 1;
				pre[v->id] = u;
				Q.Enqueue(v->id);
			}
			v = v->next;
		}
		color[u] = BLACK;
		
	}


}
void BFSGraph::PrintSP(int source, int v){
	int j;
		cout << v<< ": "; 
		j = v;
		while (pre[j] != source){
			cout << pre[j] << " ";
				j = pre[j];
		}
		cout << source << " ";
		cout << "Shortest Distance: " << dis[v];
	

}