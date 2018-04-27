Annotated Inpatient ExplanationOfBenefit Example
================================================

This document outlines an inpatient ExplanationOfBenefit FHIR resource.

The following search was used to create this sample.  It grabs a single `INPATIENT` type ExplanationOfBenefit` as a `Bundle` for the user BBUser21919 with a Patient ID of 20140000001920, and saves it to a file called `pde.json`.


    curl --header "Authorization: Bearer some-token-you-created" "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=20140000001920&startIndex=150&count=1" -o inpatient.json

The patient was admitted to the hospital for kidney problems and was diagnosed with a malignant tumor on his kidney.  Laparoscopic robotic assisted procedure was performed.  Let step through the Intapient EOB piece by peice.



The first section (below) lets us know the response is a Bundle and provides information about paging.  It also lets us know this particular individual has 499 EOBs.  Our query had a `count=1` so we will only have one object in the `entry` list.


    {
        "resourceType": "Bundle",
        "id": "22ca5321-8ac8-455a-8f62-9c567012d7e7",
        "meta": {
            "lastUpdated": "2018-04-20T09:02:53.718-04:00"
        },
        "type": "searchset",
        "total": 499,
        "link": [{
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000001920&startIndex=150&count=1",
            "relation": "self"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000001920&startIndex=151&count=1",
            "relation": "next"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000001920&startIndex=149&count=1",
            "relation": "previous"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000001920&startIndex=0&count=1",
            "relation": "first"
        }, {
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000001920&startIndex=498&count=1",
            "relation": "last"
        }],
        "entry": [{...}]

The `entry` section contains most of the important details. The first part of the entry tells us that the FHIR resource type is `ExplanationOfBenefit` and its FHIR ID is `inpatient-4317115332.


        "entry": [{
            "fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/inpatient-4317115332",
            "resource": {
                "resourceType": "ExplanationOfBenefit",
                "id": "inpatient-4317115332",

A number of extensions provide some information about the inpatient episode of care.  These contain a number of dollar amounts and identifiers which are components of the overall claim.

                "extension": [{
2000.00 USD is the Operating indirect Medical Education (IME) Amount. This is just pat of the claim and ofent indicates the cost for labor.  See http://www.medpac.gov/payment_basics.cfm for a more detailed explanation.


                    "url": "https://bluebutton.cms.gov/resources/variables/ime_op_clm_val_amt",
                    "valueMoney": {
                        "value": 2000.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

600.00 USD is the Operating Disproportionate Share (DSH) Amount is another compoment of the total claim amount.


                    "url": "https://bluebutton.cms.gov/resources/variables/dsh_op_clm_val_amt",
                    "valueMoney": {
                        "value": 600.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

450.00 USD is the Claim Pass Thru Per Diem Amount, a daily rate  to reimburse IPPS hospitals for certain “pass-through” expenses, such as capital-related costs, direct medical education costs, kidney acquisition costs for hospitals that are renal transplant centers, and bad debts.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pass_thru_per_diem_amt",
                    "valueMoney": {
                        "value": 450.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {


0.0 USD is the Professional Component Charge Amount for the physician or other professional charges covered under Medicare part B.



                    "url": "https://bluebutton.cms.gov/resources/variables/nch_profnl_cmpnt_chrg_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {
850.0 USD is the Claim Total PPS Capital Amount.  It is the sum of the capital hospital specific portion, federal specific portion, outlier portion, disproportionate share portion, indirect medical education portion, exception payments, and hold harmless payments.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_tot_pps_cptl_amt",
                    "valueMoney": {
                        "value": 850.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

1000.0 USD is the NCH Beneficiary Inpatient (or other Part A) Deductible Amount.  It is The amount of the deductible the beneficiary paid for inpatient services, as originally submitted on the institutional claim.


                    "url": "https://bluebutton.cms.gov/resources/variables/nch_bene_ip_ddctbl_amt",
                    "valueMoney": {
                        "value": 1000.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the NCH Beneficiary Part A Coinsurance Liability Amount. Its the amount of money for which the intermediary has determined that the beneficiary is liable for Part A coinsurance on the institutional claim.



                    "url": "https://bluebutton.cms.gov/resources/variables/nch_bene_pta_coinsrnc_lblty_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the NCH Inpatient(or other Part A) Non-covered Charge Amount.  this is the non-covered charges for all accommodations and services, reported on an inpatient claim (used for internal NCHMQA editing purposes).


                    "url": "https://bluebutton.cms.gov/resources/variables/nch_ip_ncvrd_chrg_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

1000.0 USD is the NCH Inpatient (or other Part A) Total Deductible/Coinsurance Amount.  It is the  total of all Part A and blood deductibles and coinsurance amounts on the claim.


                    "url": "https://bluebutton.cms.gov/resources/variables/nch_ip_tot_ddctn_amt",
                    "valueMoney": {
                        "value": 1000.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

70.0 USD is the Claim PPS Capital Disproportionate Share Amount. Its a portion of the total Prospective Payment System (PPS) payment amount.  It is the The amount of disproportionate share (rate reflecting indigent population served) portion of the PPS payment for capital.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_cptl_dsprprtnt_shr_amt",
                    "valueMoney": {
                        "value": 70.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the Claim PPS Capital Exception Amount. It is one component of the total PPS payment.  The capital PPS amount of exception payments provided for hospitals with inordinately high levels of capital obligations. Exception payments expire at the end of the 10-year transition period.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_cptl_excptn_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

650.0 USD Claim PPS Capital Federal Specific Portion (FSP) Amount. This is the  amount of the federal specific portion of the PPS payment for capital.

                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_cptl_fsp_amt",
                    "valueMoney": {
                        "value": 650.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {
150 USD is the Claim PPS Capital Indirect Medical Education (IME) Amount. It is the amount of the indirect medical education (IME) (reimbursable amount for teaching hospitals only; an added amount passed by Congress to augment normal prospective payment system [PPS] payments for teaching hospitals to compensate them for higher patient costs resulting from medical education programs for interns and residents) portion of the PPS payment for capital.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_cptl_ime_amt",
                    "valueMoney": {
                        "value": 150.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the Claim PPS Capital Outlier Amount. This is the amount of the outlier portion of the PPS payment for capital.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_cptl_outlier_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {
0.0 USD is the Claim PPS Old Capital Hold Harmless Amount. This amount is the hold harmless amount payable for old capital as computed by PRICER for providers with a payment code equal to 'A'.


                    "url": "https://bluebutton.cms.gov/resources/variables/clm_pps_old_cptl_hld_hrmls_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the NCH DRG Outlier Approved Payment Amount. On an institutional claim, the additional payment amount approved by the Quality Improvement Organization due to an outlier situation for a beneficiary's stay under the prospective payment system (PPS), which has been classified into a specific diagnosis related group (DRG).


                    "url": "https://bluebutton.cms.gov/resources/variables/nch_drg_outlier_aprvd_pmt_amt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the NCH Beneficiary Blood Deductible Liability Amount. This is the amount of money for which the intermediary determined the beneficiary is liable for the blood deductible.


                    "url": "https://bluebutton.cms.gov/resources/variables/nch_bene_blood_ddctbl_lblty_am",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {

0.0 USD is the NCH Primary Payer (if not Medicare) Claim Paid Amount. It is
the  amount of a payment made on behalf of a Medicare beneficiary by a primary payer other than Medicare, that the provider is applying to covered Medicare charges on a non-institutional claim.


                    "url": "https://bluebutton.cms.gov/resources/variables/prpayamt",
                    "valueMoney": {
                        "value": 0.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                }, {
99999 is the fiscal intermediary (FI) or Medicare Administrative Contractor (MAC) number.


                    "url": "https://bluebutton.cms.gov/resources/variables/fi_num",
                    "valueIdentifier": {
                        "system": "https://bluebutton.cms.gov/resources/variables/fi_num",
                        "value": "99999"
                    }
                }],

The `identifiers` section provides a number data points about the claim.


                "identifier": [{

4317115332 is the Claim ID for Part A or Part B.

                    "system": "https://bluebutton.cms.gov/resources/variables/clm_id",
                    "value": "4317115332"
                }, {

84390133146 is the Claim group ID.
                    "system": "https://bluebutton.cms.gov/resources/identifier/claim-group",
                    "value": "84390133146"
                }],

The `active` status flag indicates this is an active claim.


                "status": "active",

The `type` section provides more metadata about the EOB.  In this case, it  contains a codable concept with 2 coding systems  for `eob-type` and `ex-claimtype`.  As priorly mentioned, there is not always a one-to-one mapping between `eob-type` and `ex-claimtype`, but in the case of a pharmacy claim there is.  `60`, `INPATIENT`, `institutional` and `1` are all indicating this is a inpatient claim.

                "type": {
                    "coding": [{
                        "system": "https://bluebutton.cms.gov/resources/variables/nch_clm_type_cd",
                        "code": "60",
                        "display": "Inpatient claim"
                    }, {
                        "system": "https://bluebutton.cms.gov/resources/codesystem/eob-type",
                        "code": "INPATIENT"
                    }, {
                        "system": "http://hl7.org/fhir/ex-claimtype",
                        "code": "institutional",
                        "display": "Institutional"
                    }, {
The code `V` indicates that the claiim is "Part A institutional claim record (inpatient [IP], skilled nursing facility [SNF], hospice [HOS], or home health agency [HHA])".


                        "system": "https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd",
                        "code": "V",
                        "display": "Part A institutional claim record (inpatient [IP], skilled nursing facility [SNF], hospice [HOS], or home health agency [HHA])"
                    }, {

`1` is yet another code indicateding this an inpatient claim.


                        "system": "https://bluebutton.cms.gov/resources/variables/clm_srvc_clsfctn_type_cd",
                        "code": "1"
                    }]
                },

A reference to the Patient resource

                "patient": {
                    "reference": "Patient/20140000001920"
                },

The `bliiablePeriod` contains a date range (start and end dates.) I this case the start and end dates are both 2014-10-01.  The code `3` is the Claim Query Code.  It indicates the type of claim record being processed with respect to payment. `3` indicates this is a final bill as opposed to a interm bill or an adjustment.


                "billablePeriod": {
                    "extension": [{
                        "url": "https://bluebutton.cms.gov/resources/variables/claim_query_cd",
                        "valueCoding": {
                            "system": "https://bluebutton.cms.gov/resources/variables/claim_query_cd",
                            "code": "3",
                            "display": "Final bill"
                        }
                    }],
                    "start": "2014-10-01",
                    "end": "2014-10-01"
                },

The `provider` is the provider number.  It is _not_ the same as a National Provider Identifier (NPI). The first two digits indicate the state where the provider is located, using the SSA state codes; the middle two characters indicate the type of provider; and the last two digits are used as a counter for the number of providers within that state and type of provider (i.e., this is a unique but not necessarily sequential number).



                "provider": {
                    "identifier": {
                        "system": "https://bluebutton.cms.gov/resources/variables/prvdr_num",
                        "value": "999999"
                    }
                },

The `organization` identifies the organizations National Provider Identificer (NPI).


                "organization": {
                    "identifier": {
                        "system": "http://hl7.org/fhir/sid/us-npi",
                        "value": "9999999999"
                    }
                },
The `facility` provides metadata about the facility asspciated with the claim.


                "facility": {
                    "extension": [{
`1` indicates the facility is a hospital (as opposed to a skilled nursing facility, etc.)


                        "url": "https://bluebutton.cms.gov/resources/variables/clm_fac_type_cd",
                        "valueCoding": {
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_fac_type_cd",
                            "code": "1",
                            "display": "Hospital"
                        }
                    }],
The facility's National Provider Identificer (NPI).


                    "identifier": {
                        "system": "http://hl7.org/fhir/sid/us-npi",
                        "value": "9999999999"
                    }
                },

The `information` section is a list of elements containing metadata about the claim.

                "information": [{

`A` indicates the patient was discharged.


                    "sequence": 1,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/nch_ptnt_stus_ind_cd",
                            "display": "NCH Patient Status Indicator Code"
                        }]
                    },
                    "code": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/nch_ptnt_stus_ind_cd",
                            "code": "A",
                            "display": "Discharged"
                        }]
                    }
                }, {

`3` is the Claim Inpatient Admission Type Code and indicates the admission was elective as opposed to an emrgency admission.


                    "sequence": 2,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/clm_ip_admsn_type_cd",
                            "display": "Claim Inpatient Admission Type Code"
                        }]
                    },
                    "code": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_ip_admsn_type_cd",
                            "code": "3",
                            "display": "Elective - The patient's condition permitted adequate time to schedule the availability of suitable accommodations."
                        }]
                    }
                }, {

The code `1` is for the Claim Source Inpatient Admission Code.  It indicates the patient was admitted to this facility upon an order of a physician (as opposed to a transfer from a skilled nursing facility (SNF), etc.)



                    "sequence": 3,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/clm_src_ip_admsn_cd",
                            "display": "Claim Source Inpatient Admission Code"
                        }]
                    },
                    "code": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_src_ip_admsn_cd",
                            "code": "1"
                        }]
                    }
                }, {

0 is the number of untits of blood provided.  The unit in this case is pints.


                    "sequence": 4,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/nch_blood_pnts_frnshd_qty",
                            "display": "NCH Blood Pints Furnished Quantity"
                        }]
                    },
                    "valueQuantity": {
                        "value": 0,
                        "unit": "pint",
                        "system": "http://unitsofmeasure.org",
                        "code": "[pt_us]"
                    }
                }, {

The Claim Frequency Code value of `1` indicates the bill type is "Admit thru discharge claim".

                    "sequence": 5,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/clm_freq_cd",
                            "display": "Claim Frequency Code"
                        }]
                    },
                    "code": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_freq_cd",
                            "code": "1",
                            "display": "Admit thru discharge claim"
                        }]
                    }
                }, {


The Patient Discharge Status Code value of `01` indicates the patient was discharged to home/self-care (routine charge).


                    "sequence": 6,
                    "category": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/information",
                            "code": "https://bluebutton.cms.gov/resources/variables/ptnt_dschrg_stus_cd",
                            "display": "Patient Discharge Status Code"
                        }]
                    },
                    "code": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/ptnt_dschrg_stus_cd",
                            "code": "01",
                            "display": "Discharged to home/self-care (routine charge)."
                        }]
                    }
                }],
