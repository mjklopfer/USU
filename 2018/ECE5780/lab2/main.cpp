#include <iostream>
#include <fstream>

#include "InputParser.hpp"
#include "RM.hpp"
#include "EDF.hpp"

using namespace std;

int main(int argc, char const *argv[])
{
  //Determine if input contains valid number of arguments
  if(argc<3){
    cout<<"Insufficient number of arguments"<<endl;
    return 1;
  }

  // Open the input file
  ifstream fin;
  fin.open(argv[1]);
  if(!fin.is_open()){
    cout<<"Error opening file"<<endl;
    return 2;
  }

  // Open the output file
  ofstream fout;
  fout.open(argv[2]);

  // Read the simulation details
  SimulationDetails details(fin);

  // Run the RM and EDF simulations, both without and with aperiodic tasks
  RM(details, fout, false);
  EDF(details, fout, false);

  if (details.aperiodicTasks.size() > 0) {
    RM(details, fout, true);
    EDF(details, fout, true);
  }

  return 0;
}
