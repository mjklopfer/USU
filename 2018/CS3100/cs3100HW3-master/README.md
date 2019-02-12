Nathan Tipton
A01207112

Program accepts command line arguement. Use 0-9 or a-h as single arguemen to call the function, do not use a dash.

0) C++ Arithmetic Op Function (+)

   When this function is called, htop shows one of the cores almost immediately run up to 100%.  It is all user and no kernal.
Strace Shows one system call.
1) C++ Cmath library function (sqrt)
   When this function is called, htop shows one core completely being used at 100%. The time is all in user mode.

2) C++ memory new/delete function
   Htop shows one core is completely used at 100% in user mode.

3) C++ memory-leaking via new function
   htop shows that when this function is called one core is completely utilized. Around 90% is user mode with occasionally this jumping to 100%. A small portion occasionaly is in kernal. Memory usage begins to rapidly increase and quiting the function does not release the memory used.  Strace shows repeated system calls over and over again until the function is stopped.

4) Signal 0 to self
   strace shows a system call for kill with the given pid and sending SIG_0

5) SIGUSR2 to self
   strace shows a system call for kill with the given pid and sending SIGUSR2
6) nanosleep 1ns
Htop shows around 20-30% of a core being used in kernal mode. An occasional spike occurs of use in user mode. Strace shows repeated calls of nanosleep.
7) nanosleep 1000ns
Htop shows around 20-30% of a core being used in kernal mode. Strace shows repeated calls of nanosleep.
8) nanosleep 1000000ns
Strace shows repeated calls of nanosleep.
9) nanosleep 1000000000ns
   Htop shows the core being used 100%. The distribution between user and kernal is appoximately evenly distributed. Strace shows repeated calls of nanosleep with an invalid arguement error.
a)fork()
	Htop shows a core utilized at 100%. The majority of this time is in kernal mode with an occasional spike in user mode. Strace shows repeated system calls of clone with errors saying cannot allocate memory.
b)getcwd()
	Htop shows 100% utilization with 15-20% in user mode. Strace shows repeated system calls of getcwd and the cwd pathname
c)chdir()
	htop show 100% utilization with 15-20% in user mode. Strace shows repeated calls of chdir
d)access()
	htop shows 100% utilization with 15-20% in user mode. Strace shows repeated calls of access
e)sync()
	htop shows 100% utilization in kernal mode. Strace shows repeated calls of sync
f)chmod()
	htop shows 100% utilization in kernal mode. Strace did not appear to show anything for chmod
g)dup2()
	htop shows 100% utilization in kernal mode. Strace did not appear to show anything for dup2
h)clock()
	htop shows 100% utilization with 20-30% in user mode. Strace shows repeated clock_gettime calls.


Used strace.   strace -p PID  used the process ID obtained at main menu

Used htop   htop -d 1 used htop to see status of cores and memory
