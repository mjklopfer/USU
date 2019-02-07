#include <stdlib.h>
#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"


#define TOUCH_PORT NXT_PORT_S2
#define SONAR_PORT NXT_PORT_S3
#define LEFT_MOTOR NXT_PORT_C
#define RIGHT_MOTOR NXT_PORT_A


// Declare all tasks, alarms, counters, resources, and events
DeclareCounter(SysTimerCnt);
DeclareAlarm(AlarmWriteDisplay);
DeclareEvent(EventWriteDisplay);
DeclareAlarm(AlarmDispatch);
DeclareEvent(EventDispatch);
DeclareEvent(TouchOnEvent);
DeclareEvent(TouchOffEvent);
DeclareEvent(EdgeDetectedEvent);
DeclareTask(WriteDisplay);
DeclareTask(EventDispatcherTask);
DeclareTask(MotorControlTask);
DeclareResource(SharedResource);

/* nxtOSEK hooks */
void ecrobot_device_initialize(void)
{
    ecrobot_init_sonar_sensor(SONAR_PORT);
}

void ecrobot_device_terminate(void)
{
    ecrobot_term_sonar_sensor(SONAR_PORT);
}

/* nxtOSEK hook to be invoked from an ISR in category 2 */
void user_1ms_isr_type2(void)
{
    // Increment the signal counter (Used for timing the alarms)
	(void)SignalCounter(SysTimerCnt);
}

// Shared properties used for logging data to the screen
// Usage of these properties should be protected with the SharedResource semaphore
char touchState = 0;
char driveState = 0;
int distanceValue = 0;
char cliffState = 0;

// Task to handle writing the light values to the display
TASK(WriteDisplay)
{
    SetRelAlarm(AlarmWriteDisplay, 1, 500);

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
        display_goto_xy(0, 4);
        display_string("Touch State:");
        
        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);

        display_int(touchState, 0);

        display_goto_xy(0, 5);
        display_string("Drive State:");
        display_int(driveState, 0);

        display_goto_xy(0, 6);
        display_string("Distance:");
        display_int(distanceValue, 0);
        display_string(",");
        display_int(cliffState, 0);

        // Vacate the semaphore to allow the read task to save its data
        ReleaseResource(SharedResource);

        // Commit the changes to the display
		display_update();
    }
}

// Task to handle reading the current light value from the color sensor
TASK(EventDispatcherTask)
{
    SetRelAlarm(AlarmDispatch, 1, 10);

    while(1)
    {
        // Wait for the dispatch event to be triggered to begin executing
        WaitEvent(EventDispatch);
        // Clear the event flag so the event can be triggered again in the future, and to prevent this loop from repeating immediately because the event is active
        ClearEvent(EventDispatch);

        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);
        
        // Read touch sensor value
        char touch = ecrobot_get_touch_sensor(TOUCH_PORT);

        // Touch state changed
        if (touchState != touch) {
            touchState = touch;
            // Start driving
            if (touch && cliffState == 0) {
                SetEvent(MotorControlTask, TouchOnEvent);
            }
            // Stop driving
            else {
                SetEvent(MotorControlTask, TouchOffEvent);
            }
        }

        // Read ultrasonic value
        distanceValue = ecrobot_get_sonar_sensor(SONAR_PORT);

        // Update tasks based on ultrasonic value
        // Just went over the edge
        if (distanceValue > 18 && cliffState == 0) {
            SetEvent(MotorControlTask, EdgeDetectedEvent);
            cliffState = 1;
        }
        // No edge
        else if (distanceValue <= 18) {
            cliffState = 0;
        }

        // Vacate the semaphore to allow the read task to save its data
        ReleaseResource(SharedResource);
    }
}

// Task to handle task configuration and communicatino with the color sensor
TASK(MotorControlTask)
{
    while(1)
    {
        // Wait for any of the control events
        WaitEvent(TouchOnEvent | TouchOffEvent | EdgeDetectedEvent);

        // Figure out which event occured
        EventMaskType eventmask = 0;
        GetEvent(MotorControlTask, &eventmask);

        char driving = 0;
        if (eventmask & TouchOnEvent) {
            // Touch started, start driving
            driving = 1;
            ClearEvent(TouchOnEvent);
        }
        else {
            // Stop driving
            driving = 0;
            if (eventmask & TouchOffEvent) {
                // Stop due to touch off
                ClearEvent(TouchOffEvent);
            }
            else if (eventmask & EdgeDetectedEvent) {
                // Stop due to edge detected
                ClearEvent(EdgeDetectedEvent);
            }
        }

        // Drive
        if (driving == 1) {
            nxt_motor_set_speed(LEFT_MOTOR, 100, 0);
            nxt_motor_set_speed(RIGHT_MOTOR, 100, 0);
        }
        // Stop
        else {
            nxt_motor_set_speed(LEFT_MOTOR, 0, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, 0, 1);
        }

        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);

        driveState = driving;

        // Vacate the semaphore to allow the read task to save its data
        ReleaseResource(SharedResource);
    }
}

