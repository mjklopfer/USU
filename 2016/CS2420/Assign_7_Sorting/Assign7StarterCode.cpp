#include<iostream>
#include<fstream>
#include<string>
#include <chrono>
#include <ctime>
#include <time.h>
using namespace std;

// Function protototypes

// Read the file and return the number of elements in the file which contains all integers
// Make sure to close the file before return the number of elements in the file
int FindNumberofElements1(const string & fileName) ;

// Sequnetially read the data in the file and load them one-by-one in arrayPtr
// Make sure to close the file after reading the data
void GetInputfromFile1(int *arrayPtr, const string & fileName)  ;

// Read the file and return the number of elements in the file which contains all words
// Make sure to close the file before return the number of elements in the file
int FindNumberofElements2(const string & fileName) ;

// Sequnetially read the data in the file
// Convert the data into nonnegative integers using the strategy mentioned in assignment 5
// Load nonnegative integers one-by-one in arrayPtr
// Make sure to close the file after reading the data
void GetInputfromFile2(int *arrayPtr, const string & fileName)  ;

// Perform various sorting algorithms to sort the data in the ascending order
void HeapSort(int *arrayPtr, int size) ;
void MergeSort(int *arrayPtr, int low, int high) ;
void QuickSort(int *arrayPtr, int low, int high) ;
void buildheap();

// Other function prototypes go here


int main()
{
	int *A ;
	int n ; // the number of elements stored in A
	string inputFileName1 = "Assign7Data.txt" ; // the name of the input file 
		
	n = FindNumberofElements1(inputFileName1) ;
	cout << "the number of data in the input file is " << n << endl ;

	
	// dynamically allocate n spaces in A to hold the n numbers
	// Add your code here ... ... 
	A = new int[n];
	/*for (int i = 0; i < n; i++){
		A[i] = rand() % 100;
	}*/
	// read the numbers from the input file to array A 
	GetInputfromFile1(A, inputFileName1) ; 
	
	cout << "========HeapSort========" << endl;
	// print the numbers of A out on the screen/console 
	for (int i = 0; i < n; i++)
		cout << A[i] << "  ";
	cout << endl;
    // call the heap sort procedure
	HeapSort(A, n) ; 

    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
		cout << A[i] << "  " ; 

	cout << endl ; 
	cout << "========MergeSort========" << endl;
	// read the numbers from the input file to array A 
	GetInputfromFile1(A, inputFileName1) ; 

	// print the numbers of A out on the screen/console 
	for (int i = 0; i < n; i++)
		cout << A[i] << "  ";

	cout << endl;
	
	
	
	
    // call the merge sort procedure
	MergeSort(A, 0, n-1) ; 
    // print the numbers of A out on the screen/console 

	for (int i = 0 ; i < n ; i++)
		cout << A[i] << "  " ; 

	cout << endl ; 

	
	// read the numbers from the input file to array A 
	GetInputfromFile1(A, inputFileName1) ; 

    // call the quick sort procedure
	cout << "========QuickSort========" << endl;
	QuickSort(A, 0, n - 1);
    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
		cout << A[i] << "  " ; 

	cout << endl ; 

	delete [] A ;
	A = NULL ;

	cout << "*******************************************************************************************" << endl ;
	cout << "*******************************************************************************************" << endl ;


	string inputFileName2 = "dictionary.txt" ; // the name of the input file

	n = FindNumberofElements2(inputFileName2) ;
	cout << "the number of data in the input file is " << n << endl ;

	// dynamically allocate n spaces in A to hold the n numbers
	// Add your code here ... ... 
	A = new int[n];

	// read the numbers from the input file to array A 
	GetInputfromFile2(A, inputFileName2) ; 
	
	cout << "========HeapSort========" << endl;
    // call the heap sort procedure
	auto t = chrono::high_resolution_clock::now();
	HeapSort(A, n);
	auto t2 = chrono::high_resolution_clock::now();
	double time = chrono::duration_cast<chrono::milliseconds>(t2 - t).count() / (1000.00);
	cout << "Time=" << time << "second"<<endl;
	

    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
	cout << A[i] << "  " ; 

	cout << endl ; 

	// read the numbers from the input file to array A 0.2
	GetInputfromFile2(A, inputFileName2) ; 
	cout << "========MergeSort========" << endl;
	auto t3 = chrono::high_resolution_clock::now();
	MergeSort(A, 0, n - 1);
	auto t4 = chrono::high_resolution_clock::now();
	double time2 = chrono::duration_cast<chrono::milliseconds>(t4 - t3).count() / (1000.00);
	cout << "Time=" << time2 << "second" << endl;
    // call the merge sort procedure
	

    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
		cout << A[i] << "  " ; 

	cout << endl ; 


	// read the numbers from the input file to array A 
	GetInputfromFile2(A, inputFileName2) ; 
	cout << "========QuickSort========" << endl;
	auto t5 = chrono::high_resolution_clock::now();
	QuickSort(A, 0, n - 1);
	//MergeSort(A, 0, n - 1);
	auto t6 = chrono::high_resolution_clock::now();
	double time3 = chrono::duration_cast<chrono::milliseconds>(t6 - t5).count() / (1000.00);
	cout << "Time=" << time3 << "second" << endl;
    // call the quick sort procedure
	

    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
		cout << A[i] << "  " ; 
	for (int i = 1; i < n; i++){
		if (A[i]<A[i - 1])cout << "notsorted ";
	}
	cout << endl ; 

	delete [] A ;
	A = NULL ;

	cout << "========HeapSort========" << endl;
	cout << "Time=" << time << "second" << endl;
	cout << "========MergeSort========" << endl;
	cout << "Time=" << time2 << "second" << endl;
	cout << "========QuickSort========" << endl;
	cout << "Time=" << time3 << "second" << endl;
	return 0;
}

