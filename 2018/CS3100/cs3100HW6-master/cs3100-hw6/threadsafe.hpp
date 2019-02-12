#ifndef THREADSAFE_HPP
#define THREADSAFE_HPP

#include <queue>
#include <mutex>

using namespace std;

class piQueue {
public:
  queue<int> digitQueue;


  void lock();
  void unlock();
private:
  mutex mutexQ;


};





class piMap {
public:
  unordered_map<int,int> digitMap;
  void lock();
  void unlock();
  

private:
  mutex mutexM;




};













#endif
