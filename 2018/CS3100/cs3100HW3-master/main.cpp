#include <iostream>
#include <csignal>
#include <cstdio>
#include <unistd.h>
#include <algorithm>
#include "process.hpp"
#include "c++lang.hpp"
#include "filesystem.hpp"

using namespace std;

#define VERSION "1.0"

bool quitcmd=false;

void sigint(int signal){
  cout<<"QUIT COMMAND"<<endl;
  quitcmd=true;
}

void sigusr2(int signal){

}


int main(int argc, char* argv[]){
  signal(SIGINT, sigint);
  signal(SIGUSR2,sigusr2);
  
  while(!quitcmd){
    char resp;
    if(argc <2){
    cout <<"Process ID" << getpid() << endl;
    cout << "\n ---Time Wasting Main Menu--- (v" VERSION ")\n"
      "\t0) C++ Arithmetic Op Function \n"
      "\t1) C++ cmath library function \n"
      "\t2) C++ memory new/delete Function \n"
      "\t3) C++ memory-leaking via new function \n"
      "\t4) Signal 0 to self \n"
      "\t5) SIGUSR2 to self \n"
      "\t6) nanosleep 1ns \n"
      "\t7) nanosleep 1000ns \n"
      "\t8) nanosleep 1000000ns \n"
      "\t9) nanosleep 1000000000ns \n"
      "\ta) fork() \n"
      "\tb) getcwd() \n"
      "\tc) chdir() \n"
      "\td) access() \n"
      "\te) sync() \n"
      "\tf) chmod() \n"
      "\tg) dup2() \n"
      "\th) clock() \n"
      "\tq) QUIT \n";
    cin>>resp;
    }
    else {
      resp=argv[1][0];
      
    }

    switch(resp){
    case '0':
      // arithmetic op function
      arithmetic();
      break;
    case '1':
      //cmath library function
      cmathlib();
      break;
    case '2':
      //memory new/delete function
      new_delete();
      break;
    case '3':
      //memory-leaking via new function
      new_op();
      break;
    case '4':
      //signal 0 to self
      signal0_kill();
      break;
    case '5':
      //SIGUSR2 to self
      SIGUSR2_kill();
      break;
    case '6':
      //nanosleep 1ns
      nano1();
      break;
    case '7':
      //nanosleep 1000ns
      nano1k();
      break;
    case '8':
      //nanosleep 1000000ns
      nano1m();
      break;
    case '9':
      //nanosleep 1000000000ns
      nano1b();
      break;
    case 'a':
      //fork
      fork_child();
      break;
    case 'b':
      //getcwd
      getcwd_fun();
      break;
    case 'c':
      //chdir
      chdir_fun();
      break;
    case 'd':
      //access
      access_fun();
      break;
    case 'e':
      //sync
      sync_fun();
      break;
    case 'f':
      //chmod
      chmod_fun();
      break;
    case 'g':
      //dup2
      dup2_fun();
      break;
    case 'h':
      //clock
      clk();
      break;
    case 'q':
      //quit
      quitcmd=true;
      break;
      



      


    }
    argc=1; 
  }
  return 0;
}
