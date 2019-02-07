#ifndef graph_h
#define graph_h
#include <iostream>

class PriorityQueue{
private:
	
	
public:
	int min;
	int num;
	int*queue;
	bool* visited;
	bool isempty();
	int findmin(int*dis);
	PriorityQueue(int n){
		min = 9999;
		queue = new int[n];
		visited = new bool[n];
		num = n;
	}
};

class ListNode { 
public: 
	int value; 
	ListNode *next; 
	ListNode(int input_value = 0, ListNode *input_next = NULL) { value = input_value;   next = input_next; } 
};
class Stack
{
private: ListNode *top;  // the head node of the linked list 
		        // optional: stores the number of elements in the stack
public: Stack();
		~Stack(); 
		void Push(int item); 
		int Pop(); 
		int Top();
		int count;
		

};
class Vertex
{
public:
	int id; // the id of the vertex
	int weight; // the weight of an edge (u,v), where v is the current node and is in the adj list of vertex u
	Vertex * next;
	Vertex(int id_input, int weight_input, Vertex * input_next = NULL)
	{
		id = id_input;
		weight = weight_input;
		next = input_next;
	}
};
class Graph
{
private: // The first two data members are only used in the shortest path algorithm
	int*indegree;
	int * pre; // record the predecessor for each vertex
	int * dis; // record the shortest path distance from each vertex to the source vertex
	int n; // the number of vertices, the ids of the vertices are from 0 to n-1
	Vertex ** adj; // adj[i] points the head of the adjacency list of vertex i, for i from 0 to n-1
public:
	Graph(int n_input); // constructor
	void SetAdjLists(int * adjM); // build the adjacency lists from the adjacency matrix adjM
	void PrintAdjLists(); // print the adjacency lists of the graph without the edge weights
	void TopologicalSort(); // perform the topological sort using the stack data structure
	void PrintAdjListsWeight(); // print the adjacency lists of the graph with the edge weights
	void Dijkstra(int s); // compute a shortest path tree from the source vertex s in a general graph
	void PrintShortestPath(int source, int v); // print the shortest path from the source to v
	int GetShortestPathDis(int v); // return the shortest path distance from the source vertex to v
};










#endif