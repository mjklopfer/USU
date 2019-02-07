#include "RM.hpp"

#include <vector>
#include <deque>
#include <iomanip>
#include <algorithm>


// Forward all job queue operations to the underlying structure
Job * RMJobQueue::front() {
	return queue.front();
}

void RMJobQueue::push_back(Job * job) {
	queue.push_back(job);
}

void RMJobQueue::push_front(Job * job) {
	queue.push_front(job);
}

void RMJobQueue::pop_front() {
	queue.pop_front();
}

unsigned int RMJobQueue::size() {
	return queue.size();
}


// Run RM simulation
void RM(SimulationDetails details, std::ofstream &output, bool useAperiodic) {
	output << std::endl << std::endl << "Running RM";
	if (useAperiodic)
		output << " with aperiodic tasks:" << std::endl;
	else
		output << " with only the periodic tasks:" << std::endl;

	output << std::left << std::setw(10) << "ID" << std::setw(10) << "Start" << std::setw(10) << "End" << std::setw(10) << "Flags" << std::endl;

	std::sort(details.tasks.begin(), details.tasks.end(),
		[](TaskDetails *lhs, TaskDetails *rhs) {
			return lhs->time < rhs->time;
		});
	std::sort(details.tasks.begin(), details.tasks.end(),
		[](TaskDetails *lhs, TaskDetails *rhs) {
			return lhs->period < rhs->period;
		});

	std::vector<Job *> jobList;
	RMJobQueue jobQueue;

	// Create the list of jobs
	for (int time = 0; time < details.simTime; time++) {
		for (auto i: details.tasks) {
			if (time % i->period == 0) {
				Job *job = new Job(i, time, jobList, true);
				jobList.push_back(job);
			}
		}
		// Only create the aperiodic jobs when running an aperiodic simulation
		if (useAperiodic) {
			for (auto i: details.aperiodicTasks) {
			if (i->period == time) {
				Job *job = new Job(i, time, jobList, false);
				jobList.push_back(job);
			}
		}
		}
	}

	for (auto i: jobList) {
		jobQueue.push_back(i);
	}

	// Run the job simulation
	simulateJobs(details, output, useAperiodic, jobList, jobQueue);
}
