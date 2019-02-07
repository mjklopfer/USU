#include "Job.hpp"

#include <deque>
#include <iomanip>
#include <algorithm>


// Create a new job from a task
Job::Job(TaskDetails *details, int start, std::vector<Job *> &currentJobs, bool periodic) {
	this->details = details;
	releaseTime = start;
	if (periodic) {
		deadline = start + details->period;
	}
	else {
		// Aperiodic deadlines are always 500 + plus the release time
		deadline = start + 500;
	}
	timeExecuted = 0;
	startedAt = 0;
	finishedAt = 0;
	preemptions = 0;
	missedDeadline = false;
	// Calculate which iteration of the task. This is mostly for logging/debugging purposes.
	jobNum = std::count_if(currentJobs.begin(), currentJobs.end(), 
		[details](Job *job) { return job->details->id == details->id; }) + 1;
}

// Output formatting for a job
std::ostream& operator<<(std::ostream & os, const Job &rhs) {
	std::string idStr;
	idStr.push_back(rhs.details->id);
	idStr += "(";
	idStr += std::to_string(rhs.jobNum);
	idStr += ")";

	os << std::left << std::setw(10) << idStr;
	os << std::setw(10) << rhs.startedAt + 1;
	os << std::setw(10) << rhs.finishedAt + 1;
	os << std::setw(10);
	if (rhs.missedDeadline)
		os << "d";

	return os;
}


// Run the simulation for the jobs. The logic here is identical between RM and EDF
// The two algorithms will insert their own queue structures to manage priority
void simulateJobs(SimulationDetails &details, std::ofstream &output, bool useAperiodic, std::vector<Job *> &jobList, JobQueue &jobQueue) {
	Job *active = NULL;
	// Run the simulation over the simulation time
	for (int time = 0; time < details.simTime; time++) {
		jobQueue.setCurrentTime(time);
		
		// Test for preemption
		if (active != NULL && 
				 jobQueue.size() > 0 && 
				 jobQueue.front()->releaseTime <= time && 
				 jobQueue.front()->deadline < active->deadline) {

			// Swap the active job and the job on the top of the queue
			Job *preemption = jobQueue.front();
			jobQueue.pop_front();
			jobQueue.push_front(active);
			preemption->startedAt = time;
			active->preemptions++;
			active->finishedAt = time - 1;

			// Log preemption
			output << *active << "p" << std::endl;
			active = preemption;
		}
		// Get the next job to run
		while (active == NULL && jobQueue.size() > 0 && jobQueue.front()->releaseTime <= time) {
			active = jobQueue.front();
			jobQueue.pop_front();
			active->startedAt = time;

			// It's possible we missed the deadline for a task on the queue, so flag it and skip it
			if (active->deadline <= time) {
				active->missedDeadline = true;
				active->finishedAt = time;

				// Log missed deadline
				output << *active << std::endl;
				active = NULL;
			}
		}

		// If processing a current job, update the execution time, and check if it is finished
		if (active != NULL) {
			active->timeExecuted++;
			// Check if finished
			if (active->timeExecuted == active->details->time) {
				active->finishedAt = time;

				// Log finished task
				output << *active << std::endl;
				active = NULL;
			}
			// Check if missed deadline
			else if (active->timeExecuted < active->details->time && active->deadline <= time) {
				active->missedDeadline = true;
				active->finishedAt = time;

				// Log missed deadline
				output << *active << std::endl;
				active = NULL;
			}
		}
	}

	// Output summary
	output << "Summary" << std::endl;
	int totalPreemptions = 0;
	int totalDeadlineMisses = 0;

	// Calculate preemptions and missed deadlines for each task
	// for both periodic and aperiodic tasks,
	// and calculate totals
	for (auto t: details.tasks) {
		int preemptions = 0;
		int deadlineMisses = 0;
		for (auto j: jobList) {
			if (j->details->id == t->id) {
				preemptions += j->preemptions;
				if (j->missedDeadline)
					deadlineMisses += 1;
			}
		}

		output << "Task " << t->id << " was preempted " << preemptions << " times, and missed " << deadlineMisses << " deadlines." << std::endl;

		totalPreemptions += preemptions;
		totalDeadlineMisses += deadlineMisses;
	}
	if (useAperiodic) {
		for (auto t: details.aperiodicTasks) {
			int preemptions = 0;
			int deadlineMisses = 0;
			for (auto j: jobList) {
				if (j->details->id == t->id) {
					preemptions += j->preemptions;
					if (j->missedDeadline)
						deadlineMisses += 1;
				}
			}

			output << "Task " << t->id << " was preempted " << preemptions << " times, and missed " << deadlineMisses << " deadlines." << std::endl;

			totalPreemptions += preemptions;
			totalDeadlineMisses += deadlineMisses;
		}
	}

	output << "Total preemptions: " << totalPreemptions << ", total deadline misses: " << totalDeadlineMisses << std::endl;
}