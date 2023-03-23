PROGRAM VariableMapping
VAR
	testVar : INT := 12000;

	temp : BOOL;

	readSensors : ReadSensors; // Function block instance that reads the sensors and applies to the table

END_VAR

// **********************************************************************
// ** VERSION 1.0.2 - Aaron 29/01/23**
// Map all of the variables to the IO
//
// Changelog:
// - Added ME flowmeter
// - Added control cabient indicators
// - Added ME mappings
// **********************************************************************

// ========== General ============

// ==== Inputs ====
mGVL.eStopCC := DI_0;

mGVL.keySwitch := DI_2;
mGVL.tbmPowered := DI_13;

mGVL.temperatureCC := rtdToDegree.Convert(RTD_0);
mGVL.temperaturePC := rtdToDegree.Convert(RTD_1);
mGVL.temperatureOut := rtdToDegree.Convert(RTD_2);
// mGVL.temperatureCC :=

mGVL.temperatureTBM := tbmToTemperatureDegree.Convert(TO_REAL(TBM_temperature)); // TBM sencds as 1/100th of a degree, convert to real
mGVL.temperaturePi := tbmToTemperatureDegree.Convert(TO_REAL(TBM_input0)); // TBM sencds as 1/100th of a degree, convert to real


// ==== Outputs ====
// Is interlocked
DO_9 := mainGVL.isSystemInterlocked;
// Still issue
DO_17 := mainGVL.isIssue;

// Is the system enabled
DO_18 := mainGVL.isSystemEnabled;

// ========== Contactors ============

DO_0 := mGVL.c31HPUContactor;
DO_1 := mGVL.c32HPUAirPumpContactor;
DO_2 := mGVL.c33ThreePPumpsContactor;
DO_3 := mGVL.c12MEContactor;
DO_4 := mGVL.c15OtherContactor;
DO_5 := mGVL.feederPumpContactor;



// ========== Hydraullics ============

// ==== Inputs ====
// TBM Pressure sensors
// 0-400bar
// Maybe: ((? - 2000) / 40) - 100?? I dont think so
mGVL.hydraulicPressureSensorA := remoteAnalogToPressureBar400.Convert(REM_ACI_0);
mGVL.hydraulicPressureSensorB := remoteAnalogToPressureBar400.Convert(REM_ACI_1);
mGVL.hydraulicPressureSensorC := remoteAnalogToPressureBar400.Convert(REM_ACI_2);
mGVL.hydraulicPressureSensorD := remoteAnalogToPressureBar400.Convert(REM_ACI_3);
mGVL.hydraulicPressureSensorE := remoteAnalogToPressureBar400.Convert(REM_ACI_4);
mGVL.hydraulicPressureSensorF := remoteAnalogToPressureBar400.Convert(REM_ACI_5);


ACO_5 := testVar;


// ==== Outputs ====
DO_25 := mGVL.hpuReliefValve;

// Valve Amplfiers
// -100% to 100 % = 4000uA to 20000uA
ACO_0 := mGVL.motValveAmp;
ACO_1 := mGVL.thrAValveAmp;
ACO_2 := mGVL.thrBValveAmp;
ACO_3 := mGVL.thrCValveAmp;
ACO_4 := mGVL.thrDValveAmp;

DO_26 := mGVL.grpAPwrEn;
DO_27 := mGVL.grpBPwrEn;


// Gripper Pad Amplifiers
// 0 to 100 % = 0mV to 10000mV
AVO_0 := __XINT_TO_WORD( mGVL.grpAPwrAmp * 100 + 0);
AVO_1 := __XINT_TO_WORD( mGVL.grpBPwrAmp * 100 + 0);

// Gripper Pad Directions
REM_DO_0 := mGVL.grpADirA;
REM_DO_1 := mGVL.grpADirB;
REM_DO_2 := mGVL.grpBDirA;
REM_DO_3 := mGVL.grpBDirB;

REM_DO_4 := 1; // TBM Connected
// ========== Material Extraction ============

// ==== Inputs ====

// 0-25000mbar
mGVL.feederPumpPressureSensor := currentToPressureBar25.Convert(ACI_0);
mGVL.suctionPumpPressureSensor := currentToPressureBar25.Convert(ACI_1);

//??
mGVL.cutterheadPressureSensor := remoteAnalogToPressureBar25.Convert(REM_ACI_6);

mGVL.meFlowMeterPulse := DI_12;


// ==== Outputs ====

// ========== Navigation ============

// ==== Inputs ====

// Displacment sensors 4-20mA -> ?-?mm
//mGVL.displacementSensorA := REAL_TO_INT((REM_ACI_4 * 0.0085 / 1) - 51.4415);
// mGVL.displacementSensorB := REAL_TO_INT((REM_ACI_5 * 0.0085 / 1) - 51.4415);
// mGVL.displacementSensorC := REAL_TO_INT((REM_ACI_6 * 0.0085 / 1) - 51.4415);
// mGVL.displacementSensorD := REAL_TO_INT((REM_ACI_7 * 0.0085 / 1) - 51.4415);

// ==== Outputs ====


// Sensor Readout
readSensors();