This profile sets minimum expectations for the [ExplanationOfBenefit] SNF Claim resource to record, search and fetch basic demographics and other administrative information about an individual SNF Claim. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the Blue Button SNF Claim profile:


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each SNF Claim must have:**

 1. EOB identifiers
 3. a status
 4. a type
 5. a patient
 6. a billable period
 7. an insurance
 8. an item
 9. a payment
 10. the following EOB level extensions:
 	- snf-nch-bene-ip-ddctbl-amt-extension
 	- snf-nch-bene-pta-coinsrnc-lblty-amt-extension
 	- snf-nch-ip-ncvrd-chrg-amt-extension
 	- snf-nch-ip-tot-ddctn-amt-extension
 	- snf-clm-pps-cptl-dsprprtnt-shr-amt-extension
 	- snf-clm-pps-cptl-excptn-amt-extension
 	- snf-clm-pps-cptl-fsp-amt-extension
 	- snf-clm-pps-cptl-ime-amt-extension
 	- snf-clm-pps-cptl-outlier-amt-extension
 	- snf-clm-pps-old-cptl-hld-hrmls-amt-extension
 	- snf-nch-bene-blood-ddctbl-lblty-am-extension
 	- snf-clm-mdcr-non-pmt-rsn-cd-extension
 	- snf-prpayamt-extension
 	- snf-fi-num-extension
 
**If the data is available a SNF Claim shall include:**

 1. a provider
 2. an organization
 3. a facility
 4. information
 5. a care team
 6. diagnoses
 7. a procedure
 8. a hospitalization
 9. a total cost
 10. a benefit balance

**Profile specific implementation guidance:**

* none

#### Examples

* none

