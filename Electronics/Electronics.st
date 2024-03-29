PROGRAM Electronics

VAR
    blinkingCLK : Clock;
    blinkingCLKStart : BOOL : := FALSE;
END_VAR
blinkingCLK(EN := blinkingCLKStart, ON_PERIOD := T#500ms, OFF_PERIOD := T#500ms); // init running clk - period 1s, 0.5 duty cycle

// Starts False, so set to true, gives us a permenant clock
blinkingCLKStart := TRUE;


// #######################
// ## Running Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.RUNNING :
        mGVL.isRunningIndicator := TRUE; // running light on - actively moving forward
    SYSTEM_STATE.UNSUSPENDING, SYSTEM_STATE.STARTING :
        mGVL.isRunningIndicator := blinkingCLK.Q; // flash running light - imminently moving forward
    ELSE
        mGVL.isRunningIndicator := FALSE;
END_CASE

// ######################
// ## Paused Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.SUSPENDING :
        mGVL.isPausedIndicator := blinkingCLK.Q; // paused indicator blinking - temp stopped/stopping
    ELSE
        mGVL.isPausedIndicator := FALSE;
END_CASE

// #######################
// ## Startup Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.RESETTING, SYSTEM_STATE.IDLE, SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING,
    SYSTEM_STATE.SUSPENDING, SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING :
        mGVL.isStartupIndicator := TRUE; // startup indicator on - getting ready to start running/running
    ELSE
        mGVL.isStartupIndicator := FALSE;
END_CASE

// ###############################
// ## isControlledStopIndicator ##
// Essentially in the stopped position
CASE systemGVL.systemState OF
    SYSTEM_STATE.STOPPED, SYSTEM_STATE.STOPPING :
        mGVL.isControlledStopIndicator := TRUE; // stopped indicator on - stopped/stopping in a safe state
    ELSE
        mGVL.isControlledStopIndicator := FALSE;
END_CASE

// ###########################
// ## isResettableIndicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.RESETTING:
        mGVL.isResettableIndicator := blinkingCLK.Q; // reset indicator blinking - resetting
    ELSE
        mGVL.isResettableIndicator := interlocksGVL.isResettable;
END_CASE


// #######################
// ## All Light Control ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.INITIALISING, SYSTEM_STATE.NULL :
        // all lights on when initialising
        mGVL.isControlledStopIndicator := TRUE;
        mGVL.isStartupIndicator := TRUE;
        mGVL.isPausedIndicator := TRUE;
        mGVL.isRunningIndicator := TRUE;
        mGVL.warningIndicator := TRUE;
        mGVL.alarmIndicator := TRUE;
END_CASE