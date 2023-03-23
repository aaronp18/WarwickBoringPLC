FUNCTION_BLOCK ReadSensor
VAR_INPUT
	index : INT;
	title : STRING(40);
	location : STRING(40);
	min_alarm : REAL;
	min_warn : REAL;
	value : REAL;
	max_warn : REAL;
	max_alarm : REAL;


	doInterlockOnAlarm : BOOL := FALSE;
END_VAR
VAR_OUTPUT
	isWarning : BOOL;
	isAlarm : BOOL;
	isProblem : BOOL;
	status : Statuses;

	isInterlocked : BOOL;


	valueColour : DWORD;
END_VAR
VAR
	sens : SensorReading := (value := value,	min_alarm := min_alarm, min_warn := min_warn, max_warn := max_warn, max_alarm := max_alarm, doInterlockOnAlarm := doInterlockOnAlarm);
END_VAR

// Set variable
// sens.value := value;

// Set to global
mainGVL.sensorReadings[index] := sens;

// If the given value is outside the max range
isAlarm := value <= min_alarm OR value >= max_alarm;

// If the given value is outside of the warning range
isWarning := value < min_warn OR value > max_warn;

// Assign status and colour of the value
IF isAlarm THEN
	status := Statuses.STATUS_ALARM;

	valueColour := 16#FFFF0000; // Red
ELSIF isWarning THEN
	status := Statuses.STATUS_WARNING;
	valueColour := 16#FFFFA500; // Orange
ELSE
	status := Statuses.STATUS_OK;
	valueColour := 16#FF00FF00; // Green
END_IF

// Set is problem for colour change
isProblem := isAlarm OR isWarning;

// Interlock if there is an alarm and the sensor is configured to interlock
isInterlocked := isAlarm AND doInterlockOnAlarm;
