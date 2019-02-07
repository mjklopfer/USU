#include <stdlib.h>
#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"


#define SONAR_PORT NXT_PORT_S2
#define TOUCH2_PORT NXT_PORT_S3
#define LIGHT_PORT NXT_PORT_S4
#define ARM_MOTOR NXT_PORT_B

int LEFT_MOTOR = NXT_PORT_C;
int RIGHT_MOTOR = NXT_PORT_A;


int min(int lhs, int rhs) {
    if (lhs < rhs) {
        return lhs;
    }
    return rhs;
}


// Declare all tasks, alarms, counters, resources, and events
DeclareCounter(SysTimerCnt);
DeclareAlarm(AlarmWriteDisplay);
DeclareEvent(EventWriteDisplay);
DeclareAlarm(AlarmDispatch);
DeclareEvent(EventDispatch);
DeclareEvent(LightSweepForwardEvent);
DeclareEvent(LightSweepBackwardEvent);
DeclareEvent(BoxDetected);
DeclareEvent(LineDetected);
DeclareEvent(LineLost);
DeclareTask(WriteDisplay);
DeclareTask(EventDispatcherTask);
DeclareTask(MotorControlTask);
DeclareTask(LightSweepTask);
DeclareResource(SharedResource);

/* nxtOSEK hooks */
void ecrobot_device_initialize(void)
{
    // Initialize the color sensor on port COLOR_PORT_ID
	ecrobot_init_nxtcolorsensor(LIGHT_PORT, NXT_COLORSENSOR);

    // Set the config for the color sensor (NXT_LIGHTSENSOR_NONE makes the color sensor behave like a light sensor)
    ecrobot_set_nxtcolorsensor(LIGHT_PORT, NXT_LIGHTSENSOR_RED);
    ecrobot_init_sonar_sensor(SONAR_PORT);
}

void ecrobot_device_terminate(void)
{
    // Close the connection with the color sensor when the program terminates
	ecrobot_term_nxtcolorsensor(LIGHT_PORT);
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
char prevArmState = 0;
char driveState = 0;
char lineVisible = 0;
int timeSinceLineChange = 0;
int distanceValue = 0;
int boxState = 0;
char checkedDirection = 0;
int startingTime;

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
        display_string("Distance:");
        
        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);

        display_int(distanceValue, 0);

        display_goto_xy(0, 5);
        display_string("Drive State:");
        display_int(driveState, 0);

        display_goto_xy(0, 6);
        display_string("Touch2:");
        display_int(prevArmState, 0);


        display_goto_xy(0, 7);
        display_int(prevArmState, 1);
        display_string(",");
        display_int(nxt_motor_get_count(ARM_MOTOR), 1);

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
    startingTime = systick_get_ms();

    while(1)
    {
        // Wait for the dispatch event to be triggered to begin executing
        WaitEvent(EventDispatch);
        // Clear the event flag so the event can be triggered again in the future, and to prevent this loop from repeating immediately because the event is active
        ClearEvent(EventDispatch);

        // Procure the semaphore to enable usage of the shared values
        GetResource(SharedResource);
        
        if (!checkedDirection && systick_get_ms() - startingTime > 17000) {
            checkedDirection = 1;

            // Reverse the motors if the left motor is moving substantially farther than the right motor (Starting from the west)
            if (nxt_motor_get_count(LEFT_MOTOR) / 360 > nxt_motor_get_count(RIGHT_MOTOR) / 360) {
                LEFT_MOTOR = NXT_PORT_A;
                RIGHT_MOTOR = NXT_PORT_C;
                
                nxt_motor_set_count(LEFT_MOTOR, 0);
                nxt_motor_set_count(RIGHT_MOTOR, 0);

                nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
                nxt_motor_set_speed(RIGHT_MOTOR, 100, 1);

                while (nxt_motor_get_count(RIGHT_MOTOR) < 90);

                timeSinceLineChange = 100;
                lineVisible = false;
                SetEvent(MotorControlTask, LineLost);
            }
        }

        // Set the direction of the light sweep
        int motor_value = nxt_motor_get_count(ARM_MOTOR);
        char armState = 0;
        if (motor_value > 10)
            armState = 1;
        else if (motor_value < -10)
            armState = -1;

        // Trigger the events for switching the arm direction when the state changes
        if (prevArmState != armState) {
            prevArmState = armState;
            // Start driving
            if (armState == -1) {
                SetEvent(LightSweepTask, LightSweepForwardEvent);
            }
            // Stop driving
            else if (armState == 1) {
                SetEvent(LightSweepTask, LightSweepBackwardEvent);
            }
        }

        // Get color sensor information
        ecrobot_process_bg_nxtcolorsensor();
        int light = ecrobot_get_nxtcolorsensor_light(LIGHT_PORT);
        // Determine if the line is currently visible
        char lineNowDetected = light < 310;

        // If the line state changed, trigger the proper event for the drive motors
        if (lineNowDetected != lineVisible) {
            lineVisible = lineNowDetected;
            timeSinceLineChange = 0;
            if (lineVisible) {
                SetEvent(MotorControlTask, LineDetected);
            }
            else {
                SetEvent(MotorControlTask, LineLost);
            }
        }
        else {
            // Accumulate speed since last seeing a line state change.
            // This is useful so the robot starts moving mostly forward after loosing the line (eg, on a dashed line)
            // but the longer it has been since seeing the line, the more it will turn. This makes sharp turns work as well.
            timeSinceLineChange += 2;
            if (lineVisible) {
                SetEvent(MotorControlTask, LineDetected);
            }
            else {
                SetEvent(MotorControlTask, LineLost);
            }
        }

        // Read ultrasonic value
        distanceValue = ecrobot_get_sonar_sensor(SONAR_PORT);

        // Update tasks based on ultrasonic value
        // This uses a simple debounce: The value must be the same 10 times in a row before an event is triggered.
        // This very effectively removes the noise encountered when the sensor is initially turned on.
        if (distanceValue < 20) {
            boxState += 1;
        }
        else {
            boxState = 0;
        }
        if (distanceValue < 20 && boxState == 10) {
            SetEvent(MotorControlTask, BoxDetected);
        }
        

        // Vacate the semaphore to allow the read task to save its data
        ReleaseResource(SharedResource);
    }
}

