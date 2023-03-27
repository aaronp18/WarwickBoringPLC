PROGRAM Hydraulics

// ###############################
// ## Hydraulics Enable Control ##
// Inputs to move are acted on
CASE systemGVL.systemState OF
    SYSTEM_STATE.RUNNING:
        hydraulicsGVL.isHydraullicsEnabled := TRUE;
    ELSE    
        hydraulicsGVL.isHydraullicsEnabled := FALSE;
END_CASE

// ##################################
// ## Hydraulics Contactor Control ##
// Power supplied to HPU and Air Pump
CASE systemGVL.systemState OF
    SYSTEM_STATE.RUNNING, SYSTEM_STATE.IDLE, SYSTEM_STATE.STARTING, 
    SYSTEM_STATE.SUSPENDING, SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING, 
    SYSTEM_STATE.RESETTING:
        mGVL.c31HPUContactor := TRUE;
        mGVL.c32HPUAirPumpContactor := TRUE;
    ELSE
        mGVL.c31HPUContactor := FALSE;
        mGVL.c32HPUAirPumpContactor := FALSE;
END_CASE
