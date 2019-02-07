#ifndef maxheap_h
#define maxheap_h
#include <iostream>
using namespace std;

class Element
{
public:
	Element();
	Element(int weight, string word);
	int weight;
	string word;
};

class MaxHeap
{
private:
	int arraySize;
	int heapSize;
	Element * H;
	int Left(int i);
	int Right(int i);
	int Parent(int i);
	void PercolateDown(int i);
	void RPrintHeap(int i, string x);

public:
	MaxHeap(int arrSize = 30);
	MaxHeap(Element *A, int heapSize, int arraySize);
	~MaxHeap();
	void Insert(const Element &a);
	Element DeleteMax();
	void PrintHeap();

	void Merge(const MaxHeap &newHeap);
	Element * FindTopMatches(int count);
};

#endif