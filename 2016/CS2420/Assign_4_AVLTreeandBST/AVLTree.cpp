#include <iostream>
#include <algorithm>

using namespace std;
#include "AVLTree.h";

AvlNode::AvlNode(){
	height = 0;
	ptrLeft = NULL;
	ptrRight = NULL;
}; // Default constructor.
AvlNode::AvlNode(string s){
	word = s;
	ptrLeft = NULL;
	ptrRight = NULL;
}; // Constructor with one parameter
AvlTree::AvlTree(){
	root = NULL;
}
AvlTree::~AvlTree(){
	remove(root);
}
void AvlTree::remove(AvlNodeptr ptr){
	if (ptr == NULL) return;
	remove(ptr->ptrLeft);
	remove(ptr->ptrRight);
	delete ptr;

}
string AvlTree::GetRoot(){
	return root->word;
}
int AvlTree::GetHeight(AvlNode * ptr) {
	if (ptr == NULL) return  -1;
	else return ptr->height;
}
void AvlTree::rightRotate(AvlNode * &k2){
	AvlNode *k1 = k2->ptrLeft;
	k2->ptrLeft = k1->ptrRight;
	k1->ptrRight = k2;
	//update k2 height
	k2->height = 1 + max(GetHeight(k2->ptrLeft), GetHeight(k2->ptrRight));
	//update the height of k1
	k1->height = 1 + max(GetHeight(k1->ptrLeft), GetHeight(k1->ptrRight));
	k2 = k1;
}
void AvlTree::leftRotate(AvlNode * &k1){
	AvlNode *k2 = k1->ptrRight;
	k1->ptrRight = k2->ptrLeft;
	k2->ptrLeft = k1;
	//update k1 height
	k1->height = 1 + max(GetHeight(k1->ptrLeft), GetHeight(k1->ptrRight));
	//update height of k2
	k2->height = 1 + max(GetHeight(k2->ptrLeft), GetHeight(k2->ptrRight));
	k1 = k2;
}
void AvlTree::doubleLeftRightRotate(AvlNode *&ptr){
	leftRotate(ptr->ptrLeft);
	rightRotate(ptr);
}
void AvlTree::doubleRightLeftRotate(AvlNode * &ptr){
	rightRotate(ptr->ptrRight);
	leftRotate(ptr);
}
void AvlTree::balance(AvlNode * & ptr) {
	if (ptr == NULL)return;
	if ((GetHeight(ptr->ptrLeft) - GetHeight(ptr->ptrRight)) > 1)
		if (GetHeight(ptr->ptrLeft->ptrLeft) >= GetHeight(ptr->ptrLeft->ptrRight)) // left-left case 
			rightRotate(ptr);
		else // left-right case 
			doubleLeftRightRotate(ptr);
	if (GetHeight(ptr->ptrRight) - GetHeight(ptr->ptrLeft) > 1)
		if (GetHeight(ptr->ptrRight->ptrRight) >= GetHeight(ptr->ptrRight->ptrLeft)) //right-right case 
			leftRotate(ptr); else // right-left case 
			doubleRightLeftRotate(ptr); // re-compute the height of the node 
	ptr->height = 1 + max(GetHeight(ptr->ptrLeft), GetHeight(ptr->ptrRight));
}
int AvlTree::Size(){
	int size = RSize(root);
	return size-1;

}; 
int AvlTree::RSize(AvlNodeptr ptr){
	if (ptr == NULL){ return 1;}
	else{
		return RSize(ptr->ptrLeft) + RSize(ptr->ptrRight);

	}


};
// Return the number of nodes in the tree.

