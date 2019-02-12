#include "pagefunc.hpp"
#include <queue>
#include <unordered_set>

using namespace std;
void sequence::randgen(){
  for(int i=0;i<1000;i++){
    this->page_sequence[i]=rand()%250+1;
  }
}

int pageFaults(int sequence[], int framesize){
  
  unordered_set<int> pages;
  queue<int> pageFIFO;
  int numFaults=0;
  for(int i=0;i<1000;i++){
    //FIFO is not full
    if(pageFIFO.size()<framesize){
      if(pages.find(sequence[i])==pages.end()){
	pages.insert(sequence[i]);
	numFaults++;
	pageFIFO.push(sequence[i]);
      }

    } else {
      //FIFO is FULL
      if(pages.find(sequence[i])==pages.end()){
	//Remove oldest page from fifo
	int oldest_page=pageFIFO.front();
	pageFIFO.pop();
	pages.erase(oldest_page);
	pages.insert(sequence[i]);
	//push new page to fifo
	pageFIFO.push(sequence[i]);
	numFaults++;
	
      }
      
    }
    
  }
  return numFaults;
}





  
