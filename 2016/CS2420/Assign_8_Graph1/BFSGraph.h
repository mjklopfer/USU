#ifndef bfsgraph_h
#define bfsgraph_h
#ifndef colortype_foobar
#define colortype_foobar
enum colorType { WHITE, GRAY, BLACK };
class Vertex
{
public:
	int id; // id for the vertex
	Vertex * next; // the next vertex in the adj list
	Vertex(int input_id, Vertex *input_next = NULL)
	{
		id = input_id;
		next = input_next;
	}
};
#endif

class Queue
{
private: 
	int front, rear; 
	int count; // Optional: indicate whether the queue is empty
public: 
	int *Q;
	Queue(int n); 
	~Queue(); 
	void Enqueue(int x);
	bool Empty();
	int Dequeue(); 
	

};
class BFSGraph {
private: colorType * color; // record the colors of the vertices during BFS 
		 int * pre ; // record the predecessors during BFS 
		 int * dis ; // record the shortest path distances during BFS
public: 
	int n; // the number of vertices, the ids of the vertices are from 0 to n-1 
	Vertex ** adj ; // adj[i] points the head of the adjacency list of vertex i, for i from 0 to n-1
		BFSGraph(int n_input); // constructor 
		void SetAdjLists(int * adjM) ; // build the adjacency lists from the adjacency matrix adjM 
		void PrintAdjLists() ; // print the adjacency lists of the graph
		// the following two functions are for the BFS traversal as we discussed in class 
		void BFS(int id = 0) ; // BFS traversal, id is the source vertex, with default 0 
		void BFSVisit(int id) ; // actually does BFS, search a connected component from id
		void PrintSP(int source, int v); // Print the shortest path from the source to v and the 
										// shortest path distance from source to v 
} ;
#endif