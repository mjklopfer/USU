#include "EDF.hpp"

#include "Job.hpp"
#include <vector>
#include <deque>
#include <queue>
#include <iomanip>
#include <algorithm>

int LessThanJobPriority::currentTime = 0;

// Forward all job queue operations to the underlying structure
Job * EDFJobQueue::front() {
	return queue.top();
}

// Push back and push front don't matter with a priority queue,
// They both push to the same place
void EDFJobQueue::push_back(Job * job) {
	queue.push(job);
}

void EDFJobQueue::push_front(Job * job) {
	queue.push(job);
}

void EDFJobQueue::pop_front() {
	queue.pop();
}

unsigned int EDFJobQueue::size() {
	return queue.size();
}


// Run EDF simulation
void EDF(SimulationDetails details, std::ofstream &output, bool useAperiodic) {
	output << std::endl << std::endl << "Running EDF";
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
	EDFJobQueue jobQueue;

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
