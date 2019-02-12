
#include <iostream>
#include <math.h>
#include "c++lang.hpp"


using namespace std;

extern bool quitcmd;

void arithmetic(){
  
  cout<<"Running arithmetic op"<<endl<<"Press CTRL-C to Exit"<<endl;
  int val=0;
  while(!quitcmd){
  val++;
    
  }
  quitcmd=false;



}

void cmathlib(){
  cout<<"Running cmath"<<endl<<"Press CTRL-C to Exit"<<endl;
  int val=99999;
  while(!quitcmd){

    val=sqrt(val);
  };

  quitcmd=false;

};

void new_delete(){
  cout<<"Running new/delete"<<endl<<"Press CTRL-C to Exit"<<endl;
  int *p=NULL;
  while(!quitcmd){
    p = new int;
    
    delete p;
    
  };
  quitcmd=false;



};
void new_op(){
  cout<<"Running new"<<endl<<"Press CTRL-C to Exit"<<endl;
  while(!quitcmd){
  int *p=NULL;
  p=new int;
  
  }
  quitcmd=false;


};
