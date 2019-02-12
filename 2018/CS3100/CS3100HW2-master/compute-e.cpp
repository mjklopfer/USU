#include <iostream>
#include <stdio.h>
#include <string>
#include <math.h>
#include "compute-e.hpp"

using namespace std;

int factorial(int x){

  int fact=1;
  for(int i=1;i<=x;i++){
    fact*=i;
  }
  return fact;
}
  
float euhler(int n){
  float e=0;
  for(int i=1;i<=n;i++){
    e+=((pow(1,i))/factorial(i));
  }
  return e+1;
}
