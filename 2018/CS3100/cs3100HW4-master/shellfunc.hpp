#ifndef SHELLFUNC_HPP
#define SHELLFUNC_HPP

#include <iostream>
#include <vector>
#include <string>

using namespace std;
void printHistory(vector< vector<string> >historyvec);
void commands(vector<string>, vector< vector<string> >historyvec);
double execute(vector<string>);
void executep(vector<string>, int);
void testfunc();







#endif
