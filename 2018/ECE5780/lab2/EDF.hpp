#ifndef EDF_HPP
#define EDF_HPP

#include <queue>
#include <vector>

#include "InputParser.hpp"
#include "Job.hpp"

// Determination of priority for EDF
struct LessThanJobPriority {
	static int currentTime;
	bool operator()(const Job *lhs, const Job *rhs) {
		if (lhs->releaseTime <= currentTime && rhs->releaseTime <= currentTime) {
			return lhs->deadline > rhs->deadline;
		}
		else if (lhs->releaseTime <= currentTime && rhs->releaseTime > currentTime) {
			return false;
		}
		else if (lhs->releaseTime > currentTime && rhs->releaseTime <= currentTime) {
			return true;
		}
		else {
			return lhs->releaseTime > rhs->releaseTime;
		}
	}
};

// Queue to use for the algorithm. Uses a std::priority_queue behind the scenes
class EDFJobQueue : public JobQueue {
	std::priority_queue<Job *, std::vector<Job *>, LessThanJobPriority> queue;

public:
	Job * front();
	void push_back(Job *);
	void push_front(Job *);
	void pop_front();
	unsigned int size();
	void setCurrentTime(int time) {
		LessThanJobPriority::currentTime = time;
	}
};

void EDF(SimulationDetails details, std::ofstream &output, bool useAperiodic);


#endif // EDF_HPP