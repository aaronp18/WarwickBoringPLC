systemGVL.resetTrigger (CLK := systemGVL.resetSignal); //reset trigger
systemGVL.startTrigger (CLK := systemGVL.startSignal); //start trigger
systemGVL.suspendTrigger (CLK := systemGVL.suspendSignal); //suspend trigger
systemGVL.unsuspendTrigger (CLK := systemGVL.unsuspendSignal); //unsuspend trigger
systemGVL.clearTrigger (CLK := systemGVL.clearSignal); //clear trigger

CASE systemGVL.systemState OF
    SYSTEM_STATE.NULL:
        systemGVL.systemState := SYSTEM_STATE.INIT; //move to initialise
    SYSTEM_STATE.INITIALISING:
        IF systemGVL.finishedInitialising THEN
            systemGVL.systemState := SYSTEM_STATE.STOPPED; //move to stopped
        END_IF
    SYSTEM_STATE.STOPPED:
        IF systemGVL.resetTrigger.Q THEN
            systemGVL.systemState := SYSTEM_STATE.RESETTING; //move to resetting
        END_IF
    SYSTEM_STATE.RESETTING:
        IF systemGVL.finishedResetting THEN
            systemGVL.systemState := SYSTEM_STATE.IDLE; //move to isle
        END_IF
    SYSTEM_STATE.IDLE:
        IF systemGVL.startTrigger.Q THEN
            systemGVL.systemState := SYSTEM_STATE.STARTING; //move to starting
        END_IF
    SYSTEM_STATE.STARTING:
        IF systemGVL.finishedStarting THEN
            systemGVL.systemState := SYSTEM_STATE.RUNNING; //move to running
        END_IF
    SYSTEM_STATE.RUNNING:
        IF systemGVL.suspendTrigger.Q THEN
            systemGVL.systemState := SYSTEM_STATE.SUSPENDING; //move to suspending
        END_IF
    SYSTEM_STATE.SUSPENDING:
        IF systemGVL.finishedSuspending THEN
            systemGVL.systemState := SYSTEM_STATE.SUSPENDED; //move to suspended
        END_IF
    SYSTEM_STATE.SUSPENDED:
        IF systemGVL.unsuspendTrigger.Q THEN
            systemGVL.systemState := SYSTEM_STATE.UNSUSPENDING; //move to unsuspending
        END_IF
    SYSTEM_STATE.UNSUSPENDING:
        IF systemGVL.finishedUnsuspending THEN
            systemGVL.systemState := SYSTEM_STATE.RUNNING; //move to running
        END_IF
    SYSTEM_STATE.STOPPING:
        IF systemGVL.finishingStopping THEN
            systemGVL.systemState := SYSTEM_STATE.STOPPED; //move to stopped
        END_IF
    SYSTEM_STATE.ABORTING:
        IF systemGVL.finishedAborting THEN
            systemGVL.systemState := SYSTEM_STATE.ABORTED; //move to stopped
        END_IF
    SYSTEM_STATE.ABORTED:
        IF systemGVL.clearTrigger.Q THEN
            systemGVL.systemState := SYSTEM_STATE.CLEARING; //move to clearing
        END_IF
    SYSTEM_STATE.CLEARING:
        IF systemGVL.isCleared THEN
            systemGVL.systemState := SYSTEM_STATE.STOPPED; //move to stopped
        END_IF
    ELSE:
        systemGVL.systemState := SYSTEM_STATE.ABORTING; //error has occured
        systemGVL.stateError := TRUE;
END_CASE