PROGRAM MaterialExtraction
VAR
	consumptionMeterLogic : meConsumption;

	feederPumpControlLogic : meFeederPumpControl;
END_VAR


// **********************************************************************
// ** VERSION 1.0.0 - Aaron 29/01/23**
// Carries out Material Extraction logic
//
// Changelog:
// - Added ME flowmeter
// **********************************************************************

consumptionMeterLogic();
feederPumpControlLogic();

// ####################
// ### Feeder Pump  ###
// ####################
CASE systemGVL.systemState OF
	SYSTEM_STATE.NULL, SYSTEM_STATE.INITIALISING, SYSTEM_STATE.STOPPED, 
	SYSTEM_STATE.RESETTING, SYSTEM_STATE.IDLE, SYSTEM_STATE.STOPPING, 
	SYSTEM_STATE.ABORTING, SYSTEM_STATE.ABORTED, SYSTEM_STATE.CLEARING:
		//feeder pump disabled
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, 
	SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING:
		//feeder pump enabled
	ELSE:
END_CASE

// ####################
// ### Suction Pump ###
// ####################
CASE systemGVL.systemState OF
	SYSTEM_STATE.NULL, SYSTEM_STATE.INITIALISING, SYSTEM_STATE.STOPPED, 
	SYSTEM_STATE.RESETTING, SYSTEM_STATE.IDLE, SYSTEM_STATE.STOPPING, 
	SYSTEM_STATE.ABORTING, SYSTEM_STATE.ABORTED, SYSTEM_STATE.CLEARING:
		//suction pump disabled
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, 
	SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING:
		//suction pump enabled
	ELSE:
END_CASE

// ####################
// ### VFD Control  ###
// ####################
CASE systemGVL.systemState OF
	SYSTEM_STATE.NULL, SYSTEM_STATE.INITIALISING, SYSTEM_STATE.STOPPED, 
	SYSTEM_STATE.ABORTING, SYSTEM_STATE.ABORTED, SYSTEM_STATE.CLEARING:
		//VFD depowered
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, 
	SYSTEM_STATE.RESETTING, SYSTEM_STATE.IDLE, SYSTEM_STATE.SUSPENDED, 
	SYSTEM_STATE.UNSUSPENDING:
		//VFD powered
		//VFD start
	SYSTEM_STATE.STOPPING:
		//VFD stop
		//VFD depowered
	ELSE:
END_CASE