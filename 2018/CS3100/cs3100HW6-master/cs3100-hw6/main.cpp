#include <iostream>
#include <thread>
#include <vector>
#include <memory>
#include <queue>
#include <unordered_map>
#include <mutex>


#include "computePi.hpp"
#include "threadsafe.hpp"

using namespace std;
void threadWorker(piQueue&  Q, piMap& M) {
    //
    // This code exists simply to illustrate a worker thread.
    // I had better not see this in your final submission.
  //  std::cout << "Hi! I'm thread number " << threadNum << ", and I can count to 10!\n";
  // for (int i = 1; i <= 10; ++i)
  //		std::cout << "[" <<  threadNum << "] " << i << std::endl;
  //
  //std::cout <http://www.cplusplus.com/reference/queue/queue/front/< "[" <<  threadNum << "] watch me compute digit #"
  //    << threadNum+1 << " of pi: "
  //    << computePiDigit(threadNum+1) << std::endl;

    int piDigit;
    int piVal;
    //obtain digit of pi from queue
    while(Q.digitQueue.size()>0){
    Q.lock();
    piDigit=Q.digitQueue.front();
    Q.digitQueue.pop();
    Q.unlock();

    //calculate digit of pi
    cout<<".";
    cout.flush();
    piVal=computePiDigit(piDigit);

    M.lock();
    M.digitMap.insert({piDigit,piVal});
    M.unlock();

    }

    



    
}



int main() {
  piQueue Q;
  for(int i=1;i<1001;i++){
    Q.digitQueue.push(i);

  }
  piMap M;
  
	//
	// Make as many threads as there are CPU cores
    // Assign them to run our threadWorker function, and supply arguments as necessary for that function
  
	std::vector<std::shared_ptr<std::thread>> threads;
	for (std::uint16_t core = 0; core < std::thread::hardware_concurrency(); core++)
        // The arguments you wish to pass to threadWorker are passed as
        // arguments to the constructor of std::thread
	  threads.push_back(std::make_shared<std::thread>(threadWorker,ref(Q),ref(M)));

	//
	// Wait for all of these threads to complete
	for (auto&& thread : threads)
		thread->join();

	std::cout << std::endl << std::endl;
	

	cout<<"3.";
	for(int i=1; i<1001;i++){
	  cout<<M.digitMap.at(i);
	}
	cout<<endl;
	return 0;
}
