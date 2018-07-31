# Id-Summary.md not found

#### Complete Summary of the Mandatory Requirements

1.  An id in `ExplanationOfBenefit.id`

2.  One or more ... in `ExplanationOfBenefit.identifier`
    -   each ExplanationOfBenefit.identifier must have:
        -   an `identifier.system`
        -   an `identifier.value` that is unique within the system.

3.  One status in `ExplanationOfBenefit.status`

4.  One type in `ExplanationOfBenefit.type`
    -   an ExplanationOfBenefit.type must have:
        -   a `type.coding`, and each coding must have:
        		- a `coding.system`
        		- a `coding.code`
    
5.  One patient in `ExplanationOfBenefit.patient`
	-   an ExplanationOfBenefit.patient must have:
        -   a `patient.reference`
        
6.  One type in `ExplanationOfBenefit.billablePeriod`
    -   an ExplanationOfBenefit.billablePeriod must have:
        -   a `billablePeriod.start`
        -   a `billablePeriod.end`
        		
7.  One insurance in `ExplanationOfBenefit.insurance`
    -   an ExplanationOfBenefit.insurance must have:
        -   an `insurance.coverage`, and a coverage must have:
        		- a `coverage.reference`
	     		
8. One or more item in `ExplanationOfBenefit.item`
	- 	an ExplanationOfBenefit.item must have:
		-	an `item.sequence`
		-	an `item.category`, and each category must have:
			- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
		-	an `item.service`, and each service must have:
			- a `service.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        - a `service.carrier-carr-line-ansthsa-unit-cnt-extension`
	     -	an `item.modifier`, and each modifier must have:
			- a `modifier.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	    -	an `item.serviced`
	    -	an `item.locationCodeableConcept`, and each locationCodeableConcept must have:
	    	- a `locationCodeableConcept.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	    	- a `locationCodeableConcept.carrier-prvdr-state-cd-extension`
	    	- a `locationCodeableConcept.carrier-prvdr-zip-extension`
	    	- a `locationCodeableConcept.carrier-carr-line-prcng-lclty-cd-extension`
	    	- a `locationCodeableConcept.carrier-carr-line-clia-lab-num-extension`
	    -	an `item.quantity`, and each quantity must have:
	    	- a `quantity.value`
	    -	one or more `item.adjudication`, and each adjudication must have:
	    	- an `adjudication.category`, and each category must have:
        		- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        - an `adjudication.reason`, and each reason must have:
        		- a `reason.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        - an `adjudication.amount`, and each amount must have:
	        		- a `amount.value`
	        		- a `amount.system`
	        		- a `amount.code`
	    	- an `adjudication.carrier-line-pmt-80-100-cd-extension`
		-	an `item.carrier-carr-line-mtus-cd-extension`
		-	an `item.carrier-carr-line-mtus-cnt-extension`
		-	an `item.carrier-betos-cd-extension`
		-	an `item.carrier-line-bene-prmry-pyr-cd-extension`
		-	an `item.carrier-line-service-deductible-extension`
		-	an `item.carrier-line-hct-hgb-rslt-num-extension`
		-	an `item.carrier-ndc-extension`
		        		
9. A payment in `ExplanationOfBenefit.payment`
	- an ExplanationOfBenefit.payment must have:
		- a `payment.amount`, and each amount must have:
	        - a `amount.value`
	        - a `amount.system`
	        
10. The following `ExplanationOfBenefit` extensions:
 	- `ExplanationOfBenefit.carrier-prpayamt-extension`
 	- `ExplanationOfBenefit.carrier-carr-num-extension`
 	- `ExplanationOfBenefit.carrier-asgmntcd-extension`
 	- `ExplanationOfBenefit.carrier-carr-clm-cash-ddctbl-apld-amt-extension`
 	- `ExplanationOfBenefit.carrier-carr-clm-pmt-dnl-cd-extension`
 	- `ExplanationOfBenefit.carrier-nch-carr-clm-alowd-amt-extension`
 	- `ExplanationOfBenefit.carrier-nch-carr-clm-sbmtd-chrg-amt-extension`
 	- `ExplanationOfBenefit.carrier-nch-clm-bene-pmt-amt-extension`
 	- `ExplanationOfBenefit.carrier-nch-clm-prvdr-pmt-amt-extension`
 	- `ExplanationOfBenefit.carrier-clm-clncl-tril-num-extension`
		        		
		        		
#### Summary of the Must Support Requirements

Additionally your system must support:

1. One referral in `ExplanationOfBenefit.referral`
	-   an ExplanationOfBenefit.referral must have:
        -   a `referral.reference`
	        		
2. One or more care team in `ExplanationOfBenefit.careTeam`
	-   an ExplanationOfBenefit.careTeam must have:
        -   a `careTeam.sequence`
        -   a `careTeam.provider`, and each provider must have:
        		- a `provider.identifer`
	     -   a `careTeam.role`, and each role must have:
	     		- a `role.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -   a `careTeam.qualification`, and each qualification must have:
	     		- a `qualification.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -   a `careTeam.carrier-line-prvdr-type-cd-extension`
	     -   a `careTeam.carrier-prtcptng-ind-cd-extension`
	     -   a `careTeam.carrier-us-npi-extension`
	     
3. One or more diagnosis in `ExplanationOfBenefit.diagnosis`
	-   an ExplanationOfBenefit.diagnosis must have:
        -   a `diagnosis.sequence`
        -   a `diagnosis.diagnosis`
	     -   a `diagnosis.type`, and each type must have:
	     		- a `type.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
