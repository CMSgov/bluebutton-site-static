# The Inrodductory Page you were looking for was not found!

This profile sets minimum expectations for the [ExplanationOfBenefit] Carrier Claim resource to record, search and fetch basic demographics and other administrative information about an individual Carrier Claim. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the Blue Button Carrier Claim profile:


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Carrier claim must have:**

 1. an id 
 2. EOB identifiers
 3. a status
 4. a type
 5. a patient
 6. a billable period
 7. an insurance
 8. an item
 9. a payment
 10. the following EOB level extensions:
 	- carrier-prpayamt-extension
 	- carrier-carr-num-extension
 	- carrier-asgmntcd-extension
 	- carrier-carr-clm-cash-ddctbl-apld-amt-extension
 	- carrier-carr-clm-pmt-dnl-cd-extension
 	- carrier-nch-carr-clm-alowd-amt-extension
 	- carrier-nch-carr-clm-sbmtd-chrg-amt-extension
 	- carrier-nch-clm-bene-pmt-amt-extension
 	- carrier-nch-clm-prvdr-pmt-amt-extension
 	- carrier-clm-clncl-tril-num-extension
 
**If the data is available a Carrier claim shall include:**

 1. a referral
 2. a care team
 3. a diagnosis

**Profile specific implementation guidance:**

* none

#### Examples

* none

