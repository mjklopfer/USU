#ifndef AVLTREE_H
#define AVLREE_H
#include <string>
#include <iostream>
using namespace std;
class AvlNode
{
public:
	string word;
	int height;
	AvlNode *ptrLeft, *ptrRight;
	AvlNode(); // Default constructor
	AvlNode(string s); // Constructor with one parameter
};
typedef AvlNode * AvlNodeptr;
class AvlTree
{
	
private:
	AvlNodeptr root;
public:
	AvlTree(); // Initializes root to NULL.
	AvlTree(const AvlTree &); //Copy constructor
	~AvlTree(); // Destructor.
	int Size(); // Return the number of nodes in the tree.
	int Height(); // Return the path length from the root node to a deepest leaf node in the tree.
	void Delete(string s); // Delete a string.
	string Traverse(); // return a string containing all strings stored in the binary search tree in
	// the descending order and print the strings in pre-order
	void Insert(string s); // Insert a string into the binary search tree.
	bool Find(string s); // search s in the list. Return true if s is found; otherwise, return false.
	int FindComparisons(string s); // search s in the list and return the number of comparisons to
	// determine whether s is in the tree.
	int CountTwoChildren(); // return the number of nodes with two children
	int CountOneChild(); // return the number of nodes with one child
	int CountLeaves(); // return the number of leave nodes
	int GetHeight(AvlNodeptr v); // return the height of node v
	string GetRoot(); // return the word contained in the root node
private:
	// You need to add the following private functions to implement the rebalance operations.
	// You may need to add other private functions you feel appropriate
	void RInsert(AvlNode * &ptr, string s);
	string RTraverse(AvlNodeptr ptr);// You need to add private functions to implement the recursive solutions.
	int RSize(AvlNodeptr ptr);
	int RHeight(AvlNodeptr ptr);
	int RCountTwoChildren(AvlNodeptr ptr);
	int RCountOneChild(AvlNodeptr ptr);
	int RCountLeaves(AvlNodeptr ptr);
	void RDelete(string s, AvlNodeptr& ptr);
	void DelNode(AvlNodeptr& ptr);
	void remove(AvlNodeptr ptr);
	void balance(AvlNodeptr &); // make the tree balanced after insert and delete
	void rightRotate(AvlNodeptr &); // Right rotation
	void leftRotate(AvlNodeptr &); // Left rotation
	void doubleLeftRightRotate(AvlNodeptr &); // Left right double rotation
	void doubleRightLeftRotate(AvlNodeptr &); // Right left double rotation
};
#endif