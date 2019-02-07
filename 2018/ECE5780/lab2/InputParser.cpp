#include "InputParser.hpp"

#include <algorithm>
#include <string>


// Parse the task details from the input file
std::vector<TaskDetails *> parseTasks(std::ifstream &input, int numTasks) {
	std::vector<TaskDetails *> tasks;

	int numRead = 0;
	char id;
	int time, period;
	std::string inputTask;
	while (numRead < numTasks && input.good()) {

		// Read in task details
		std::string parameter;
		if (std::getline(input, parameter, ',')) {
			id = 0;
			int index = 0;
			while (id < 48)
				id = parameter.c_str()[index++];
		}
		if (std::getline(input, parameter, ',')) {
			time = std::stoi(parameter);
		}
		if (std::getline(input, parameter)) {
			period = std::stoi(parameter);
		}

		// Add the task to the list
		TaskDetails *task = new TaskDetails(id, time, period);
		tasks.push_back(task);

		numRead++;
	}

	return tasks;
}


// Read in the simulation details from the input file
SimulationDetails::SimulationDetails(std::ifstream &input) {
	input >> numTasks;
	input >> simTime;

	std::cout << "Num Tasks: " << numTasks << "; Sim Time: " << simTime << std::endl;

	// Parse the periodic tasks
	tasks = parseTasks(input, numTasks);
	std::cout << "Num tasks added " << tasks.size() << std::endl;

	input >> numAperiodic;

	std::cout << "Num Aperiodic Tasks: " << numTasks << std::endl;

	// Parse the aperiodic tasks
	aperiodicTasks = parseTasks(input, numTasks);
}
