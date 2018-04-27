Anatomy of BlueButton API FHIR ExplanationOfBenefit Responses
=============================================================


BlueButton  API FHIR responses contain these FHIR Resource types. 


* `Patient`
* `Coverage`
* `ExplanationOfBenefit` (EOB)


The purpose of this document is provide more detailed descriptions of the complex resource the `ExplanationOfBenefit`. `ExplanationOfBenefit` is often abbreviated as EOB.  The official documentation for the EOB is here http://hl7.org/fhir/explanationofbenefit.html.


As per the FHIR specification, if you query the API as a search operation, a `Bundle` will instead be returned containing one or more search results.  When it comes to the `Patient` resource, only one record will ever be returned.   `Coverage` usually as only a handful of entries per patient as well.  `ExplanationOfBenefit` on the other hand can have hundreds of entries.  The BB API support paging to help developers step through potentially huge responses.  by default, only 10 records are returned.  The maximum number of records that can be queries at one time is 50.  This means that developers must use paging to obtain all information when the number of EOBs is greater than 50.


Types of EOBs
-------------

The Blue Button API defines several "EOB types". These are:


* `CARRIER` - Routine office visits, etc. (Part B)
* `DME` - Durable Medical Equipment. (Part B)
* `HHA` - Home Health Services. (Part A)
* `HOSPICE` -  Hospice. (Part A)
* `INPATIENT` - Inpatient Hospital Care (Part A)
* `OUTPATIENT` - Outpatient (Part B)
* `PDE` - Pharmacy (Part D)
* `SNF` - Skilled Nursing Facility (Part A)

The current version of FHIR (STU 3) does not have a direct one-to-one mapping between the `eob-type` and the `ex-claimtype`. Please see https://bluebutton.cms.gov/resources/codesystem/eob-type  for more detailed information.  Based on the EOB type, the anatomy of the EOB resource will differ.  Currently, in the sample synthetic data set only `CARRIER`, `INPATIENT`, and, `PDE`.


Annotated `PDE` (Pharmacy)
-------------------------

