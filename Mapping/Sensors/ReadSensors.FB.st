FUNCTION_BLOCK ReadSensors
VAR_INPUT
END_VAR
VAR_OUTPUT
END_VAR
VAR
	isWarning : BOOL;
	isAlarm : BOOL;
	index : INT;
END_VAR


//=================================================================
//========= Sensor Readout Configurer Auto Generator - 2023-03-20=========
//=================================================================


// Resets the index to 0 (used to number)
index := 0;


//====================
//= Material Extraction
//====================
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Feeder Pump Pressure', location := 'Feeder Pump (Inlet)', value := TO_REAL(mGVL.feederPumpPressureSensor),
  min_alarm := 0.5, min_warn := 3, max_warn := 7, max_alarm := 8,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Cutter Head Pressure', location := 'Cutter Head', value := TO_REAL(mGVL.cutterheadPressureSensor),
  min_alarm := 0.5, min_warn := 3, max_warn := 7, max_alarm := 8,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Slurry Pump Pressure', location := 'Slurry Pump', value := TO_REAL(mGVL.suctionPumpPressureSensor),
  min_alarm := 0.5, min_warn := 3, max_warn := 7, max_alarm := 8,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Water Meter', location := 'Feeder Pump', value := TO_REAL(mGVL.meFlowMeterPulse),
  min_alarm := 2, min_warn := - 1, max_warn := - 1, max_alarm := 2,
  doInterlockOnAlarm := FALSE);
index := index + 1;

//====================
//= Navigation
//====================
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Axis 1 Inclinometers', location := 'TBM', value := TO_REAL(mGVL.pitchInclinometer),
  min_alarm := - 30, min_warn := - 15, max_warn := 15, max_alarm := 30,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Axis 2 Inclinometers', location := 'TBM', value := TO_REAL(mGVL.yawInclinometer),
  min_alarm := - 90, min_warn := - 60, max_warn := 60, max_alarm := 90,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Axis 3 Inclinometers', location := 'TBM', value := TO_REAL(mGVL.rollInclinometer),
  min_alarm := - 90, min_warn := - 60, max_warn := 60, max_alarm := 90,
  doInterlockOnAlarm := FALSE);
index := index + 1;

//====================
//= Electronics
//====================
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Control Cabinet Temperature Sensor', location := 'Control Cabinet', value := TO_REAL(mGVL.temperatureCC),
  min_alarm := 5, min_warn := 10, max_warn := 55, max_alarm := 70,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Power Cabinet Temperature Sensor', location := 'Power Cabinet', value := TO_REAL(mGVL.temperaturePC),
  min_alarm := 5, min_warn := 10, max_warn := 55, max_alarm := 70,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'TBM Cutter head Temperature Sensor', location := 'TBM Cutter head', value := TO_REAL(mGVL.temperatureTBM),
  min_alarm := 5, min_warn := 10, max_warn := 55, max_alarm := 70,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Outside air Temperature Sensor', location := 'Outside Air - Mounted near control cabinet', value := TO_REAL(mGVL.temperatureOut),
  min_alarm := 5, min_warn := 10, max_warn := 55, max_alarm := 70,
  doInterlockOnAlarm := FALSE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'PLC Temperature', location := 'PLC', value := TO_REAL(REVPI_TEMP),
  min_alarm := 5, min_warn := 10, max_warn := 55, max_alarm := 70,
  doInterlockOnAlarm := FALSE);
index := index + 1;

// To find actual values
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'TBM Methane Sensor', location := 'TBM Cutter Head', value := TO_REAL(mGVL.methaneSensorTBM),
  min_alarm := 0, min_warn := 10, max_warn := 2000, max_alarm := 5000,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Control Cabinet Door Switch', location := 'Control Cabinet', value := TO_REAL(mGVL.doorOpenCC),
  min_alarm := 1, min_warn := 0, max_warn := 0, max_alarm := 1,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Power Cabinet Door Switch', location := 'Power Cabinet', value := TO_REAL(mGVL.doorOpenPC),
  min_alarm := 1, min_warn := 0, max_warn := 0, max_alarm := 1,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Control Panel E-Stop', location := 'Control Panel', value := TO_REAL(mGVL.eStopCP),
  min_alarm := 0, min_warn := 1, max_warn := 1, max_alarm := 0,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Control Cabinet E-Stop', location := 'Control Cabinet', value := TO_REAL(mGVL.eStopCC),
  min_alarm := 0, min_warn := 1, max_warn := 1, max_alarm := 0,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Power Cabinet E-Stop', location := 'Power Cabinet', value := TO_REAL(mGVL.eStopPC),
  min_alarm := 0, min_warn := 1, max_warn := 1, max_alarm := 0,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Consumption Meter', location := 'Power Cabinet', value := TO_REAL(mGVL.energyConsumptionPulse),
  min_alarm := 2, min_warn := - 1, max_warn := 1, max_alarm := 2,
  doInterlockOnAlarm := FALSE);
index := index + 1;

// Triggers when off
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'TBM Connected', location := 'Control Cabinet', value := TO_REAL(mGVL.tbmPowered),
  min_alarm := - 2, min_warn := 1, max_warn := 1, max_alarm := 2,
  doInterlockOnAlarm := TRUE);
index := index + 1;

//====================
//= Propulsion
//====================
mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor A', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorA),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor B', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorB),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor C', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorC),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor D', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorD),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor E', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorE),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

mainGVL.sensorReadingsFunctionBlocks[index](
  index := index, title := 'Pressure Sensor F', location := 'TBM', value := TO_REAL(mGVL.hydraulicPressureSensorF),
  min_alarm := 0, min_warn := 0.5, max_warn := 230, max_alarm := 250,
  doInterlockOnAlarm := TRUE);
index := index + 1;

