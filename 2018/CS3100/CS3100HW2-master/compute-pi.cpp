#include <iostream>
#include <stdio.h>
#include <string>
#include <math.h>
#include "compute-pi.hpp"

using namespace std;

void pi(int n){

  printf("Pi to %d digits: %.*f\n",n,n,M_PI);
}
