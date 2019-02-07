#include <iostream>
#include <string>
#include <cmath>
#include "MaxHeap.h"
using namespace std;


Element::Element(){
	weight = 0;
	word = "";
}
Element::Element(int x, string w){
	weight = x;
	word = w;
}
int MaxHeap::Left(int i){
	return i * 2;
}; // return the index of the left child of node i
int MaxHeap::Right(int i){
	return (i * 2) + 1;
}; // return the index of the right child of node i
int MaxHeap::Parent(int i){
	return i / 2;
}; // return the index of the parent of node i
void MaxHeap::PercolateDown(int i){
	int max;
	int left_child = Left(i);
	int right_child = Right(i);
	if (left_child > heapSize){
		return;
	}	else if (right_child > heapSize){
		max = left_child;
	}
	else if (H[left_child].weight < H[right_child].weight){
		max = right_child;
	}
	else if (H[left_child].weight > H[right_child].weight){
		max = left_child;
	}
	Element tmp = H[i];
	if (H[max].weight > H[i].weight){
		H[i] = H[max];
		H[max] = tmp;
	}
	PercolateDown(max);

}; // DownHeap method. It will be called in MaxHeap and DeleteMax
MaxHeap::MaxHeap(int arraySize){
	this->arraySize = arraySize+1;
	heapSize = 0;
	H = new Element[this->arraySize];

}; // Generate an empty heap with the default array size of 30.
MaxHeap::MaxHeap(Element *A, int heapSize, int arraySize){
	this->heapSize = 0;
	this->arraySize = arraySize+1;
	H = new Element[this->arraySize];
	for (int i = 0; i < heapSize;i++){
		this->Insert(A[i]);
	}
}; // A contains a sequence of elements
MaxHeap::~MaxHeap(){};
void MaxHeap::Insert(const Element &a){
	heapSize++;
	H[heapSize] = a;
	int i = heapSize;
	while (i > 1 && H[i].weight > H[Parent(i)].weight){
		Element temp = H[i];
		H[i] = H[Parent(i)];
		H[Parent(i)] = temp;
		i = Parent(i);
	}
	
}; // Insert a new element containing word and its weight
Element MaxHeap::DeleteMax(){
	Element temp = H[1];
	H[1] = H[heapSize];
	heapSize--;
	PercolateDown(1);
	return temp;
}; // Find, return, and remove the element with the maximum weight
void MaxHeap::PrintHeap(){
	RPrintHeap(1, "");
}
void MaxHeap::RPrintHeap(int i,string x){
	int left_child = Left(i);
	int right_child = Right(i);
	if (right_child < arraySize){
		RPrintHeap(right_child, x+"        ");
		//cout << "Right";
	}
	cout << x<< H[i].word << " " << H[i].weight << endl;
	if (left_child < arraySize){
		RPrintHeap(left_child, x+"        ");
	}
	
	
		


}; // Print the heap in tree structure; each node containing word and weight
void MaxHeap::Merge(const MaxHeap &newHeap){
	int newarraysize;
	newarraysize = this->arraySize + newHeap.arraySize;
	Element * temp = this->H;
	
	
	H = new Element[newarraysize];
	this->heapSize = 0;
	for (int i = 1; i < this->arraySize; i++){
		//cout << i << endl;
		this->Insert(temp[i]);
	}
	for (int i = 1; i < newHeap.arraySize; i++){
		this->Insert(newHeap.H[i]);
	}

	delete[] temp;


}; // Merge with another heap to form a larger heap
Element * MaxHeap::FindTopMatches(int count){
	
	int num = count;
	Element * match;
	match = new Element[num];
	MaxHeap tempheap(H,this->heapSize,this->arraySize);
	
	
		for (int i = 0; i < this->arraySize; i++){
			tempheap.H[i] = this->H[i];
		}
		for (int i = 0; i < num; i++){
			match[i] = tempheap.DeleteMax();
		}
		
		
	return match;
}; // return top “count” matching words based on weights