// Add your code for each function

// Read the file and return the number of elements in the file containing integers
int FindNumberofElements1(const string & fileName)
{
	int i = 0;
	int input=0;
	ifstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		fin >> input;
		cout << input << endl;
		i++;
		

	}

	return i;
}



// Sequnetially read the data in the file and load them one-by-one in arrayPtr
void GetInputfromFile1(int *arrayPtr, const string & fileName) 
{
	int i = 0;
	int input = 0;
	ifstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		fin>> input;
		arrayPtr[i] = input;
		i++;
		
	}

	
}

// Read the file and return the number of elements in the file containing words
int FindNumberofElements2(const string & fileName) 
{
	string temp;
	int tmp=0;
	ifstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		getline(fin, temp);
		tmp++;
	}

	return tmp;
}


// Sequnetially read the data in the file, convert them to integers, and load integers one-by-one in arrayPtr
void GetInputfromFile2(int *arrayPtr, const string & fileName) 
{
	int count = 0;
	string temp;
	int tmp = 0;
	ifstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		getline(fin, temp);
		for (int i = 0; temp[i]; i++){
			tmp+=temp[i];
		}
		arrayPtr[count] = tmp;
		count++;
	}


	
}

// Perform heap sort and sort the data in ascending order
void buildheap(int *arrayPtr,int size, int i){

	int max = i;
	int left_child = 2*i+1;
	int right_child = 2*i + 2;
	if (left_child < size&&arrayPtr[left_child]>arrayPtr[right_child]){
		max = left_child;
		
	}
   if (right_child < size&&arrayPtr[right_child]>arrayPtr[max]){
		max = right_child;
	}
	
	int tmp = arrayPtr[i];

	if (arrayPtr[max]> arrayPtr[i]){
		arrayPtr[i] = arrayPtr[max];
		arrayPtr[max] = tmp;
		buildheap(arrayPtr, size, max);
	}
	


}


