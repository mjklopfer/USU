#include <iostream>
#include <stdio.h>
#include <string>
#include <math.h>
using namespace std;
//Nathan Tipton
//A01207112
//CS3100 OS and Concurrency



int fibonacci(int n){
  if (n==0){
    return 0;
  }
  else if (n==1){
    return 1;
  }
  else return (fibonacci(n-1)+fibonacci(n-2));
}

int factorial(int x){

  int fact=1;
  for(int i=1;i<=x;i++){
    fact*=i;
  }
  return fact;
}
float euhler(int n){
  float e=0;
  for(int i=1;i<=n; i++){
    e+=((pow(1,i))/factorial(i));
    //    printf("\ne: %f\n",e);
  }
  return e+1;
}

void pi(int n){

  printf("Pi to %d digits: %.*f\n",n,n,M_PI);

}

int main(int argc, char *argv[]){

  if(argc==1){
    printf("\n ---Assign 1 Help---\n");
    printf("-fib [n] : Compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : Compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : Compute Pi to [n] digits 1<=n<=10\n");
  }
  else if (argc>=2){
    /*
    for(int i=0; i<argc; i++){
      printf("argv[%d]: %s\n",i,argv[i]);
      }*/
    if(string(argv[1])=="-fib"){
	int n=stoi(argv[2]);
	if(n>=0 && n<=40){
	int fib=fibonacci(n);
	printf("\nFibonacci of %d: %d\n",n,fib);
	}
	else {
	  
    printf("\n ---Assign 1 Help---\n");
    printf("-fib [n] : Compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : Compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : Compute Pi to [n] digits 1<=n<=10\n");
	}
      }
    else if(string(argv[1])=="-e"){
      int n=stoi(argv[2]);
      if(n>=1 && n<=30){
      float e=euhler(n);
      printf("\n Euhler approx. : %f\n",e);
      }
   
      else{
    printf("\n ---Assign 1 Help---\n");
    printf("-fib [n] : Compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : Compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : Compute Pi to [n] digits 1<=n<=10\n");
      }
    }

    else if(string(argv[1])=="-pi"){
      int n=stoi(argv[2]);
      if(n>=1 && n<=10){
      pi(n);
      }
      else{
	
    printf("\n ---Assign 1 Help---\n");
    printf("-fib [n] : Compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : Compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : Compute Pi to [n] digits 1<=n<=10\n");
      }
    }
    else {
      
    printf("\n ---Assign 1 Help---\n");
    printf("-fib [n] : Compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : Compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : Compute Pi to [n] digits 1<=n<=10\n");
    }
  }


  return 0;
}
