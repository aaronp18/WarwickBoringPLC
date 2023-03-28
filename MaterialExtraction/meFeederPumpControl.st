FUNCTION_BLOCK meFeederPumpControl
VAR_INPUT
	
END_VAR
VAR_OUTPUT
END_VAR
VAR
	// Feeder pump clock
	// TODO
	
END_VAR



// Feeder Pump Auto control clock
// TODO


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

// Reset feeder pump clock on rising edge of Auto Control Request
// TODO