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
        
6.  One type in `ExplanationOfBenefit.disposition`
    -   an ExplanationOfBenefit.disposition must have:
        -   a `type.coding`, and each coding must have:
        		- a `coding.system`
        		- a `coding.code`
        		
7.  One or more ... in `ExplanationOfBenefit.information`
    -   an ExplanationOfBenefit.information must have:
        -   an `information.sequence`
        -   an `information.category`, and each category must have:
        		- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        		
8. One care team in `ExplanationOfBenefit.careTeam`
	-   an ExplanationOfBenefit.careTeam must have:
        -   a `careTeam.sequence`
        -   a `careTeam.provider`, and each provider must have:
        		- a `provider.identifer`
	     -   a `careTeam.role`, and each role must have:
	     		- a `role.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        		
9. One insurance in `ExplanationOfBenefit.insurance`
	-   an ExplanationOfBenefit.insurance must have:
	     -   a `insurance.coverage`, and each coverage must have:
	     		- a `coverage.reference`
	     		- a `coverage.planConctractId`
	     		- a `coverage.planBenefitPackageId`
	     		
10. One item in `ExplanationOfBenefit.item`
	- 	an ExplanationOfBenefit.item must have:
		-	an `item.sequence`
		-	an `item.service`, and each service must have:
			- a `service.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	    -	an `item.serviced`
	    -	an `item.quantity`, and each quantity must have:
	    	- a `quantity.value`
	    	- a `quantity.fillNum`
	    	- a `quantity.daysSupplyNum`
	    -	one or more `item.adjudication`, and each adjudication must have:
	    	- an `adjudication.category`, and each category must have:
        		- a `category.coding`, and each coding must have:
	        		- a `coding.system`
	        		- a `coding.code`
	        - an `adjudication.amount`, and each amount must have:
	        		- a `amount.value`
	        		- a `amount.system`
	        		- a `amount.code`
	    - 	an `item.detail`, and each detail must have:
	    	- a `detail.sequence`
	    	- a `detail.type`, and each type must have:
	    		- a `type.coding`, and each coding must have:
		        		- a `coding.system`
		        		- a `coding.code`
			
	

#### Summary of the Must Support Requirements

Additionally your system must support:

1.  An organization in `ExplanationOfBenefit.organization`
	- an ExplanationOfBenefit.organization must have:
		- an `organization.identifier`
2.  A facility in `ExplanationOfBenefit.facility`
	- an ExplanationOfBenefit.facility must have:
		- a `facility.identifier`
		- a `facility.phrmcySrvcTypeCd`
3.	A payment in `ExplanationOfBenefit.payment`
	- an ExplanationOfBenefit.payment must have:
		- a `payment.date`