The `careTeam` section identifes the provider that are part of patient's care team.  The provider with the NAtional Provider Identifier of "999999999" is the "Assisting Provider".

                "careTeam": [{
                    "sequence": 2,
                    "provider": {
                        "identifier": {
                            "system": "http://hl7.org/fhir/sid/us-npi",
                            "value": "9999999999"
                        }
                    },
                    "role": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/claimcareteamrole",
                            "code": "assist",
                            "display": "Assisting Provider"
                        }]
                    }
                }],

the `diagnosis` section is a list containing codes indicating the diagnosis using codes such as ICD-9 and DRG.

                "diagnosis": [{

`658` is the Claim Diagnosis Related Group Code  (DRG) code. `658` is for Diseases & Disorders of the Kidney & Urinary Tract. See https://www.cms.gov/icd10manual/fullcode_cms/P0243.html for more information.


                    "packageCode": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_drg_cd",
                            "code": "658"
                        }]
                    }
                }, {
The ICD-9-cm code `5939` indicates a diagnosis of "Renal & ureteral dis NOS (Unspecified disorder of kidney and ureter)".


                    "sequence": 2,
                    "diagnosisCodeableConcept": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/sid/icd-9-cm",
                            "code": "5939"
                        }]
                    },
The `type` section is a list of elements providing more metadata and context to the inpatient claim.
                    "type": [{

The diagnosis code of `admitting` indicates the diagnosis given was the reason why the patient was admitted to the hospital.


                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/diagnosis-type",
                            "code": "admitting",
                            "display": "The diagnosis given as the reason why the patient was admitted to the hospital."
                        }]
                    }]
                }, {
                    "extension": [{

The code value of `Y` is for the "Claim Diagnosis Code I Diagnosis Present on Admission (POA) Indicator Code".  `Y` indicates the diagnosis was preswnt at the time of admission.

                        "url": "https://bluebutton.cms.gov/resources/variables/clm_poa_ind_sw1",
                        "valueCoding": {
                            "system": "https://bluebutton.cms.gov/resources/variables/clm_poa_ind_sw1",
                            "code": "Y",
                            "display": "Diagnosis was present at the time of admission (POA)"
                        }
                    }],

The ICD-9-CM code of `1890` indicates "Malignant neoplasm of kidney, except pelvis".


                    "sequence": 3,
                    "diagnosisCodeableConcept": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/sid/icd-9-cm",
                            "code": "1890"
                        }]
                    },

