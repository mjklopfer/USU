#include<iostream>
#include<fstream>
#include<string>
using namespace std;

// Function protototypes

// Read the file and return the number of elements in the file
int FindNumberofElements(const string & fileName) ;

// Sequnetially read the data in the file and load them one-by-one in arrayPtr
void GetInputfromFile(int *arrayPtr, const string & fileName)  ;

// Perform selection sort and sort the data in ascending order
void SelectionSort(int *arrayPtr, int size) ;

// Output the sorted data to a file
void OutputResulttoFile(int *arrayPtr, const int size, const string & fileName) ;


int main()
{
	int *A ;
	int n ; // the number of elements stored in A
	string inputFileName = "hw1_Q5_input.txt" ; // the name of the input file 
	string outputFileName = "hw1_Q5_output.txt" ; // the name of the output file 
	
	n = FindNumberofElements(inputFileName) ;
	cout << "the number of data in the input file is " << n << endl ;

	// dynamically allocate n spaces in A to hold the n numbers
	// Add your code here ... ... 
	A = new int[n];
	

	// read the numbers from the input file to array A 
	GetInputfromFile(A, inputFileName) ; 

    // call the selection sort procedure
	SelectionSort(A, n) ; 

    // print the numbers of A out on the screen/console 
	for (int i = 0 ; i < n ; i++)
	cout << A[i] << "  " ; 

	cout << endl ; 

	// output the sorted numbers in A to output file
	OutputResulttoFile(A, n, outputFileName) ;

	

	return 0;
}

// Add your code for each function

// Read the file and return the number of elements in the file
int FindNumberofElements(const string & fileName) 
{
	int n = 0;
	int x;
	fstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		
		fin>>x;
		n++;
	}
	
	
	return n;
}


// Sequnetially read the data in the file and load them one-by-one in arrayPtr
void GetInputfromFile(int *arrayPtr, const string & fileName) 
{
	int x;
	int i = 0;
	fstream fin;
	fin.open(fileName);
	while (!fin.eof()){
		fin >> x;
		arrayPtr[i] = x;
		i++;
	}

	
}

// Perform selection sort and sort the data in ascending order
void SelectionSort(int *arrayPtr, int size)
{
	int minIndex, temp;
	
	for (int i = 0; i < size; i++){
		minIndex = i;
		for (int j = i + 1; j < size; j++){
			if (arrayPtr[j] < arrayPtr[minIndex])
				minIndex = j;
		}
		if (minIndex != i)
		{
			temp = arrayPtr[i];
			arrayPtr[i] = arrayPtr[minIndex];
			arrayPtr[minIndex] = temp;
		}
	}
	

}

// Output the sorted data to a file
void OutputResulttoFile(int *arrayPtr, const int size, const string & fileName) 
{
	fstream fout;
	fout.open(fileName,fstream::out);
	for (int i = 0; i < size; i++){
		fout << arrayPtr[i] << " ";
	}
	fout.close();
}