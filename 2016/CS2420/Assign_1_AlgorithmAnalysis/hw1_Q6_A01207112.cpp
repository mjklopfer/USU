#include<iostream>
#include<fstream>
#include<string>
using namespace std ;

// Use function prototypes listed in the starter code for Q5 as a reference to write appropriate function prototypes for Q6
void GetInputfromFile(int *arrayPtr, const string & fileName);

// the following two function prototypes should be fixed
int BinarySearch(const int *arrayPtr,int start, int end, int key) ;  
void OutputResulttoFile(const int *arrayPtr, const int *arraySearch, const int size, const string & filename) ;

int main()
{
	int *A, *B, *C ; // array C is used to hold the search results temporarily
	int n = 0 ; // the number of elements stored in A
	int m = 0 ; // the number of elements stored in B
	string dataFileName = "hw1_Q6_data.txt" ; // the name of the data file 
	string searchFileName = "hw1_Q6_search.txt" ; // the name of the search file 
	string outputFileName = "hw1_Q6_output.txt" ; // the name of the output file 

    // input all numbers from the data file to the array A
	fstream fin;
	int x;
	fin.open(dataFileName);
	while (!fin.eof()){
		fin >> x;
		n++;
	}
	fin.close();
	A = new int[n];
	GetInputfromFile(A, dataFileName);
    
	// input all numbers from the search file to the array B
	
	fin.open(searchFileName);
	while (!fin.eof()){
		fin >> x;
		m++;
	}
	fin.close();
	B = new int[m];
	GetInputfromFile(B, searchFileName);
	// For debugging purpose, print out the content in A
	for (int i = 0; i < n; i++)
		cout << A[i] << " " ; 
	cout << endl ;

	C = new int[m];
	// print the search results on the screen
	for (int i = 0; i < m; i++)
	{
		C[i] = BinarySearch(A, 0, n-1, B[i]) ; 
		cout << "The position of " << B[i] << " is " << C[i] << endl ; 
	}

	// output the search results to the output file
	OutputResulttoFile(C, B, m, outputFileName) ;

	cout << endl ; 

	return 0;
}

// implementation of all the functions declared in the prototype
void GetInputfromFile(int *arrayPtr, const string &fileName){
	int i = 0;

	fstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		fin >> arrayPtr[i];
		i++;
	}
	fin.close();
		
}
int BinarySearch(const int *Ar,int start, int end, int key){
	int middle = 0;
	do{
		middle = (start + end) / 2;
		if (Ar[middle] < key){
			start = middle + 1;
		}
		else{
			end = middle;
		}

	} while (start < end);
	if (Ar[start] == key){
		return start;
	}
	else{
		return -1;
	}
	


}
void OutputResulttoFile(const int *arrayPtr, const int *arraySearch, const int size, const string & filename){
	ofstream fout;
	fout.open(filename);
	for (int i = 0; i < size; i++){
		fout << "The position of " << arraySearch[i] << " is " << arrayPtr[i] << endl;

	}
}