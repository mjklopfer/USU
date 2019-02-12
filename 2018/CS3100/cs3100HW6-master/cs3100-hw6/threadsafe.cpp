#include <iostream>
#include <mutex>
#include <queue>
#include <unordered_map>
#include "threadsafe.hpp"

void piQueue:: lock(){
  mutexQ.lock();
}

void piQueue:: unlock(){
  mutexQ.unlock();

}

void piMap:: lock(){
  mutexM.lock();
}

void piMap:: unlock(){
  mutexM.unlock();
}
