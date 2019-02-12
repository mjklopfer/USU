//Nathan Tipton

#include <iostream>
#include <sys/wait.h>
#include <unistd.h>
#include <vector>
#include <chrono>
#include <ctime>
#include <string>
#include <cstring>
#include <error.h>
#include "shellfunc.hpp"

using namespace std;

const int WRITE =1;
const int READ = 0;
void printHistory(vector< vector<string> >historyvec){

  cout<<"Size of History: "<<historyvec.size()<<endl;
  for(int i=0; i<historyvec.size();i++){
    cout<<i+1<<": ";
    for(int j=0; j<historyvec[i].size();j++){
      cout<<historyvec[i][j]<<" ";
    }
    cout<<endl;
  }
}



void commands(vector<string> tokens, vector< vector<string> >historyvec){
  static double ptimeval=0;
  if(tokens[0]=="history"){
    printHistory(historyvec);

  }else if (tokens[0]=="^"){
    //execute command from history
    int index=stoi(tokens[1]);
    //cout<<"Index: "<<index<<endl;
    if(index<=0){
      cout<<"Error: Enter non-negative number greater than zero"<<endl;
    } else if(index+1>historyvec.size()){
      cout<<"Error: Exceded Command History Length"<<endl;
    } else{
      //execute command
      //    cout<<"Execute command"<<endl;
      if(historyvec[index-1].size() > 1){
	if(tokens[1] != historyvec[index-1][1]){
	  commands(historyvec[index-1],historyvec);
	}else{
	  cout<<"Error: Command will cause seg fault"<<endl;
        }
     

      }else{
	 commands(historyvec[index-1],historyvec);
      }

    }
  
  } else if(tokens[0]=="ptime"){
    //print time spend executing child processes
    cout<<"Time spent executing last child process: "<<ptimeval<<" s"<<endl;

    
  }else if(tokens[0]=="cd"){

    const char* path = tokens[1].c_str();

    if(chdir(path)<0){
	cout<<"Error: invalid"<<endl;


    }






  }  else {
    bool pipechar=false;
    int pipeindex;
    for(int i=0;i<tokens.size();i++){
      
      if(tokens[i]=="|"){
	pipeindex=i;
	pipechar=true;
	

      }
    }
    if(pipechar==false){
    ptimeval=execute(tokens);
    }
    else{
      // cout<<"Pipe found at "<<pipeindex<<endl;
      executep(tokens,pipeindex);
    }
  }
}
void executep(vector<string> tokens, int pipeindex){
  vector<string> cmd1;
  vector<string> cmd2;
  int p[2];
  pipe(p);
  
  for(int i=0;i<pipeindex;i++){
    
     cmd1.push_back(tokens[i]);
     // cout<<tokens[i]<<endl;
  }
  for(int i=pipeindex+1;i<tokens.size();i++){
    //    cout<<tokens[i]<<endl;
    cmd2.push_back(tokens[i]);
  }
  // cout<<"Command 1:";
  // for(int i=0;i<cmd1.size();i++){
  //  cout<<cmd1[i]<<" ";
  // }
  // cout<<endl<<"Command 2:";
  // for(int i=0;i<cmd2.size();i++){
  //  cout<<cmd2[i]<<" ";
  // }
  char** argv = new char*[cmd1.size()+1];
  int length=cmd1.size()+1;
  for(int i=0;i<cmd1.size();i++){
    char* token = new char[cmd1[i].length()];
    strcpy(token,cmd1[i].c_str());
    argv[i]=token;
    argv[length-1]=NULL;
  }
  char** argv2 = new char*[cmd2.size()+1];
  int length2=cmd2.size()+1;
  for(int i=0;i<cmd2.size();i++){
    char* token2 = new char[cmd2[i].length()];
    strcpy(token2,cmd2[i].c_str());
    argv2[i]=token2;
    argv2[length2-1]=NULL;
  }

  if(fork() == 0) {
    close(p[READ]);
    dup2(p[WRITE], STDOUT_FILENO);
    if(execvp(argv[0], argv)<0){
      error(1, errno, "execvp(argv) failed");
    }

  }
  if(fork()==0){
    close(p[WRITE]);
    dup2(p[READ], STDIN_FILENO);

    if(execvp(argv2[0], argv2) <0){
      error(1, errno, "execvp(argv2) failed");
    }
  }

  close(p[READ]);
  close(p[WRITE]);

  int wstatus;
  int kids=2;
  while(kids >0){
    pid_t kid = waitpid(-1, &wstatus, 0);
    //    cout<<"Child Proc " << kid << "exited with status"<< wstatus <<endl;
    kids--;
  }

  for(int i=0;i<length;i++){
      delete[] argv[i];
    }
    delete[] argv;
      
  
for(int i=0;i<length;i++){
      delete[] argv2[i];
    }
    delete[] argv2;
      
}




double execute(vector<string> cmd){
   double elapsed_time;
  char** argv = new char*[cmd.size()+1];
  int length=cmd.size()+1;
  for(int i=0;i<cmd.size();i++){
    char* token = new char[cmd[i].length()];
    strcpy(token,cmd[i].c_str());
    argv[i]=token;
    argv[length-1]=NULL;
  }
  /* cout<<"ARGV: ";
  for(int i=0;i<length;i++){
    printf("%s ", argv[i]);
  }
  cout<<endl;
  */
  pid_t child_pid;
  int status;

  
  if (( child_pid = fork()) != 0){
    auto start = chrono::system_clock::now();
    wait(NULL);
    auto end=chrono::system_clock::now();
    chrono::duration<double>elapsed_seconds=end-start;
 
    elapsed_time=elapsed_seconds.count();
    for(int i=0;i<length;i++){
      delete[] argv[i];
    }
    delete[] argv;
      
  }
  else {
    int retval=execvp(argv[0],argv);
    cerr<<"Error: "<<retval<<endl;
        
 
  }
    


  /*
  cout<<"execute command"<<endl;
  for(int i=0; i<cmd.size(); i++){

    cout<<string(cmd[i])<<endl;
    
  }
  */
  //cout<<"Elapsed Time: "<<elapsed_time<<endl;
  return elapsed_time;
}


