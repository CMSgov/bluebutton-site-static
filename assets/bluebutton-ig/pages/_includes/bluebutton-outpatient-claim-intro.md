This profile sets minimum expectations for the [ExplanationOfBenefit] Outpatient Claim resource to record, search and fetch basic demographics and other administrative information about an individual Outpatient Claim. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the Blue Button Outpatient Claim profile:


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Outpatient Claim must have:**

 1. EOB identifiers
 3. a status
 4. a type
 5. a patient
 6. a billable period
 7. an insurance
 8. an item
 9. a payment
 10. the following EOB level extensions:
 	- outpatient-nch-profnl-cmpnt-chrg-amt-extension
 	- outpatient-nch-bene-ptb-ddctbl-amt-extension
 	- outpatient-nch-bene-ptb-coinsrnc-amt-extension
 	- outpatient-clm-op-prvdr-pmt-amt-extension
 	- outpatient-clm-op-bene-pmt-amt-extension
 	- outpatient-nch-bene-blood-ddctbl-lblty-am-extension
 	- outpatient-clm-mdcr-non-pmt-rsn-cd-extension
 	- outpatient-prpayamt-extension
 	- outpatient-fi-num-extension
 
**If the data is available a Outpatient Claim shall include:**

 1. a provider
 2. an organization
 3. a facility
 4. information
 5. a care team
 6. diagnoses
 7. a procedure
 8. a total cost

**Profile specific implementation guidance:**

* none

#### Examples

* none

