#ifndef RM_HPP
#define RM_HPP

#include <deque>

#include "InputParser.hpp"
#include "Job.hpp"

// Queue to use for the algorithm. Uses a std::deque behind the scenes
class RMJobQueue : public JobQueue {
	std::deque<Job *> queue;

public:
	Job * front();
	void push_back(Job *);
	void push_front(Job *);
	void pop_front();
	unsigned int size();
	void setCurrentTime(int time) {}
};


void RM(SimulationDetails details, std::ofstream &output, bool useAperiodic);

#endif // RM_HPP