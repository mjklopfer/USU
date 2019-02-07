#include <iostream>

using namespace std;
/*Task 1a: gcd(21,35) 
1. int gcd(int a, int b) {
2.   if (b == 0) return a;
3.   else return gcd(b, a%b);
}


1. gcd is called at stack frame level 0 with a=21,b=35.
2.The if statement at line 2 is executed.
3. b=25,so b==0 is false. Return statement at line 3 is executed with b=35 and a%b=21%35=21
4.gcd is called at stack frame level 1 with a=35, b=21
5. if statement at line 2 executed
6.b=21, b==0 is false. Return statement at line 3 executed with b=21, a%b=35%21=14
gcd is called at stack frame level 2 with a=21,b=14
7.if statement at line 2 is executed.
8.b=14, so b==0 is false, return statement at line 3 is executed with b=14 and a%b=21%14=7
9.gcd is called at stack frame level 3 with a=14, b=7
10.if statement line 2 executed
11.b=7, b==0 is false. Return statement line 3 executed with b=7 and a%b=14%7=0
12.gcd called at stack frame level 4 with a=7, b=0
13. If statement line 2 executed
14.b=0, so b==0 is true. Return statement at line 2 executed, returns 7.



*/
/*Task 2b*/
int gcd(int a, int b){
	int c;
	while (!b == 0){
		c = a%b;
		a = b;
b = c;
	}
	return a;





}
int f(int a[], int x, int y) {
	if (x == y) return a[x];
	int z = (x + y) / 2;
	return f(a, x, z) + f(a, z + 1, y);
}
int add(int a[], int x, int y){
	int sum = 0;
	for (int i = x; i <= y; i++){
		sum += a[i];
	}
	return sum;

}
/* Task 2
int f(int a[], int x, int y) {
if (x == y) return a[x];
int z = (x+y)/2;
return f(a, x, z) + f(a, z+1, y);
}
If a = {1, 4, 2, 5}, what is the return value of f(a, 0, 3)?
The return value is 12.
This function computes the sum of the elements in the array in the given range.


*/
/*Task 3
1. void QuickSort(int a[], int l, int r) {
2.    int pivot = a[(l+r)/2];
3.    int i = l, j = r;
4.    while (i < j) {
5.        while (a[i] < pivot) i++;
6.        while (a[j] > pivot) j--;
7.        int t = a[i]; a[i] = a[j]; a[j] = t;
8.        i++; j--;
9.    }
10.   if (l < j) QuickSort(a, l, j);
11.   if (i < r) QuickSort(a, i, r);
}

Task 3a
a={1 4 2 3}
1. QuickSort is called at stack frame level 0 with a={1 4 2 3}. l=0, r=3
2. Line 2 executed. Pivot assigned value of a[(0+3)/2]=a[1]=4
3. Line 3 executed. i=0, j=3
4. While loop at line 4 executed. Since i=0, j=3, i<j. Loop continues
5. While loop at line 5 executed. Stops at i=1. a[1]=4 pivot=4 4<4 is false
6. While loop at line 6 executed. Stops at j=1 a[3]=3 pivot=4 3>4 is false
7.line 7 is executed, a[i] and a[j] exchanged.  a becomes [1 3 2 4]
8.Line 8 is executed. i becomes 2 and j becomes 2.
9.since i and j are both 2. i<j is false. While loop at line 4 breaks.
10.if statement at line 10 executes. l=0, j=2. 0<2 is true.
11.quicksort is called at stack frame level 1 with a=[1 3 2 4], l=0, r=j=2
12.Line 2 executed. Pivot assigned value of a[(0+2)/2]=a[1]=3
13.Line 3 is executed. i assigned 0, j assigned 2.
14. while loop at line 4 is executed. Since i=0, j=2. i<j loop continues
15.while loop at line 5 executed. stops at i=1. a[1]=3 pivot=3 3<3 is false
16. while loop at line 6 executed. stops at j=2 a[2]=2 pivot=4 2>4 is false
17. line 7 is executed. a[i] and a[j] are exchanged a becomes [1 2 3 4]
18. line 8 is executed. i becomes 2, j becomes 1
19. while statement on line 4 is executed. 2<1 is false, while loop is not continued
20. Line 10 is executed. l=0, j=1 0<1 is true.
21. quicksort is called at stack frame level 2 with a=[1 2 3 4], l=0, r=j=1
22. Line 2 is executed. Pivot assigned value of a[(0+1/2]=a[1]=2
23. Line 3 is executed. i assigned 0, j assigned 1
24. While loop at line 4 is executed. Since i=0, j=1. i<j loop continues
25. While loop at line 5 executed. stops at i=1 a[1]=2 pivot=2 2<2 is false
26. while loop at line 6 executed. stops at j=1 a[1]=2 pivot=2 2>2 is false
27. Line 7 is executed. a[i] and a[j] are exchanged, a becomes [ 1 2 3 4], l=0,r=j=1
28. Line 8 is executed. i becomes 2, j becomes 0
29. While loop line 4 executed, i<j is false, loop stops
30. if statement line 10 executed. 0<0 is false
31. if statement line 11 exectued. 2<1 is false
32.

The issue with the quicksort is that the array is sorted early in the implementation.  However the code continues to run not realizing the array is already sorted. This
is inefficient and takes up memory in the stack.

mergesort
a=[4 1 3 2]
1. mergesort is called at stack frame level 0 with a=[4 1 3 2], first=0, last=3
2.if statement line 163 is executed. 0>=3 is false.
3.line 165. mid is assigned ((0+3)/2)=1
4.line 166 Mergesort is called at stack frame level 1 with a=[4 1 3 2], first=0, last=1
5.if statement line 163 is executed. 0>=1 is false
6. line 165 mid is assigned (0+1/2)=0
7.line 166 mergesort is called at stack frame level 2 with a=[4 1 3 2], first=0, last=0
8.if statement line 163 is executed. 0>=0 is true. returns.
9.line 167 mergesort is called at stack frame level 3 with a=[4 1 3 2], first=1, last=1
10.if statement line 163 is executed 1>=1 is true. returns
11.merge statement called a=[4 1 3 2], first=0. last =1
12.if statement line 125 called 0>=1 false
13. line 127 memory allocated for temporary array of size[last-first+1]
14. line 128 mid assigned (0+1)/2=0
15. line 129 i assingned 0
16. line 130 j assigned 1
17. line 131 k assigned 0
18. line 132 while loop executed (0<=0 and 1<=1) evaluates true. Loop continues
19. if statement line 133 executed. a[i]=4 a[j]=1 4<1 is false
20. else statement line 138 executed
21. line 139 t[0]=a[j]=1
22. line 140 k becomes 1
23. line 141 j becomes 2
24. while statement line 132 executed (0<=0 and 2<=1) false, loop breaks
25. line 144 if statement executes. 0>0 is false goes to else
26. for loop line 151 executes.
27. line 152 t[1] becomes 4.
28. line 153. k becomes 2
29. for loop line 151 0<=0 is true loop breaks
30. for loop line 155 executes i=0
31. line 156 a[0]=t[0]=1
32. line 155. for loop i=1
33. line 156 a[1]=t[1]=4
34.
*/
void merge(int a[], int first, int last){
	if (first >= last)
		return;
	int *t = new int[last - first + 1];
	int mid = ((first + last) / 2);
	int i = first;
	int j = mid + 1;
	int k = 0;
	while (i <= mid && j <= last){
		if (a[i] < a[j]){
			t[k] = a[i];
			k++;
			i++;
		}
		else{
			t[k] = a[j];
			k++;
			j++;
		}
	}
	if (i > mid){
		for (; j <= last; j++){
			t[k] = a[j];
			k++;
		}
	}
	else{
		for (; i <= mid; i++){
			t[k] = a[i];
			k++;
		}
		for (int i = 0; i < k; i++){
			a[first+i] = t[i];

		}
		delete[] t;
	}
}
void mergesort(int a[], int first, int last){
	if (first >= last)
		return;
	int mid = ((first + last) / 2);
	mergesort(a, first, mid);
	mergesort(a, mid + 1, last);
	merge(a, first, last);

}

	

	


int main(){
	int aa[] = { 4, 1, 3, 2 };
	cout << "Enter Two Numbers:" << endl;
	int a, b;
	cin >> a >> b;
	int g;
	g=gcd(a, b);
	cout << "GCD is: " << g << endl;
	cout << "Function f: " << f(aa, 0, 3) << endl;
	cout << "Function add: " << add(aa, 0, 3) << endl;
	mergesort(aa, 0, 3);
	for (int i = 0; i < 4; i++){
		cout << aa[i] << " ";
	}

	return 0;
}