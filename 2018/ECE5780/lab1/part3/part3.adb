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

procedure Part3  is
  -- Random time interval generator type
  subtype Time_Gen is Integer range 0 .. 10;
  package Random_Time_Gen is new Ada.Numerics.Discrete_Random(Time_Gen);
  use Random_Time_Gen;
  G_Time: Random_Time_Gen.Generator;


  -- Task for the buffer
  task type Buffer_Task is
    -- Rendezvous
    entry Insert(i: in Integer);
    entry Remove(i: out Integer);
    entry Done;
  end Buffer_Task;

  task body Buffer_Task is
    -- Internal buffer type
    type Arr_Type is array (Integer range <>) of Integer;
    -- Internal buffer
    arr: Arr_Type (0 .. 9);

    -- Values to track indexes in the buffer
    max_size: Integer := 10;
    curr_size: Integer := 0;
    index: Integer := 0;

    -- Helper function to determine if the buffer is full
    function is_full return Boolean is
    begin
      return (curr_size = max_size);
    end is_full;

    -- Helper function to determine if the buffer is empty
    function is_empty return Boolean is
    begin
      return (curr_size = 0);
    end is_empty;

    -- Helper function to calculate the index to insert into in the buffer
    function insert_index return Integer is
    begin
      return (index + curr_size) mod max_size;
    end insert_index;

    -- Helper function to calculate the index to remove from in the buffer
    function remove_index return Integer is
    begin
      return index;
    end remove_index;

    finished: Boolean := false;

  begin
    -- Initialize the values in the buffer to -1 (makes debugging easier)
    for I in Arr'Range loop
      Arr(I) := -1;
    end loop;

    loop
      select
        -- Handle the insertion when the buffer is not full
        when not is_full =>
          accept Insert(i: in Integer) do

            arr(insert_index) := i;

            -- Update sizes
            curr_size := curr_size + 1;
          
          end Insert;
      or
        -- Handle the deletion when the buffer is not empty
        when not is_empty =>
          accept Remove(i: out Integer) do
           
            i := arr(remove_index);

            -- Update sizes
            curr_size := curr_size - 1;
            arr(index) := -1;
            index := (index + 1) mod max_size;
          
          end Remove;
      or 
        -- Handle synchronization with consumer finishing
        accept Done do
          finished := true;
        end Done;
      end select;

      exit when finished;

    end loop;
  end Buffer_Task;

  -- Create buffer
  Buffer: Buffer_Task;

  -- Task for the producer
  task type Producer_Task is
    entry Done;
  end Producer_Task;

  task body Producer_Task is
    -- Random producer value type
    subtype Num_Gen is Integer range 0 .. 25;
    package Random_Gen is new Ada.Numerics.Discrete_Random(Num_Gen);
    use Random_Gen;
    G: Random_Gen.Generator;

    value: Integer;
    finished: Boolean := false;

  begin
    Reset(G);

    loop
      select
        -- Handle synchronization with consumer finishing
        accept Done do
          finished := true;
        end Done;
      or
        -- Delay for a random time interval (between 0 and 1 second)
        delay Duration(float(random(G_Time)) / 10.0);
        
        -- Get a random number and insert it into the buffer
        value := random(G);
        Put_line("Producer is inserting value: " & Integer'Image(value));
        -- This is conditional rendezvous so it will wait here until the buffer accepts the new value
        Buffer.Insert(value);

      end select;

      exit when finished;

    end loop;
  end Producer_Task;

  -- Create producer
  Producer: Producer_Task;

  -- Task for the consumer
  task type Consumer_Task is
  end Consumer_Task;

  task body Consumer_Task is
    sum: Integer := 0;
    value: Integer;
  begin
    loop
      -- Delay for a random time interval (between 0.5 and 1.5 seconds)
      delay Duration(float(random(G_Time)) / 10.0) + 0.5;

      -- Remove a value from the buffer
      -- This is a rendezvous so it will wait here until there is a value available to remove
      Buffer.Remove(value);
      sum := sum + value;

      Put_line("Consumer removed the value: " & Integer'Image(value) & ", the new sum is: " & Integer'Image(sum));
      
      -- Exit if the sum is >= 100
      if sum >= 100 then
        -- Trigger the exit in the other tasks
        Buffer.Done;
        Producer.Done;
        exit;
      end if;      

    end loop;

  end Consumer_Task;
  
  -- Create consumer
  Consumer: Consumer_Task;

begin

  reset(G_Time);
  
end Part3; 
