PROGRAM SafetyProg
VAR
	isHPSA_unsafe : BOOL; // True if Hydraullic Pressure is too high
	isEStopPressed : BOOL; // True if an ESTOP is pressed

	isInterlocked : BOOL; // If any interlocks have occured


END_VAR

// Safety runs as a seperate task checking for interlocks, seperate to the main task to prevent stalls.

// Hydraulic Pressure Sensor A
isUnsafe(sensorMin := 0, sensorMax := 100, sensorValue := mgvl.hydraulicPressureSensorA, unSafe => isHPSA_unsafe);

// Control Cabinet E STOP, Visualisation Estop
isEStopPressed := (NOT mgvl.eStopCC) OR visuGVL.visuEstop;

isInterlocked := isHPSA_unsafe OR isESTOPPressed;

// Interlock Check
IF isInterlocked THEN
	mainGVL.isSystemInterlocked := TRUE;
END_IF

mainGVL.isResettable := (NOT isInterlocked) AND (mainGVL.isSystemInterlocked);

// If clearable, and then reset button pressed
IF mainGVL.isResettable AND (visuGVL.resetButton) THEN
	// Then reset estop
	mainGVL.isSystemInterlocked := FALSE;

END_IF