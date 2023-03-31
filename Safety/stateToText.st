FUNCTION_BLOCK stateToString
VAR_INPUT
    state : SYSTEM_STATE;
END_VAR
VAR_OUTPUT
    StateToString : STRING;
END_VAR

CASE state OF
    SYSTEM_STATE.NULL :
        StateToString := 'NULL';
    SYSTEM_STATE.INITIALISING :
        StateToString := 'INITIALISING';
    SYSTEM_STATE.STOPPED :
        StateToString := 'STOPPED';
    SYSTEM_STATE.RESETTING :
        StateToString := 'RESETTING';
    SYSTEM_STATE.IDLE :
        StateToString := 'IDLE';
    SYSTEM_STATE.STARTING :
        StateToString := 'STARTING';
    SYSTEM_STATE.RUNNING :
        StateToString := 'RUNNING';
    SYSTEM_STATE.SUSPENDING :
        StateToString := 'SUSPENDING';
    SYSTEM_STATE.SUSPENDED :
        StateToString := 'SUSPENDED';
    SYSTEM_STATE.UNSUSPENDING :
        StateToString := 'UNSUSPENDING';
    SYSTEM_STATE.STOPPING :
        StateToString := 'STOPPING';
    SYSTEM_STATE.ABORTING :
        StateToString := 'ABORTING';
    SYSTEM_STATE.ABORTED :
        StateToString := 'ABORTED';
    SYSTEM_STATE.CLEARING :
        StateToString := 'CLEARING';
    ELSE
        StateToString := 'ERROR';
END_CASE
