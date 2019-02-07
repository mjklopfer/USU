cmake_minimum_required (VERSION 3.0)
project (Lab2)

if (CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
endif()

add_executable(Lab2
  main.cpp
  InputParser.hpp InputParser.cpp
  RM.hpp RM.cpp
  EDF.hpp EDF.cpp
  Job.hpp Job.cpp
  )

set_target_properties(Lab2
  PROPERTIES
    CXX_STANDARD 11
    OUTPUT_NAME "lab2"
  )
