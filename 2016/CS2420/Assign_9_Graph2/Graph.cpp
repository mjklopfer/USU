#include <iostream>
#include "Graph.h"

using namespace std;
bool PriorityQueue::isempty(){
	
	bool empty = true;
	for (int i = 0; i < num;i++){
		if (queue[i] != -1){ empty = false;}
	}
	return empty;
}
int PriorityQueue::findmin(int*dis){
	int min = 9999;
	int minindex=0;
	for (int i = 0; i < num;i++){
		if (dis[i] < min&&visited[i]==false){
			minindex = i;
			visited[i] = true;
			queue[i] = -1;
			min = dis[i];
		}
	}
	
	return minindex;
}
Stack::Stack()
{
	top = NULL;
	count = 0;
}
void Stack::Push(int item){

	ListNode*temp = new ListNode;
	temp->value = item;
	temp->next = top;
	top = temp;
	count++;
}
int Stack::Pop(){
	if (count == 0){
		return -1;
	}
	ListNode*temp = top;
	int item = temp->value;
	top = temp->next;
	count--;
	delete temp;
	return item;
}
Stack::~Stack(){
	ListNode *temp = top;
	while (temp != NULL){
		top = temp->next;
		delete temp;
		temp = top;
	}
}
Graph::Graph(int n_input){
	n = n_input;
	pre = new int[n];
	dis = new int[n];
	indegree = new int[n];
	for (int i = 0; i < n; i++){
		indegree[i] = -1;
	}


}
void Graph::SetAdjLists(int * adjM){
	adj = new Vertex *[n];
	for (int i = 0; i < n; i++)
		adj[i] = NULL;
	for (int i = 0; i < n; i++)
	{
		for (int j = n - 1; j >= 0; j--)
		{
			if (adjM[i*n + j] !=0)
			{
				Vertex * v = new Vertex(j,n+1);
				v->next = adj[i];
				v->weight = adjM[i*n + j];

				adj[i] = v;
			}

		}

	}


}; // build the adjacency lists from the adjacency matrix adjM
void Graph::PrintAdjLists(){
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


}; // print the adjacency lists of the graph without the edge weights
void Graph::TopologicalSort(){
	int pos = 0;
	int v;
	Vertex* temp;
	for (int i = 0; i < n; i++){
		temp = adj[i];
		while (temp != NULL){
			if (indegree[temp->id] == -1){
				indegree[temp->id] = 1;
			}
			else indegree[temp->id] ++;
			temp = temp->next;

		}
		
	}
	//for (int i = 0; i < n; i++){
	//	cout << i << " : " << indegree[i] << endl;
	//}
	int*L;
	Stack S;
	
	L = new int[n];
	for (int i = 0; i < n; i++){
		if (indegree[i] == -1){
			S.Push(i);
		}
		
	}
	while (S.count > 0){
		v = S.Pop();
		L[pos] = v;
		pos++;
		temp = adj[v];
		while (temp != NULL){
			int w=-1;
			w=temp->id;
			indegree[w]--;
			if (indegree[w] == 0){
				S.Push(w);
			}
			temp = temp->next;
		}

	}

	
	cout << "---Topological sort---" << endl;
	for (int i = 0; i < n; i++){
		cout << L[i] << " ";
	}
	cout << endl;
}; // perform the topological sort using the stack data structure
void Graph::PrintAdjListsWeight(){
	Vertex* temp;
	for (int i = 0; i < n; i++){
		cout << i << ": ";
		temp = adj[i];
		while (temp != NULL){
			cout << temp->id << "(" << temp->weight << ")" << " ";
			temp = temp->next;

		}
		cout << endl;
	}
}; // print the adjacency lists of the graph with the edge weights
void Graph::Dijkstra(int s){
	int u;
	Vertex*v;
	
	PriorityQueue PQ(n);
	// Input: A graph G with vertices V, and a start vertex s
	// Output: dist(u) set to shortest distance from s to u
	/*dist(v in V) = infinity // Initialize distance decorations to infinity
		prev(v in V) = infinity // Initialize previous pointers to infinity
		dist(s) = 0 // Set distance to start vertex to 0
		PQ = PriorityQueue(V) // Use dist(v) as priorities
		while PQ not empty
			u = PQ.RemoveMin() // find/remove vertex u in PQ whose distance value is the smallest
			for all edges(u, v) :
				if dist(v) > dist(u) + cost(u, v) // cost() is weight
					dist(v) = dist(u) + cost(u, v) // Update distance as necessary
					prev(v) = u // Maintain the previous pointers for path
					PQ.ReplaceKey(v, dist(v))*/
	for (int i = 0; i < n; i++){
		dis[i] = 9999;
		pre[i] = 9999;
		PQ.visited[i] = false;
		PQ.queue[i] = i;
	}
	dis[s] = 0;
	while (!PQ.isempty()){
		u = PQ.findmin(this->dis);
		v = adj[u];
		while (v != NULL){
			if (dis[v->id] > dis[u] + v->weight){
				dis[v->id] = dis[u] + v->weight;
				pre[v->id] = u;

			}
			v = v->next;
		}

	}


}; // compute a shortest path tree from the source vertex s in a general graph
void Graph::PrintShortestPath(int source, int v){
	int j;
	cout << v << ": ";
	j = v;
	while (pre[j] != source){
		cout << pre[j] << " ";
		j = pre[j];
	}
	cout << source << " ";

}; // print the shortest path from the source to v
int Graph::GetShortestPathDis(int v){
	
	return dis[v];
}; // return the shortest path distance from the source vertex to v