This profile sets minimum expectations for the [ExplanationOfBenefit] PDE resource to record, search and fetch basic demographics and other administrative information about an individual Part D Event. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the Blue Button Part D Event profile:


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each PDE must have:**

 1. an id 
 2. EOB identifiers (e.g. PDE_ID, ClaimGroup, RX_SRVC_RFRNC_NUM)
 3. a status
 4. a type
 5. a patient
 6. a disposition
 7. information
 8. a care team
 9. an insurance
 10. an item
 
 
**If the data is available a Patient shall include:**

 1. an organization
 2. a facility
 3. a payment
 
**Profile specific implementation guidance:**

* none

#### Examples


[ExplanationOfBenefit]: {{site.data.fhir.path}}/explanationofbenefit.html
