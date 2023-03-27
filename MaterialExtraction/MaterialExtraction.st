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



// #############################
// ### 1P Machine Power C12  ###
// #############################
// control for ME 1 Phase - polymer pump, polymer mixer
CASE systemGVL.systemState OF
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, UNSUSPENDING:
		meGVL.me1PMachineEnabled := TRUE; //polymer pump & mixer start
	ELSE
		meGVL.me1PMachineEnabled := FALSE; //polymer pump & mixer stop
END_CASE


// ####################
// ### Feeder Pump  ###
// ####################
// control for contactor of feeder pump
CASE systemGVL.systemState OF
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, 
	SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING:
		meGVL.meFeederPumpEnabled := TRUE; //feeder pump enabled
	ELSE
		meGVL.meFeederPumpEnabled := FALSE; //feeder pump disabled
END_CASE

// ##############################
// ### Suction Pump VFD Power ###
// ##############################
// control for contactor of suction pump VFD
CASE systemGVL.systemState OF
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, SYSTEM_STATE.SUSPENDING, 
	SYSTEM_STATE.SUSPENDED, SYSTEM_STATE.UNSUSPENDING:
		meSuctionPumpContactorEnabled := TRUE; //suction pump contactor enabled
	ELSE
		meSuctionPumpContactorEnabled := FALSE; //suction pump contactor disabled
END_CASE

// ####################
// ### VFD Control  ###
// ####################
// control for run/stop of suction
// actively digging - running, unsuspending, starting
CASE systemGVL.systemState OF
	SYSTEM_STATE.STARTING, SYSTEM_STATE.RUNNING, UNSUSPENDING:
		meSuctionPumpVFDEnabled := TRUE; //VFD start
	ELSE
		meSuctionPumpVFDEnabled := FALSE; //VFD stop
END_CASE