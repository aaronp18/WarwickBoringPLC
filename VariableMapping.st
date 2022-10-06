PROGRAM VariableMapping
VAR
END_VAR

// Map all of the variables to the IO

// Inputs
mGVL.hydraulicPressureSensorA := ACI_3;
mGVL.eStopCC := DI_0;

// Outputs
DO_25 := mGVL.hpuReliefValve;