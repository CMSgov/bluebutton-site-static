Annotated `CaRRIER` (Carrier) ExplanationOfBenefit Resource
===========================================================


ThisCARRIER example is for a new office visit where the patient was referred, the diagnosis is bilateral age-related cataracts.

The following search grabs a single `CARRIER` type ExplanationOfBenefit` as a `Bundle` for the user BBUser21919 with a Patient ID of 20140000001920, and saves it to a file called `carrier.json`.


    curl --header "Authorization: Bearer some-token-you-created" "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=20140000001920&startIndex=0&count=1" -o carrier.json


To save bandwidth, the API response is minified.  We have "pretty printed" with indents to make it easier to annotate.  This pharmacy claim is for Simvastatin, a statin used to treat high cholesterol and triglyceride levels. Its more commonly known by its brand name Zocor.  Let's step through this piece by piece:


The first section (below) lets us know the response is a Bundle and provides information about paging.  It also lets us know this particular individual has 499 EOBs.  Our query had a `count=1` so we will only have one object in the `entry` list.

{
	"resourceType": "Bundle",
	"id": "5ac91e0a-7948-49fe-8d6c-7259c5656f4b",
	"meta": {
		"lastUpdated": "2018-04-20T12:55:48.050-04:00"
	},
	"type": "searchset",
	"total": 499,
	"link": [{
		"url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?count=1&startIndex=0&patient=20140000001920&_format=application%2Fjson%2Bfhir",
		"relation": "self"
	}, {
		"url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?count=1&startIndex=1&patient=20140000001920&_format=application%2Fjson%2Bfhir",
		"relation": "next"
	}, {
		"url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?count=1&startIndex=498&patient=20140000001920&_format=application%2Fjson%2Bfhir",
		"relation": "last"
	}],

The `entry` section contains most of the important details. The first part of the entry tells us that the FHIR resource type is `ExplanationOfBenefit` and its FHIR ID is `carrier-23701391372`.


	"entry": [{
		"fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/carrier-23701391372",
		"resource": {
			"resourceType": "ExplanationOfBenefit",
			"id": "carrier-23701391372",

The `ReferralRequest` FHIR resource is contained within the EOB.

			"contained": [{
				"resourceType": "ReferralRequest",
				"id": "1",

The referral is `completed` as opposed to `draft`, `canceled`, `active`, etc.


				"status": "completed",

A refrence to the `Patient` FHIR resource within the `ReferralRequest`.



				"subject": {
					"reference": "Patient/20140000001920"
				},

The NPI of the the requester is "999999999999"".


				"requester": {
					"agent": {
						"identifier": {
							"system": "http://hl7.org/fhir/sid/us-npi",
							"value": "999999999999"
						}
					}
				},

The NPI of the the provider to which the patient was referred.


				"recipient": [{
					"identifier": {
						"system": "http://hl7.org/fhir/sid/us-npi",
						"value": "999999999999"
					}
				}]
			}],
			"extension": [{
0.0 USD was the amount of a payment made on behalf of a Medicare beneficiary by a primary payer other than Medicare, that the provider is applying to covered Medicare charges on a non-institutional claim.


				"url": "https://bluebutton.cms.gov/resources/variables/prpayamt",
				"valueMoney": {
					"value": 0.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}, {

99999 is the Carrier or MAC number. The identification number assigned by CMS to a carrier authorized to process claims from a physician or supplier.


				"url": "https://bluebutton.cms.gov/resources/variables/carr_num",
				"valueIdentifier": {
					"system": "https://bluebutton.cms.gov/resources/variables/carr_num",
					"value": "99999"
				}
			}, {

The code `1` indicates the payment was made to the "Physician/supplier" (as opposed to be being denied, etc.)


				"url": "https://bluebutton.cms.gov/resources/variables/carr_clm_pmt_dnl_cd",
				"valueCoding": {
					"system": "https://bluebutton.cms.gov/resources/variables/carr_clm_pmt_dnl_cd",
					"code": "1",
					"display": "Physician/supplier"
				}
			}, {

The code `A` indicates this is an assigned claim as opposed  to an non-assigned claim (``N).

				"url": "https://bluebutton.cms.gov/resources/variables/asgmntcd",
				"valueCoding": {
					"system": "https://bluebutton.cms.gov/resources/variables/asgmntcd",
					"code": "A",
					"display": "Assigned claim"
				}
			}, {

`99999999` is the number used to identify all items and line item services provided to a beneficiary during their participation in a clinical trial.


				"url": "https://bluebutton.cms.gov/resources/variables/clm_clncl_tril_num",
				"valueIdentifier": {
					"system": "https://bluebutton.cms.gov/resources/variables/clm_clncl_tril_num",
					"value": "99999999"
				}
			}, {

150.0 USD is the "Carrier Claim Cash Deductible Applied Amount (sum of all line-level deductible amounts)".


				"url": "https://bluebutton.cms.gov/resources/variables/carr_clm_cash_ddctbl_apld_amt",
				"valueMoney": {
					"value": 150.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}, {

0.0 USD is the total payments made to the beneficiary for this claim (sum of line payment amounts to the beneficiary.)  At the time of this wrting,
1.the URL  https://bluebutton.cms.gov/resources/variables/nch_clm_prvdr_pmt_amt is missing,  The ommision has been reported.


				"url": "https://bluebutton.cms.gov/resources/variables/nch_clm_prvdr_pmt_amt",
				"valueMoney": {
					"value": 0.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}, {

0.0 USD is the "NCH Claim Payment Amount to Beneficiary". It is the total payments made to the beneficiary for this claim (sum of all line-level payments to beneficiary, variable called LINE_BENE_PMT_AMT)


				"url": "https://bluebutton.cms.gov/resources/variables/nch_clm_bene_pmt_amt",
				"valueMoney": {
					"value": 0.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}, {

300.0 USD is the NCH Carrier Claim Submitted Charge Amount (sum of all line-level submitted charges). The total submitted charges on the claim (sum of all line-level submitted charges, variable called LINE_SBMTD_CHRG_AMT)



				"url": "https://bluebutton.cms.gov/resources/variables/nch_carr_clm_sbmtd_chrg_amt",
				"valueMoney": {
					"value": 300.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}, {

150 USD is the NCH Carrier Claim Allowed Charge Amount. It is the sum of all line item allowed charges,


				"url": "https://bluebutton.cms.gov/resources/variables/nch_carr_clm_alowd_amt",
				"valueMoney": {
					"value": 150.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}],

"23701391372" is the Claim ID.  This is not a FHIR ID. See https://bluebutton.cms.gov/resources/variables/clm_id/ for more details.



			"identifier": [{
				"system": "https://bluebutton.cms.gov/resources/variables/clm_id",
				"value": "23701391372"
			}, {

"84390133146" is the claim group identifier.


				"system": "https://bluebutton.cms.gov/resources/identifier/claim-group",
				"value": "84390133146"
			}],

The status is `active` as opposed to `draft`, etc.


			"status": "active",

The `type` section provides classification as to the type of ExplanationOfBenefit.  The code, `71`
indicates a ""Local carrier non-durable medical equipment, prosthetics, orthotics, and supplies (DMEPOS) claim".
The code `CARRIER` identifieds the BlueButton API EOB type. `professional` is the FHIR  claimtype.
The code `O` indicates that this is a "Part B physician/supplier claim record".



			"type": {
				"coding": [{
					"system": "https://bluebutton.cms.gov/resources/variables/nch_clm_type_cd",
					"code": "71",
					"display": "Local carrier non-durable medical equipment, prosthetics, orthotics, and supplies (DMEPOS) claim"
				}, {
					"system": "https://bluebutton.cms.gov/resources/codesystem/eob-type",
					"code": "CARRIER"
				}, {
					"system": "http://hl7.org/fhir/ex-claimtype",
					"code": "professional",
					"display": "Professional"
				}, {
					"system": "https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd",
					"code": "O",
					"display": "Part B physician/supplier claim record (processed by local carriers; can include DMEPOS services)"
				}]
			},

A pointer to the patient's FHIR `Patient` reource.


			"patient": {
				"reference": "Patient/20140000001920"
			},

The biilabePeriod for this claim is 1 day, October, 1 2016.


			"billablePeriod": {
				"start": "2016-10-01",
				"end": "2016-10-01"
			},

A reference to ther referral contained within this resource.

			"referral": {
				"reference": "#1"
			},

The `careTeam`.


			"careTeam": [{
				"extension": [{
The code `1` indicates the the type of provider furnishing the sertvice is sole proprietor.


					"url": "https://bluebutton.cms.gov/resources/variables/carr_line_prvdr_type_cd",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/carr_line_prvdr_type_cd",
						"code": "1"
					}
				}, {

The code `2` indicates that "All or some covered and allowed expenses applied to deductible Participating".


					"url": "https://bluebutton.cms.gov/resources/variables/prtcptng_ind_cd",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/prtcptng_ind_cd",
						"code": "2",
						"display": "All or some covered and allowed expenses applied to deductible Participating"
					}
				}],
				"sequence": 2,

The NPI of the health provider/physician.


				"provider": {
					"identifier": {
						"system": "http://hl7.org/fhir/sid/us-npi",
						"value": "999999999999"
					}
				},

This provider is responsiible for this patient.


				"responsible": true,

This provider is the patient's primary caregiver.


				"role": {
					"coding": [{
						"system": "http://hl7.org/fhir/claimcareteamrole",
						"code": "primary",
						"display": "Primary provider"
					}]
				},

The provider's specialty code.  Instead of the value `999` seen here, we might expect to instead find `18` indicating
Ophthalmology. `999` is an invlid code, but `99` indicated "Unknown physician specialty".


				"qualification": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/prvdr_spclty",
						"code": "999"
					}]
				}
			}],

The ICD-10 diagnosis code `H25813` is for Combined forms of age-related cataract, bilateral.


			"diagnosis": [{
				"sequence": 1,
				"diagnosisCodeableConcept": {
					"coding": [{
						"system": "http://hl7.org/fhir/sid/icd-10",
						"code": "H25813"
					}]
				},

This is the `principal` medical diagnosis that is most relevant to the patient's chief complaint or need for treatment.


				"type": [{
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/diagnosis-type",
						"code": "principal",
						"display": "The single medical diagnosis that is most relevant to the patient's chief complaint or need for treatment."
					}]
				}]
			}, {

The ICD-10 code `9999999` doesn't exist.  This appears to be a bug in the sample data.

				"sequence": 2,
				"diagnosisCodeableConcept": {
					"coding": [{
						"system": "http://hl7.org/fhir/sid/icd-10",
						"code": "9999999"
					}]
				}
			}],

This is a link to the FHIR coverage resource covering this claim.


			"insurance": {
				"coverage": {
					"reference": "Coverage/part-b-20140000001920"
				}
			},

The `item` section contains a nuber of items providing more metadata about the encounter.

			"item": [{
				"extension": [{

The code `3` indicates the untits is `Services` (as opposed to "Transportation (ambulance) miles", etc.)


					"url": "https://bluebutton.cms.gov/resources/variables/carr_line_mtus_cd",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/carr_line_mtus_cd",
						"code": "3",
						"display": "Services"
					}
				}, {
The unit's value is 1.  this makes since because this is a single doctor's visit.


					"url": "https://bluebutton.cms.gov/resources/variables/carr_line_mtus_cnt",
					"valueQuantity": {
						"value": 1
					}
				}, {

The code `M1A` indicates this is a new office visit.

					"url": "https://bluebutton.cms.gov/resources/variables/betos_cd",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/betos_cd",
						"code": "M1A",
						"display": "Office visits - new"
					}
				}, {

The code `0` is for the "Line Service Deductible Indicator Switch" and indicates the service is subject to deductable.


					"url": "https://bluebutton.cms.gov/resources/variables/line_service_deductible",
					"valueCoding": {
						"system": "https://bluebutton.cms.gov/resources/variables/line_service_deductible",
						"code": "0",
						"display": "Service Subject to Deductible"
					}
				}],
				"sequence": 1,
				"careTeamLinkId": [2],
				"diagnosisLinkId": [2],
				"category": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/line_cms_type_srvc_cd",
						"code": "1",
						"display": "Medical care"
					}]
				},
The HCPCS code `99204` code indicates an office or other outpatient visit for the evaluation and management of a new patient.



				"service": {
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/codesystem/hcpcs",
						"version": "6",
						"code": "99204"
					}]
				},

The service periood date range was October 1, 2016.


				"servicedPeriod": {
					"start": "2016-10-01",
					"end": "2016-10-01"
				},
The service location's state code is `99`.


				"locationCodeableConcept": {
					"extension": [{
						"url": "https://bluebutton.cms.gov/resources/variables/prvdr_state_cd",
						"valueCoding": {
							"system": "https://bluebutton.cms.gov/resources/variables/prvdr_state_cd",
							"code": "99",
							"display": "With 000 county code is American Samoa; otherwise unknown"
						}
					}, {
The service location's zip code is `999999999`.


						"url": "https://bluebutton.cms.gov/resources/variables/prvdr_zip",
						"valueCoding": {
							"system": "https://bluebutton.cms.gov/resources/variables/prvdr_zip",
							"code": "999999999"
						}
					}, {

The code `99` is for Carrier Line Pricing Locality Code.  `99` is an invalid code.


						"url": "https://bluebutton.cms.gov/resources/variables/carr_line_prcng_lclty_cd",
						"valueCoding": {
							"system": "https://bluebutton.cms.gov/resources/variables/carr_line_prcng_lclty_cd",
							"code": "99"
						}
					}],
					"coding": [{
						"system": "https://bluebutton.cms.gov/resources/variables/line_place_of_srvc_cd",
						"code": "99",
						"display": "Other Place of Service. Other place of service not identified above."
					}]
				},

The quantity is 1.  This is for a single doctor's visit.


				"quantity": {
					"value": 1
				},

The adjudication section higlights items about the claims payment, denials, co-pays, out-of-pocket expenses and related concepts.



				"adjudication": [{

The code `0` is for the "Carrier Line Reduced Payment Physician Assistant Code" and indicates that its N/A. 


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/carr_line_rdcd_pmt_phys_astn_c",
							"display": "Carrier Line Reduced Payment Physician Assistant Code"
						}]
					},
					"reason": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/variables/carr_line_rdcd_pmt_phys_astn_c",
							"code": "0",
							"display": "N/A"
						}]
					}
				}, {
					"extension": [{

The code `0` is for the Line payment percent (%). `0` indicates 80%.


						"url": "https://bluebutton.cms.gov/resources/variables/line_pmt_80_100_cd",
						"valueCoding": {
							"system": "https://bluebutton.cms.gov/resources/variables/line_pmt_80_100_cd",
							"code": "0",
							"display": "80%"
						}
					}],
0.0 USD is the amount of payment made from the Medicare trust fund (after deductible and coinsurance amounts have been paid) for the line item service on the non-institutional claim. See https://bluebutton.cms.gov/resources/variables/line_nch_pmt_amt for more information.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_nch_pmt_amt",
							"display": "Line NCH Medicare Payment Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				},
0.0 USD is the payment (reimbursement) made to the beneficiary related to the line item service on the non-institutional claim.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_bene_pmt_amt",
							"display": "Line Payment Amount to Beneficiary"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {

0.0 USD is the payment made by Medicare to the provider for the line item service on the non-institutional claim.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_prvdr_pmt_amt",
							"display": "Line Provider Payment Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
150.0 USD us the part B deductible amount.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_bene_ptb_ddctbl_amt",
							"display": "Line Beneficiary Part B Deductible Amount"
						}]
					},
					"amount": {
						"value": 150.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
0.0 USD is the amount paid by the primay payer if its not Medicare.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_bene_prmry_pyr_pd_amt",
							"display": "Line Primary Payer (if not Medicare) Paid Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
0.0 USD is the beneficiary coinsurance amount.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_coinsrnc_amt",
							"display": "Line Beneficiary Coinsurance Amount"
						}]
					},
					"amount": {
						"value": 0.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
300.0 USD is the "Line Submitted Charge Amount". This is the charge for the office visit.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_sbmtd_chrg_amt",
							"display": "Line Submitted Charge Amount"
						}]
					},
					"amount": {
						"value": 300.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {
					"category": {
150.0 USD is the amount of allowed charges for the line item service on the non-institutional claim.


						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_alowd_chrg_amt",
							"display": "Line Allowed Charge Amount"
						}]
					},
					"amount": {
						"value": 150.0,
						"system": "urn:iso:std:iso:4217",
						"code": "USD"
					}
				}, {


The code `A` indicates the claim was allowd. The "Line Processing Indicator Code" is the code on a non-institutional claim indicating to whom payment was made or if the claim was denied.


					"category": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
							"code": "https://bluebutton.cms.gov/resources/variables/line_prcsg_ind_cd",
							"display": "Line Processing Indicator Code"
						}]
					},
					"reason": {
						"coding": [{
							"system": "https://bluebutton.cms.gov/resources/variables/line_prcsg_ind_cd",
							"code": "A",
							"display": "Allowed"
						}]
					}
				}]
			}],

The payment amount is 0.0 USD.


			"payment": {
				"amount": {
					"value": 0.0,
					"system": "urn:iso:std:iso:4217",
					"code": "USD"
				}
			}
		}
	}]
}

