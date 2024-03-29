## Changelog
Whenever you push a change, make a detailed note about it in here along with updating the change log in the file if possible. This way multiple can work at once. You can add images too if needed.

Below is the format we ideally keep. Any questions let me know.

Thanks :)

## Format:

```
### <Title of what has been done> - <Date> - <Who>

#### File versions: 
- <file> <version> -> <new version>
- **<requires a new download if configurations have changed>**

#### Change Description
- Brief description of change

```

```
### Added Variable structure to VisuGVL - 04/01/23 - Aaron

#### File versions: 
- Visu/visuGVL.gvl v0.0.0 -> v1.0.0
- (Does not require a new download as no configurations have changed, so can omit this line)

#### Change Description
- Added how to structure variables in visualisations

```

### Changes - <Date> - <Who>

#### File versions: 
- <file> <version> -> <new version>
- **<requires a new download if configurations have changed>**
- SafteyProg

#### Change Description
- Implemented key switch that on rising edge is used as reset.



### Added ME Flow meter - 29/01/23 - Aaron
#### File versions: 
- mGVL 1.0.1 -> 1.0.2
- VariableMapping 1.0.1 -> 1.0.2
- MaterialExtraction 1.0.0
- visuGVL 1.0.0 -> 1.0.1
- ME Visu 
- Main gvl 1.0.0
#### Change Description
- Added flow meter logic with rate measurement
- Updated ME visu

  

### Added Control Cabinet indicators - 28/01/23 - Aaron
#### File versions: 
- mGVL 1.0.0 -> 1.0.1
- VariableMapping 1.0.0 -> 1.0.1
- mainGVL 1.0.0
- safetyProg 1.0.0
- DO 
- DIO
-  **YOU SHOULD DOWNLOAD THE PROJECT AS CONFIGURATION HAS CHANGED!!!**

#### Change Description
- Moved isIssue to global
- Added outputs for system enabled, interlocked and isIssue
  
### Implemented ME Visu for Testing - 28/01/23 - Aaron
#### File versions: 
- mGVL 1.0.0
- VariableMapping 1.0.0
- AIO_1 Settings 1.0.0
- MEVisu new, 1.0.0
-  **YOU SHOULD DOWNLOAD THE PROJECT AS CONFIGURATION HAS CHANGED!!!**
#### Change Description
- Added correct calculations for AIO input ( measurement (micro amps) * 16/25 - 2560 = 0 < 25000 milli bar) 
- Added visu for Me (Traces with outputs)
### Added Variable structure to VisuGVL - 04/01/23 - Aaron

#### File versions: 
- Visu/visuGVL.gvl v0.0.0 -> v1.0.0
- (Does not require a new download as no configurations have changed, so can omit this line)

#### Change Description
- Added how to structure variables in visualisations



> Aaron

### Polished Hydraulic control + added hpu control
- Done a bunch of stuff
- Added some varaibles and maps etc
-  **YOU SHOULD DOWNLOAD THE PROJECT AS CONFIGURATION HAS CHANGED!!!**

> Aaron 
### Added Hydraulic control with UI 06/10/22 - 12PM
- Mapped controls to values if enabled
- Current outputs on -100% to 100% as parametrs
- Gripper pads set from 0 to 100% and converted to voltage
- **YOU SHOULD DOWNLOAD THE PROJECT AS CONFIGURATION HAS CHANGED!!!**

> Aaron


### Added safety and interface with UI + Global Variable lists 06/10/22 11PM
- Added the safety code with estop and reset interlocks
- Added global variable lists and variable mapping
- **YOU SHOULD DOWNLOAD THE PROJECT AS CONFIGURATION HAS CHANGED!!!**

> Aaron

### Initial Commit - 04/10/22
Made an initial commit of the project. 

> Aaron

