#ifndef INPUT_PARSER_HPP
#define INPUT_PARSER_HPP

#include <iostream>
#include <fstream>
#include <vector>


// Stores details for a task
struct TaskDetails {
	char id;
	int time;
	int period;

	TaskDetails(char id, int time, int period) : id(id), time(time), period(period) {};
};


// Stores details for the simulation
struct SimulationDetails {
	int numTasks;
	int simTime;
	int numAperiodic;
	std::vector<TaskDetails *> tasks;
	std::vector<TaskDetails *> aperiodicTasks;

	SimulationDetails(std::ifstream &);
};

#endif // RM_HPP