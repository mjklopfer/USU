-- ECE 5780
-- Spring 2018
-- Nathan Tipton, Erik Sargent

with Ada.Text_IO;
use  Ada.Text_IO;

with Text_Io;
use  Text_Io;

with Ada.Calendar;
use  Ada.Calendar;

with Ada.Numerics.Discrete_Random;
use  Ada.Numerics;

procedure Part2  is
   
   F1_Start, F2_Start, F3_Start: Duration;
   Before, ScheduledRunTime: Time;

   -- Create a watchdog
   task type Watchdog is
    entry Start(timeout: Time);
    entry feed;
   end Watchdog;

   task body Watchdog is
    watchedTime: Time;
    watching: Boolean := false;
    
   begin
    loop
      select
        -- Set the timeout for the watchdog to start complaining about the missed deadline
        accept Start(timeout: Time) do
          watchedTime := timeout;
          watching := true;
        end Start;
      or
        -- Feed the watchdog to prevent it from complaining about the missed deadline
        when watching => accept feed do
          watchedTime := watchedTime + 2.0;
          watching := false;
        end feed;
      or
        -- The deadline was missed, so complain about it
        when watching => delay until watchedTime;
          Put_Line("");
          Put_Line("---WATCHDOG---");
          -- watching := false;
          watchedTime := watchedTime + 2.0;
          -- exit;

      end select;
    end loop;
   end Watchdog;

   watcher: Watchdog;

   -- Random number generator
   subtype Num_Gen is Integer range 0 .. 10;
   package Random_Gen is new Ada.Numerics.Discrete_Random(Num_Gen);
   use Random_Gen;
   G: Random_Gen.Generator;
   
   package DIO is new Text_Io.Fixed_Io(Duration); --To print Duration variables you can instantiate the generic 
						  --package Text_Io.Fixed_Io with a duration type: 
						  --"package DIO is new Text_Io.Fixed_Io(Duration);" 
						  --The DIO package will then export, among other things, 
						  --the procedure DIO.Put(D:Duration, Fore:Field, Aft:Field) 
						  --to print variable D of type Duration. See an example
						  --on how to use this below.
   
   --Declare F1, which prints out a message when it starts and stops executing
   procedure F1(Currtime: Time; StartF1: Duration) is 
        RunTime: Duration := 0.3;
   begin
   Put_Line(""); --Add a new line
   Put("F1 has started executing. The time is now:");
   DIO.Put(Ada.Calendar.Clock - Currtime);
     delay until Currtime + StartF1 + RunTime;
   Put_Line("");
   Put("F1 has finished executing. The time is now:");
   DIO.Put(Ada.Calendar.Clock - Currtime); --Needed since time starts at 0 and RunTime and StartF1 are not virtual times
   end F1;

   --Declare F2, which prints out a message when it starts and stops executing
   procedure F2(Currtime: Time; StartF2: Duration) is 
        RunTime: Duration := 0.15;
   begin
     Put_Line(""); --Add a new line
     Put(" F2 has started executing. The time is now:");
     DIO.Put(Ada.Calendar.Clock - Currtime);
     delay until Currtime + StartF2 + RunTime;
     Put_Line("");
     Put(" F2 has finished executing. The time is now:");
     DIO.Put(Ada.Calendar.Clock - Currtime); --Needed since time starts at 0 and RunTime and StartF2 are not virtual times
   end F2;

   --Declare F3, which prints out a message when it starts and stops executing
   procedure F3(Currtime: Time; StartF3: Duration) is 
        RunTime: Duration;
   begin
     -- Generate random delay (in range [0.45, 0.55] seconds)
     RunTime := 0.45 + Duration(Float(random(G)) / 100.0);
     Put_Line(""); --Add a new line
     Put("  F3 has started executing. The time is now:");
     DIO.Put(Ada.Calendar.Clock - Currtime);
     delay until Currtime + StartF3 + RunTime;
     Put_Line("");
     Put("  F3 has finished executing. The time is now:");
     DIO.Put(Ada.Calendar.Clock - Currtime); --Needed since time starts at 0 and RunTime and StartF3 are not virtual times
   end F3;
      
begin
   Reset(G);

   Before := Ada.Calendar.Clock;
   ScheduledRunTime := Before;
   
   --Main loop
   loop
        ScheduledRunTime := ScheduledRunTime + 1.0;
        delay until ScheduledRunTime;

        F1_Start := ScheduledRunTime - Before;
        F1(Currtime => Before, StartF1 => F1_Start); --Initialize F1

        F2_Start := ScheduledRunTime - Before + 0.3;
        F2(Currtime => Before, StartF2 => F2_Start); --Initialize F1

        delay until ScheduledRunTime + 0.5;
        F3_Start := ScheduledRunTime - Before + 0.5;
        watcher.Start(ScheduledRunTime + 1.0);
        F3(Currtime => Before, StartF3 => F3_Start); --Initialize F1
        watcher.feed;

        if Ada.Calendar.Clock > ScheduledRunTime + 1.0 then
          ScheduledRunTime := ScheduledRunTime + 1.0;
        end if;
	
   end loop; --Main loop
  
  end Part2; 
