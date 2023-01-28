// **********************************************************************
// ** VERSION 1.0.0 - Aaron 28/01/23**
// Map all of the variables to the IO
//
// Changelog:
// Added ME mappings
// **********************************************************************

// ========== Hydraullics ============

// ==== Inputs ====
mGVL.hydraulicPressureSensorA := ACI_3;
mGVL.eStopCC := DI_0;

// ==== Outputs ====
DO_25 := mGVL.hpuReliefValve;

// Valve Amplfiers
// -100% to 100 % = 4000uA to 20000uA
ACO_0 := mGVL.motValveAmp;
ACO_1 := mGVL.thrAValveAmp;
ACO_2 := mGVL.thrBValveAmp;
ACO_3 := mGVL.thrCValveAmp;
ACO_4 := mGVL.thrDValveAmp;

ACO_5 := testVar;

// Gripper Pad Amplifiers
// 0 to 100 % = 0mV to 10000mV
AVO_0 := __XINT_TO_WORD( mGVL.grpAPwrAmp * 100 + 0);
AVO_1 := __XINT_TO_WORD( mGVL.grpBPwrAmp * 100 + 0);

// Gripper Pad Directions
DO_26 := mGVL.grpADirA;
DO_27 := mGVL.grpADirB;
DO_28 := mGVL.grpBDirA;
DO_29 := mGVL.grpBDirB;

// ========== Material Extraction ============

// ==== Inputs ====

// 0-25000mbar
mGVL.feederPumpPressureSensor := ACI_0;
mGVL.suctionPumpPressureSensor := ACI_1;

// ==== Outputs ====


