FUNCTION_BLOCK stateToString
VAR_INPUT
    state : SYSTEM_STATE;
END_VAR
VAR_OUTPUT
    stateString : STRING;
END_VAR

CASE state OF
    SYSTEM_STATE.NULL:
        stateString := 'NULL';
    SYSTEM_STATE.INITIALISING:
        stateString := 'INITIALISING';
    SYSTEM_STATE.STOPPED:
        stateString := 'STOPPED';
    SYSTEM_STATE.RESETTING:
        stateString := 'RESETTING';
    SYSTEM_STATE.IDLE:
        stateString := 'IDLE';
    SYSTEM_STATE.STARTING:
        stateString := 'STARTING';
    SYSTEM_STATE.RUNNING:
        stateString := 'RUNNING';
    SYSTEM_STATE.SUSPENDING:
        stateString := 'SUSPENDING';
    SYSTEM_STATE.SUSPENDED:
        stateString := 'SUSPENDED';
    SYSTEM_STATE.UNSUSPENDING:
        stateString := 'UNSUSPENDING';
    SYSTEM_STATE.STOPPING:
        stateString := 'STOPPING';
    SYSTEM_STATE.ABORTING:
        stateString := 'ABORTING';
    SYSTEM_STATE.ABORTED:
        stateString := 'ABORTED';
    SYSTEM_STATE.CLEARING:
        stateString := 'CLEARING';
    ELSE
        stateString := 'ERROR';
END_CASE
