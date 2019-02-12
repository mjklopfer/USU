#include <iostream>
#include <stdio.h>
#include <string>
#include <math.h>
#include "compute-e.hpp"
#include "compute-pi.hpp"
#include "compute-fib.hpp"

using namespace std;

int main(int argc, char *argv[]){
  if(argc==1){
    printf("\n ---Assign 2 Help---\n");
    printf("-fib [n] : compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : compute Pi to [n] digits 1<=n<=10\n");
  }
  else if (argc>=2){
    if(string(argv[1])=="-fib"){
      int n=stoi(argv[2]);
      if(n>=0 && n<=40){
	int fib=fibonacci(n);
	printf("\nFibonacci of %d: %d\n",n,fib);
      }
      else {
	
    printf("\n ---Assign 2 Help---\n");
    printf("-fib [n] : compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : compute Pi to [n] digits 1<=n<=10\n");
      }
    }
    else if(string(argv[1])=="-e"){
      int n=stoi(argv[2]);
      if (n>=1 && n<=30){
	float e=euhler(n);
	printf("\n Euhler approx. : %f\n",e);
      }

      else{
	
    printf("\n ---Assign 2 Help---\n");
    printf("-fib [n] : compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : compute Pi to [n] digits 1<=n<=10\n");
      }
    }
    else if(string(argv[1])=="-pi"){
      int n=stoi(argv[2]);
      if(n>=1 && n<=10){
	pi(n);
      }
      else{
	
    printf("\n ---Assign 2 Help---\n");
    printf("-fib [n] : compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : compute Pi to [n] digits 1<=n<=10\n");
      }
    }
    else {
      
    printf("\n ---Assign 2 Help---\n");
    printf("-fib [n] : compute the fibonacci of [n] 0<=n<=40\n");
    printf("-e [n] : compute the value of 'e' using [n] iterations 1<=n<=30\n");
    printf("-pi [n] : compute Pi to [n] digits 1<=n<=10\n");
    }
  }
  return 0;
}

	
