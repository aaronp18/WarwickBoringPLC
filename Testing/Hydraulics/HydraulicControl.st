
// Only run if enabled and not estopped.
IF NOT mainGVL.isSystemInterlocked AND mainGVL.isSystemEnabled THEN
	// Enable/Disable HPU
	mGVL.hpuReliefValve := visuGVL.hpuEnable;


	// Override Values
	IF visuGVL.overrideValuesButton THEN
		hydraulicControlValue := visuGVL.manualValue;
	ELSE
		// Set the power depending on the button pressed
		IF visuGVL.extendButton THEN
			hydraulicControlValue := visuGVL.powerSlider;
		ELSIF visuGVL.retractButton THEN
			hydraulicControlValue := - visuGVL.powerSlider;
		ELSE
			// Set to 0 if not meant to move.
			hydraulicControlValue := zeroValue;
		END_IF
	END_IF


	// Now cylinder control

	// Thrust A
	IF visuGVL.tAEn THEN
		// If enabled, set the valve amp value to that of the contro value
		mGVL.thrAValveAmp := hydraulicControlValue;
	ELSE
		// Otherwise not enabled so set to 0
		mGVL.thrAValveAmp := zeroValue;
	END_IF
	// Thrust B
	IF visuGVL.tBEn THEN
		// If enabled, set the valve amp value to that of the contro value
		mGVL.thrBValveAmp := hydraulicControlValue;
	ELSE
		// Otherwise not enabled so set to 0
		mGVL.thrBValveAmp := zeroValue;
	END_IF
	// Thrust C
	IF visuGVL.tCEn THEN
		// If enabled, set the valve amp value to that of the contro value
		mGVL.thrCValveAmp := hydraulicControlValue;
	ELSE
		// Otherwise not enabled so set to 0
		mGVL.thrCValveAmp := zeroValue;
	END_IF
	// Thrust D
	IF visuGVL.tDEn THEN
		// If enabled, set the valve amp value to that of the contro value
		mGVL.thrDValveAmp := hydraulicControlValue;

	ELSE
		// Otherwise not enabled so set to 0
		mGVL.thrDValveAmp := zeroValue;
	END_IF


	// Motor
	// !! NOT BEING USED
	// SO WIRE TO THRUST D

	IF doWireThrustDAsMot THEN
		IF visuGVL.tDEn THEN
			// If enabled, set the valve amp value to that of the contro value
			mGVL.motValveAmp := hydraulicControlValue;
		ELSE
			// Otherwise not enabled so set to 0
			mGVL.motValveAmp := zeroValue;
		END_IF
	ELSIF visuGVL.motEn THEN
		// If enabled, set the valve amp value to that of the contro value
		mGVL.motValveAmp := hydraulicControlValue;
	ELSE
		// Otherwise not enabled so set to 0
		mGVL.motValveAmp := zeroValue;
	END_IF


	// Gripper Pad A
	IF visuGVL.grpAEn THEN
		// Direction Control
		IF visuGVL.extendButton THEN
			// Set gripper directions to 10 for extend
			mGVL.grpADirA := 1;
			mGVL.grpADirB := 0;
		ELSIF visuGVL.retractButton THEN
			// Set gripper directions to 01 for retract
			mGVL.grpADirA := 0;
			mGVL.grpADirB := 1;
		ELSE
			// Set gripper directions to 00
			mGVL.grpADirA := 0;
			mGVL.grpADirB := 0;
		END_IF
	ELSE
		// Set gripper directions to 00
		mGVL.grpADirA := 0;
		mGVL.grpADirB := 0;


	END_IF
	mGVL.grpAPwrAmp := visuGVL.powerSlider;


	// Gripper Pad B
	IF visuGVL.grpBEn THEN
		// Direction Control
		IF visuGVL.extendButton THEN
			// Set gripper directions to 10 for extend
			mGVL.grpBDirA := 1;
			mGVL.grpBDirB := 0;
		ELSIF visuGVL.retractButton THEN
			// Set gripper directions to 01 for retract
			mGVL.grpBDirA := 0;
			mGVL.grpBDirB := 1;
		ELSE
			// Set gripper directions to 00
			mGVL.grpBDirA := 0;
			mGVL.grpBDirB := 0;
		END_IF
	ELSE
		// Set gripper directions to 00
		mGVL.grpBDirA := 0;
		mGVL.grpBDirB := 0;


	END_IF
	mGVL.grpBPwrAmp := visuGVL.powerSlider;


ELSE
// E-Stopped or Disabled

// HPU
mGVL.hpuReliefValve := FALSE;
visuGVL.hpuEnable := FALSE; // Sync the visualisation with actual value

//Safe Values
hydraulicControlValue := zeroValue;

mGVL.thrAValveAmp := zeroValue;
mGVL.thrBValveAmp := zeroValue;
mGVL.thrCValveAmp := zeroValue;
mGVL.thrDValveAmp := zeroValue;

mGVL.motValveAmp := zeroValue;

// Set gripper directions to 00
mGVL.grpADirA := 0;
mGVL.grpADirB := 0;

mGVL.grpBDirA := 0;
mGVL.grpBDirB := 0;

mGVL.grpAPwrAmp := zeroValue;
mGVL.grpBPwrAmp := zeroValue;


END_IF