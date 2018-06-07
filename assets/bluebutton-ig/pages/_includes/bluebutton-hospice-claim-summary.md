#### Complete Summary of the Mandatory Requirements

1.  One or more ... in `ExplanationOfBenefit.identifier`
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
		-   a `item.careTeamLinkId`
		-	a `item.revenue`, and each revenue must have:
			- a `revenue.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        - a `revenue.hospice-rev-cntr-stus-ind-cd-extension`
	        - a `revenue.hospice-rev-cntr-ddctbl-coinsrnc-cd-extension`
		-	an `item.service`, and each service must have:
			- a `service.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -	an `item.modifier`, and each modifier must have:
			- a `modifier.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	    -	an `item.serviceDate`
	    -	an `item.locationAddress`, and each locationAddress must have:
			- a `locationAddress.state`
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
		-	an `item.hospice-rev-cntr-ndc-qty-extension`
		        		
9. A payment in `ExplanationOfBenefit.payment`
	- an ExplanationOfBenefit.payment must have:
		- a `payment.amount`, and each amount must have:
	        - a `amount.value`
	        - a `amount.system`
	        
10. The following `ExplanationOfBenefit` extensions:
 	- `ExplanationOfBenefit.hospice-clm-mdcr-non-pmt-rsn-cd-extension`
 	- `ExplanationOfBenefit.hospice-prpayamt-extension`
 	- `ExplanationOfBenefit.hospice-fi-num-extension`
		        		
		        		
#### Summary of the Must Support Requirements

Additionally your system must support:

1. One provider in `ExplanationOfBenefit.provider`
	-   an ExplanationOfBenefit.provider must have:
        -   a `provider.identifier`
        
2. One organization in `ExplanationOfBenefit.organization`
	-   an ExplanationOfBenefit.organization must have:
        -   a `organization.identifier`
        
3. One facility in `ExplanationOfBenefit.facility`
	-   an ExplanationOfBenefit.facility must have:
        -   a `facility.identifier`
        -   a `facility.hospice-clm-fac-type-cd-extension`
        
4. One or more information in `ExplanationOfBenefit.information`
    -   an ExplanationOfBenefit.information must have:
        -   an `information.sequence`
        -   an `information.category`, and each category must have:
        		- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -	  an `information.code`, and each cod must have:
        		- a `ccod.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -	  an `information.value`
	        		
5. One or more care team in `ExplanationOfBenefit.careTeam`
	-   an ExplanationOfBenefit.careTeam must have:
        -   a `careTeam.sequence`
        -   a `careTeam.provider`, and each provider must have:
        		- a `provider.identifer`
	     -   a `careTeam.role`, and each role must have:
	     		- a `role.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        			     
6. One or more diagnosis in `ExplanationOfBenefit.diagnosis`
	-   an ExplanationOfBenefit.diagnosis must have:
        -   a `diagnosis.sequence`
        -   a `diagnosis.diagnosis`
	     -   a `diagnosis.type`, and each type must have:
	     		- a `type.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -   a `diagnoisis.packageCode, and each packageCode must have:
	     		- a `packageCode.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        		
7. One hospitalization in `ExplanationOfBenefit.hospitalization`
	-   an ExplanationOfBenefit.hospitalization must have:
        -   a `hospitalization.start`
        -   a `hospitalization.end`

8. One total cost in `ExplanationOfBenefit.totalCost`
    -   an ExplanationOfBenefit.totalCost must have:
        -   an `totalCost.value`
        -   an `information.system`
	     -	  an `information.code`
	     
9. One or more benefit balances in `ExplanationOfBenefit.BenefitBalance`
	-   an ExplanationOfBenefit.BenefitBalance must have:
	     -   a `BenefitBalance.category`, and each category must have:
	     		- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	     -   a `BenefitBalance.financial, and each financial must have:
	     		- a `financial.type`, and each type must have:
	     			- a `type.coding`, and each coding must have:
		        		- a `coding.system`
		        		- a `coding.code`
		        	- a `type.used`
		        		