This profile sets minimum expectations for the [ExplanationOfBenefit] Inpatient Claim resource to record, search and fetch basic demographics and other administrative information about an individual Inpatient Claim. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the Blue Button Inpatient Claim profile:


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Inpatient Claim must have:**

 1. EOB identifiers
 3. a status
 4. a type
 5. a patient
 6. a billable period
 7. an insurance
 8. an item
 9. a payment
 10. the following EOB level extensions:
 	- inpatient-ime-op-clm-val-amt-extension
 	- inpatient-dsh-op-clm-val-amt-extension
 	- inpatient-clm-pass-thru-per-diem-amt-extension
 	- inpatient-nch-profnl-cmpnt-chrg-amt-extension
 	- inpatient-clm-tot-pps-cptl-amt-extension
 	- inpatient-nch-bene-ip-ddctbl-amt-extension
 	- inpatient-nch-bene-pta-coinsrnc-lblty-amt-extension
 	- inpatient-nch-ip-ncvrd-chrg-amt-extension
 	- inpatient-nch-ip-tot-ddctn-amt-extension
 	- inpatient-clm-pps-cptl-dsprprtnt-shr-amt-extension
 	- inpatient-clm-pps-cptl-excptn-amt-extension
 	- inpatient-clm-pps-cptl-fsp-amt-extension
 	- inpatient-clm-pps-cptl-ime-amt-extension
 	- inpatient-clm-pps-cptl-outlier-amt-extension
 	- inpatient-clm-pps-old-cptl-hld-hrmls-amt-extension
 	- inpatient-nch-drg-outlier-aprvd-pmt-amt-extension
 	- inpatient-nch-bene-blood-ddctbl-lblty-am-extension
 	- inpatient-clm-mdcr-non-pmt-rsn-cd-extension
 	- inpatient-prpayamt-extension
 	- inpatient-fi-num-extension
 	
 
**If the data is available a Inpatient Claim shall include:**

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