void HeapSort(int *arrayPtr, int size)
{
	int temp;
	for (int i = size/2-1; i >=0 ; i--){
		buildheap(arrayPtr, size, i);
}
	for (int i = size-1; i >= 0; i--){
		
		temp = arrayPtr[0];
		arrayPtr[0] = arrayPtr[i];
		arrayPtr[i] = temp;

		buildheap(arrayPtr, i, 0);
	}
	temp = arrayPtr[0];
	arrayPtr[0] = arrayPtr[1];
	arrayPtr[1] = temp;

	buildheap(arrayPtr, 1, 0);
	
}

// Perform merge sort and sort the data in ascending order

void MergeSort(int *arrayPtr, int low, int high)
{
	
	if (low >= high){
	/*	for (int i = 0; i < sizeof(arrayPtr); i++){
			cout << arrayPtr[i] << " ";
		}
		cout << endl;*/
		return;
	}
	int mid = (low + high) / 2;
	MergeSort(arrayPtr, low, mid);
	MergeSort(arrayPtr, mid + 1, high);
	
	int *temp = new int[high - low + 1];
	int h1 = low;
	int h2 = mid + 1;
	int p = 0;
	while (h1 <= mid&&h2 <= high){
		if (arrayPtr[h1] < arrayPtr[h2]){
			temp[p] = arrayPtr[h1];
			p++;
			h1++;
		}
		else {
			temp[p] = arrayPtr[h2];
			p++;
			h2++;
		}
	}
	for (int i = h1; i <= mid; i++){
		temp[p] = arrayPtr[h1];
		p++;
		h1++;
	}
	for (int i = h2; i <= high; i++){
		temp[p] = arrayPtr[h2];
		p++;
		h2++;
	}
	for (int i = 0; i < p; i++){
		arrayPtr[low + i] = temp[i];
		//cout << temp[i] << endl;
	}
	delete[] temp;

}


// Perform quick sort and sort the data in ascending order
void swap(int* a, int* b)
{
	int t = *a;
	*a = *b;
	*b = t;
}
int partition(int *arrayPtr, int low, int high)
{
	int pivot;
	int temp;
	int k = (low + high) / 2;
	pivot = k;
	if (arrayPtr[k]<arrayPtr[high] && arrayPtr[k]>arrayPtr[low]){
		pivot = k;
	}
	if (arrayPtr[low]<arrayPtr[high] && arrayPtr[low]>arrayPtr[k]){
		pivot = low;
	}
	if (arrayPtr[high]<arrayPtr[k] && arrayPtr[k]<arrayPtr[low]){
		pivot = k;
	}
	if (arrayPtr[low]<arrayPtr[k] && arrayPtr[low]>arrayPtr[high]){
		pivot = low;
	}
	if (arrayPtr[high]<arrayPtr[low] && arrayPtr[high]>arrayPtr[k]){
		pivot = high;
	}
	if (arrayPtr[k]>arrayPtr[high] && arrayPtr[high]>arrayPtr[low]){
		pivot =high;
	}

	   
	int i = low;
	int j = high-1;
	while (i <j){
		if (arrayPtr[i] <= arrayPtr[pivot]){
			i++;
		}
		if (arrayPtr[j] >= arrayPtr[pivot]){
			j--;
		}
	
		if (arrayPtr[i] > arrayPtr[pivot]&&arrayPtr[j] < arrayPtr[pivot]){
			temp = arrayPtr[i];
			arrayPtr[i] = arrayPtr[j];
			arrayPtr[j] = temp;
			
		}

	}
	temp = arrayPtr[i];
	arrayPtr[i] = arrayPtr[pivot];
	arrayPtr[pivot] = temp;
	return i;
}
void QuickSort(int *arrayPtr, int low, int high)
{
	if (low < high)
	{
		// Partition the array and get the pivot point.
		int p = partition(arrayPtr, low, high);
		// Sort the portion before the pivot point.
		if ((p - 1) - low < (high - (p + 1))){
			QuickSort(arrayPtr, low, p - 1);
			QuickSort(arrayPtr, p + 1, high);
		}
		// Sort the portion after the pivot point.
		else{
			QuickSort(arrayPtr, p + 1, high);
			QuickSort(arrayPtr, low, p - 1);
		}
	}

}


// Implementation of other functions