The code `principal` indicates this is the single medical diagnosis that is most relevant to the patient's chief complaint or need for treatment.


                    "type": [{
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/codesystem/diagnosis-type",
                            "code": "principal",
                            "display": "The single medical diagnosis that is most relevant to the patient's chief complaint or need for treatment."
                        }]
                    }]
                }],

The `procedure` section indicates prcedues performed during the hospital stay.

                "procedure": [{
The ICD-9-CM code `554` indicates the prcedure performed was a "Partial nephrectomy" (surgical removal of one or both of the kidneys).


                    "sequence": 1,
                    "date": "2014-10-01T00:00:00-04:00",
                    "procedureCodeableConcept": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/sid/icd-9-cm",
                            "code": "554"
                        }]
                    }
                }, {
The ICD-9-CM code `1742'  indicates it was a "Laparoscopic robotic assisted procedure.

                    "date": "2014-10-01T00:00:00-04:00",
                    "procedureCodeableConcept": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/sid/icd-9-cm",
                            "code": "1742"
                        }]
                    }
                }],

the `insurance` section provides a pointer to the `Coverage` FHIR Resource
used to cover this prcedure.


                "insurance": {
                    "coverage": {
                        "reference": "Coverage/part-a-20140000001920"
                    }
                },

The dates for the hospialization stay.


                "hospitalization": {
                    "start": "2014-10-01",
                    "end": "2014-10-01"
                },
The `item` section is a list providing additional information about the EOB.


                "item": [{
                    "sequence": 1,


The `revenue` section contains the Revenue or cost center code.

                    "revenue": {

The Revenue Center Code identifies the type of accomidation.  In this case`0102` indicates the accomidation is a Semi-private 2 bed room.

                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0120",
                            "display": "Semi-private 2 bed (medical or general) general classification"
                        }]
                    },

The `locationAddress` indocates the state of the accomidation.


                    "locationAddress": {
                        "state": "99"
                    },

The quatitiy of 3 is the number of day the accomidation was used.  It should be noted that in this example, the hospitalization start and end dates are the same and do not quite line up with this value.

                    "quantity": {
                        "value": 3
                    },

The `adjudication` section details information related to claim's adjudication such as payment, denial, co-pay, out of pocket expennses, etc.
                    "adjudication": [{
1000.0 USD is the Revenue Center Rate Amount.  We can surmise the afformentioned hospital accomidation rate is $1000 per day.


                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 1000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
4000.0 USD is the value for the "Revenue Center Total Charge".  This is total charges (covered and non-covered) for all accommodations and services (related to the revenue code) for a billing period before reduction for the deductible and coinsurance amounts and before an adjustment for the cost of services provided.


                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 4000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {

0.0 USD is the "Revenue Center Non-Covered Charge Amount". This is the charge amount related to a revenue center code for services that are not covered by Medicare.

                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

Not all `item` elements are related to the hopital stay iteself. Items can include, IVs, surgical supplies, and medication.  We can see sequence 2 is has a Revenue Center Total Charge Amount for $4000.0 USD, and the quatity of the service was 868.  It should be noted that at the time of this writing, items do not always provide all the desidred informatio.  We see the quantity is 868, but we can't determine exactly what the item is refrencing.  The only glimpse we have is "Pharmacy-general classification".


                    "sequence": 2,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0250",
                            "display": "Pharmacy-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 868
                    },

Note that each item in the seqence has its own adjudication section.  The change associated with this item is $4000.0 USD.


                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 4000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0252` adds the detail "Pharmacy-nongeneric drugs".
There change associated with this item is $350.0 USD and the quantity is 16.  The specific drug is unknown.


                    "sequence": 3,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0252",
                            "display": "Pharmacy-nongeneric drugs"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 16
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 350.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {
The code `0258` adds the detail "Pharmacy-IV solutions".
There change associated with this item is $650.0 USD and the quantity is 6.


                    "sequence": 4,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0258",
                            "display": "Pharmacy-IV solutions"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 6
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 350.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {


The code `0260` adds the detail "IV therapy-general classification".
There change associated with this item is $650.0 USD and the quantity is 1.


                    "sequence": 5,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0260",
                            "display": "IV therapy-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 1
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 650.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0270` adds the detail "Medical/surgical supplies-general classification (also see 062X)".
There change associated with this item is $10,000.0 USD and the quantity is 69.


                    "sequence": 6,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0270",
                            "display": "Medical/surgical supplies-general classification (also see 062X)"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 69
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 10000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0272` adds the detail "Medical/surgical supplies-sterile supply".  The specific implant is not identified.
There change associated with this item is $950.0 USD and the quantity is 5.


                    "sequence": 7,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0272",
                            "display": "Medical/surgical supplies-sterile supply"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 5
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 950.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {
The code `0303` adds the detail "Medical/surgical supplies-other implants".  The specific implant is not identified.
There change associated with this item is $2,000.0 USD. The quantity is 1.


                    "sequence": 8,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0278",
                            "display": "Medical/surgical supplies-other implants"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 1
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 2000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0301` adds the detail "Laboratory-chemistry".
There change associated with this item is $750.0 USD.


                    "sequence": 9,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0301",
                            "display": "Laboratory-chemistry"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 8
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 750.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0303` adds the detail "Laboratory-immunology".
There change associated with this item is $450.0 USD.

                    "sequence": 10,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0302",
                            "display": "Laboratory-immunology"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 5
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 450.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0305` adds the detail "Laboratory-hematology"
There change associated with this item is $550.0 USD.


                    "sequence": 11,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0305",
                            "display": "Laboratory-hematology"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 5
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 550.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {
The code `0310` adds the detail "Laboratory pathological-general classification".
There change associated with this item is $5000.0 USD.


                    "sequence": 12,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0310",
                            "display": "Laboratory pathological-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 10
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 5000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0360` adds the detail "Operating room services-general classification"
There change associated with this item is $6000.0 USD.


                    "sequence": 13,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0360",
                            "display": "Operating room services-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 19
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 60000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {
The code `0730` adds the detail "Anesthesia-general classification".
There change associated with this item is $5000.00 USD.


                    "sequence": 14,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0370",
                            "display": "Anesthesia-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 18
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 5000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0710` adds the detail "Recovery room-general classification".
There change associated with this item is $3000.0 USD.



                    "sequence": 15,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0710",
                            "display": "Recovery room-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 2
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 3000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {


The code `0703` adds the detail "EKG/ECG-general classification". about. about the . "EKG/ECG-general classification".
There change associated with this item is $450.0 USD. Note: At the time of this writing the code is missing from https://bluebutton.cms.gov/resources/variables/rev_cntr.


                    "sequence": 16,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0730",
                            "display": "EKG/ECG-general classification"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 1
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 450.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code`0761` indicates the type of room is a "Treatment or observation room-treatment room".
The no change associated with this item is $150 USD.


                    "sequence": 17,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0761",
                            "display": "Treatment or observation room-treatment room"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 1
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 150.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }, {

The code `0001` indicates the "Toal charge". 10,000 USD is the "Total change" amount. Note: In this example, the total charge amount is not the sum of the other items.


                    "sequence": 18,
                    "revenue": {
                        "coding": [{
                            "system": "https://bluebutton.cms.gov/resources/variables/rev_cntr",
                            "code": "0001",
                            "display": "Total charge"
                        }]
                    },
                    "locationAddress": {
                        "state": "99"
                    },
                    "quantity": {
                        "value": 0
                    },
                    "adjudication": [{
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_rate_amt",
                                "display": "Revenue Center Rate Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_tot_chrg_amt",
                                "display": "Revenue Center Total Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 100000.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }, {
                        "category": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/adjudication",
                                "code": "https://bluebutton.cms.gov/resources/variables/rev_cntr_ncvrd_chrg_amt",
                                "display": "Revenue Center Non-Covered Charge Amount"
                            }]
                        },
                        "amount": {
                            "value": 0.0,
                            "system": "urn:iso:std:iso:4217",
                            "code": "USD"
                        }
                    }]
                }],

The total cost of the inpatient episode of care is 10000.0 USD.


                "totalCost": {
                    "value": 100000.0,
                    "system": "urn:iso:std:iso:4217",
                    "code": "USD"
                },

The total payment of the inpatient episode of care is 10000.0 USD.


                "payment": {
                    "amount": {
                        "value": 10000.0,
                        "system": "urn:iso:std:iso:4217",
                        "code": "USD"
                    }
                },
                "benefitBalance": [{
This is covered by `medical` insurance as opposed to `oral`, `vision`, etc.


                    "category": {
                        "coding": [{
                            "system": "http://hl7.org/fhir/benefit-category",
                            "code": "medical",
                            "display": "Medical Health Coverage"
                        }]
                    },
                    "financial": [{

8 days is the count of the total number of coinsurance days involved with the beneficiary's stay in a facility.


                        "type": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/benefit-balance",
                                "code": "https://bluebutton.cms.gov/resources/variables/bene_tot_coinsrnc_days_cnt",
                                "display": "Beneficiary Total Coinsurance Days Count"
                            }]
                        },
                        "usedUnsignedInt": 8
                    }, {

2  days of care are not chargeable to Medicare facility utilization.


                        "type": {
                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/benefit-balance",
                                "code": "https://bluebutton.cms.gov/resources/variables/clm_non_utlztn_days_cnt",
                                "display": "Claim Medicare Non Utilization Days Count"
                            }]
                        },
                        "usedUnsignedInt": 2
                    }, {
                        "type": {

7 is the number of days  of care that are chargeable to Medicare facility utilization that includes full days, coinsurance days, and lifetime reserve days.  It excludes any days classified as non-covered, leave of absence days, and the day of discharge or death.


                            "coding": [{
                                "system": "https://bluebutton.cms.gov/resources/codesystem/benefit-balance",
                                "code": "https://bluebutton.cms.gov/resources/variables/clm_utlztn_day_cnt",
                                "display": "Claim Medicare Utilization Day Count"
                            }]
                        },
                        "usedUnsignedInt": 7
                    }]
                }]
            }
        }]
    }