#ifndef BSTREE_H
#define BSTREE_H
#include <string>
#include <iostream>
using namespace std;
class TreeNode
{
public:
	string word;
	TreeNode *ptrLeft, *ptrRight;
	TreeNode(); // Default constructor.
	TreeNode(string s); // Constructor with one parameter
};
typedef TreeNode* TreeNodeptr;
class BSTree
{
private:
	TreeNodeptr root;
public:
	BSTree(); // Initializes root to NULL.
	BSTree(const BSTree &); //Copy constructor
	~BSTree(); // Destructor.
	int Size(); // Return the number of nodes in the tree.
	int Height(); // Return the path length from the root node to a deepest leaf node in the tree.
	void Delete(string s); // Delete a string.
	string Traverse(); // return a string containing all strings stored in the binary search tree in
	// the descending order.
	void Insert(string s); // Insert a string into the binary search tree.
	bool Find(string s); // search s in the list. Return true if s is found; otherwise, return false.
	int CountTwoChildren(); // return the number of nodes with two children
	int CountOneChild(); // return the number of nodes with one child
	int CountLeaves(); // return the number of leave nodes
	int GetHeight(TreeNodeptr v); // return the height of node v
	string GetRoot(); // return the word contained in the root node
	int FindComparisons(string s); // search s in the list and return the number of comparisons to
private:
	string RTraverse(TreeNodeptr ptr);// You need to add private functions to implement the recursive solutions.
	int RSize(TreeNodeptr ptr);
	int RHeight(TreeNodeptr ptr);
	void RDelete(string s, TreeNodeptr& ptr);
	void DelNode(TreeNodeptr& ptr);
	void remove(TreeNodeptr ptr);
	int RCountTwoChildren(TreeNodeptr ptr);
	int RCountOneChild(TreeNodeptr ptr);
	int RCountLeaves(TreeNodeptr ptr);
};
#endif