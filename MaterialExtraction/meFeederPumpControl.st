FUNCTION_BLOCK meFeederPumpControl
VAR_INPUT
	
END_VAR
VAR_OUTPUT
END_VAR
VAR
	feederPumpClock : CLK; // Feeder pump clock
END_VAR



feederPumpClock(EN:= meGVL.meFeederPumpEnabled AND meGVL.meFeederPumpUserEnabled, ON_PERIOD:= T#1s, OFF_PERIOD:= T#1s, Q=> meGVL.meFeederPumpAutoPower); //TODO - change on/off period to correct values

// If feeder pump is not enabled, the power off
IF NOT meGVL.meFeederPumpEnabled OR NOT meGVL.meFeederPumpUserEnabled THEN
	// Disable 
	meGVL.mePowerFeederPump := FALSE;	
ELSE 
	// If auto mode
	IF meGVL.meFeederPumpAutoControlEnabled THEN
		meGVL.mePowerFeederPump := meGVL.meFeederPumpAutoPower;
	// Else in manual mode
	ELSE
		meGVL.mePowerFeederPump := meGVL.meFeederPumpManualPower;
	END_IF
END_IF

// Assign feeder pump contactor
mGVL.feederPumpContactor := meGVL.mePowerFeederPump;
