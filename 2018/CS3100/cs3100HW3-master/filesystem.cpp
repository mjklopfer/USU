#include <iostream>
#include <unistd.h>
#include "filesystem.hpp"
using namespace std;

extern bool quitcmd;
void getcwd_fun(){
  char cwd[256];
  cout<<"Running getcwd()"<<endl<<"CTRL-C to Exit"<<endl;
  while(!quitcmd){
    getcwd(cwd, sizeof(cwd));

  }
  quitcmd=false;

};

void chdir_fun(){
cout<<"Running chdir() "<<endl<<"CTRL-C to Exit"<<endl;
 while(!quitcmd){
   chdir(".");

 }
 quitcmd=false;

};

void access_fun(){
  int accessint;
cout<<"Running access()"<<endl<<"CTRL-C to Exit"<<endl;
 while(!quitcmd){
   accessint=access("..",F_OK);

  
 }
 quitcmd=false;

};

void sync_fun(){
cout<<"Running sync()"<<endl<<"CTRL-C to Exit"<<endl;
 while(!quitcmd){

   sync();

 }
 quitcmd=false;



};

void chmod_fun(){
cout<<"Running chmod()"<<endl<<"CTRL-C to Exit"<<endl;
 while(!quitcmd){


 }
 quitcmd=false;

};

void dup2_fun(){
cout<<"Running dup2()"<<endl<<"CTRL-C to Exit"<<endl;
 while(!quitcmd){


 }
 quitcmd=false;


};
