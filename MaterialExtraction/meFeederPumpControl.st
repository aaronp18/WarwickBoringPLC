FUNCTION_BLOCK meFeederPumpControl
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
	feederPumpClock : CLK; // Feeder pump clock
	onPeriod : TIME;
	offPeriod : TIME;
END_VAR

onPeriod = REAL_TO_TIME(TIME_TO_REAL(meGVL.meFeederPumpPeriod) * meFeederPumpDuty); //get on period
offPeriod = REAL_TO_TIME(TIME_TO_REAL(meGVL.meFeederPumpPeriod) - onPeriod); //get off period

feederPumpClock(EN:= meGVL.meFeederPumpEnabled AND meGVL.meFeederPumpUserEnabled, ON_PERIOD:= onPeriod, OFF_PERIOD:= offPeriod, Q=> meGVL.meFeederPumpAutoPower); //TODO - change on/off period to correct values

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