int AvlTree::Height(){
	int height;
	height = RHeight(root);
	return height;

}; // Return the path length from the root node to a deepest leaf node in the tree.
int AvlTree::RHeight(AvlNodeptr ptr){
	
	if (ptr == NULL){
		return -1;
	}
	else{
		int lheight=RHeight(ptr->ptrLeft);
		int rheight=RHeight(ptr->ptrRight);
		if (lheight > rheight){
			return (lheight+1);

		}
		else return (rheight+1);
	}
	
}
void AvlTree::Delete(string s){

	RDelete(s, root);

}; // Delete a string.
string AvlTree::Traverse(){
	cout << "The pre-order traversal list is:" << endl;
	return RTraverse(root);
	
}; 
string AvlTree::RTraverse(AvlNodeptr ptr){
	string left, right;
	if (ptr == NULL){ return ""; }
	else
	{
		cout << ptr->word<<" ";
		left = RTraverse(ptr->ptrLeft);
		right = RTraverse(ptr->ptrRight);
		return(right+ptr->word+" "+left);
	}
	


}// return a string containing all strings stored in the binary search tree in
// the descending order.
void AvlTree::Insert(string s){
	RInsert(root, s);
}; // Insert a string into the binary search tree. Non recursive
void AvlTree::RInsert(AvlNode *& ptr, string s){
	if (ptr == NULL){
		ptr = new AvlNode(s);
	}
	else{
		if (s == ptr->word) return;
		else if (s < ptr->word) RInsert(ptr->ptrLeft, s);
		else RInsert(ptr->ptrRight, s);
	}
	balance(ptr);
}
bool AvlTree::Find(string s){
	AvlNodeptr* ptr;
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
int AvlTree::FindComparisons(string s){
	int comparisons=0;
	AvlNodeptr* ptr;
	ptr = &root;
	if (s == (*ptr)->word){
		comparisons = 1;
		return comparisons;
	}

	while (*ptr != NULL){
		if (s < (*ptr)->word){

			comparisons++;
			ptr = &(*ptr)->ptrLeft;


		}


		else if (s >(*ptr)->word){

			comparisons++;
			ptr = &(*ptr)->ptrRight;


		}
		else if (s == (*ptr)->word){
			comparisons++;
			return comparisons;
		}

	}
	return comparisons;

}

void AvlTree::RDelete(string s, AvlNodeptr& ptr){

	if (ptr != NULL){

		if (s == ptr->word){
			DelNode(ptr);
		}
		else if (s <= ptr->word){
			RDelete(s, ptr->ptrLeft);
		}
		else  RDelete(s, ptr->ptrRight);
		balance(ptr);
	}

};
void AvlTree::DelNode(AvlNodeptr& ptr){
	if (ptr->ptrLeft == NULL&&ptr->ptrRight == NULL){
		delete ptr; ptr = NULL;
	}
	else if (ptr->ptrLeft == NULL){
		AvlNodeptr here = ptr;
		ptr = ptr->ptrRight;
		delete here;
	}
	else if (ptr->ptrRight == NULL){
		AvlNodeptr here = ptr;
		ptr = ptr->ptrLeft;
		delete here;
	}
	else{
		AvlNodeptr min = ptr->ptrRight;
		AvlNodeptr minParent = ptr;
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
int AvlTree::CountTwoChildren(){
	

	return RCountTwoChildren(root);

} // return the number of nodes with two children
int AvlTree::RCountTwoChildren(AvlNodeptr ptr){
	if (ptr == NULL)return 0;
	if (ptr->ptrLeft == NULL&&ptr->ptrRight == NULL)return 0;
	if (ptr->ptrLeft != NULL&&ptr->ptrRight == NULL)return RCountTwoChildren(ptr->ptrLeft);
	if (ptr->ptrLeft == NULL&&ptr->ptrRight != NULL)return RCountTwoChildren(ptr->ptrRight);
	if (ptr->ptrLeft != NULL && ptr->ptrRight != NULL)
		return 1+RCountTwoChildren(ptr->ptrLeft) + RCountTwoChildren(ptr->ptrRight);

}
int AvlTree::CountOneChild(){
	return RCountOneChild(root);
} // return the number of nodes with one child
int AvlTree::CountLeaves(){
	return RCountLeaves(root);
}
int AvlTree::RCountOneChild(AvlNodeptr ptr){
	if (ptr == NULL)return 0;
	else if (ptr->ptrLeft == NULL&&ptr->ptrRight != NULL)return 1;
	else if (ptr->ptrLeft != NULL && ptr->ptrRight == NULL)return 1;
	else return RCountOneChild(ptr->ptrLeft) + RCountOneChild(ptr->ptrRight);

}
int AvlTree::RCountLeaves(AvlNodeptr ptr){
	if (ptr == NULL)return 0;
	else if (ptr->ptrLeft==NULL && ptr->ptrRight == NULL)return 1;
	else return RCountLeaves(ptr->ptrLeft) + RCountLeaves(ptr->ptrRight);
	
} // return the number of leave nodes
