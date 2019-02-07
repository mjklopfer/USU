#include <iostream>


using namespace std;
#include "BSTree.h";

TreeNode::TreeNode(){
	ptrLeft = NULL;
	ptrRight = NULL;
}; // Default constructor.
TreeNode::TreeNode(string s){
	word = s;
	ptrLeft = NULL;
	ptrRight = NULL;
}; // Constructor with one parameter
BSTree::BSTree(){
	root = NULL;
}
BSTree::~BSTree(){
	remove(root);
}
void BSTree::remove(TreeNodeptr ptr){
	if (ptr == NULL) return;
	remove(ptr->ptrLeft);
	remove(ptr->ptrRight);
	delete ptr;

}
int BSTree::Size(){
	int size = RSize(root);
	return size-2;

}; 
int BSTree::RSize(TreeNodeptr ptr){
	if (ptr == NULL){ return 1;}
	else{
		return RSize(ptr->ptrLeft) + RSize(ptr->ptrRight);

	}


};
// Return the number of nodes in the tree.
int BSTree::Height(){
	int height;
	height = RHeight(root);
	return height;

}; // Return the path length from the root node to a deepest leaf node in the tree.
int BSTree::RHeight(TreeNodeptr ptr){
	
	if (ptr == NULL){
		return 0;
	}
	else{
		int lheight=RHeight(ptr->ptrLeft);
		int rheight=RHeight(ptr->ptrRight);
		if (lheight > rheight){
			return (lheight + 1);

		}
		else return (rheight + 1);
	}
	
}
void BSTree::Delete(string s){

	RDelete(s, root);

}; // Delete a string.
string BSTree::Traverse(){
	cout << "Pre-Order Traversal" << endl;
	return RTraverse(root);

}; 
string BSTree::RTraverse(TreeNodeptr ptr){
	string left, right;
	if (ptr == NULL){ return ""; }
	else
	{
		cout << ptr->word << endl;
		left = RTraverse(ptr->ptrLeft);
		right = RTraverse(ptr->ptrRight);
		return(left + " " + ptr->word + " " + right);
	}



}// return a string containing all strings stored in the binary search tree in
// the descending order.
void BSTree::Insert(string s){
	TreeNodeptr* ptr;
	ptr = &root;
	if (*ptr == NULL){
		*ptr = new TreeNode(s);
		return;
	}
		
	while (*ptr != NULL){
		if (s == (*ptr)->word){
			return;
		}
		if (s < (*ptr)->word){
			
			
			if ((*ptr)->ptrLeft == NULL){
				TreeNodeptr newnode = new TreeNode(s);
				(*ptr)->ptrLeft = newnode;
				return;

			}
			else ptr = &(*ptr)->ptrLeft;


		}
			
		
		else if (s > (*ptr)->word){
			
			
			if ((*ptr)->ptrRight == NULL){
				TreeNodeptr newnode = new TreeNode(s);
				(*ptr)->ptrRight = newnode;
				return;

			}
			else ptr = &(*ptr)->ptrRight;
			
		
		}
	
	}
	
}; // Insert a string into the binary search tree. Non recursive
bool BSTree::Find(string s){
	TreeNodeptr* ptr;
	ptr = &root;
	if (s == (*ptr)->word){
		return true;
	}

	while (*ptr != NULL){
		if (s < (*ptr)->word){


		ptr = &(*ptr)->ptrLeft;


		}


		else if (s > (*ptr)->word){


		 ptr = &(*ptr)->ptrRight;


		}
		else if (s == (*ptr)->word){
			return true;
		}

	}
	return false;

}; // search s in the list. Return true if s is found; otherwise, return false.

void BSTree::RDelete(string s, TreeNodeptr& ptr){

	if (ptr != NULL){

		if (s == ptr->word){
			DelNode(ptr);
		}
		else if (s <= ptr->word){
			RDelete(s, ptr->ptrLeft);
		}
		else  RDelete(s, ptr->ptrRight);
			
	}

};
void BSTree::DelNode(TreeNodeptr& ptr){
	if (ptr->ptrLeft == NULL&&ptr->ptrRight == NULL){
		delete ptr; ptr = NULL;
	}
	else if (ptr->ptrLeft == NULL){
		TreeNodeptr here = ptr;
		ptr = ptr->ptrRight;
		delete here;
	}
	else if (ptr->ptrRight == NULL){
		TreeNodeptr here = ptr;
		ptr = ptr->ptrLeft;
		delete here;
	}
	else{
		TreeNodeptr min = ptr->ptrRight;
		TreeNodeptr minParent = ptr;
		while (min->ptrLeft != NULL){
			minParent = min;
			min = min->ptrLeft;
		}
		ptr->word = min->word;
		if (minParent->ptrLeft == min){
			minParent->ptrLeft = NULL;
		}
		else minParent->ptrRight = NULL;
		
		
		delete min;
		min = NULL;
		

	}
};