// Task to handle task configuration and communicatino with the color sensor
TASK(MotorControlTask)
{
    nxt_motor_set_count(LEFT_MOTOR, 0);
    nxt_motor_set_count(RIGHT_MOTOR, 0);

    while(1)
    {
        // Wait for any of the control events
        WaitEvent(LineDetected | LineLost | BoxDetected);

        // Figure out which event occured
        EventMaskType eventmask = 0;
        GetEvent(MotorControlTask, &eventmask);

        // Clear events
        if (eventmask & (LineDetected | LineLost)) {
            if (eventmask & LineDetected)
                ClearEvent(LineDetected);
            else if (eventmask & LineLost)
                ClearEvent(LineLost);
        }
        else if (eventmask & BoxDetected) {
            ClearEvent(BoxDetected);

            // Run pre-defined routine to navigate around the box

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, 100, 1);

            while (nxt_motor_get_count(LEFT_MOTOR) > -360);

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -100, 1);

            while (nxt_motor_get_count(LEFT_MOTOR) > -3 * 360);

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, 100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -100, 1);

            while (nxt_motor_get_count(RIGHT_MOTOR) > -360);

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -100, 1);

            while (nxt_motor_get_count(LEFT_MOTOR) > -3 * 360 - 180);
            
            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);
            
            nxt_motor_set_speed(LEFT_MOTOR, 100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -100, 1);

            while (nxt_motor_get_count(RIGHT_MOTOR) > -360);

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -100, 1);

            while (nxt_motor_get_count(LEFT_MOTOR) > -3 * 360);

            nxt_motor_set_count(LEFT_MOTOR, 0);
            nxt_motor_set_count(RIGHT_MOTOR, 0);

            nxt_motor_set_speed(LEFT_MOTOR, -100, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, 100, 1);

            while (nxt_motor_get_count(LEFT_MOTOR) > -360);

            nxt_motor_set_speed(LEFT_MOTOR, 0, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, 0, 1);
        }

        // Drive
        if (lineVisible) {
            nxt_motor_set_speed(LEFT_MOTOR, -70 - timeSinceLineChange, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, 70 + timeSinceLineChange, 1);
        }
        else {
            nxt_motor_set_speed(LEFT_MOTOR, -80 + timeSinceLineChange / 3, 1);
            nxt_motor_set_speed(RIGHT_MOTOR, -60, 1);
        }
    }
}

// Task to sweep the light sensor back and forth
TASK(LightSweepTask)
{
    nxt_motor_set_count(ARM_MOTOR, 0);
    nxt_motor_set_speed(ARM_MOTOR, -50, 1);

    while(1)
    {
        // Wait for any of the control events
        WaitEvent(LightSweepForwardEvent | LightSweepBackwardEvent);

        // Figure out which event occured
        EventMaskType eventmask = 0;
        GetEvent(LightSweepTask, &eventmask);

        if (eventmask & LightSweepForwardEvent) {
            // sweep forward
            ClearEvent(LightSweepForwardEvent);
            nxt_motor_set_speed(ARM_MOTOR, 60, 1);
        }
        else {
            // sweep backward
            ClearEvent(LightSweepBackwardEvent);
            nxt_motor_set_speed(ARM_MOTOR, -60, 1);
        }
    }
}

