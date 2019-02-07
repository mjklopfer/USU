#include <stdlib.h>
#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"

// Port used for the color sensor
#define COLOR_PORT_ID NXT_PORT_S1

// Declare all tasks, alarms, counters, resources, and events
DeclareCounter(SysTimerCnt);
DeclareAlarm(AlarmWriteDisplay);
DeclareEvent(EventWriteDisplay);
DeclareAlarm(AlarmReadSensor);
DeclareEvent(EventReadSensor);
DeclareTask(WriteDisplay);
DeclareTask(ReadColorSensor);
DeclareTask(CommColorSensor);
DeclareResource(SharedResource);

/* nxtOSEK hooks */
void ecrobot_device_initialize(void)
{
    // Initialize the color sensor on port COLOR_PORT_ID
	ecrobot_init_nxtcolorsensor(COLOR_PORT_ID, NXT_COLORSENSOR);

    // Set the config for the color sensor (NXT_LIGHTSENSOR_NONE makes the color sensor behave like a light sensor)
    ecrobot_set_nxtcolorsensor(COLOR_PORT_ID, NXT_LIGHTSENSOR_NONE);
}

void ecrobot_device_terminate(void)
{
    // Close the connection with the color sensor when the program terminates
	ecrobot_term_nxtcolorsensor(COLOR_PORT_ID);
}

/* nxtOSEK hook to be invoked from an ISR in category 2 */
void user_1ms_isr_type2(void)
{
    // Increment the signal counter (Used for timing the alarms)
	(void)SignalCounter(SysTimerCnt);
}

// Shared properties to track the light readings between the WriteDisplay and ReadColorSensor tasks
// Usage of these properties should be protected with the SharedResource semaphore
int total_readings = 0;
int current_value = 0;
int samples_since_update = 0;

// Task to handle writing the light values to the display
TASK(WriteDisplay)
{
    while(1)
    {
        // Wait for the write display event to be triggered to begin executing
        WaitEvent(EventWriteDisplay);
        // Clear the event flag so the event can be triggered again in the future, and to prevent this loop from repeating immediately because the event is active
        ClearEvent(EventWriteDisplay);

        // Write the Welcome text to the display in the format:
		display_clear(0);
		display_goto_xy(0, 0);
        display_string("Welcome!");
        display_goto_xy(0, 1);
        display_string("To My World!");
        display_goto_xy(0, 2);
        display_string("Names:");
        display_goto_xy(0, 3);
        display_string("Erik and Nate");
        display_goto_xy(0, 5);
        display_string("LightSensor:");
        
        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);
        // Calculate the average of the last several samples and write it to the screen
        // There should be 5 samples recorded in between writing to the display
        // But this value is tracked dynamically to prevent value errors in case there are not 5 value updates
        display_int(current_value / samples_since_update, 0);

        // Reset the current value and samples since update
        current_value = 0;
        samples_since_update = 0;

        // Print out the total number of samples
        display_goto_xy(0, 6);
        display_string("Count: ");
        display_int(total_readings, 0);

        // Vacate the semaphore to allow the read task to save its data
        ReleaseResource(SharedResource);

        // Commit the changes to the display
		display_update();
    }
}

// Task to handle reading the current light value from the color sensor
TASK(ReadColorSensor)
{
    while(1)
    {
        // Wait for the read sensor event to be triggered to begin executing
        WaitEvent(EventReadSensor);
        // Clear the event flag so the event can be triggered again in the future, and to prevent this loop from repeating immediately because the event is active
        ClearEvent(EventReadSensor);

        // Procure the resource (semaphore) to prevent the display task from writing the values while this task is updating them
        GetResource(SharedResource);

        // Get the current color sensor reading and add it to the current average accumulator
        current_value += ecrobot_get_nxtcolorsensor_light(COLOR_PORT_ID);

        // Increment the number of samples since update, this will be used to calculate the average by the display task
        samples_since_update++;

        // Increment the total number of readings
        total_readings++;

        // Vacate the semaphore to allow the display task to access the shared values
        ReleaseResource(SharedResource);
    }
}

// Task to handle task configuration and communicatino with the color sensor
TASK(CommColorSensor)
{
    // The write display alarm will be triggered every 500ms
    // The read sensor alarm will be triggered every 100ms
    SetRelAlarm(AlarmWriteDisplay, 1, 500);
    SetRelAlarm(AlarmReadSensor, 1, 100);
    while(1)
    {
        // Communicate with the color sensor
        ecrobot_process_bg_nxtcolorsensor();
    }
}

