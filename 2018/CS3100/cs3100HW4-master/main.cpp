//Nathan Tipton
#include <iostream>
#include <sys/wait.h>
#include <unistd.h>
#include <vector>
#include <sstream>
#include <chrono>
#include <ctime>
#include <cstring>
#include <csignal>
#include "shellfunc.hpp"

bool quittingTime=false;
void sigint(int signal){
  quittingTime=true;

}
using namespace std;

int main(void){
  signal(SIGINT,sigint);
  vector<string> tokens;
  vector< vector<string> > historyvec;
  string c;
  stringstream ss;
  string token;
  while(true){
    ss.clear();
    tokens.clear();
    c.clear();
    token.clear();

    
    cout<<"[cmd]: ";
    getline(cin,c);
    ss<<c;
    //parse through user input and tokenize
    while(ss >> token){

      tokens.push_back(token);
    }
    //place command into history vector
    historyvec.push_back(tokens);
    //exit command
    if(tokens.size()>0){
    if(tokens[0]=="exit"){
      break;
    } else {

      commands(tokens,historyvec);
    }
    }
        
  }
  return 0;
  
}
