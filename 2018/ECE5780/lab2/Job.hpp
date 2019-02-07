#ifndef JOB_HPP
#define JOB_HPP

#include "InputParser.hpp"
#include <vector>
#include <deque>
#include <iostream>

// Structure to store the details for each job
struct Job {
	TaskDetails *details;
	int jobNum;
	int releaseTime;
	int deadline;
	int timeExecuted;
	int startedAt;
	int finishedAt;
	int preemptions;
	bool missedDeadline;

	// Initializer
	Job(TaskDetails *details, int start, std::vector<Job *> &currentJobs, bool periodic);

	// Output formatting
	friend std::ostream& operator<<(std::ostream & os, const Job &rhs);
};


// Queue for storing the jobs to be processed.
// RM and EDF will implement this slightly differently to handle different priority schemes
class JobQueue {
public:
	virtual Job * front() = 0;
	virtual void push_back(Job *) = 0;
	virtual void push_front(Job *) = 0;
	virtual void pop_front() = 0;
	virtual unsigned int size() = 0;
	virtual void setCurrentTime(int time) = 0;
};


// Run the simulation
void simulateJobs(SimulationDetails &details, std::ofstream &output, bool useAperiodic, std::vector<Job *> &jobList, JobQueue &jobQueue);


#endif // JOB_HPP