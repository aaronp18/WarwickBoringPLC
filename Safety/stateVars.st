//declare vars
VAR
    resetTP : TP;
    resetTON : TON;
    stoppingTP : TP;
    stoppingTON : TON;
    suspendingTP : TP;
    suspendingTON : TON;
    unsuspendingTP : TP;
    unsuspendingTON : TON;
END_VAR

//each timer 2s

//init vars
resetTP (IN:= systemGVL.resetTrigger.Q, PT := T#3s);
resetTON (IN:= resetTP.Q, PT := T#2s);
stoppingTP (IN:= systemGVL.stoppingTrigger.Q, PT := T#3s);
stoppingTON (IN:= stoppingTP.Q, PT := T#2s);
suspendingTP (IN:= systemGVL.suspendingTrigger.Q, PT := T#3s);
suspendingTON (IN:= suspendingTP.Q, PT := T#2s);
unsuspendingTP (IN:= systemGVL.unsuspendingTrigger.Q, PT := T#3s);
unsuspendingTON (IN:= unsuspendingTP.Q, PT := T#2s);
startingTP (IN:= systemGVL.startingTrigger.Q, PT := T#3s);
startingTON (IN:= startingTP.Q, PT := T#2s);


//logic
IF systemGVL.SYSTEM_STATE >= 0 THEN

    systemGVL.finishedInitialising := TRUE;

    systemGVL.finishedResetting := resetTON.Q;

    //systemGVL.finishedStarting
    //read pressures, ensure they are in expected range
    //1 if pressure good, 0 if not

    //systemGVL.finishedSuspending
    //read valve positions, should be closed
    //1 if closed, 0 if not

    systemGVL.finishedUnsuspending := TRUE;
    //as no tunnel lining, nothing happens in unsuspending state - skip to next state
    //read valves, should be opening again
    //1 if open, 0 if not

    //systemGVL.finishedStopping
    //read ME, TL power states, should be off
    //read hydraulics, keep on
    //read pressures, ensure depressurised
    //1 if so, 0 if not

    //systemGVL.finishedAborting
    //ME power off
    //TL power off
    //hydraulics power on, relief valve open, depressurised
    //1 if so, 0 if not

END_IF