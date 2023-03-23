// Calculates the rate for the consumption meter
FUNCTION_BLOCK ConsumptionMeterCalculator
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
	// Consumption meter triggers
	consumptionPulseTrigger : R_TRIG; (* to catch the rising signal edge *)
  	consumptionResetTrigger : R_TRIG; (* to catch the rising signal edge *)

	// Consumption meter rate calculation
	tDelta, tCurrent, tLast : TIME;

	impulseSize : REAL := 1000; // 1 pulse = 1 kWH, TO CHECK
END_VAR
consumptionPulseTrigger (CLK := mGVL.energyConsumptionPulse); (* finds the counting up events *)
consumptionResetTrigger (CLK := FALSE); (* finds the clear commands *) // TODO

IF consumptionPulseTrigger.Q
THEN
	// One impulse = 10L
	mainGVL.energyConsumptionTotal := mainGVL.energyConsumptionTotal + TO_INT(impulseSize);

	tCurrent := TO_TIME(SysTimeGetMs());

	// Calculate delta
	tDelta := tCurrent - tLast; // ms

	// Calculate rate
	mainGVL.energyConsumptionPower := impulseSize * 1000 / TIME_TO_REAL(tDelta) ; // w, x1000 as time is in ms.

	tLast := tCurrent;

END_IF;
IF consumptionResetTrigger.Q
	// Reset total energy consumption
	THEN mainGVL.energyConsumptionTotal := 0;
END_IF;