FUNCTION_BLOCK 
    VAR
        beatTOF : TOF;
    END_VAR
    //rising edge rests timer
    //mGVL.tbmStatusIn

    beatTOF(IN := mGVL.tbmStatusIn, PT:= T#1s, Q => mainGVL.tbmPIHeartBeat); //low after 1s if no heartbeat

END_FUNCTION_BLOCK