The following search grabs a single `PDE` type ExplanationOfBenefit` as a `Bundle` for the user BBUser21919 with a Patient ID of 20140000001920, and saves it to a file called `pde.json`.


    curl --header "Authorization: Bearer some-token-you-created" "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=20140000001920&startIndex=200&count=1" -o pde.json


To save bandwidth, the API response is minified.  We have "pretty printed" with indents to make it easier to annotate.  This pharmacy claim is for Simvastatin, a statin used to treat high cholesterol and triglyceride levels. Its more commonly known by its brand name Zocor.  Let's step through this piece by piece:


The first section (below) lets us know the response is a Bundle and provides information about paging.  It also lets us know this particular individual has 499 EOBs.  Our query had a `count=1` so we will only have one object in the `entry` list.

    {
        "resourceType": "Bundle",
        "id": "79d87611-d42e-417f-99ce-a71e971cd173",
        "meta": {
            "lastUpdated": "2018-04-20T09:57:18.948-04:00"
        },
        "type": "searchset",
        "total": 499,
        "link": [{
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&startIndex=200&count=1&patient=20140000001920",
            "relation": "self"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&startIndex=201&count=1&patient=20140000001920",
            "relation": "next"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&startIndex=199&count=1&patient=20140000001920",
            "relation": "previous"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&startIndex=0&count=1&patient=20140000001920",
            "relation": "first"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&startIndex=498&count=1&patient=20140000001920",
            "relation": "last"
        }],

	"entry": [{...}]



The `entry` section contains most of the important details. The first part of the entry tells us that the FHIR resource type is `ExplanationOfBenefit` and its FHIR ID is `pde-6966343334`.


	"entry": [{
		"fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/pde-6966343334",
		"resource": {
			"resourceType": "ExplanationOfBenefit",
			"id": "pde-6966343334",


The `identifier` section provides some IDs and metadata related to this PDE EOB. This tells us that the unique Part D event for a beneficiary is 6966343334. rx_srvc_rfrnc_num is the RX Service Reference Number. It tells us that the prescription reference number assigned by the pharmacy at the time the prescription was filled is "63200078748".  The claim-group is undocumented at the moment and this has been submitted to the BBAPI team for resolution.


			"identifier": [{
				"system": "https://bluebutton.cms.gov/resources/variables/pde_id",
				"value": "6966343334"
			}, {
				"system": "https://bluebutton.cms.gov/resources/identifier/claim-group",
				"value": "2030072395"
			}, {
				"system": "https://bluebutton.cms.gov/resources/variables/rx_srvc_rfrnc_num",
				"value": "63200078748"
			}],


The `status` of the EOB is `active` letting us know this medication is likely being taken by the beneficiary.

			"status": "active",

The `type` section provides more metadata about the EOB.  In this case, it  contains a codable concept with 2 coding systems  for `eob-type` and `ex-claimtype`.  As priorly mentioned, there is not always a one-to-one mapping between `eob-type` and `ex-claimtype`, but in the case of a pharmacy claim there is.  Both `PDE` and `pharmacy` are indicating this is a pharmacy claim. 


			"type": {
				"coding": [{
					"system": "https://bluebutton.cms.gov/resources/codesystem/eob-type",
					"code": "PDE"
				}, {
					"system": "http://hl7.org/fhir/ex-claimtype",
					"code": "pharmacy",
					"display": "Pharmacy"
				}]
			},

The patient section is simply a reference to the patient id.

			"patient": {
				"reference": "Patient/20140000001920"
			},

The `organization` section let's us know the organization responsible for the prescription.  The identifier is for a National Provider Identifier (NPI).  NPIs can refer to organizations or individual providers. See https://www.cms.gov/Regulations-and-Guidance/Administrative-Simplification/NationalProvIdentStand/ for more information.

			"organization": {
				"identifier": {
					"system": "http://hl7.org/fhir/sid/us-npi",
					"value": "999999999999999"
				}
			},

The `facility` tells us about the facility that fulfilled the prescription.  The `phrmcy_srvc_type_cd` code of 02 tells us the pharmacy service type is a compounding pharmacy.


			"facility": {
				"extension": [{
					"url": "https://bluebutton.cms.gov/resources/variables/phrmcy_srvc_type_cd",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/phrmcy_srvc_type_cd",
						"code": "02",
						"display": "Compounding pharmacy"
					}
				}],

The `identifier` is for the NPI of the pharmacy.


				"identifier": {
					"system": "http://hl7.org/fhir/sid/us-npi",
					"value": "999999999999999"
				}
			},

The `information` section is a list containing a number of codes that provide more context about the prescription.


			"information": [{

The prescriber gave no instructions regarding substitution of generic equivalents. The `daw_prod_slctn_cd` code is `0`.

				"sequence": 1,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/daw_prod_slctn_cd",
						"display": "Dispense as Written (DAW) Product Selection Code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/daw_prod_slctn_cd",
						"code": "0",
						"display": "No Product Selection Indicated (may also have missing values)"
					}]
				}
			}, {

The prescription was complete (as opposed to partially filled).  The `dspnsng_stus_cd` code is `C`.

				"sequence": 2,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/dspnsng_stus_cd",
						"display": "Dispensing Status Code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/dspnsng_stus_cd",
						"code": "C",
						"display": "Completion of partial fill"
					}]
				}
			}, {

The prescription is covered. The `drug_cvrg_stus_cd` code is `C`.

				"sequence": 3,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/drug_cvrg_stus_cd",
						"display": "Drug Coverage Status Code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/drug_cvrg_stus_cd",
						"code": "C",
						"display": "Covered"
					}]
				}
			}, {

The prescription is electronic as opposed to hand written, by telephone, etc.). The `rx_orgn_cd"` code is `E`.

				"sequence": 4,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/rx_orgn_cd",
						"display": "Prescription Origination Code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/rx_orgn_cd",
						"code": "3",
						"display": "Electronic"
					}]
				}
			}, {


The health plan is indicating this is a claim for a generic as opposed to a brand name. The `brnd_gnrc_cd` code is `G`.

				"sequence": 5,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/brnd_gnrc_cd",
						"display": "Brand-Generic Code Reported by Submitting Plan"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/brnd_gnrc_cd",
						"code": "G",
						"display": "Generic Null/missing"
					}]
				}
			}, {

The prescription was filled by a compounding pharmacy (as opposed to a retail pharmacy, etc). The `phrmcy_srvc_type_cd` code is `02`.

				"sequence": 6,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/phrmcy_srvc_type_cd",
						"display": "Pharmacy service type code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/phrmcy_srvc_type_cd",
						"code": "02",
						"display": "Compounding pharmacy"
					}]
				}
			}, {

The prescription was filled by a compounding pharmacy as opposed to a retail pharmacy, etc). The `phrmcy_srvc_type_cd` code is `02`.


				"sequence": 7,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/ptnt_rsdnc_cd",
						"display": "Patient Residence Code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/ptnt_rsdnc_cd",
						"code": "90"
					}]
				}
			}, {

The prescription is in response to a prescribing physician changing the patient's therapy. The `submsn_clr_cd` code is `05`.


				"sequence": 8,
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/information",
						"code": "https://bluebutton.cms.gov/resources/variables/submsn_clr_cd",
						"display": "Submission clarification code"
					}]
				},
				"code": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/submsn_clr_cd",
						"code": "05",
						"display": "Therapy change. Physician determined that a change in therapy was required – either the medication was used faster than expected, or a different dosage form is needed."
					}]
				}
			}],


The `careTeam` lists the health care provider. In this instance, only the patiewnt's primary care physician is listed.


			"careTeam": [{
				"sequence": 2,
				"provider": {
					"identifier": {
						"system": "http://hl7.org/fhir/sid/us-npi",
						"value": "999999999999999"
					}
				},
				"role": {
					"coding": [{
						"system": "http://hl7.org/fhir/claimcareteamrole",
						"code": "primary",
						"display": "Primary provider"
					}]
				}
			}],


