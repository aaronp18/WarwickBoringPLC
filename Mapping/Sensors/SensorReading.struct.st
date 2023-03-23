TYPE SensorReading :
STRUCT

	value : REAL;
	min_alarm : REAL;
	min_warn : REAL;
	max_warn : REAL;
	max_alarm : REAL;

	doInterlockOnAlarm : BOOL := FALSE;

	status : Statuses;


END_STRUCT
END_TYPE
