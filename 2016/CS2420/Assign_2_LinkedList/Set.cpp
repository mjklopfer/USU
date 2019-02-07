#include <iostream>
using namespace std;

#include "Set.h"
ListNode::ListNode() {};
ListNode::ListNode(int s) {
	value = s;
	next = NULL;
};
void Set::Insert(int v) {
	bool duplicate_check;
	duplicate_check = Find(v);//See if value is already in set
	if (duplicate_check == true) {//If value is already in set, return, do not insert
		return;
	}
	ListNode *newnode = new ListNode(v);
	ListNode *here = head->next;
	ListNode *prev = head;
	while (v > here->value) {
		prev = here;
		here = here->next;
	}
	prev->next = newnode;
	newnode->next = here;
	count++;
	/*Check if value is already in set. If so, duplicate is not inserted. Otherwise insert value in order*/
}
void Set::Delete(int v) {
	ListNode *here = head->next;//first real node
	ListNode *prev = head;//dummy node
	while (v != here->value&&here->next != NULL)//Go through nodes finding v
	{
		prev = here;
		here = here->next;
	}
	if (here->next != NULL)//delete node containing v and set pointers
	{
		prev->next = here->next;
		delete here;
		count--;
	}

} // Delete a value
void Set::Print() {
	cout << "----" << endl;
	ListNode *here = head->next;//first real node
	while (here->next != NULL)//watch for last real node
	{
		cout << here->value << endl;//output value
		here = here->next;//move to next node
	}
	cout << "----" << endl;
} // Display list in order
bool Set::Find(int v) {
	ListNode *val = head->next;
	while (val->next != NULL) {
		if (val->value == v) {
			return true;
		}
		val = val->next;
	}
	return false;
} // Search v in the list. Return true if v is found; otherwise, return false

Set::Set() {
	head = new ListNode(-1);
	head->next = new ListNode(100);
	count = 0;
}
Set::Set(Set &obj) {
	head = new ListNode(-1);
	head->next = new ListNode(100);
	ListNode *temp;
	Set S2;
	S2 = obj;
	temp = S2.head->next;
	while (temp->next != NULL){
		Insert(temp->value);
		temp = temp->next;
	}
	obj.count = count;
};
Set::~Set() {
	
	ListNode *current = head;
	ListNode *lnext = current->next;
	while (current != NULL){
		lnext = current->next;
		//delete current;
		current = lnext;
	}
	//delete current;
	//delete lnext;
};
bool Set::operator<(const Set &obj) {
	Set S2;
	S2 = obj;
	ListNode *temp;
	temp = head->next;
	while (temp->next != NULL){
		if (!S2.Find(temp->value)){
			return false;
		}
		temp = temp->next;
	}
	if (S2.count == count){ return false; }
	return true;
} // proper subset
Set Set::operator^(const Set &obj) {
	Set new_set;
	ListNode *temp;
	ListNode *S2;
	temp = head->next;
	S2 = obj.head->next;
	bool var; 
	while (S2->next != NULL){
		var = Find(S2->value);
		if (Find(S2->value)){ new_set.Insert(S2->value); }
		S2 = S2->next;
	}
	return new_set;
} // intersection
Set Set::operator+(const Set &obj) {
	Set new_set;
	ListNode* temp;
	temp = head->next;
	while (temp->next != NULL){
		
		
		new_set.Insert(temp->value);
		temp = temp->next;
	}
	ListNode *S2 = obj.head->next;
	while (S2->next != NULL){
		
		new_set.Insert(S2->value);
		S2 = S2->next;
	}
	return new_set;
} // union
Set Set::operator-(const Set &obj) {
	Set new_set;
	ListNode* temp;
	Set S2;
	S2 = obj;
	temp = head->next;
	while (temp->next != NULL){
		if (!S2.Find(temp->value)){
			new_set.Insert(temp->value);


		}

		temp = temp->next;


	} // set difference
	return new_set;
}
Set & Set::operator=(const Set &obj) {
	head = obj.head;
	count = obj.count;
	
	return *this;
} // assignment
int Set::operator[](const int index) {
	ListNode *temp;
	temp = head->next;
	for (int i = 0; i < index; i++){
		temp = temp->next;
	}
	return temp->value;
} // index