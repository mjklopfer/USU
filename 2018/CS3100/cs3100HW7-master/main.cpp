#include <iostream>
#include <queue>
#include <stdlib.h>
#include <time.h>
#include "pagefunc.hpp"

int sequence_length=10;

int main(){
  srand (time(NULL));
  int belady_count=0;
  int seq_num=0;
  int prev_page_faults=1000000;
  int prev_framesize=0;
  int curr_framesize=0;
  int curr_page_faults=0;
  std::cout<<"Length of memory reference string: 1000"<<std::endl;
  std::cout<<"Frames of physical memory: 100"<<std::endl;
  
  for(int i=1;i<101;i++){
    sequence seq;
    seq_num++;
    //std::cout<<"Sequence Number: "<<seq_num<<std::endl;
    seq.randgen();
    /*
    for(int i=0;i<10;i++){
      std::cout<<seq.page_sequence[i]<<" ";
    }
    std::cout<<std::endl;
    */
  for(int i=1; i<101; i++){
    curr_framesize=i;
    curr_page_faults=pageFaults(seq.page_sequence,curr_framesize);
    // std::cout<<"CurrPageFaults: "<<curr_page_faults<<std::endl;
    //std::cout<<"PrevPageFaults: "<<prev_page_faults<<std::endl;
    if((curr_page_faults>prev_page_faults)&&(curr_framesize>prev_framesize)){
      belady_count++;
      std::cout<<"Anomaly Discovered"<<std::endl;
      std::cout<<"sequence "<<seq_num<<std::endl;
      std::cout<<"Page Faults: "<<prev_page_faults<<" @ Frame Size: "<<prev_framesize<<std::endl;
      std::cout<<"Page Faults: "<<curr_page_faults<<" @ Frame Size: "<<curr_framesize<<std::endl;
      
    }
    prev_framesize=curr_framesize;
    prev_page_faults=curr_page_faults;
  }
  //belady_count=0;

  
  }
  std::cout<<"Anomaly Detected: "<<belady_count<<" times."<<std::endl;
  
  return 0;
  }
