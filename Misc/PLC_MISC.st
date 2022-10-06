// Used to get misc PLC sensors and values
PROGRAM PLC_MISC
VAR
	result : POINTER TO CmpApp.RTS_IEC_RESULT;
END_VAR

mainGVL.cpuLoad := SchedGetProcessorLoad(result);