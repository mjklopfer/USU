#include <iostream>
#include <sys/types.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>
#include <sys/wait.h>
#include "process.hpp"
using namespace std;

extern bool quitcmd;
void signal0_kill(){
  cout<<"Running signal0 kill"<<endl<<"press CTRL-C to Exit"<<endl;
  kill(getpid(),0);
  
};

void SIGUSR2_kill(){
cout<<"Running sigusr2 kill"<<endl<<"press CTRL-C to Exit"<<endl;
 kill(getpid(),SIGUSR2);
};

void clk(){
  clock_t clk;
cout<<"Running clock()"<<endl<<"press CTRL-C to Exit"<<endl;  
  while(!quitcmd){
    clk=clock();


  };
  quitcmd=false;

};

void nano1(){
cout<<"Running nanosleep 1ns"<<endl<<"press CTRL-C to Exit"<<endl;
 struct timespec req = {0};
 req.tv_sec=0;
 req.tv_nsec=1L;
 while(!quitcmd){
   nanosleep(&req, (struct timespec *)NULL);
 }
 quitcmd=false;

};

void nano1k(){
cout<<"Running nanosleep 1000ns"<<endl<<"press CTRL-C to Exit"<<endl;
struct timespec req = {0};
 req.tv_sec=0;
 req.tv_nsec=1000L;
 while(!quitcmd){
   nanosleep(&req, (struct timespec *)NULL);
 }
 quitcmd=false;


};

void nano1m(){
cout<<"Running 1000000ns"<<endl<<"press CTRL-C to Exit"<<endl;
struct timespec req = {0};
 req.tv_sec=0;
 req.tv_nsec=1000000L;
 while(!quitcmd){
   nanosleep(&req, (struct timespec *)NULL);
 }
 quitcmd=false;
};

void nano1b(){
cout<<"Running 1000000000ns"<<endl<<"press CTRL-C to Exit"<<endl;
struct timespec req = {0};
 req.tv_sec=0;
 req.tv_nsec=1000000000L;
 while(!quitcmd){
   nanosleep(&req, (struct timespec *)NULL);
 }
 quitcmd=false;
};


void fork_child(){
cout<<"Running fork()"<<endl<<"press CTRL-C to Exit"<<endl;
 pid_t kid;
 while(!quitcmd){
   if(!(kid=fork())) { exit(0); /*child*/ }
   else { wait (0); /*parent*/}
 }
 quitcmd=false;



};
