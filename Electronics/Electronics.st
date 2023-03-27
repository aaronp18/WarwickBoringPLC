PROGRAM Electronics

VAR
    runningClk : CLK;
    start_unsus : BOOL;
END_VAR

runningClk(EN:= start_unsus, ON_PERIOD:= T#500ms, OFF_PERIOD:= T#500ms); // init running clk - period 1s, 0.5 duty cycle

// #####################
// ## start_unsus var ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.UNSUSPENDING, SYSTEM_STATE.STARTING:
        start_unsus:= TRUE;
    ELSE
        start_unsus:= FALSE;
END_CASE

// #######################
// ## Running Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.RUNNING:
        mGVL.isRunningIndicator := TRUE; //running light on - actively moving forward
    SYSTEM_STATE.UNSUSPENDING, SYSTEM_STATE.STARTING:
        mGVL.isRunningIndicator := runningClk.Q; //flash running light - imminently moving forward
    ELSE
        mGVL.isRunningIndicator := FALSE;
END_CASE

// ######################
// ## Paused Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.SUSPENDED:
        mGVL.isPausedIndicator := TRUE; //paused indicator on - temp stopped/stopping
    SYSTEM_STATE.SUSPENDING:

    ELSE
        mGVL.isPausedIndicator := FALSE;
END_CASE

// #######################
// ## Startup Indicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.RESETTING, SYSTEM_STATE.IDLE, SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING:
        mGVL.isStartupIndicator := TRUE;//startup indicator on - getting ready to start running/running
    ELSE
        mGVL.isStartupIndicator := FALSE;
END_CASE

// ###############################
// ## isControlledStopIndicator ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.INITIALISING, SYSTEM_STATE.STOPPED, SYSTEM_STATE.STmGVL.isRunningIndicator := TRUE;
        mGVL.isControlledStopIndicator := TRUE; //stopped indicator on - stopped/stopping in a safe state
    ELSE
        mGVL.isControlledStopIndicator := FALSE;
END_CASE

// #######################
// ## All Light Control ##
CASE systemGVL.systemState OF
    SYSTEM_STATE.INITIALISING, SYSTEM_STATE.NULL:
        // all lights on when initialising
        mGVL.isControlledStopIndicator := TRUE;
        mGVL.isStartupIndicator := TRUE;
        mGVL.isPausedIndicator := TRUE;
        mGVL.isRunningIndicator := TRUE;
        mGVL.warningIndicator := TRUE;
        mGVL.alarmIndicator := TRUE;
END_CASE