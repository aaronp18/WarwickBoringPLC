PROGRAM safety
    
END_PROGRAM


FUNCTION isUnsafe : BOOL
    VAR_INPUT
        sensorValue: REAL; (* sensor input value *)
        sensorMax: REAL; (* max safe value the sensor can take *)
        sensorMin: REAL; (* min safe value the sensor can take *)
    END_VAR    
    VAR_OUTPUT
        unSafe: BOOL; (* is the value safe *)
    END_VAR

    IF sensorValue > sensorMax OR sensorValue < sensorMin THEN
        unSafe := TRUE;
    ELSE
        unSafe := FALSE;
    END_IF;
END_FUNCTION