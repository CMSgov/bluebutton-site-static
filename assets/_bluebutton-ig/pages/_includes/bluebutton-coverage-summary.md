#### Complete Summary of the Mandatory Requirements

1.  An id in `Coverage.id`

2.  One status in `Coverage.status`

3.  One type in `Coverage.type`
    -   a Coverage.type must have:
        -   a `type.coding`, and each coding must have:
        		- a `coding.system`
        		- a `coding.code`
    
4.  One patient in `Coverage.beneficiary`
	-   a Coverage.beneficiary must have:
        -   a `beneficiary.reference`
	     		
5. One or more item in `Coverage.grouping`
	- 	a Coverage.grouping must have:
		-	a `grouping.subGroup`
		-	a `grouping.subPlan`
		        		
		        		
#### Summary of the Must Support Requirements

Additionally your system must support:

1. The following `Coverage` extensions:
 	- `Coverage.coverage-ms-cd-extension`
 	- `Coverage.coverage-orec-extension`
 	- `Coverage.coverage-crec-extension`
 	- `Coverage.coverage-esrd-ind-extension`
 	- `Coverage.coverage-a-trm-cd-extension`
 	- `Coverage.coverage-b-trm-cd-extension`

