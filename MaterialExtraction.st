PROGRAM MaterialExtraction
VAR
	// Flow meter triggers
	meFlowMeterCountTrigger : R_TRIG; (* to catch the rising signal edge *)
  	meFlowMeterResetTrigger : R_TRIG; (* to catch the rising signal edge *)

	// Flow meter rate calculation
	tDelta, tCurrent, tLast : TIME;
END_VAR


// **********************************************************************
// ** VERSION 1.0.0 - Aaron 29/01/23**
// Carries out Material Extraction logic
//
// Changelog:
// - Added ME flowmeter
// **********************************************************************

meFlowMeterCountTrigger (CLK := mGVL.meFlowMeterPulse); (* finds the counting up events *)
meFlowMeterResetTrigger (CLK := visuGVL.meResetFlowMeter); (* finds the clear commands *)

IF meFlowMeterCountTrigger.Q
THEN
	mainGVL.meFlowMeterCount := mainGVL.meFlowMeterCount + 1;

	tCurrent := TO_TIME(SysTimeGetMs());

	// Calculate delta
	tDelta := tCurrent - tLast; // ms

	// Calculate rate
	mainGVL.meFlowMeterRate := 1000 / TIME_TO_REAL(tDelta); // L per second

	tLast := tCurrent;

END_IF;
IF meFlowMeterResetTrigger.Q
	THEN mainGVL.meFlowMeterCount := 0;
END_IF;