The `insurance` identifies the plan that is covering the prescription.  In this example, the plan id is `999999`.
The plan benefit package (PBP) identifier for the beneficary's PArt D coverage is `999`.  We also see a refrence to FHIR `Coverage` record, `Coverage/part-d-20140000001920`.


			"insurance": {
				"coverage": {
					"extension": [{
						"url": "https://bluebutton.cms.gov/resources/variables/plan_cntrct_rec_id",
						"valueIdentifier": {
							"system": "https://bluebutton.cms.gov/resources/variables/plan_cntrct_rec_id",
							"value": "99999"
						}
					}, {
						"url": "https://bluebutton.cms.gov/resources/variables/plan_pbp_rec_num",
						"valueIdentifier": {
							"system": "https://bluebutton.cms.gov/resources/variables/plan_pbp_rec_num",
							"value": "999"
						}
					}],
					"reference": "Coverage/part-d-20140000001920"
				}
			},

The `item` section is a list containing more metadata about the prescription.



			"item": [{

The prescription is for Simvastatin (Brand name Zocor).  The `ndc` code is `16729000517`.


				"sequence": 1,
				"careTeamLinkId": [2],
				"service": {
					"coding": [{
						"system": "http://hl7.org/fhir/sid/ndc",
						"code": "16729000517"
					}]
				},
The `serviceDate`.


				"servicedDate": "2016-01-01",

The quantity section indicates 34 units were filled and it is for a 90 day supply. The `fill_num` value is 34. The `days_supply_num is 90.`


				"quantity": {
					"extension": [{
						"url": "https://bluebutton.cms.gov/resources/variables/fill_num",
						"valueQuantity": {
							"value": 34
						}
					}, {
						"url": "https://bluebutton.cms.gov/resources/variables/days_suply_num",
						"valueQuantity": {
							"value": 90
						}
					}],
					"value": 90.0
				},


The `adjudication` section contains a list of metadata about the claim's adjudication process.
Information such as co-pays and out of pocket expenses are found in this section.





				"adjudication": [{

The prescription is covered and nothing ($0 USD) is the net amount the Part D plan paid for a PDE that was 
covered by the Medicare Part D benefit.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/cvrd_d_plan_pd_amt",
							"display": "Amount paid by Part D plan for the PDE (drug is covered by Part D)"
						}]
					},
					"reason": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/variables/drug_cvrg_stus_cd",
							"code": "C",
							"display": "Covered"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
$10 USD is the portion of the gross drug cost for the prescription drug fill that was not covered by Part D’s catastrophic coverage.
`gdc_abv_oopt_amt` is 10.0.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/gdc_blw_oopt_amt",
							"display": "Gross Drug Cost Below Part D Out-of-Pocket Threshold (GDCB)"
						}]
					},
					"amount": {
						"value": 10.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
This prescription was filled when a beneficiary was below the out-of-pocket threshold (OOPT).
The `dc_abv_oopt_amt` value is 0.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/gdc_abv_oopt_amt",
							"display": "Gross Drug Cost Above Part D Out-of-Pocket Threshold (GDCA)"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {

0.0 USD was amount the beneficiary paid for the PDE without being reimbursed by a third party.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/ptnt_pay_amt",
							"display": "Amount Paid by Patient"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
0.0 USD is the amount of any payment made by other third-party payers that reduces the beneficiary’s liability for the PDE and counts towards Part D’s true out-of-pocket (TrOOP) requirement.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/othr_troop_amt",
							"display": "Other True Out-of-Pocket (TrOOP) Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {

0.0 USD was paid for the PDE by Part D low income subsidy.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/lics_amt",
							"display": "Amount paid for the PDE by Part D low income subsidy"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {


0.0 USD is the amount of any payment by other third-party payers that reduces the beneficiary’s liability for the PDE but does not count towards Part D’s true out-of-pocket (TrOOP) requirement.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/plro_amt",
							"display": "Reduction in patient liability due to payments by other payers (PLRO)"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {


10.0 USD is the total cost of the prescription drug event and is taken directly from the original PDE.
					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/tot_rx_cst_amt",
							"display": "Total drug cost (Part D)"
						}]
					},
					"amount": {
						"value": 10.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {

10.0 USD is the total cost of the prescription drug event and is taken directly from the original PDE.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/rptd_gap_dscnt_num",
							"display": "Gap Discount Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}],
The `detail` sectrion is a list of additional information points about the EOB presription.  In this example, 
the code `RXDINV` indicates that the Pharmacy dispense invoice is for a pharmacutlical that did not involve a compund.



				"detail": [{
					"type": {
						"coding": [{
							"system": "http://hl7.org/fhir/v3/ActCode",
							"code": "RXDINV",
							"display": "Rx dispense invoice"
						}]
					}
				}]
			}]
		}
	}]}

















