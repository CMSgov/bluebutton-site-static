#### Complete Summary of the Mandatory Requirements


1.  An id in `Patient.id`
2.  One or more medical record numbers in `Patient.identifier`
    -   each Patient.identifier must have:
        -   an `identifier.system`
        -   an `identifier.value` that is unique within the system.

3.  One name in `Patient.name`    
    -   each Patient.name must have:
        -   a `name.use`
        -   a `name.family`
        -   a `name.given`

4.  One gender in `Patient.gender`
    -   Patient.gender is bound to [Blue ButtonGender] value set
    
5.  One address in `Patient.address`
	-	each patient.address must have:
		-   a `name.use`
       	-   a `name.family`
       	-   a `name.given`

  [Blue ButtonGender]:ValueSet-gndr-cd.html


#### Summary of the Must Support Requirements

Additionally your system must support:

1.  A date of birth in `Patient.birthDate`
2.  One race codes in  `Patient.extension` = [Blue ButtonRace Extension] which:
    - May include additional race codes from [Blue ButtonRace Codes]


  [Blue ButtonRace Extension]:StructureDefinition-bluebutton-patient-race-extension.html
  [Blue ButtonRace Codes]:ValueSet-race.html
